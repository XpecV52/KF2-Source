/*******************************************************************************
 * KFPawn_ZedStalker generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFPawn_ZedStalker extends KFPawn_Monster
    config(Game)
    hidecategories(Navigation);

var MaterialInstanceConstant SpottedMaterial;
var export editinline AkComponent CloakedAkComponent;
var AkEvent CloakedLoop;
var AkEvent CloakedLoopEnd;
var float CloakPercent;
var KFPlayerController ViewerPlayer;
var float CloakSpeed;
var float DeCloakSpeed;

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    SetCloaked(true);
    PlayStealthSoundLoop();
}

simulated event ReplicatedEvent(name VarName)
{
    switch(VarName)
    {
        case 'bIsCloakingSpottedByTeam':
            UpdateGameplayMICParams();
            break;
        case 'bIsCloaking':
            ClientCloakingStateUpdated();
            break;
        default:
            break;
    }
    super.ReplicatedEvent(VarName);
}

function SetCloaked(bool bNewCloaking)
{
    if(bCanCloak)
    {
        if(bNewCloaking && !IsCombatCapable())
        {
            return;
        }
        if(((MaxHeadChunkGoreWhileAlive == 0) && bIsCloaking != bNewCloaking) && IsAliveAndWell())
        {
            if(((Role == ROLE_Authority) && KFGameInfo(WorldInfo.Game) != none) && KFGameInfo(WorldInfo.Game).DialogManager != none)
            {
                KFGameInfo(WorldInfo.Game).DialogManager.PlaySpotCloakDialog(self, bNewCloaking);
            }
        }
        bIsCloaking = bNewCloaking;
        if(WorldInfo.NetMode != NM_DedicatedServer)
        {
            UpdateGameplayMICParams();
            Mesh.SetPerObjectShadows(!bNewCloaking);
            ClearBloodDecals();
        }
        super.SetCloaked(bNewCloaking);
    }
}

simulated function ClientCloakingStateUpdated()
{
    if(bIsCloaking)
    {
        ClearBloodDecals();
    }
    UpdateGameplayMICParams();
    Mesh.SetPerObjectShadows(!bIsCloaking);
}

simulated function UpdateGameplayMICParams()
{
    local bool bIsSpotted;

    super.UpdateGameplayMICParams();
    if(!bIsGoreMesh && WorldInfo.NetMode != NM_DedicatedServer)
    {
        bIsSpotted = bIsCloakingSpottedByLP || bIsCloakingSpottedByTeam;
        if(bIsSpotted && bIsCloaking)
        {
            CharacterMICs[0].SetParent(SpottedMaterial);            
        }
        else
        {
            if(CharacterMICs[0].Parent == SpottedMaterial)
            {
                CharacterMICs[0].SetParent(Mesh.SkeletalMesh.Materials[0]);
                PlayStealthSoundLoop();
            }
        }
    }
}

simulated event NotifyGoreMeshActive()
{
    super.NotifyGoreMeshActive();
    if(((Role == ROLE_Authority) && KFGameInfo(WorldInfo.Game) != none) && KFGameInfo(WorldInfo.Game).DialogManager != none)
    {
        KFGameInfo(WorldInfo.Game).DialogManager.PlaySpotCloakDialog(self, false);
    }
    PlayStealthSoundLoopEnd();
    bIsCloaking = false;
    bIsCloakingSpottedByLP = false;
    bIsCloakingSpottedByTeam = false;
    if((PlayerReplicationInfo == none) && Mesh.SkeletalMesh.Materials.Length > 2)
    {
        CharacterMICs[0].SetParent(Mesh.SkeletalMesh.Materials[2]);
    }
}

simulated function TerminateEffectsOnDeath()
{
    PlayStealthSoundLoopEnd();
    super(KFPawn).TerminateEffectsOnDeath();
}

simulated function PlayStealthSoundLoop()
{
    if((WorldInfo.NetMode != NM_DedicatedServer) && !CloakedAkComponent.IsPlaying(CloakedLoop))
    {
        CloakedAkComponent.PlayEvent(CloakedLoop, true, true);
    }
}

simulated function PlayStealthSoundLoopEnd()
{
    if((WorldInfo.NetMode != NM_DedicatedServer) && CloakedAkComponent.IsPlaying(CloakedLoop))
    {
        CloakedAkComponent.PlayEvent(CloakedLoopEnd, true, true);
    }
}

simulated event Tick(float DeltaTime)
{
    local float MinCloakPct;

    super.Tick(DeltaTime);
    if(WorldInfo.NetMode != NM_DedicatedServer)
    {
        if(ViewerPlayer == none)
        {
            ViewerPlayer = KFPlayerController(GetALocalPlayerController());
        }
        MinCloakPct = GetMinCloakPct();
        if(!bIsCloaking)
        {
            if(CloakPercent < 1)
            {
                CloakPercent = FMin(CloakPercent + (DeltaTime * DeCloakSpeed), 1);
                CharacterMICs[0].SetScalarParameterValue('Transparency', CloakPercent);
            }            
        }
        else
        {
            if(CloakPercent > MinCloakPct)
            {
                CloakPercent = FMax(CloakPercent - (DeltaTime * CloakSpeed), MinCloakPct);
                CharacterMICs[0].SetScalarParameterValue('Transparency', CloakPercent);
            }
        }
    }
}

protected simulated function float GetMinCloakPct()
{
    if((ViewerPlayer != none) && (ViewerPlayer.GetTeamNum() == GetTeamNum()) || ViewerPlayer.PlayerReplicationInfo.bOnlySpectator)
    {
        return 0.5;
    }
    return 0;
}

simulated event UpdateSpottedStatus()
{
    local bool bOldSpottedByLP;
    local KFPerk LocalPerk;
    local float DistanceSq, Range;

    if(WorldInfo.NetMode == NM_DedicatedServer)
    {
        return;
    }
    bOldSpottedByLP = bIsCloakingSpottedByLP;
    bIsCloakingSpottedByLP = false;
    if(!IsHumanControlled() || bIsSprinting)
    {
        if(ViewerPlayer == none)
        {
            ViewerPlayer = KFPlayerController(GetALocalPlayerController());
        }
        if(ViewerPlayer != none)
        {
            LocalPerk = ViewerPlayer.GetPerk();
        }
        if((((((ViewerPlayer != none) && ViewerPlayer.Pawn != none) && ViewerPlayer.Pawn.IsAliveAndWell()) && LocalPerk != none) && LocalPerk.bCanSeeCloakedZeds) && (WorldInfo.TimeSeconds - LastRenderTime) < 1)
        {
            DistanceSq = VSizeSq(ViewerPlayer.Pawn.Location - Location);
            Range = LocalPerk.GetCloakDetectionRange();
            if(DistanceSq < Square(Range))
            {
                bIsCloakingSpottedByLP = true;
                if(LocalPerk.IsCallOutActive())
                {
                    ViewerPlayer.ServerCallOutPawnCloaking(self);
                }
            }
        }
    }
    if(!bIsCloakingSpottedByTeam)
    {
        if(bIsCloakingSpottedByLP != bOldSpottedByLP)
        {
            UpdateGameplayMICParams();
        }
    }
}

function CallOutCloaking(optional KFPlayerController CallOutController)
{
    bIsCloakingSpottedByTeam = true;
    LastStoredCC = CallOutController;
    UpdateGameplayMICParams();
    SetTimer(2, false, 'CallOutCloakingExpired');
}

function CallOutCloakingExpired()
{
    bIsCloakingSpottedByTeam = false;
    LastStoredCC = none;
    UpdateGameplayMICParams();
}

simulated function bool Rally(KFPawn RallyInstigator, ParticleSystem RallyEffect, name EffectBoneName, Vector EffectOffset, ParticleSystem AltRallyEffect, name AltEffectBoneNames[2], Vector AltEffectOffset, optional bool bSkipEffects)
{
    local PlayerController PC;

    bSkipEffects = false;
    if(WorldInfo.NetMode != NM_DedicatedServer)
    {
        PC = WorldInfo.GetALocalPlayerController();
        if(((((bIsCloaking && !bIsCloakingSpottedByLP) && !bIsCloakingSpottedByTeam) && PC.GetTeamNum() < 255) && PC.Pawn != none) && PC.Pawn.IsAliveAndWell())
        {
            bSkipEffects = true;
        }
    }
    return super.Rally(RallyInstigator, RallyEffect, EffectBoneName, EffectOffset, AltRallyEffect, AltEffectBoneNames, AltEffectOffset, bSkipEffects);
}

simulated function PlayDying(class<DamageType> DamageType, Vector HitLoc)
{
    SetCloaked(false);
    bCanCloak = false;
    super.PlayDying(DamageType, HitLoc);
}

function CauseHeadTrauma(optional float BleedOutTime)
{
    BleedOutTime = 5;
    super.CauseHeadTrauma(BleedOutTime);
    if((bIsHeadless && IsAliveAndWell()) && !IsDoingSpecialMove())
    {
        SetCloaked(false);
    }
}

function OnStackingAfflictionChanged(byte Id)
{
    super.OnStackingAfflictionChanged(Id);
    if((Role == ROLE_Authority) && IsAliveAndWell())
    {
        if(Id == 0)
        {
            SetCloaked(!bEmpPanicked && !bEmpDisrupted);
        }
    }
}

function PlayHit(float Damage, Controller InstigatedBy, Vector HitLocation, class<DamageType> DamageType, Vector Momentum, TraceHitInfo HitInfo)
{
    super.PlayHit(Damage, InstigatedBy, HitLocation, DamageType, Momentum, HitInfo);
    SetCloaked(false);
    if((HitFxInfo.DamageType != none) && HitFxInfo.DamageType.default.MeleeHitPower > float(0))
    {
        SetTimer(1, false, 'ReCloakTimer');        
    }
    else
    {
        SetTimer(0.35, false, 'ReCloakTimer');
    }
}

simulated function PlayHeadAsplode()
{
    if(bIsCloaking)
    {
        SetCloaked(false);
    }
    bCanCloak = false;
    super.PlayHeadAsplode();
}

simulated function ReCloakTimer()
{
    SetCloaked(true);
}

static function bool IsStalkerPawn()
{
    return true;
}

function int GetKillerDialogID()
{
    return 66;
}

function int GetSpotterDialogID()
{
    if(bIsCloaking && MaxHeadChunkGoreWhileAlive == 0)
    {
        return 135;
    }
    return 125;
}

static function int GetTraderAdviceID()
{
    return 40;
}

defaultproperties
{
    SpottedMaterial=MaterialInstanceConstant'ZED_Stalker_MAT.ZED_Stalker_Visible_MAT'
    begin object name=CloakedAkComponent0 class=AkComponent
        BoneName=Dummy
        bStopWhenOwnerDestroyed=true
        bForceOcclusionUpdateInterval=true
        OcclusionUpdateInterval=0.4
    object end
    // Reference: AkComponent'Default__KFPawn_ZedStalker.CloakedAkComponent0'
    CloakedAkComponent=CloakedAkComponent0
    CloakedLoop=AkEvent'WW_ZED_Stalker.ZED_Stalker_SFX_Stealth_LP'
    CloakedLoopEnd=AkEvent'WW_ZED_Stalker.ZED_Stalker_SFX_Stealth_LP_Stop'
    CloakPercent=1
    CloakSpeed=4
    DeCloakSpeed=4.5
    bCloakOnMeleeEnd=true
    bIsStalkerClass=true
    MonsterArchPath="ZED_ARCH.ZED_Stalker_Archetype"
    ElitePawnClass=/* Array type was not detected. */
    begin object name=MeleeHelper class=KFMeleeHelperAI
        BaseDamage=9
        MyDamageType=Class'KFDT_Slashing_ZedWeak'
        MomentumTransfer=25000
    object end
    // Reference: KFMeleeHelperAI'Default__KFPawn_ZedStalker.MeleeHelper'
    MeleeAttackHelper=MeleeHelper
    DoshValue=15
    XPValues[0]=8
    XPValues[1]=10
    XPValues[2]=10
    XPValues[3]=10
    ZEDCowboyHatAttachName=Hat_Attach
    DamageTypeModifiers=/* Array type was not detected. */
    DifficultySettings=Class'KFDifficulty_Stalker'
    SprintAkComponent=AkComponent'Default__KFPawn_ZedStalker.SprintAkComponent0'
    HeadShotAkComponent=AkComponent'Default__KFPawn_ZedStalker.HeadshotAkComponent0'
    PawnAnimInfo=KFPawnAnimInfo'ZED_Stalker_ANIM.Stalker_AnimGroup'
    LocalizationKey=KFPawn_ZedStalker
    begin object name=ThirdPersonHead0 class=SkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: SkeletalMeshComponent'Default__KFPawn_ZedStalker.ThirdPersonHead0'
    ThirdPersonHeadMeshComponent=ThirdPersonHead0
    bCanCloak=true
    bIsCloaking=true
    PenetrationResistance=0.5
    AfflictionHandler=KFAfflictionManager'Default__KFPawn_ZedStalker.Afflictions'
    IncapSettings=/* Array type was not detected. */
    PhysRagdollImpulseScale=0.9
    KnockdownImpulseScale=0.9
    SprintSpeed=500
    begin object name=FirstPersonArms class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedStalker.FirstPersonArms'
    ArmsMesh=FirstPersonArms
    begin object name=SpecialMoveHandler class=KFSpecialMoveHandler
        SpecialMoveClasses=/* Array type was not detected. */
    object end
    // Reference: KFSpecialMoveHandler'Default__KFPawn_ZedStalker.SpecialMoveHandler'
    SpecialMoveHandler=SpecialMoveHandler
    AmbientAkComponent=AkComponent'Default__KFPawn_ZedStalker.AmbientAkSoundComponent_1'
    WeaponAkComponent=AkComponent'Default__KFPawn_ZedStalker.AmbientAkSoundComponent'
    WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'Default__KFPawn_ZedStalker.WeaponAmbientEchoHandler'
    SecondaryWeaponAkComponent=AkComponent'Default__KFPawn_ZedStalker.SecondaryWeaponAkSoundComponent'
    FootstepAkComponent=AkComponent'Default__KFPawn_ZedStalker.FootstepAkSoundComponent'
    DialogAkComponent=AkComponent'Default__KFPawn_ZedStalker.DialogAkSoundComponent'
    PowerUpAkComponent=AkComponent'Default__KFPawn_ZedStalker.PowerUpAkSoundComponent'
    DamageRecoveryTimeHeavy=0.65
    Mass=50
    GroundSpeed=400
    Health=75
    ControllerClass=Class'KFAIController_ZedStalker'
    begin object name=KFPawnSkeletalMeshComponent class=KFSkeletalMeshComponent
        bUpdateKinematicBonesFromAnimation=true
        ReplacementPrimitive=none
        bAllowPerObjectShadows=false
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedStalker.KFPawnSkeletalMeshComponent'
    Mesh=KFPawnSkeletalMeshComponent
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedStalker.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=Sprite class=SpriteComponent
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__KFPawn_ZedStalker.Sprite'
    Components(0)=Sprite
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedStalker.CollisionCylinder'
    Components(1)=CollisionCylinder
    begin object name=Arrow class=ArrowComponent
        ReplacementPrimitive=none
    object end
    // Reference: ArrowComponent'Default__KFPawn_ZedStalker.Arrow'
    Components(2)=Arrow
    begin object name=KFPawnSkeletalMeshComponent class=KFSkeletalMeshComponent
        bUpdateKinematicBonesFromAnimation=true
        ReplacementPrimitive=none
        bAllowPerObjectShadows=false
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedStalker.KFPawnSkeletalMeshComponent'
    Components(3)=KFPawnSkeletalMeshComponent
    Components(4)=AkComponent'Default__KFPawn_ZedStalker.AmbientAkSoundComponent'
    Components(5)=AkComponent'Default__KFPawn_ZedStalker.AmbientAkSoundComponent_1'
    Components(6)=AkComponent'Default__KFPawn_ZedStalker.FootstepAkSoundComponent'
    Components(7)=AkComponent'Default__KFPawn_ZedStalker.DialogAkSoundComponent'
    Components(8)=AkComponent'Default__KFPawn_ZedStalker.PowerUpAkSoundComponent'
    Components(9)=AkComponent'Default__KFPawn_ZedStalker.SecondaryWeaponAkSoundComponent'
    Components(10)=AkComponent'Default__KFPawn_ZedStalker.SprintAkComponent0'
    Components(11)=AkComponent'Default__KFPawn_ZedStalker.HeadshotAkComponent0'
    begin object name=CloakedAkComponent0 class=AkComponent
        BoneName=Dummy
        bStopWhenOwnerDestroyed=true
        bForceOcclusionUpdateInterval=true
        OcclusionUpdateInterval=0.4
    object end
    // Reference: AkComponent'Default__KFPawn_ZedStalker.CloakedAkComponent0'
    Components(12)=CloakedAkComponent0
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedStalker.CollisionCylinder'
    CollisionComponent=CollisionCylinder
    RotationRate=(Pitch=50000,Yaw=45000,Roll=50000)
}