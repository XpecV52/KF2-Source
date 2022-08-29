/*******************************************************************************
 * KFPawn_MonsterBoss generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFPawn_MonsterBoss extends KFPawn_Monster
    abstract
    native(Pawn)
    config(Game)
    hidecategories(Navigation)
    implements(KFInterface_MonsterBoss);

struct native BossMinionWaveInfo
{
    var KFAIWaveInfo PhaseOneWave;
    var KFAIWaveInfo PhaseTwoWave;
    var KFAIWaveInfo PhaseThreeWave;
    var KFAIWaveInfo PhaseFourWave;

    structdefaultproperties
    {
        PhaseOneWave=none
        PhaseTwoWave=none
        PhaseThreeWave=none
        PhaseFourWave=none
    }
};

var KFPlayerController KFPC;
var BossMinionWaveInfo SummonWaves[4];
var Vector2D NumMinionsToSpawn;
var repnotify int CurrentBattlePhase;
var float LastPlayerAliveAttackRangeScale;
var protected float LastPlayerAliveStartTime;
var protected const float TimeUntilSpeedIncrease;
var protected const float SpeedLimitScalar;
var protected const float SpeedPctIncreasePerMinute;
var protected float ActualSprintSpeed;
var bool bUseAnimatedCamera;
var Vector AnimatedBossCameraOffset;
var const localized array<localized string> BossCaptionStrings;

replication
{
     if(bNetDirty)
        CurrentBattlePhase;
}

simulated function KFPawn_Monster GetMonsterPawn()
{
    return self;
}

simulated function string GetRandomBossCaption()
{
    if(default.BossCaptionStrings.Length <= 0)
    {
        return "";
    }
    return default.BossCaptionStrings[Rand(default.BossCaptionStrings.Length)];
}

static simulated event bool IsABoss()
{
    return true;
}

simulated function float GetHealthPercent()
{
    return float(Health) / float(HealthMax);
}

simulated function SetAnimatedBossCamera(bool bEnable, optional Vector CameraOffset)
{
    bUseAnimatedCamera = bEnable;
    if(bUseAnimatedCamera)
    {
        AnimatedBossCameraOffset = CameraOffset;        
    }
    else
    {
        AnimatedBossCameraOffset = vect(0, 0, 0);
    }
}

simulated function bool UseAnimatedBossCamera()
{
    return bUseAnimatedCamera;
}

simulated function name GetBossCameraSocket()
{
    return 'TheatricCameraRootSocket';
}

simulated function Vector GetBossCameraOffset()
{
    return AnimatedBossCameraOffset;
}

function OnZedDied(Controller Killer)
{
    super.OnZedDied(Killer);
    KFGameInfo(WorldInfo.Game).BossDied(Killer);
}

function KFAIWaveInfo GetWaveInfo(int BattlePhase, int Difficulty)
{
    switch(BattlePhase)
    {
        case 1:
            return SummonWaves[Difficulty].PhaseOneWave;
            break;
        case 2:
            return SummonWaves[Difficulty].PhaseTwoWave;
            break;
        case 3:
            return SummonWaves[Difficulty].PhaseThreeWave;
            break;
        default:
            break;
    }
    return none;
}

function byte GetNumMinionsToSpawn()
{
    return byte(Lerp(NumMinionsToSpawn.X, NumMinionsToSpawn.Y, FMax(float(WorldInfo.Game.NumPlayers), 1) / float(WorldInfo.Game.MaxPlayers)));
}

simulated event ReplicatedEvent(name VarName)
{
    if(VarName == 'CurrentBattlePhase')
    {
        OnBattlePhaseChanged();        
    }
    else
    {
        super.ReplicatedEvent(VarName);
    }
}

simulated event PreBeginPlay()
{
    super.PreBeginPlay();
    OnBattlePhaseChanged();
    KFPC = KFPlayerController(GetALocalPlayerController());
}

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
}

static simulated function SetupHealthBar(KFInterface_MonsterBoss BossRef)
{
    local KFPawn_Monster BossMonster;
    local KFPlayerController LocalKFPC;

    BossMonster = KFPawn_Monster(bool(BossRef));
    if((BossMonster != none) && BossMonster.WorldInfo.NetMode != NM_DedicatedServer)
    {
        LocalKFPC = KFPlayerController(BossMonster.GetALocalPlayerController());
        if((LocalKFPC.myGfxHUD != none) && LocalKFPC.myGfxHUD.bossHealthBar != none)
        {
            LocalKFPC.myGfxHUD.bossHealthBar.SetBossPawn(BossRef);
            if(!KFGameReplicationInfo(BossMonster.WorldInfo.GRI).ShouldSetBossCamOnBossSpawn())
            {
                LocalKFPC.myGfxHUD.bossHealthBar.OnNamePlateHidden();
            }
        }
    }
}

function PossessedBy(Controller C, bool bVehicleTransition)
{
    super.PossessedBy(C, bVehicleTransition);
    PlayBossMusic();
    PlayBossEntranceTheatrics((self));
    if(!IsHumanControlled())
    {
        ActualSprintSpeed = SprintSpeed;
        SetTimer(TimeUntilSpeedIncrease, false, 'Timer_IncreaseSpeed');
    }
}

static function PlayBossEntranceTheatrics(KFInterface_MonsterBoss BossRef)
{
    local KFPawn_Monster BossMonster;

    BossMonster = KFPawn_Monster(bool(BossRef));
    if((BossMonster != none) && KFGameReplicationInfo(BossMonster.WorldInfo.GRI).ShouldSetBossCamOnBossSpawn())
    {
        BossMonster.ServerDoSpecialMove(37);
    }
}

function Timer_IncreaseSpeed()
{
    SetTimer(10, false, 'Timer_IncreaseSpeed');
    if(IsOnePlayerLeftInTeamGame())
    {
        if(LastPlayerAliveStartTime == 0)
        {
            LastPlayerAliveStartTime = WorldInfo.TimeSeconds;
        }
        SprintSpeed = FClamp(ActualSprintSpeed + (((WorldInfo.TimeSeconds - LastPlayerAliveStartTime) / 60) * (ActualSprintSpeed * SpeedPctIncreasePerMinute)), ActualSprintSpeed, ActualSprintSpeed * SpeedLimitScalar);        
    }
    else
    {
        LastPlayerAliveStartTime = 0;
        SprintSpeed = ActualSprintSpeed;
    }
}

function NotifyTakeHit(Controller InstigatedBy, Vector HitLocation, int Damage, class<DamageType> DamageType, Vector Momentum, Actor DamageCauser)
{
    super.NotifyTakeHit(InstigatedBy, HitLocation, Damage, DamageType, Momentum, DamageCauser);
    if(((Role == ROLE_Authority) && KFGameInfo(WorldInfo.Game) != none) && KFGameInfo(WorldInfo.Game).DialogManager != none)
    {
        KFGameInfo(WorldInfo.Game).DialogManager.PlayBossTakeDamageDialog(self);
    }
}

function bool CanAITargetThisPawn(Controller TargetingController)
{
    if(TargetingController.Pawn.IsSameTeam(self))
    {
        return false;
    }
    return super(KFPawn).CanAITargetThisPawn(TargetingController);
}

simulated function PlayDyingSound()
{
    if(!HasMouth())
    {
        return;
    }
    super.PlayDyingSound();
}

simulated function TerminateEffectsOnDeath()
{
    super(KFPawn).TerminateEffectsOnDeath();
    OnBattlePhaseChanged();
}

simulated function UpdateGameplayMICParams()
{
    super.UpdateGameplayMICParams();
    OnBattlePhaseChanged();
}

simulated function int GetCurrentBattlePhase()
{
    return CurrentBattlePhase;
}

simulated function OnBattlePhaseChanged()
{
    UpdateBattlePhaseOnLocalPlayerUI();
}

simulated function UpdateBattlePhaseOnLocalPlayerUI()
{
    if(((KFPC == none) || KFPC.myGfxHUD == none) || KFPC.myGfxHUD.bossHealthBar == none)
    {
        return;
    }
    KFPC.myGfxHUD.bossHealthBar.UpdateBossBattlePhase(CurrentBattlePhase);
}

function float GetAttackRangeScale()
{
    if(IsOnePlayerLeftInTeamGame())
    {
        return LastPlayerAliveAttackRangeScale;
    }
    return 1;
}

function bool IsOnePlayerLeftInTeamGame()
{
    if(WorldInfo.Game.NumPlayers > 1)
    {
        return KFGameInfo(WorldInfo.Game).GetLivingPlayerCount() == 1;
    }
    return false;
}

// Export UKFPawn_MonsterBoss::execLocalIsOnePlayerLeftInTeamGame(FFrame&, void* const)
native function bool LocalIsOnePlayerLeftInTeamGame();

function bool Died(Controller Killer, class<DamageType> DamageType, Vector HitLocation)
{
    local bool Result;

    Result = super.Died(Killer, DamageType, HitLocation);
    ClearTimer('Timer_IncreaseSpeed');
    return Result;
}

function PlayBossMusic();

function CauseHeadTrauma(optional float BleedOutTime)
{
    BleedOutTime = 5;
}

simulated function PlayHeadAsplode();

function PlayGrabDialog()
{
    if(((Role == ROLE_Authority) && KFGameInfo(WorldInfo.Game) != none) && KFGameInfo(WorldInfo.Game).DialogManager != none)
    {
        KFGameInfo(WorldInfo.Game).DialogManager.PlayBossGrabDialog(self);
    }
}

function PlayHealDialog()
{
    if(((Role == ROLE_Authority) && KFGameInfo(WorldInfo.Game) != none) && KFGameInfo(WorldInfo.Game).DialogManager != none)
    {
        KFGameInfo(WorldInfo.Game).DialogManager.PlayBossHealDialog(self);
    }
}

function PlayLeapedDialog()
{
    if(((Role == ROLE_Authority) && KFGameInfo(WorldInfo.Game) != none) && KFGameInfo(WorldInfo.Game).DialogManager != none)
    {
        KFGameInfo(WorldInfo.Game).DialogManager.PlayBossLeapedDialog(self);
    }
}

function PlayLandedDialog()
{
    if(((Role == ROLE_Authority) && KFGameInfo(WorldInfo.Game) != none) && KFGameInfo(WorldInfo.Game).DialogManager != none)
    {
        KFGameInfo(WorldInfo.Game).DialogManager.PlayBossLandedDialog(self);
    }
}

function PlayGrabbedPlayerDialog(KFPawn_Human Target);

function PlayGrabKilledDialog();

simulated function string GetIconPath()
{
    return "ZED_Patriarch_UI.ZED-VS_Icon_Boss";
}

defaultproperties
{
    LastPlayerAliveAttackRangeScale=0.75
    TimeUntilSpeedIncrease=60
    SpeedLimitScalar=1.3
    SpeedPctIncreasePerMinute=0.2
    BossCaptionStrings(0)="Boss caption 1"
    BossCaptionStrings(1)="Boss caption 2"
    MinSpawnSquadSizeType=ESquadType.EST_Boss
    MeleeAttackHelper=KFMeleeHelperAI'Default__KFPawn_MonsterBoss.MeleeHelper'
    SprintAkComponent=AkComponent'Default__KFPawn_MonsterBoss.SprintAkComponent0'
    HeadShotAkComponent=AkComponent'Default__KFPawn_MonsterBoss.HeadshotAkComponent0'
    begin object name=ThirdPersonHead0 class=SkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: SkeletalMeshComponent'Default__KFPawn_MonsterBoss.ThirdPersonHead0'
    ThirdPersonHeadMeshComponent=ThirdPersonHead0
    bWeakZedGrab=false
    AfflictionHandler=KFAfflictionManager'Default__KFPawn_MonsterBoss.Afflictions'
    begin object name=FirstPersonArms class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_MonsterBoss.FirstPersonArms'
    ArmsMesh=FirstPersonArms
    SpecialMoveHandler=KFSpecialMoveHandler'Default__KFPawn_MonsterBoss.SpecialMoveHandler'
    AmbientAkComponent=AkComponent'Default__KFPawn_MonsterBoss.AmbientAkSoundComponent_1'
    WeaponAkComponent=AkComponent'Default__KFPawn_MonsterBoss.AmbientAkSoundComponent'
    WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'Default__KFPawn_MonsterBoss.WeaponAmbientEchoHandler'
    FootstepAkComponent=AkComponent'Default__KFPawn_MonsterBoss.FootstepAkSoundComponent'
    DialogAkComponent=AkComponent'Default__KFPawn_MonsterBoss.DialogAkSoundComponent'
    begin object name=KFPawnSkeletalMeshComponent class=KFSkeletalMeshComponent
        bUpdateKinematicBonesFromAnimation=true
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_MonsterBoss.KFPawnSkeletalMeshComponent'
    Mesh=KFPawnSkeletalMeshComponent
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_MonsterBoss.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=Sprite class=SpriteComponent
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__KFPawn_MonsterBoss.Sprite'
    Components(0)=Sprite
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_MonsterBoss.CollisionCylinder'
    Components(1)=CollisionCylinder
    begin object name=Arrow class=ArrowComponent
        ReplacementPrimitive=none
    object end
    // Reference: ArrowComponent'Default__KFPawn_MonsterBoss.Arrow'
    Components(2)=Arrow
    begin object name=KFPawnSkeletalMeshComponent class=KFSkeletalMeshComponent
        bUpdateKinematicBonesFromAnimation=true
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_MonsterBoss.KFPawnSkeletalMeshComponent'
    Components(3)=KFPawnSkeletalMeshComponent
    Components(4)=AkComponent'Default__KFPawn_MonsterBoss.AmbientAkSoundComponent'
    Components(5)=AkComponent'Default__KFPawn_MonsterBoss.AmbientAkSoundComponent_1'
    Components(6)=AkComponent'Default__KFPawn_MonsterBoss.FootstepAkSoundComponent'
    Components(7)=AkComponent'Default__KFPawn_MonsterBoss.DialogAkSoundComponent'
    Components(8)=AkComponent'Default__KFPawn_MonsterBoss.SprintAkComponent0'
    Components(9)=AkComponent'Default__KFPawn_MonsterBoss.HeadshotAkComponent0'
    bAlwaysRelevant=true
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_MonsterBoss.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}