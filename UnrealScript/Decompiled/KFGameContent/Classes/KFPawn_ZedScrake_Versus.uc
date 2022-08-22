/*******************************************************************************
 * KFPawn_ZedScrake_Versus generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFPawn_ZedScrake_Versus extends KFPawn_ZedScrake
    config(Game)
    hidecategories(Navigation);

var protected const float RageSprintSpeed;
var protected const class<KFDamageType> RageBumpDamageType;
var protected const int RageBumpDamage;
var protected const float RageBumpRadius;
var protected const float RageBumpMomentum;

function SetSprinting(bool bNewSprintStatus)
{
    if(bEmpDisrupted)
    {
        bNewSprintStatus = false;
    }
    super.SetSprinting(bNewSprintStatus);
}

simulated function SetEnraged(bool bNewEnraged)
{
    super.SetEnraged(bNewEnraged);
    if(bIsEnraged)
    {
        if(!IsTimerActive('Timer_RageBump'))
        {
            SetTimer(0.25, true, 'Timer_RageBump');
        }
        SprintSpeed = RageSprintSpeed;        
    }
    else
    {
        if(IsTimerActive('Timer_RageBump'))
        {
            ClearTimer('Timer_RageBump');
            SprintSpeed = default.SprintSpeed;
        }
    }
}

protected simulated function Timer_RageBump()
{
    HurtRadius(float(RageBumpDamage), RageBumpRadius, RageBumpDamageType, RageBumpMomentum, Location, self, Controller);
}

simulated function PlayDying(class<DamageType> DamageType, Vector HitLoc)
{
    ClearTimer('Timer_RageBump');
    super(KFPawn_Monster).PlayDying(DamageType, HitLoc);
}

defaultproperties
{
    RageSprintSpeed=650
    RageBumpDamageType=Class'KFDT_HeavyZedBump'
    RageBumpDamage=2
    RageBumpRadius=240
    RageBumpMomentum=500
    ChainsawIdleAkComponent=AkComponent'Default__KFPawn_ZedScrake_Versus.ChainsawAkComponent0'
    RageHealthThresholdNormal=0.75
    bVersusZed=true
    ThirdPersonViewOffset=(OffsetHigh=(X=-175,Y=60,Z=60),OffsetMid=(X=-160,Y=50,Z=0),OffsetLow=(X=-220,Y=100,Z=50))
    begin object name=MeleeHelper class=KFMeleeHelperAI
        BaseDamage=15
        PlayerDoorDamageMultiplier=5
        MeleeImpactCamScale=0.45
    object end
    // Reference: KFMeleeHelperAI'Default__KFPawn_ZedScrake_Versus.MeleeHelper'
    MeleeAttackHelper=MeleeHelper
    DoshValue=260
    XPValues=102
    DamageTypeModifiers=/* Array type was not detected. */
    MoveListGamepadScheme=/* Array type was not detected. */
    SpecialMoveCooldowns=/* Array type was not detected. */
    MinBlockFOV=0
    LocalizationKey=KFPawn_ZedScrake
    begin object name=ThirdPersonHead0 class=SkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: SkeletalMeshComponent'Default__KFPawn_ZedScrake_Versus.ThirdPersonHead0'
    ThirdPersonHeadMeshComponent=ThirdPersonHead0
    AfflictionHandler=KFAfflictionManager'Default__KFPawn_ZedScrake_Versus.Afflictions'
    IncapSettings=/* Array type was not detected. */
    SprintSpeed=530
    SprintStrafeSpeed=350
    TeammateCollisionRadiusPercent=0.3
    begin object name=FirstPersonArms class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedScrake_Versus.FirstPersonArms'
    ArmsMesh=FirstPersonArms
    begin object name=SpecialMoveHandler class=KFSpecialMoveHandler
        SpecialMoveClasses=/* Array type was not detected. */
    object end
    // Reference: KFSpecialMoveHandler'Default__KFPawn_ZedScrake_Versus.SpecialMoveHandler'
    SpecialMoveHandler=SpecialMoveHandler
    AmbientAkComponent=AkComponent'Default__KFPawn_ZedScrake_Versus.AmbientAkSoundComponent_1'
    WeaponAkComponent=AkComponent'Default__KFPawn_ZedScrake_Versus.AmbientAkSoundComponent'
    WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'Default__KFPawn_ZedScrake_Versus.WeaponAmbientEchoHandler'
    FootstepAkComponent=AkComponent'Default__KFPawn_ZedScrake_Versus.FootstepAkSoundComponent'
    DialogAkComponent=AkComponent'Default__KFPawn_ZedScrake_Versus.DialogAkSoundComponent'
    GroundSpeed=220
    Health=1600
    begin object name=KFPawnSkeletalMeshComponent class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedScrake_Versus.KFPawnSkeletalMeshComponent'
    Mesh=KFPawnSkeletalMeshComponent
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedScrake_Versus.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=Sprite class=SpriteComponent
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__KFPawn_ZedScrake_Versus.Sprite'
    Components(0)=Sprite
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedScrake_Versus.CollisionCylinder'
    Components(1)=CollisionCylinder
    begin object name=Arrow class=ArrowComponent
        ReplacementPrimitive=none
    object end
    // Reference: ArrowComponent'Default__KFPawn_ZedScrake_Versus.Arrow'
    Components(2)=Arrow
    begin object name=KFPawnSkeletalMeshComponent class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedScrake_Versus.KFPawnSkeletalMeshComponent'
    Components(3)=KFPawnSkeletalMeshComponent
    Components(4)=AkComponent'Default__KFPawn_ZedScrake_Versus.AmbientAkSoundComponent'
    Components(5)=AkComponent'Default__KFPawn_ZedScrake_Versus.AmbientAkSoundComponent_1'
    Components(6)=AkComponent'Default__KFPawn_ZedScrake_Versus.FootstepAkSoundComponent'
    Components(7)=AkComponent'Default__KFPawn_ZedScrake_Versus.DialogAkSoundComponent'
    Components(8)=AkComponent'Default__KFPawn_ZedScrake_Versus.ChainsawAkComponent0'
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedScrake_Versus.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}