/*******************************************************************************
 * KFPawn_ZedDAR_Laser generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFPawn_ZedDAR_Laser extends KFPawn_ZedDAR
    config(Game)
    hidecategories(Navigation);

simulated function ANIMNOTIFY_FireLaser_L()
{
    FiringSocketName = FiringSocketLName;
    StartRangedAttack();
}

simulated function ANIMNOTIFY_FireLaser_R()
{
    FiringSocketName = FiringSocketRName;
    StartRangedAttack();
}

defaultproperties
{
    RangedProjectileClass=Class'KFProj_EvilDAR_Laser'
    FiringSocketLName=Laser_L
    FiringSocketRName=Laser_R
    ExplosionTemplate=KFGameExplosion'Default__KFPawn_ZedDAR_Laser.ExploTemplate0'
    MonsterArchPath="ZED_ARCH.ZED_DAR_Laser_Archetype"
    MeleeAttackHelper=KFMeleeHelperAI'Default__KFPawn_ZedDAR_Laser.MeleeHelper'
    DifficultySettings=Class'KFDifficulty_DAR_Laser'
    SprintAkComponent=AkComponent'Default__KFPawn_ZedDAR_Laser.SprintAkComponent0'
    LocalizationKey=KFPawn_ZedDAR_Laser
    begin object name=ThirdPersonHead0 class=SkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: SkeletalMeshComponent'Default__KFPawn_ZedDAR_Laser.ThirdPersonHead0'
    ThirdPersonHeadMeshComponent=ThirdPersonHead0
    AfflictionHandler=KFAfflictionManager'Default__KFPawn_ZedDAR_Laser.Afflictions'
    begin object name=FirstPersonArms class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedDAR_Laser.FirstPersonArms'
    ArmsMesh=FirstPersonArms
    begin object name=SpecialMoveHandler class=KFSpecialMoveHandler
        SpecialMoveClasses=/* Array type was not detected. */
    object end
    // Reference: KFSpecialMoveHandler'Default__KFPawn_ZedDAR_Laser.SpecialMoveHandler'
    SpecialMoveHandler=SpecialMoveHandler
    AmbientAkComponent=AkComponent'Default__KFPawn_ZedDAR_Laser.AmbientAkSoundComponent_1'
    WeaponAkComponent=AkComponent'Default__KFPawn_ZedDAR_Laser.AmbientAkSoundComponent'
    WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'Default__KFPawn_ZedDAR_Laser.WeaponAmbientEchoHandler'
    FootstepAkComponent=AkComponent'Default__KFPawn_ZedDAR_Laser.FootstepAkSoundComponent'
    DialogAkComponent=AkComponent'Default__KFPawn_ZedDAR_Laser.DialogAkSoundComponent'
    ControllerClass=Class'KFAIController_ZedDAR_Laser'
    begin object name=KFPawnSkeletalMeshComponent class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedDAR_Laser.KFPawnSkeletalMeshComponent'
    Mesh=KFPawnSkeletalMeshComponent
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedDAR_Laser.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=Sprite class=SpriteComponent
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__KFPawn_ZedDAR_Laser.Sprite'
    Components(0)=Sprite
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedDAR_Laser.CollisionCylinder'
    Components(1)=CollisionCylinder
    begin object name=Arrow class=ArrowComponent
        ReplacementPrimitive=none
    object end
    // Reference: ArrowComponent'Default__KFPawn_ZedDAR_Laser.Arrow'
    Components(2)=Arrow
    begin object name=KFPawnSkeletalMeshComponent class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedDAR_Laser.KFPawnSkeletalMeshComponent'
    Components(3)=KFPawnSkeletalMeshComponent
    Components(4)=AkComponent'Default__KFPawn_ZedDAR_Laser.AmbientAkSoundComponent'
    Components(5)=AkComponent'Default__KFPawn_ZedDAR_Laser.AmbientAkSoundComponent_1'
    Components(6)=AkComponent'Default__KFPawn_ZedDAR_Laser.FootstepAkSoundComponent'
    Components(7)=AkComponent'Default__KFPawn_ZedDAR_Laser.DialogAkSoundComponent'
    Components(8)=AkComponent'Default__KFPawn_ZedDAR_Laser.SprintAkComponent0'
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedDAR_Laser.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}