/*******************************************************************************
 * KFPawn_ZedClot_Alpha generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFPawn_ZedClot_Alpha extends KFPawn_ZedClot
    config(Game)
    hidecategories(Navigation);

static function int GetTraderAdviceID()
{
    return 35;
}

defaultproperties
{
    MonsterArchPath="ZED_ARCH.ZED_Clot_Alpha_Archetype"
    ElitePawnClass=/* Array type was not detected. */
    GrabAttackFrequency=0.33
    ParryResistance=0
    MeleeAttackHelper=KFMeleeHelperAI'Default__KFPawn_ZedClot_Alpha.MeleeHelper'
    XPValues[0]=8
    XPValues[1]=11
    XPValues[2]=11
    XPValues[3]=11
    DamageTypeModifiers=/* Array type was not detected. */
    DifficultySettings=Class'KFDifficulty_ClotAlpha'
    SprintAkComponent=AkComponent'Default__KFPawn_ZedClot_Alpha.SprintAkComponent0'
    HeadShotAkComponent=AkComponent'Default__KFPawn_ZedClot_Alpha.HeadshotAkComponent0'
    LocalizationKey=KFPawn_ZedClot_Alpha
    begin object name=ThirdPersonHead0 class=SkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: SkeletalMeshComponent'Default__KFPawn_ZedClot_Alpha.ThirdPersonHead0'
    ThirdPersonHeadMeshComponent=ThirdPersonHead0
    AfflictionHandler=KFAfflictionManager'Default__KFPawn_ZedClot_Alpha.Afflictions'
    IncapSettings=/* Array type was not detected. */
    KnockdownImpulseScale=1
    SprintSpeed=500
    begin object name=FirstPersonArms class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedClot_Alpha.FirstPersonArms'
    ArmsMesh=FirstPersonArms
    begin object name=SpecialMoveHandler class=KFSpecialMoveHandler
        SpecialMoveClasses=/* Array type was not detected. */
    object end
    // Reference: KFSpecialMoveHandler'Default__KFPawn_ZedClot_Alpha.SpecialMoveHandler'
    SpecialMoveHandler=SpecialMoveHandler
    AmbientAkComponent=AkComponent'Default__KFPawn_ZedClot_Alpha.AmbientAkSoundComponent_1'
    WeaponAkComponent=AkComponent'Default__KFPawn_ZedClot_Alpha.AmbientAkSoundComponent'
    WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'Default__KFPawn_ZedClot_Alpha.WeaponAmbientEchoHandler'
    FootstepAkComponent=AkComponent'Default__KFPawn_ZedClot_Alpha.FootstepAkSoundComponent'
    DialogAkComponent=AkComponent'Default__KFPawn_ZedClot_Alpha.DialogAkSoundComponent'
    DamageRecoveryTimeHeavy=0.75
    GroundSpeed=210
    ControllerClass=Class'KFAIController_ZedClot_Alpha'
    begin object name=KFPawnSkeletalMeshComponent class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedClot_Alpha.KFPawnSkeletalMeshComponent'
    Mesh=KFPawnSkeletalMeshComponent
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedClot_Alpha.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=Sprite class=SpriteComponent
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__KFPawn_ZedClot_Alpha.Sprite'
    Components(0)=Sprite
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedClot_Alpha.CollisionCylinder'
    Components(1)=CollisionCylinder
    begin object name=Arrow class=ArrowComponent
        ReplacementPrimitive=none
    object end
    // Reference: ArrowComponent'Default__KFPawn_ZedClot_Alpha.Arrow'
    Components(2)=Arrow
    begin object name=KFPawnSkeletalMeshComponent class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedClot_Alpha.KFPawnSkeletalMeshComponent'
    Components(3)=KFPawnSkeletalMeshComponent
    Components(4)=AkComponent'Default__KFPawn_ZedClot_Alpha.AmbientAkSoundComponent'
    Components(5)=AkComponent'Default__KFPawn_ZedClot_Alpha.AmbientAkSoundComponent_1'
    Components(6)=AkComponent'Default__KFPawn_ZedClot_Alpha.FootstepAkSoundComponent'
    Components(7)=AkComponent'Default__KFPawn_ZedClot_Alpha.DialogAkSoundComponent'
    Components(8)=AkComponent'Default__KFPawn_ZedClot_Alpha.SprintAkComponent0'
    Components(9)=AkComponent'Default__KFPawn_ZedClot_Alpha.HeadshotAkComponent0'
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedClot_Alpha.CollisionCylinder'
    CollisionComponent=CollisionCylinder
    RotationRate=(Pitch=50000,Yaw=45000,Roll=50000)
}