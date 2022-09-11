/*******************************************************************************
 * KFPawn_ZedClot_Cyst generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFPawn_ZedClot_Cyst extends KFPawn_ZedClot
    config(Game)
    hidecategories(Navigation);

static function int GetTraderAdviceID()
{
    return 36;
}

defaultproperties
{
    GrabAttackFrequency=0.8
    ParryResistance=0
    MeleeAttackHelper=KFMeleeHelperAI'Default__KFPawn_ZedClot_Cyst.MeleeHelper'
    XPValues[0]=8
    XPValues[1]=11
    XPValues[2]=11
    XPValues[3]=11
    DamageTypeModifiers=/* Array type was not detected. */
    DifficultySettings=Class'KFDifficulty_ClotCyst'
    KnockedDownBySonicWaveOdds=0.35
    SprintAkComponent=AkComponent'Default__KFPawn_ZedClot_Cyst.SprintAkComponent0'
    HeadShotAkComponent=AkComponent'Default__KFPawn_ZedClot_Cyst.HeadshotAkComponent0'
    PawnAnimInfo=KFPawnAnimInfo'ZED_Clot_Anim.UnDevClot_AnimGroup'
    LocalizationKey=KFPawn_ZedClot_Cyst
    begin object name=ThirdPersonHead0 class=SkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: SkeletalMeshComponent'Default__KFPawn_ZedClot_Cyst.ThirdPersonHead0'
    ThirdPersonHeadMeshComponent=ThirdPersonHead0
    AfflictionHandler=KFAfflictionManager'Default__KFPawn_ZedClot_Cyst.Afflictions'
    IncapSettings=/* Array type was not detected. */
    KnockdownImpulseScale=1
    begin object name=FirstPersonArms class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedClot_Cyst.FirstPersonArms'
    ArmsMesh=FirstPersonArms
    SpecialMoveHandler=KFSpecialMoveHandler'Default__KFPawn_ZedClot_Cyst.SpecialMoveHandler'
    AmbientAkComponent=AkComponent'Default__KFPawn_ZedClot_Cyst.AmbientAkSoundComponent_1'
    WeaponAkComponent=AkComponent'Default__KFPawn_ZedClot_Cyst.AmbientAkSoundComponent'
    WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'Default__KFPawn_ZedClot_Cyst.WeaponAmbientEchoHandler'
    SecondaryWeaponAkComponent=AkComponent'Default__KFPawn_ZedClot_Cyst.SecondaryWeaponAkSoundComponent'
    FootstepAkComponent=AkComponent'Default__KFPawn_ZedClot_Cyst.FootstepAkSoundComponent'
    DialogAkComponent=AkComponent'Default__KFPawn_ZedClot_Cyst.DialogAkSoundComponent'
    PowerUpAkComponent=AkComponent'Default__KFPawn_ZedClot_Cyst.PowerUpAkSoundComponent'
    DamageRecoveryTimeHeavy=0.85
    PeripheralVision=-0.5
    ControllerClass=Class'KFAIController_ZedClot_Cyst'
    begin object name=KFPawnSkeletalMeshComponent class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedClot_Cyst.KFPawnSkeletalMeshComponent'
    Mesh=KFPawnSkeletalMeshComponent
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedClot_Cyst.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=Sprite class=SpriteComponent
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__KFPawn_ZedClot_Cyst.Sprite'
    Components(0)=Sprite
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedClot_Cyst.CollisionCylinder'
    Components(1)=CollisionCylinder
    begin object name=Arrow class=ArrowComponent
        ReplacementPrimitive=none
    object end
    // Reference: ArrowComponent'Default__KFPawn_ZedClot_Cyst.Arrow'
    Components(2)=Arrow
    begin object name=KFPawnSkeletalMeshComponent class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedClot_Cyst.KFPawnSkeletalMeshComponent'
    Components(3)=KFPawnSkeletalMeshComponent
    Components(4)=AkComponent'Default__KFPawn_ZedClot_Cyst.AmbientAkSoundComponent'
    Components(5)=AkComponent'Default__KFPawn_ZedClot_Cyst.AmbientAkSoundComponent_1'
    Components(6)=AkComponent'Default__KFPawn_ZedClot_Cyst.FootstepAkSoundComponent'
    Components(7)=AkComponent'Default__KFPawn_ZedClot_Cyst.DialogAkSoundComponent'
    Components(8)=AkComponent'Default__KFPawn_ZedClot_Cyst.PowerUpAkSoundComponent'
    Components(9)=AkComponent'Default__KFPawn_ZedClot_Cyst.SecondaryWeaponAkSoundComponent'
    Components(10)=AkComponent'Default__KFPawn_ZedClot_Cyst.SprintAkComponent0'
    Components(11)=AkComponent'Default__KFPawn_ZedClot_Cyst.HeadshotAkComponent0'
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedClot_Cyst.CollisionCylinder'
    CollisionComponent=CollisionCylinder
    RotationRate=(Pitch=50000,Yaw=20000,Roll=50000)
}