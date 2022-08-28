/*******************************************************************************
 * KFPawn_ZedGorefast_Versus generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFPawn_ZedGorefast_Versus extends KFPawn_ZedGorefast
    config(Game)
    hidecategories(Navigation);

defaultproperties
{
    bVersusZed=true
    ThirdPersonViewOffset=(OffsetHigh=(X=-175,Y=50,Z=25),OffsetMid=(X=-140,Y=50,Z=-10),OffsetLow=(X=-220,Y=50,Z=50))
    begin object name=MeleeHelper class=KFMeleeHelperAI
        BaseDamage=14
        PlayerDoorDamageMultiplier=5
        MeleeImpactCamScale=0.2
    object end
    // Reference: KFMeleeHelperAI'Default__KFPawn_ZedGorefast_Versus.MeleeHelper'
    MeleeAttackHelper=MeleeHelper
    DoshValue=28
    XPValues=44
    DamageTypeModifiers=/* Array type was not detected. */
    MoveListGamepadScheme=/* Array type was not detected. */
    SpecialMoveCooldowns=/* Array type was not detected. */
    MinBlockFOV=1
    SprintAkComponent=AkComponent'Default__KFPawn_ZedGorefast_Versus.SprintAkComponent0'
    HeadShotAkComponent=AkComponent'Default__KFPawn_ZedGorefast_Versus.HeadshotAkComponent0'
    begin object name=ThirdPersonHead0 class=SkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: SkeletalMeshComponent'Default__KFPawn_ZedGorefast_Versus.ThirdPersonHead0'
    ThirdPersonHeadMeshComponent=ThirdPersonHead0
    HitZones=/* Array type was not detected. */
    AfflictionHandler=KFAfflictionManager'Default__KFPawn_ZedGorefast_Versus.Afflictions'
    IncapSettings=/* Array type was not detected. */
    SprintSpeed=550
    SprintStrafeSpeed=350
    TeammateCollisionRadiusPercent=0.3
    begin object name=FirstPersonArms class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedGorefast_Versus.FirstPersonArms'
    ArmsMesh=FirstPersonArms
    begin object name=SpecialMoveHandler class=KFSpecialMoveHandler
        SpecialMoveClasses=/* Array type was not detected. */
    object end
    // Reference: KFSpecialMoveHandler'Default__KFPawn_ZedGorefast_Versus.SpecialMoveHandler'
    SpecialMoveHandler=SpecialMoveHandler
    AmbientAkComponent=AkComponent'Default__KFPawn_ZedGorefast_Versus.AmbientAkSoundComponent_1'
    WeaponAkComponent=AkComponent'Default__KFPawn_ZedGorefast_Versus.AmbientAkSoundComponent'
    WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'Default__KFPawn_ZedGorefast_Versus.WeaponAmbientEchoHandler'
    FootstepAkComponent=AkComponent'Default__KFPawn_ZedGorefast_Versus.FootstepAkSoundComponent'
    DialogAkComponent=AkComponent'Default__KFPawn_ZedGorefast_Versus.DialogAkSoundComponent'
    GroundSpeed=350
    Health=500
    begin object name=KFPawnSkeletalMeshComponent class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedGorefast_Versus.KFPawnSkeletalMeshComponent'
    Mesh=KFPawnSkeletalMeshComponent
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedGorefast_Versus.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=Sprite class=SpriteComponent
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__KFPawn_ZedGorefast_Versus.Sprite'
    Components(0)=Sprite
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedGorefast_Versus.CollisionCylinder'
    Components(1)=CollisionCylinder
    begin object name=Arrow class=ArrowComponent
        ReplacementPrimitive=none
    object end
    // Reference: ArrowComponent'Default__KFPawn_ZedGorefast_Versus.Arrow'
    Components(2)=Arrow
    begin object name=KFPawnSkeletalMeshComponent class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedGorefast_Versus.KFPawnSkeletalMeshComponent'
    Components(3)=KFPawnSkeletalMeshComponent
    Components(4)=AkComponent'Default__KFPawn_ZedGorefast_Versus.AmbientAkSoundComponent'
    Components(5)=AkComponent'Default__KFPawn_ZedGorefast_Versus.AmbientAkSoundComponent_1'
    Components(6)=AkComponent'Default__KFPawn_ZedGorefast_Versus.FootstepAkSoundComponent'
    Components(7)=AkComponent'Default__KFPawn_ZedGorefast_Versus.DialogAkSoundComponent'
    Components(8)=AkComponent'Default__KFPawn_ZedGorefast_Versus.SprintAkComponent0'
    Components(9)=AkComponent'Default__KFPawn_ZedGorefast_Versus.HeadshotAkComponent0'
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedGorefast_Versus.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}