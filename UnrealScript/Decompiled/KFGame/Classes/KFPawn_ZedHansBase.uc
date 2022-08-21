/*******************************************************************************
 * KFPawn_ZedHansBase generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFPawn_ZedHansBase extends KFPawn_MonsterBoss
    abstract
    config(Game)
    hidecategories(Navigation);

enum EHansNadeType
{
    HNT_None,
    HNT_HEGrenade,
    HNT_NerveGas,
    HNT_Smoke,
    HNT_HEGrenadeBarrage,
    HNT_NerveGasBarrage,
    HNT_SmokeBarrage,
    HNT_MAX
};

struct HansBattlePhaseInfo
{
    var bool bCanFrenzy;
    var bool bSprintingBehavior;
    var float GlobalOffensiveNadePhaseCooldown;
    var bool bCanTossNerveGas;
    var float NerveGasTossPhaseCooldown;
    var bool bCanBarrageNerveGas;
    var float NerveGasBarragePhaseCooldown;
    var bool bCanUseGuns;
    var float GunAttackPhaseCooldown;
    var float GunAttackLengthPhase;
    var bool bCanTossGrenade;
    var float HENadeTossPhaseCooldown;
    var bool bCanBarrageGrenades;
    var float HENadeBarragePhaseCooldown;
    var array<float> HealThresholds;
    var array<float> HealAmounts;
    var array<int> MaxShieldHealth;

    structdefaultproperties
    {
        bCanFrenzy=false
        bSprintingBehavior=true
        GlobalOffensiveNadePhaseCooldown=8
        bCanTossNerveGas=false
        NerveGasTossPhaseCooldown=10
        bCanBarrageNerveGas=false
        NerveGasBarragePhaseCooldown=20
        bCanUseGuns=false
        GunAttackPhaseCooldown=20
        GunAttackLengthPhase=15
        bCanTossGrenade=false
        HENadeTossPhaseCooldown=10
        bCanBarrageGrenades=false
        HENadeBarragePhaseCooldown=20
        HealThresholds=none
        HealAmounts=none
        MaxShieldHealth=none
    }
};

var KFAIController_Hans MyHansController;
var repnotify bool bGunsEquipped;
var bool bHealedThisPhase;
var repnotify bool bInHuntAndHealMode;
var bool bPendingSmokeGrenadeBarrage;
var bool bDoingBarrage;
var array<HansBattlePhaseInfo> BattlePhases;
var float AmountHealedThisPhase;
/** How much to reduce Hans' damage he receives when he is in hunt and heal mode */
var() float HuntAndHealModeDamageReduction;
var float IncapPowerScaleWhenHealing;
var float ShieldHealth;
var float ShieldHealthMax;
var repnotify byte ShieldHealthPctByte;
var int NumHuntAndHealEnemyBumps;
var float LastHuntAndHealEnemyBumpTime;
var class<KFProj_Grenade> ActiveGrenadeClass;
var const class<KFProj_Grenade> ExplosiveGrenadeClass;
var const class<KFProj_Grenade> NerveGasGrenadeClass;
var const class<KFProj_Grenade> SmokeGrenadeClass;
var name RightHandSocketName;
var name LeftHandSocketName;
var float GrenadeTossSpread;
var int BarrageTossCount;
var float GlobalOffensiveNadeCooldown;
var float LastOffensiveNadeTime;
var float HENadeTossCooldown;
var float LastHENadeTossTime;
var float HENadeBarrageCooldown;
var float LastHENadeBarrageTime;
var float NerveGasTossCooldown;
var float LastNerveGasTossTime;
var float NerveGasBarrageCooldown;
var float LastNerveGasBarrageTime;
var float SmokeTossCooldown;
var float LastSmokeTossTime;

replication
{
     if(bNetDirty)
        ShieldHealthPctByte, bGunsEquipped, 
        bInHuntAndHealMode;
}

simulated event ReplicatedEvent(name VarName)
{
    switch(VarName)
    {
        case 'bInHuntAndHealMode':
            SetHuntAndHealMode(bInHuntAndHealMode);
            break;
        case 'ShieldHealthPctByte':
            UpdateShieldColor();
            break;
        default:
            super.ReplicatedEvent(VarName);
            break;
    }
}

function PossessedBy(Controller C, bool bVehicleTransition)
{
    super.PossessedBy(C, bVehicleTransition);
    MyHansController = KFAIController_Hans(C);
    SetPhaseCooldowns(0);
}

function IncrementBattlePhase()
{
    ++ CurrentBattlePhase;
    bHealedThisPhase = true;
    AmountHealedThisPhase = 0;
    SetPhaseCooldowns(CurrentBattlePhase - 1);
    bForceNetUpdate = true;
}

function SetPhaseCooldowns(int BattlePhase)
{
    GlobalOffensiveNadeCooldown = BattlePhases[BattlePhase].GlobalOffensiveNadePhaseCooldown;
    HENadeTossCooldown = BattlePhases[BattlePhase].HENadeTossPhaseCooldown;
    HENadeBarrageCooldown = BattlePhases[BattlePhase].HENadeBarragePhaseCooldown;
    NerveGasTossCooldown = BattlePhases[BattlePhase].NerveGasTossPhaseCooldown;
    NerveGasBarrageCooldown = BattlePhases[BattlePhase].NerveGasBarragePhaseCooldown;
    if(MyHansController != none)
    {
        MyHansController.ShootingCooldown = BattlePhases[BattlePhase].GunAttackPhaseCooldown;
        MyHansController.MaxGunAttackLength = BattlePhases[BattlePhase].GunAttackLengthPhase;
        MyHansController.bSummonedThisPhase = false;
    }
}

function AdjustDamage(out int InDamage, out Vector Momentum, Controller InstigatedBy, Vector HitLocation, class<DamageType> DamageType, TraceHitInfo HitInfo, Actor DamageCauser)
{
    super(KFPawn_Monster).AdjustDamage(InDamage, Momentum, InstigatedBy, HitLocation, DamageType, HitInfo, DamageCauser);
    UpdateShieldHealth(InDamage);
    if(bInHuntAndHealMode && ShieldHealth > float(0))
    {
        InDamage *= HuntAndHealModeDamageReduction;
    }
}

simulated function AdjustAffliction(out float AfflictionPower)
{
    super(KFPawn).AdjustAffliction(AfflictionPower);
    if(bInHuntAndHealMode)
    {
        AfflictionPower *= IncapPowerScaleWhenHealing;
    }
}

function UpdateShieldHealth(optional int Damage)
{
    Damage = -1;
    if((ShieldHealth == float(0)) || Damage == 0)
    {
        return;
    }
    if((ShieldHealth > float(0)) && Damage > 0)
    {
        ShieldHealth = float(Max(int(ShieldHealth - float(Damage)), 0));
    }
    if(ShieldHealth == float(0))
    {
        ShieldHealthPctByte = 0;        
    }
    else
    {
        ShieldHealthPctByte = FloatToByte(FClamp(ShieldHealth / ShieldHealthMax, 0, 1));
    }
    UpdateShieldColor();
    if(((WorldInfo.NetMode == NM_DedicatedServer) && bInHuntAndHealMode) && ShieldHealthPctByte == 0)
    {
        BreakShield();
    }
}

simulated function BreakShield()
{
    if(Role == ROLE_Authority)
    {
        if(MyHansController != none)
        {
            MyHansController.CancelFlee();
        }
        SetHuntAndHealMode(false);
        if(IsDoingSpecialMove())
        {
            EndSpecialMove();
        }
        Knockdown(((Velocity != vect(0, 0, 0)) ? -Velocity * float(2) : float(3) * (-vector(Rotation) * GroundSpeed)), vect(1, 1, 1),,,,, Location);
    }
}

function bool CanFrenzyInThisPhase()
{
    return BattlePhases[CurrentBattlePhase - 1].bCanFrenzy;
}

function bool DesireSprintingInThisPhase()
{
    return BattlePhases[CurrentBattlePhase - 1].bSprintingBehavior;
}

function bool ShouldPlaySpecialMeleeAnims()
{
    return CanFrenzyInThisPhase();
}

function bool OffensiveGrenadeCooldownComplete()
{
    if((LastOffensiveNadeTime == float(0)) || (WorldInfo.TimeSeconds - LastOffensiveNadeTime) > GlobalOffensiveNadeCooldown)
    {
        return true;
    }
    return false;
}

function bool CanTossNerveGasInThisPhase()
{
    if((((BattlePhases[CurrentBattlePhase - 1].bCanTossNerveGas && !bInHuntAndHealMode) && (WorldInfo.TimeSeconds - LastNerveGasTossTime) > float(0)) && (WorldInfo.TimeSeconds - LastNerveGasTossTime) > NerveGasTossCooldown) && OffensiveGrenadeCooldownComplete())
    {
        return true;
    }
    return false;
}

function bool CanBarrageNerveGasInThisPhase()
{
    if((((BattlePhases[CurrentBattlePhase - 1].bCanBarrageNerveGas && !bInHuntAndHealMode) && (WorldInfo.TimeSeconds - LastNerveGasBarrageTime) > float(0)) && (WorldInfo.TimeSeconds - LastNerveGasBarrageTime) > NerveGasBarrageCooldown) && OffensiveGrenadeCooldownComplete())
    {
        return true;
    }
    return false;
}

function bool CanUseGunsInThisPhase()
{
    return BattlePhases[CurrentBattlePhase - 1].bCanUseGuns;
}

function bool CanTossGrenadeInThisPhase()
{
    if((((BattlePhases[CurrentBattlePhase - 1].bCanTossGrenade && !bInHuntAndHealMode) && (WorldInfo.TimeSeconds - LastHENadeTossTime) > float(0)) && (WorldInfo.TimeSeconds - LastHENadeTossTime) > HENadeTossCooldown) && OffensiveGrenadeCooldownComplete())
    {
        return true;
    }
    return false;
}

function bool CanGrenadeBarrageInThisPhase()
{
    if((((BattlePhases[CurrentBattlePhase - 1].bCanBarrageGrenades && !bInHuntAndHealMode) && (WorldInfo.TimeSeconds - LastHENadeBarrageTime) > float(0)) && (WorldInfo.TimeSeconds - LastHENadeBarrageTime) > HENadeBarrageCooldown) && OffensiveGrenadeCooldownComplete())
    {
        return true;
    }
    return false;
}

function bool CanSmokeTossInThisPhase()
{
    return (bInHuntAndHealMode && (WorldInfo.TimeSeconds - LastSmokeTossTime) > float(0)) && (WorldInfo.TimeSeconds - LastSmokeTossTime) > SmokeTossCooldown;
}

function bool IsThrowingGrenade()
{
    return false;
}

function bool CacheGrenadeThrowLocation(optional bool bLeftHand)
{
    return false;
}

function SetActiveGrenadeClassGrenade()
{
    ActiveGrenadeClass = ExplosiveGrenadeClass;
}

function SetActiveGrenadeClassSmoke()
{
    ActiveGrenadeClass = SmokeGrenadeClass;
}

function SetActiveGrenadeClassNerveGas()
{
    ActiveGrenadeClass = NerveGasGrenadeClass;
}

function PlayDrawGunsDialog()
{
    if(((Role == ROLE_Authority) && KFGameInfo(WorldInfo.Game) != none) && KFGameInfo(WorldInfo.Game).DialogManager != none)
    {
        KFGameInfo(WorldInfo.Game).DialogManager.PlayHansDrawGunsDialog(self);
    }
}

function PlayGrenadeDialog(bool bBarrage)
{
    switch(ActiveGrenadeClass)
    {
        case ExplosiveGrenadeClass:
            if(((Role == ROLE_Authority) && KFGameInfo(WorldInfo.Game) != none) && KFGameInfo(WorldInfo.Game).DialogManager != none)
            {
                KFGameInfo(WorldInfo.Game).DialogManager.PlayHansNadeDialog(self, bBarrage);
            }
            break;
        case SmokeGrenadeClass:
            if(((Role == ROLE_Authority) && KFGameInfo(WorldInfo.Game) != none) && KFGameInfo(WorldInfo.Game).DialogManager != none)
            {
                KFGameInfo(WorldInfo.Game).DialogManager.PlayHansSmokeDialog(self, bBarrage);
            }
            break;
        case NerveGasGrenadeClass:
            if(((Role == ROLE_Authority) && KFGameInfo(WorldInfo.Game) != none) && KFGameInfo(WorldInfo.Game).DialogManager != none)
            {
                KFGameInfo(WorldInfo.Game).DialogManager.PlayHansGasDialog(self, bBarrage);
            }
            break;
        default:
            break;
    }
}

simulated function SetHuntAndHealMode(bool bOn)
{
    local KFGameInfo KFGI;
    local KFCharacterInfo_Monster MonsterInfo;
    local float HealthMod, HeadHealthMod;

    bInHuntAndHealMode = bOn;
    if(Role == ROLE_Authority)
    {
        if(bInHuntAndHealMode)
        {
            SetTimer(0.25, true, 'HuntAndHealBump');
            HealthMod = 1;
            KFGI = KFGameInfo(WorldInfo.Game);
            if(KFGI != none)
            {
                MonsterInfo = GetCharacterMonsterInfo();
                KFGI.DifficultyInfo.GetAIHealthModifier(MonsterInfo, KFGI.GameDifficulty, byte(KFGI.GetLivingPlayerCount()), HealthMod, HeadHealthMod);
            }
            ShieldHealthMax = float(BattlePhases[CurrentBattlePhase - 1].MaxShieldHealth[int(WorldInfo.Game.GameDifficulty)]) * HealthMod;
            ShieldHealth = ShieldHealthMax;
            UpdateShieldHealth();
            NumHuntAndHealEnemyBumps = 0;
            LastHuntAndHealEnemyBumpTime = WorldInfo.TimeSeconds;
            if(IsDoingSpecialMove())
            {
                EndSpecialMove();
            }
            DoSpecialMove(4,,, Class'KFSM_Stumble'.static.PackBodyHitSMFlags(self, vector(Rotation)));
            if(MyHansController != none)
            {
                MyHansController.NextBattlePhase();
            }
            IncrementBattlePhase();            
        }
        else
        {
            ClearTimer('HuntAndHealBump');
            if(((Role == ROLE_Authority) && KFGameInfo(WorldInfo.Game) != none) && KFGameInfo(WorldInfo.Game).DialogManager != none)
            {
                KFGameInfo(WorldInfo.Game).DialogManager.PlayHansBattlePhaseDialog(self, CurrentBattlePhase);
            }
        }
    }
    if(!bOn)
    {
        bHealedThisPhase = false;
        SetTimer(0.1, false, 'Timer_ResetShieldHealthPct');
    }
}

function Timer_ResetShieldHealthPct()
{
    ShieldHealthPctByte = 0;
}

function float GetHealAmountForThisPhase()
{
    return float(HealthMax) * BattlePhases[CurrentBattlePhase - 2].HealAmounts[int(WorldInfo.Game.GameDifficulty)];
}

function SummonMinions()
{
    local int Skill, DifficultyIndex;
    local KFAIWaveInfo MinionWave;
    local KFAISpawnManager SpawnManager;
    local KFGameInfo MyKFGameInfo;

    MyKFGameInfo = KFGameInfo(WorldInfo.Game);
    if(MyHansController != none)
    {
        Skill = int(MyHansController.Skill);
    }
    if(float(Skill) == Class'KFDifficultyInfo'.static.GetDifficultyValue(0))
    {
        DifficultyIndex = 0;        
    }
    else
    {
        if(float(Skill) <= Class'KFDifficultyInfo'.static.GetDifficultyValue(1))
        {
            DifficultyIndex = 1;            
        }
        else
        {
            if(float(Skill) <= Class'KFDifficultyInfo'.static.GetDifficultyValue(2))
            {
                DifficultyIndex = 2;                
            }
            else
            {
                DifficultyIndex = 3;
            }
        }
    }
    if(CurrentBattlePhase == 1)
    {
        MinionWave = SummonWaves[DifficultyIndex].PhaseOneWave;        
    }
    else
    {
        if(CurrentBattlePhase == 2)
        {
            MinionWave = SummonWaves[DifficultyIndex].PhaseTwoWave;            
        }
        else
        {
            if(CurrentBattlePhase == 3)
            {
                MinionWave = SummonWaves[DifficultyIndex].PhaseThreeWave;
            }
        }
    }
    MyKFGameInfo.GetAIDirector().bForceFrustration = true;
    SpawnManager = MyKFGameInfo.SpawnManager;
    if(SpawnManager != none)
    {
        SpawnManager.SummonBossMinions(MinionWave.Squads, NumMinionsToSpawn);
    }
}

simulated function ClearDOTs()
{
    DamageOverTimeArray.Length = 0;
}

simulated event Bump(Actor Other, PrimitiveComponent OtherComp, Vector HitNormal)
{
    local KFPawn KFP;

    if(!bGunsEquipped)
    {
        if(((((((Role == ROLE_Authority) && bInHuntAndHealMode) && MyHansController != none) && NumHuntAndHealEnemyBumps >= 0) && !IsDoingSpecialMove()) && Other.GetTeamNum() != GetTeamNum()) && MyHansController.FindCommandOfClass(Class'AICommand_Attack_Grab') == none)
        {
            KFP = KFPawn(Other);
            if(KFP != none)
            {
                if((WorldInfo.TimeSeconds - LastHuntAndHealEnemyBumpTime) > 1)
                {
                    ++ NumHuntAndHealEnemyBumps;
                    LastHuntAndHealEnemyBumpTime = WorldInfo.TimeSeconds;
                    if(NumHuntAndHealEnemyBumps > 0)
                    {
                        NumHuntAndHealEnemyBumps = -1;
                        MyHansController.CancelFlee(false);
                        MyKFAIC.DoGrabAttack(KFP);
                        return;
                    }
                }
            }
        }
    }
    super(KFPawn_Monster).Bump(Other, OtherComp, HitNormal);
}

function HuntAndHealBump()
{
    local KFPawn_Monster KFPM;
    local Vector ClosestPoint;
    local float ClosestDist;

    if(((MyKFAIC == none) || MyKFAIC.Enemy == none) || VSizeSq(Location - MyKFAIC.Enemy.Location) > float(250000))
    {
        return;
    }
    foreach WorldInfo.AllPawns(Class'KFPawn_Monster', KFPM, Location, 300)
    {
        if((KFPM != self) && KFPM.IsAliveAndWell())
        {
            ClosestDist = PointDistToSegment(KFPM.Location, Location, MyKFAIC.Enemy.Location, ClosestPoint);
            if(ClosestDist < ((GetCollisionRadius()) * 1.5))
            {
                MyKFAIC.DoHeavyZedBump(KFPM, Normal(KFPM.Location - Location));
            }
        }        
    }    
}

function bool NeedToTurnEx(Vector targ, optional float Angle)
{
    local Vector LookDir, AimDir;

    Angle = 0.93;
    LookDir = vector(Rotation);
    LookDir.Z = 0;
    LookDir = Normal(LookDir);
    AimDir = targ - Location;
    AimDir.Z = 0;
    AimDir = Normal(AimDir);
    return (LookDir Dot AimDir) < Angle;
}

simulated function ANIMNOTIFY_AoENerveGas();

simulated function ApplyBloodDecals(int HitZoneIndex, Vector HitLocation, Vector HitDirection, name HitZoneName, name HitBoneName, class<KFDamageType> dmgType, bool bIsDismemberingHit, bool bWasObliterated)
{
    if(!bInHuntAndHealMode)
    {
        super(KFPawn_Monster).ApplyBloodDecals(HitZoneIndex, HitLocation, HitDirection, HitZoneName, HitBoneName, dmgType, bIsDismemberingHit, bWasObliterated);
    }
}

simulated function UpdateShieldColor();

simulated function DetachShieldFX();

defaultproperties
{
    MeleeAttackHelper=KFMeleeHelperAI'Default__KFPawn_ZedHansBase.MeleeHelper'
    begin object name=ThirdPersonHead0 class=SkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: SkeletalMeshComponent'Default__KFPawn_ZedHansBase.ThirdPersonHead0'
    ThirdPersonHeadMeshComponent=ThirdPersonHead0
    AfflictionHandler=KFAfflictionManager'Default__KFPawn_ZedHansBase.Afflictions'
    begin object name=FirstPersonArms class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedHansBase.FirstPersonArms'
    ArmsMesh=FirstPersonArms
    SpecialMoveHandler=KFSpecialMoveHandler'Default__KFPawn_ZedHansBase.SpecialMoveHandler'
    AmbientAkComponent=AkComponent'Default__KFPawn_ZedHansBase.AmbientAkSoundComponent_1'
    WeaponAkComponent=AkComponent'Default__KFPawn_ZedHansBase.AmbientAkSoundComponent'
    WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'Default__KFPawn_ZedHansBase.WeaponAmbientEchoHandler'
    FootstepAkComponent=AkComponent'Default__KFPawn_ZedHansBase.FootstepAkSoundComponent'
    DialogAkComponent=AkComponent'Default__KFPawn_ZedHansBase.DialogAkSoundComponent'
    begin object name=KFPawnSkeletalMeshComponent class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedHansBase.KFPawnSkeletalMeshComponent'
    Mesh=KFPawnSkeletalMeshComponent
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedHansBase.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=Sprite class=SpriteComponent
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__KFPawn_ZedHansBase.Sprite'
    Components(0)=Sprite
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedHansBase.CollisionCylinder'
    Components(1)=CollisionCylinder
    begin object name=Arrow class=ArrowComponent
        ReplacementPrimitive=none
    object end
    // Reference: ArrowComponent'Default__KFPawn_ZedHansBase.Arrow'
    Components(2)=Arrow
    begin object name=KFPawnSkeletalMeshComponent class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedHansBase.KFPawnSkeletalMeshComponent'
    Components(3)=KFPawnSkeletalMeshComponent
    Components(4)=AkComponent'Default__KFPawn_ZedHansBase.AmbientAkSoundComponent'
    Components(5)=AkComponent'Default__KFPawn_ZedHansBase.AmbientAkSoundComponent_1'
    Components(6)=AkComponent'Default__KFPawn_ZedHansBase.FootstepAkSoundComponent'
    Components(7)=AkComponent'Default__KFPawn_ZedHansBase.DialogAkSoundComponent'
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedHansBase.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}