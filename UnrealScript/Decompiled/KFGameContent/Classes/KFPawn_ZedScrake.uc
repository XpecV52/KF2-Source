/*******************************************************************************
 * KFPawn_ZedScrake generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFPawn_ZedScrake extends KFPawn_Monster
    config(Game)
    hidecategories(Navigation);

var protected export editinline AkComponent ChainsawIdleAkComponent;
var protected AkEvent PlayChainsawIdleAkEvent;
var protected AkEvent StopChainsawIdleAkEvent;
var name ExhaustSocketName;
var ParticleSystem ExhaustTemplate;
var export editinline ParticleSystemComponent ExhaustPSC;
/** Threshold of health below which the Scrake will start rage charging on normal */
var(RageCharge) float RageHealthThresholdNormal;
/** Threshold of health below which the Scrake will start rage charging on hard */
var(RageCharge) float RageHealthThresholdHard;
/** Threshold of health below which the Scrake will start rage charging on suicidal */
var(RageCharge) float RageHealthThresholdSuicidal;
/** Threshold of health below which the Scrake will start rage charging on hell on earth */
var(RageCharge) float RageHealthThresholdHellOnEarth;
/** Threshold of health below which the Scrake will start rage charging (determined by difficulty) */
var(RageCharge) float RageHealthThreshold;

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    if(WorldInfo.NetMode != NM_DedicatedServer)
    {
        ChainsawIdleAkComponent.PlayEvent(PlayChainsawIdleAkEvent, true, true);
        CreateExhaustFx();
    }
}

simulated function SetCharacterArch(KFCharacterInfoBase Info, optional bool bForce)
{
    super.SetCharacterArch(Info);
    if((WorldInfo.NetMode != NM_DedicatedServer) && Mesh != none)
    {
        CharacterMICs[1] = Mesh.CreateAndSetMaterialInstanceConstant(2);
    }
}

function PossessedBy(Controller C, bool bVehicleTransition)
{
    local KFAIController_Monster KFAICM;

    super.PossessedBy(C, bVehicleTransition);
    if(!IsHumanControlled())
    {
        KFAICM = KFAIController_Monster(C);
        if(KFAICM != none)
        {
            if(KFAICM.Skill == Class'KFGameDifficultyInfo'.static.GetDifficultyValue(0))
            {
                RageHealthThreshold = RageHealthThresholdNormal;                
            }
            else
            {
                if(KFAICM.Skill <= Class'KFGameDifficultyInfo'.static.GetDifficultyValue(1))
                {
                    RageHealthThreshold = RageHealthThresholdHard;                    
                }
                else
                {
                    if(KFAICM.Skill <= Class'KFGameDifficultyInfo'.static.GetDifficultyValue(2))
                    {
                        RageHealthThreshold = RageHealthThresholdSuicidal;                        
                    }
                    else
                    {
                        RageHealthThreshold = RageHealthThresholdHellOnEarth;
                    }
                }
            }
        }        
    }
    else
    {
        if(WorldInfo.Game.GetModifiedGameDifficulty() == 0)
        {
            RageHealthThreshold = RageHealthThresholdNormal;            
        }
        else
        {
            if(WorldInfo.Game.GetModifiedGameDifficulty() == 1)
            {
                RageHealthThreshold = RageHealthThresholdHard;                
            }
            else
            {
                if(WorldInfo.Game.GetModifiedGameDifficulty() == 2)
                {
                    RageHealthThreshold = RageHealthThresholdSuicidal;                    
                }
                else
                {
                    RageHealthThreshold = RageHealthThresholdHellOnEarth;
                }
            }
        }
    }
}

simulated function CreateExhaustFx()
{
    local Vector Loc;
    local Rotator Rot;

    if((ExhaustPSC == none) && ExhaustTemplate != none)
    {
        if(Mesh.GetSocketWorldLocationAndRotation(ExhaustSocketName, Loc, Rot))
        {
            ExhaustPSC = new (self) Class'ParticleSystemComponent';
            ExhaustPSC.SetTemplate(ExhaustTemplate);
            Mesh.AttachComponentToSocket(ExhaustPSC, ExhaustSocketName);
        }
    }
}

event TakeDamage(int Damage, Controller InstigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser)
{
    super.TakeDamage(Damage, InstigatedBy, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
    if((bCanRage && !bPlayedDeath) && (GetHealthPercentage() < RageHealthThreshold) || (GetHeadHealthPercent()) < RageHealthThreshold)
    {
        SetEnraged(true);
    }
}

simulated event bool IsEnraged()
{
    return bIsEnraged;
}

function bool CanBlock()
{
    return !bIsEnraged && super.CanBlock();
}

function CauseHeadTrauma(optional float BleedOutTime)
{
    BleedOutTime = 5;
    super.CauseHeadTrauma(BleedOutTime);
    SetEnraged(false);
}

simulated event NotifyGoreMeshActive()
{
    super.NotifyGoreMeshActive();
    if((WorldInfo.NetMode != NM_DedicatedServer) && Mesh != none)
    {
        CharacterMICs[1] = Mesh.CreateAndSetMaterialInstanceConstant(2);
    }
}

simulated function TerminateEffectsOnDeath()
{
    CleanupChainsaw();
    super(KFPawn).TerminateEffectsOnDeath();
}

simulated function CleanupChainsaw()
{
    local MaterialInstanceConstant ChainsawBladeMIC;

    if(WorldInfo.NetMode != NM_DedicatedServer)
    {
        ChainsawBladeMIC = Mesh.CreateAndSetMaterialInstanceConstant(1);
        ChainsawBladeMIC.SetScalarParameterValue('Animation_Scalar', 0);
        ChainsawIdleAkComponent.PlayEvent(StopChainsawIdleAkEvent);
        if(ExhaustPSC != none)
        {
            ExhaustPSC.DeactivateSystem();
            DetachComponent(ExhaustPSC);
            WorldInfo.MyEmitterPool.OnParticleSystemFinished(ExhaustPSC);
            ExhaustPSC = none;
        }
    }
}

function int GetSpotterDialogID()
{
    return 129;
}

static function int GetTraderAdviceID()
{
    return 42;
}

function SetSprinting(bool bNewSprintStatus)
{
    if((bEmpDisrupted && bNewSprintStatus) && (MyKFAIC == none) || !MyKFAIC.bHasDebugCommand)
    {
        return;
    }
    super.SetSprinting(bNewSprintStatus);
}

function OnStackingAfflictionChanged(byte Id)
{
    super.OnStackingAfflictionChanged(Id);
    if(((bEmpDisrupted && bIsSprinting) && MyKFAIC != none) && IsAliveAndWell())
    {
        SetSprinting(false);
    }
}

defaultproperties
{
    begin object name=ChainsawAkComponent0 class=AkComponent
        BoneName=Dummy
        bStopWhenOwnerDestroyed=true
        bForceOcclusionUpdateInterval=true
        OcclusionUpdateInterval=0.2
    object end
    // Reference: AkComponent'Default__KFPawn_ZedScrake.ChainsawAkComponent0'
    ChainsawIdleAkComponent=ChainsawAkComponent0
    PlayChainsawIdleAkEvent=AkEvent'WW_ZED_Scrake_2.ZED_Scrake_SFX_Chainsaw_Idle_LP'
    StopChainsawIdleAkEvent=AkEvent'WW_ZED_Scrake_2.ZED_Scrake_SFX_Chainsaw_Idle_LP_Stop'
    ExhaustSocketName=FX_Exhaust
    ExhaustTemplate=ParticleSystem'ZED_Scrake_EMIT.FX_Scrake_Smoke_Idle_01'
    RageHealthThresholdNormal=0.5
    RageHealthThresholdHard=0.75
    RageHealthThresholdSuicidal=0.75
    RageHealthThresholdHellOnEarth=0.9
    bLargeZed=true
    bCanRage=true
    MonsterArchPath="ZED_ARCH.ZED_Scrake_Archetype"
    HeadlessBleedOutTime=6
    ParryResistance=4
    MinSpawnSquadSizeType=ESquadType.EST_Large
    begin object name=MeleeHelper class=KFMeleeHelperAI
        BaseDamage=30
        MyDamageType=Class'KFDT_Slashing_Scrake'
        MomentumTransfer=45000
        MaxHitRange=200
    object end
    // Reference: KFMeleeHelperAI'Default__KFPawn_ZedScrake.MeleeHelper'
    MeleeAttackHelper=MeleeHelper
    DoshValue=75
    XPValues[0]=34
    XPValues[1]=45
    XPValues[2]=60
    XPValues[3]=69
    DamageTypeModifiers=/* Array type was not detected. */
    ZedBumpDamageScale=0.1
    DifficultySettings=Class'KFDifficulty_Scrake'
    BumpDamageType=Class'KFGame.KFDT_NPCBump_Large'
    SprintAkComponent=AkComponent'Default__KFPawn_ZedScrake.SprintAkComponent0'
    HeadShotAkComponent=AkComponent'Default__KFPawn_ZedScrake.HeadshotAkComponent0'
    OnDeathAchievementID=132
    PawnAnimInfo=KFPawnAnimInfo'ZED_Scrake_ANIM.Scrake_AnimGroup'
    LocalizationKey=KFPawn_ZedScrake
    begin object name=ThirdPersonHead0 class=SkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: SkeletalMeshComponent'Default__KFPawn_ZedScrake.ThirdPersonHead0'
    ThirdPersonHeadMeshComponent=ThirdPersonHead0
    HitZones=/* Array type was not detected. */
    PenetrationResistance=4
    begin object name=Afflictions class=KFAfflictionManager
        AfflictionClasses=/* Array type was not detected. */
        FireFullyCharredDuration=5
    object end
    // Reference: KFAfflictionManager'Default__KFPawn_ZedScrake.Afflictions'
    AfflictionHandler=Afflictions
    IncapSettings=/* Array type was not detected. */
    KnockdownImpulseScale=2
    SprintSpeed=600
    begin object name=FirstPersonArms class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedScrake.FirstPersonArms'
    ArmsMesh=FirstPersonArms
    begin object name=SpecialMoveHandler class=KFSpecialMoveHandler
        SpecialMoveClasses=/* Array type was not detected. */
    object end
    // Reference: KFSpecialMoveHandler'Default__KFPawn_ZedScrake.SpecialMoveHandler'
    SpecialMoveHandler=SpecialMoveHandler
    AmbientAkComponent=AkComponent'Default__KFPawn_ZedScrake.AmbientAkSoundComponent_1'
    WeaponAkComponent=AkComponent'Default__KFPawn_ZedScrake.AmbientAkSoundComponent'
    WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'Default__KFPawn_ZedScrake.WeaponAmbientEchoHandler'
    SecondaryWeaponAkComponent=AkComponent'Default__KFPawn_ZedScrake.SecondaryWeaponAkSoundComponent'
    FootstepAkComponent=AkComponent'Default__KFPawn_ZedScrake.FootstepAkSoundComponent'
    DialogAkComponent=AkComponent'Default__KFPawn_ZedScrake.DialogAkSoundComponent'
    PowerUpAkComponent=AkComponent'Default__KFPawn_ZedScrake.PowerUpAkSoundComponent'
    DamageRecoveryTimeHeavy=0.85
    DamageRecoveryTimeMedium=0.75
    Mass=130
    GroundSpeed=170
    Health=1100
    ControllerClass=Class'KFAIController_ZedScrake'
    begin object name=KFPawnSkeletalMeshComponent class=KFSkeletalMeshComponent
        bUpdateKinematicBonesFromAnimation=true
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedScrake.KFPawnSkeletalMeshComponent'
    Mesh=KFPawnSkeletalMeshComponent
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionRadius=55
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedScrake.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=Sprite class=SpriteComponent
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__KFPawn_ZedScrake.Sprite'
    Components(0)=Sprite
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionRadius=55
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedScrake.CollisionCylinder'
    Components(1)=CollisionCylinder
    begin object name=Arrow class=ArrowComponent
        ReplacementPrimitive=none
    object end
    // Reference: ArrowComponent'Default__KFPawn_ZedScrake.Arrow'
    Components(2)=Arrow
    begin object name=KFPawnSkeletalMeshComponent class=KFSkeletalMeshComponent
        bUpdateKinematicBonesFromAnimation=true
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedScrake.KFPawnSkeletalMeshComponent'
    Components(3)=KFPawnSkeletalMeshComponent
    Components(4)=AkComponent'Default__KFPawn_ZedScrake.AmbientAkSoundComponent'
    Components(5)=AkComponent'Default__KFPawn_ZedScrake.AmbientAkSoundComponent_1'
    Components(6)=AkComponent'Default__KFPawn_ZedScrake.FootstepAkSoundComponent'
    Components(7)=AkComponent'Default__KFPawn_ZedScrake.DialogAkSoundComponent'
    Components(8)=AkComponent'Default__KFPawn_ZedScrake.PowerUpAkSoundComponent'
    Components(9)=AkComponent'Default__KFPawn_ZedScrake.SecondaryWeaponAkSoundComponent'
    Components(10)=AkComponent'Default__KFPawn_ZedScrake.SprintAkComponent0'
    Components(11)=AkComponent'Default__KFPawn_ZedScrake.HeadshotAkComponent0'
    begin object name=ChainsawAkComponent0 class=AkComponent
        BoneName=Dummy
        bStopWhenOwnerDestroyed=true
        bForceOcclusionUpdateInterval=true
        OcclusionUpdateInterval=0.2
    object end
    // Reference: AkComponent'Default__KFPawn_ZedScrake.ChainsawAkComponent0'
    Components(12)=ChainsawAkComponent0
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionRadius=55
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedScrake.CollisionCylinder'
    CollisionComponent=CollisionCylinder
    RotationRate=(Pitch=50000,Yaw=50000,Roll=50000)
}