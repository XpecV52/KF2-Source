/*******************************************************************************
 * KFPawn_ZedDAR generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFPawn_ZedDAR extends KFPawn_Monster
    abstract
    config(Game)
    hidecategories(Navigation);

const ChestBombZoneIndex = 3;

var protected KFAIController_ZedDAR MyDARController;
var class<KFProjectile> RangedProjectileClass;
var const name FiringSocketLName;
var const name FiringSocketRName;
var name FiringSocketName;
var protected transient bool bHasExploded;
var transient bool bChestArmorDestroyedThisFrame;
var protected KFGameExplosion ExplosionTemplate;

function PossessedBy(Controller C, bool bVehicleTransition)
{
    super.PossessedBy(C, bVehicleTransition);
    MyDARController = KFAIController_ZedDAR(C);
}

simulated function StartRangedAttack()
{
    local KFSM_RangedAttack RangedSM;

    if(MyDARController != none)
    {
        RangedSM = KFSM_RangedAttack(SpecialMoves[SpecialMove]);
        MyDARController.FireRangedAttack(RangedProjectileClass, RangedSM.GetFireOffset());
    }
}

function OnStackingAfflictionChanged(byte Id)
{
    super.OnStackingAfflictionChanged(Id);
    if((MyKFAIC == none) || !IsAliveAndWell())
    {
        return;
    }
    if(bEmpDisrupted)
    {
        if(IsDoingSpecialMove(22))
        {
            EndSpecialMove();
        }
    }
}

function AdjustPlayHitForArmor(out float InDamage, out TraceHitInfo InHitInfo)
{
    local int HitZoneIdx;

    HitZoneIdx = GetHitZoneIndex(InHitInfo.BoneName);
    if((HitZoneIdx == -1) || HitZones[HitZoneIdx].GoreHealth > 0)
    {
        super.AdjustPlayHitForArmor(InDamage, InHitInfo);
    }
}

function int GetHitZoneIndex(name BoneName)
{
    if(BoneName == 'KBArmor')
    {
        return OverrideArmorFXIndex;
    }
    return super(KFPawn).GetHitZoneIndex(BoneName);
}

simulated function KFSkinTypeEffects GetHitZoneSkinTypeEffects(int HitZoneIdx)
{
    if(HitZoneIdx == OverrideArmorFXIndex)
    {
        return CharacterArch.ImpactSkins[3];
    }
    return super(KFPawn).GetHitZoneSkinTypeEffects(HitZoneIdx);
}

function CauseHeadTrauma(optional float BleedOutTime)
{
    BleedOutTime = 5;
}

function ZedExplodeArmor(int ArmorZoneIdx, name ArmorZoneName)
{
    super.ZedExplodeArmor(ArmorZoneIdx, ArmorZoneName);
    if(MyDARController != none)
    {
        MyDARController.OnArmorLoss(ArmorZoneName);
    }
    if(ArmorZoneName == 'Front')
    {
        bChestArmorDestroyedThisFrame = true;
    }
}

function SetSprinting(bool bNewSprintStatus)
{
    if(bNewSprintStatus)
    {
        if(CanDoSpecialMove(20))
        {
            DoSpecialMove(20, true,, SpecialMoves[20].PackFlagsBase(self));
        }        
    }
    else
    {
        super.SetSprinting(bNewSprintStatus);
    }
}

simulated function NotifySpecialMoveEnded(KFSpecialMove FinishedMove, KFGame.KFPawn.ESpecialMove SMHandle)
{
    super.NotifySpecialMoveEnded(FinishedMove, SMHandle);
    if(SMHandle == 20)
    {
        SetSprinting(true);
    }
}

function PlayHit(float Damage, Controller InstigatedBy, Vector HitLocation, class<DamageType> DamageType, Vector Momentum, TraceHitInfo HitInfo)
{
    super.PlayHit(Damage, InstigatedBy, HitLocation, DamageType, Momentum, HitInfo);
    if(((Role == ROLE_Authority) && TimeOfDeath == WorldInfo.TimeSeconds) && bChestArmorDestroyedThisFrame)
    {
        bChestArmorDestroyedThisFrame = false;
        TriggerExplosion(true);
    }
}

simulated function PlayDeadHitEffects(Vector HitLocation, Vector HitDirection, int HitZoneIndex, name HitZoneName, name HitBoneName, class<KFDamageType> dmgType, optional bool bUseHitImpulse)
{
    local class<KFProj_PinningBullet> PinProjectileClass;
    local KFPawn DeadPawn;
    local KFGoreManager GoreManager;
    local bool bIsDismemberingHit, bWasObliterated;

    if(bAllowRagdollAndGoreOnDeadBodies || (WorldInfo.TimeSeconds - TimeOfDeath) <= 3)
    {
        if(((InjuredHitZones & (1 << HitZoneIndex)) > 0) && !HitZones[HitZoneIndex].bPlayedInjury)
        {
            bIsDismemberingHit = PlayDismemberment(HitZoneIndex, dmgType, HitDirection);
            if(!bIsDismemberingHit && (InjuredHitZones & (1 << 0)) > 0)
            {
                PlayHeadAsplode();
                bIsDismemberingHit = true;
            }
        }
        GoreManager = KFGoreManager(WorldInfo.MyGoreEffectManager);
        if(((GoreManager.AllowMutilation() && HitFxInfo.bObliterated || HitZoneIndex == 3) && (WorldInfo.TimeSeconds - TimeOfDeath) < 0.25) && !bUseDamageInflation)
        {
            bWasObliterated = true;
            bIsDismemberingHit = true;
            HandlePartialGoreAndGibs(dmgType, HitLocation, HitDirection, HitBoneName, true);
            GoreManager = KFGoreManager(WorldInfo.MyGoreEffectManager);
            GoreManager.SpawnObliterationBloodEffect(self);            
        }
        else
        {
            PinProjectileClass = dmgType.static.GetPinProjectileClass();
            if(PinProjectileClass != none)
            {
                DeadPawn = self;
                PinProjectileClass.static.CreatePin(DeadPawn, HitLocation, HitDirection, HitBoneName);
            }
            HandlePartialGoreAndGibs(dmgType, HitLocation, HitDirection, HitBoneName, false);
        }
        HandleRagdollImpulseEffects(HitLocation, HitDirection, HitZoneName, HitBoneName, dmgType, bIsDismemberingHit, bUseHitImpulse);
    }
    ApplyBloodDecals(HitZoneIndex, HitLocation, HitDirection, HitZoneName, HitBoneName, dmgType, bIsDismemberingHit, bWasObliterated);
}

function bool CanInjureHitZone(class<DamageType> DamageType, int HitZoneIdx)
{
    if((HitZoneIdx == 3) && !bPlayedDeath || WorldInfo.TimeSeconds == TimeOfDeath)
    {
        return true;
    }
    return super(KFPawn).CanInjureHitZone(DamageType, HitZoneIdx);
}

simulated function HitZoneInjured(optional int HitZoneIdx)
{
    HitZoneIdx = -1;
    super.HitZoneInjured(HitZoneIdx);
    if((Role == ROLE_Authority) && HitZoneIdx == 3)
    {
        TriggerExplosion(true);
    }
}

simulated function TriggerExplosion(optional bool bIgnoreHumans)
{
    local KFExplosionActorReplicated ExploActor;
    local Controller DamageInstigator, OldController;
    local bool bExplodeOnDeath;

    bExplodeOnDeath = WorldInfo.TimeSeconds == TimeOfDeath;
    if(!bHasExploded)
    {
        OldController = Controller;
        bHasExploded = true;
        if(Role == ROLE_Authority)
        {
            ExploActor = Spawn(Class'KFExplosionActorReplicated', self);
            if(ExploActor != none)
            {
                DamageInstigator = (((bIgnoreHumans && LastHitBy != none) && KFPlayerController(LastHitBy) != none) ? LastHitBy : MyKFAIC);
                ExploActor.InstigatorController = DamageInstigator;
                ExploActor.Instigator = self;
                ExploActor.Attachee = self;
                if(bIgnoreHumans)
                {
                    ExplosionTemplate.ActorClassToIgnoreForDamage = Class'KFPawn_Human';                    
                }
                else
                {
                    ExplosionTemplate.ActorClassToIgnoreForDamage = none;
                }
                ExploActor.Explode(ExplosionTemplate, vect(0, 0, 1));
            }
            if(!bPlayedDeath || bExplodeOnDeath)
            {
                Health = 0;
                Died(DamageInstigator, ExplosionTemplate.MyDamageType, Location);
            }
        }
        OnExploded(OldController);
    }
}

function bool WeeklyShouldExplodeOnDeath()
{
    return !bHasExploded;
}

simulated function OnExploded(Controller SuicideController);

simulated function bool ShouldAllowHeadBoneToBreak(name BoneName)
{
    return true;
}

defaultproperties
{
    begin object name=ExploTemplate0 class=KFGameExplosion
        ExplosionEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Explosions.EDar_EMP_Explosion'
        Damage=25
        DamageFalloffExponent=0.5
        MyDamageType=Class'KFGame.KFDT_EMP'
        ExplosionSound=AkEvent'WW_WEP_EXP_Grenade_EMP.Play_WEP_EXP_Grenade_EMP_Explosion'
        ExploLight=PointLightComponent'Default__KFPawn_ZedDAR.ExplosionPointLight'
        ExploLightFadeOutTime=0.5
        CamShake=KFCameraShake'FX_CameraShake_Arch.Misc_Explosions.HuskSuicide'
    object end
    // Reference: KFGameExplosion'Default__KFPawn_ZedDAR.ExploTemplate0'
    ExplosionTemplate=ExploTemplate0
    MinSpawnSquadSizeType=ESquadType.EST_Medium
    RepArmorPct[0]=255
    RepArmorPct[1]=255
    ArmorZoneStatus=3
    PreviousArmorZoneStatus=3
    begin object name=MeleeHelper class=KFMeleeHelperAI
        BaseDamage=10
        MyDamageType=Class'KFDT_Slashing_ZedWeak'
        MomentumTransfer=25000
    object end
    // Reference: KFMeleeHelperAI'Default__KFPawn_ZedDAR.MeleeHelper'
    MeleeAttackHelper=MeleeHelper
    DoshValue=17
    XPValues[0]=15
    XPValues[1]=20
    XPValues[2]=27
    XPValues[3]=31
    WeakSpotSocketNames=/* Array type was not detected. */
    ZEDCowboyHatAttachName=Hat_Attach
    DamageTypeModifiers=/* Array type was not detected. */
    SprintAkComponent=AkComponent'Default__KFPawn_ZedDAR.SprintAkComponent0'
    HeadShotAkComponent=AkComponent'Default__KFPawn_ZedDAR.HeadshotAkComponent0'
    StartSprintingSound=AkEvent'WW_ZED_Evil_DAR.Play_ZED_EvilDAR_SFX_Thruster_Start'
    SprintLoopingSound=AkEvent'WW_ZED_Evil_DAR.Play_ZED_EvilDAR_SFX_Thruster_LP'
    StopSprintingSound=AkEvent'WW_ZED_Evil_DAR.Play_ZED_EvilDAR_SFX_Thruster_Stop'
    ArmorInfoClass=Class'KFZedArmorInfo_EvilDAR'
    OverrideArmorFXIndex=200
    begin object name=ThirdPersonHead0 class=SkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: SkeletalMeshComponent'Default__KFPawn_ZedDAR.ThirdPersonHead0'
    ThirdPersonHeadMeshComponent=ThirdPersonHead0
    bEnableAimOffset=true
    HitZones=/* Array type was not detected. */
    AfflictionHandler=KFAfflictionManager'Default__KFPawn_ZedDAR.Afflictions'
    IncapSettings=/* Array type was not detected. */
    SprintSpeed=600
    begin object name=FirstPersonArms class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedDAR.FirstPersonArms'
    ArmsMesh=FirstPersonArms
    begin object name=SpecialMoveHandler class=KFSpecialMoveHandler
        SpecialMoveClasses=/* Array type was not detected. */
    object end
    // Reference: KFSpecialMoveHandler'Default__KFPawn_ZedDAR.SpecialMoveHandler'
    SpecialMoveHandler=SpecialMoveHandler
    AmbientAkComponent=AkComponent'Default__KFPawn_ZedDAR.AmbientAkSoundComponent_1'
    WeaponAkComponent=AkComponent'Default__KFPawn_ZedDAR.AmbientAkSoundComponent'
    WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'Default__KFPawn_ZedDAR.WeaponAmbientEchoHandler'
    SecondaryWeaponAkComponent=AkComponent'Default__KFPawn_ZedDAR.SecondaryWeaponAkSoundComponent'
    FootstepAkComponent=AkComponent'Default__KFPawn_ZedDAR.FootstepAkSoundComponent'
    DialogAkComponent=AkComponent'Default__KFPawn_ZedDAR.DialogAkSoundComponent'
    PowerUpAkComponent=AkComponent'Default__KFPawn_ZedDAR.PowerUpAkSoundComponent'
    Mass=85
    GroundSpeed=170
    Health=775
    begin object name=KFPawnSkeletalMeshComponent class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedDAR.KFPawnSkeletalMeshComponent'
    Mesh=KFPawnSkeletalMeshComponent
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedDAR.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=Sprite class=SpriteComponent
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__KFPawn_ZedDAR.Sprite'
    Components(0)=Sprite
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedDAR.CollisionCylinder'
    Components(1)=CollisionCylinder
    begin object name=Arrow class=ArrowComponent
        ReplacementPrimitive=none
    object end
    // Reference: ArrowComponent'Default__KFPawn_ZedDAR.Arrow'
    Components(2)=Arrow
    begin object name=KFPawnSkeletalMeshComponent class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedDAR.KFPawnSkeletalMeshComponent'
    Components(3)=KFPawnSkeletalMeshComponent
    Components(4)=AkComponent'Default__KFPawn_ZedDAR.AmbientAkSoundComponent'
    Components(5)=AkComponent'Default__KFPawn_ZedDAR.AmbientAkSoundComponent_1'
    Components(6)=AkComponent'Default__KFPawn_ZedDAR.FootstepAkSoundComponent'
    Components(7)=AkComponent'Default__KFPawn_ZedDAR.DialogAkSoundComponent'
    Components(8)=AkComponent'Default__KFPawn_ZedDAR.PowerUpAkSoundComponent'
    Components(9)=AkComponent'Default__KFPawn_ZedDAR.SecondaryWeaponAkSoundComponent'
    Components(10)=AkComponent'Default__KFPawn_ZedDAR.SprintAkComponent0'
    Components(11)=AkComponent'Default__KFPawn_ZedDAR.HeadshotAkComponent0'
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedDAR.CollisionCylinder'
    CollisionComponent=CollisionCylinder
    RotationRate=(Pitch=50000,Yaw=66000,Roll=50000)
}