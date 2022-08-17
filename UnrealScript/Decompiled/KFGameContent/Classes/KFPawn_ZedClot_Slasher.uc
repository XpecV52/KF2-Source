/*******************************************************************************
 * KFPawn_ZedClot_Slasher generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFPawn_ZedClot_Slasher extends KFPawn_ZedClot
    config(Game)
    hidecategories(Navigation);

static function int GetTraderAdviceID()
{
    return 37;
}

defaultproperties
{
    CharacterMonsterArch=KFCharacterInfo_Monster'ZED_Clot_ARCH.ZED_Clot_Slasher_Archetype'
    GrabAttackFrequency=0.38
    ParryResistance=0
    MeleeAttackHelper=KFMeleeHelperAI'Default__KFPawn_ZedClot_Slasher.MeleeHelper'
    XPValues[0]=8
    XPValues[1]=11
    XPValues[2]=11
    XPValues[3]=11
    PawnAnimInfo=KFPawnAnimInfo'ZED_Clot_Anim.SlasherClot_AnimGroup'
    begin object name=ThirdPersonHead0 class=SkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: SkeletalMeshComponent'Default__KFPawn_ZedClot_Slasher.ThirdPersonHead0'
    ThirdPersonHeadMeshComponent=ThirdPersonHead0
    AfflictionHandler=KFPawnAfflictions'Default__KFPawn_ZedClot_Slasher.Afflictions'
    InstantIncaps=/* Array type was not detected. */
    StackingIncaps=/* Array type was not detected. */
    KnockdownImpulseScale=1
    SprintSpeed=500
    begin object name=FirstPersonArms class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedClot_Slasher.FirstPersonArms'
    ArmsMesh=FirstPersonArms
    SpecialMoveHandler=KFSpecialMoveHandler'Default__KFPawn_ZedClot_Slasher.SpecialMoveHandler'
    AmbientAkComponent=AkComponent'Default__KFPawn_ZedClot_Slasher.AmbientAkSoundComponent_1'
    WeaponAkComponent=AkComponent'Default__KFPawn_ZedClot_Slasher.AmbientAkSoundComponent'
    WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'Default__KFPawn_ZedClot_Slasher.WeaponAmbientEchoHandler'
    FootstepAkComponent=AkComponent'Default__KFPawn_ZedClot_Slasher.FootstepAkSoundComponent'
    DialogAkComponent=AkComponent'Default__KFPawn_ZedClot_Slasher.DialogAkSoundComponent'
    DamageRecoveryTimeHeavy=0.3
    GroundSpeed=300
    ControllerClass=Class'KFAIController_ZedClot_Slasher'
    begin object name=KFPawnSkeletalMeshComponent class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedClot_Slasher.KFPawnSkeletalMeshComponent'
    Mesh=KFPawnSkeletalMeshComponent
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedClot_Slasher.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=Sprite class=SpriteComponent
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__KFPawn_ZedClot_Slasher.Sprite'
    Components(0)=Sprite
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedClot_Slasher.CollisionCylinder'
    Components(1)=CollisionCylinder
    begin object name=Arrow class=ArrowComponent
        ReplacementPrimitive=none
    object end
    // Reference: ArrowComponent'Default__KFPawn_ZedClot_Slasher.Arrow'
    Components(2)=Arrow
    begin object name=KFPawnSkeletalMeshComponent class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedClot_Slasher.KFPawnSkeletalMeshComponent'
    Components(3)=KFPawnSkeletalMeshComponent
    Components(4)=AkComponent'Default__KFPawn_ZedClot_Slasher.AmbientAkSoundComponent'
    Components(5)=AkComponent'Default__KFPawn_ZedClot_Slasher.AmbientAkSoundComponent_1'
    Components(6)=AkComponent'Default__KFPawn_ZedClot_Slasher.FootstepAkSoundComponent'
    Components(7)=AkComponent'Default__KFPawn_ZedClot_Slasher.DialogAkSoundComponent'
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedClot_Slasher.CollisionCylinder'
    CollisionComponent=CollisionCylinder
    RotationRate=(Pitch=50000,Yaw=50000,Roll=50000)
}