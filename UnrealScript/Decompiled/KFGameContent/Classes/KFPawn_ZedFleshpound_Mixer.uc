/*******************************************************************************
 * KFPawn_ZedFleshpound_Mixer generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFPawn_ZedFleshpound_Mixer extends KFPawn_ZedFleshpound
    config(Game)
    hidecategories(Navigation);

simulated event bool UsePlayerControlledZedSkin()
{
    return true;
}

defaultproperties
{
    RageAkComponent=AkComponent'Default__KFPawn_ZedFleshpound_Mixer.RageAkComponent0'
    BattlePhaseLightTemplateYellow=PointLightComponent'Default__KFPawn_ZedFleshpound_Mixer.PointLightComponent1'
    BattlePhaseLightTemplateRed=PointLightComponent'Default__KFPawn_ZedFleshpound_Mixer.PointLightComponent2'
    MeleeAttackHelper=KFMeleeHelperAI'Default__KFPawn_ZedFleshpound_Mixer.MeleeHelper'
    FootstepCameraShake=CameraShake'Default__KFPawn_ZedFleshpound_Mixer.FootstepCameraShake0'
    SprintAkComponent=AkComponent'Default__KFPawn_ZedFleshpound_Mixer.SprintAkComponent0'
    HeadShotAkComponent=AkComponent'Default__KFPawn_ZedFleshpound_Mixer.HeadshotAkComponent0'
    begin object name=ThirdPersonHead0 class=SkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: SkeletalMeshComponent'Default__KFPawn_ZedFleshpound_Mixer.ThirdPersonHead0'
    ThirdPersonHeadMeshComponent=ThirdPersonHead0
    AfflictionHandler=KFAfflictionManager'Default__KFPawn_ZedFleshpound_Mixer.Afflictions'
    begin object name=FirstPersonArms class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedFleshpound_Mixer.FirstPersonArms'
    ArmsMesh=FirstPersonArms
    SpecialMoveHandler=KFSpecialMoveHandler'Default__KFPawn_ZedFleshpound_Mixer.SpecialMoveHandler'
    AmbientAkComponent=AkComponent'Default__KFPawn_ZedFleshpound_Mixer.AmbientAkSoundComponent_1'
    WeaponAkComponent=AkComponent'Default__KFPawn_ZedFleshpound_Mixer.AmbientAkSoundComponent'
    WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'Default__KFPawn_ZedFleshpound_Mixer.WeaponAmbientEchoHandler'
    FootstepAkComponent=AkComponent'Default__KFPawn_ZedFleshpound_Mixer.FootstepAkSoundComponent'
    DialogAkComponent=AkComponent'Default__KFPawn_ZedFleshpound_Mixer.DialogAkSoundComponent'
    begin object name=KFPawnSkeletalMeshComponent class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedFleshpound_Mixer.KFPawnSkeletalMeshComponent'
    Mesh=KFPawnSkeletalMeshComponent
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedFleshpound_Mixer.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=Sprite class=SpriteComponent
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__KFPawn_ZedFleshpound_Mixer.Sprite'
    Components(0)=Sprite
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedFleshpound_Mixer.CollisionCylinder'
    Components(1)=CollisionCylinder
    begin object name=Arrow class=ArrowComponent
        ReplacementPrimitive=none
    object end
    // Reference: ArrowComponent'Default__KFPawn_ZedFleshpound_Mixer.Arrow'
    Components(2)=Arrow
    begin object name=KFPawnSkeletalMeshComponent class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedFleshpound_Mixer.KFPawnSkeletalMeshComponent'
    Components(3)=KFPawnSkeletalMeshComponent
    Components(4)=AkComponent'Default__KFPawn_ZedFleshpound_Mixer.AmbientAkSoundComponent'
    Components(5)=AkComponent'Default__KFPawn_ZedFleshpound_Mixer.AmbientAkSoundComponent_1'
    Components(6)=AkComponent'Default__KFPawn_ZedFleshpound_Mixer.FootstepAkSoundComponent'
    Components(7)=AkComponent'Default__KFPawn_ZedFleshpound_Mixer.DialogAkSoundComponent'
    Components(8)=AkComponent'Default__KFPawn_ZedFleshpound_Mixer.SprintAkComponent0'
    Components(9)=AkComponent'Default__KFPawn_ZedFleshpound_Mixer.HeadshotAkComponent0'
    Components(10)=AkComponent'Default__KFPawn_ZedFleshpound_Mixer.RageAkComponent0'
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedFleshpound_Mixer.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}