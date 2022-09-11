/*******************************************************************************
 * KFPawn_ZedDAR_Rocket generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFPawn_ZedDAR_Rocket extends KFPawn_ZedDAR
    config(Game)
    hidecategories(Navigation);

simulated function ANIMNOTIFY_FireRocket_L()
{
    FiringSocketName = FiringSocketLName;
    StartRangedAttack();
}

simulated function ANIMNOTIFY_FireRocket_R()
{
    FiringSocketName = FiringSocketRName;
    StartRangedAttack();
}

defaultproperties
{
    RangedProjectileClass=Class'KFProj_EvilDAR_Rocket'
    FiringSocketLName=Rocket_L
    FiringSocketRName=Rocket_R
    ExplosionTemplate=KFGameExplosion'Default__KFPawn_ZedDAR_Rocket.ExploTemplate0'
    MonsterArchPath="ZED_ARCH.ZED_DAR_Rocket_Archetype"
    MeleeAttackHelper=KFMeleeHelperAI'Default__KFPawn_ZedDAR_Rocket.MeleeHelper'
    DifficultySettings=Class'KFDifficulty_DAR_Rocket'
    SprintAkComponent=AkComponent'Default__KFPawn_ZedDAR_Rocket.SprintAkComponent0'
    HeadShotAkComponent=AkComponent'Default__KFPawn_ZedDAR_Rocket.HeadshotAkComponent0'
    LocalizationKey=KFPawn_ZedDAR_Rocket
    begin object name=ThirdPersonHead0 class=SkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: SkeletalMeshComponent'Default__KFPawn_ZedDAR_Rocket.ThirdPersonHead0'
    ThirdPersonHeadMeshComponent=ThirdPersonHead0
    AfflictionHandler=KFAfflictionManager'Default__KFPawn_ZedDAR_Rocket.Afflictions'
    begin object name=FirstPersonArms class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedDAR_Rocket.FirstPersonArms'
    ArmsMesh=FirstPersonArms
    begin object name=SpecialMoveHandler class=KFSpecialMoveHandler
        SpecialMoveClasses=/* Array type was not detected. */
    object end
    // Reference: KFSpecialMoveHandler'Default__KFPawn_ZedDAR_Rocket.SpecialMoveHandler'
    SpecialMoveHandler=SpecialMoveHandler
    AmbientAkComponent=AkComponent'Default__KFPawn_ZedDAR_Rocket.AmbientAkSoundComponent_1'
    WeaponAkComponent=AkComponent'Default__KFPawn_ZedDAR_Rocket.AmbientAkSoundComponent'
    WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'Default__KFPawn_ZedDAR_Rocket.WeaponAmbientEchoHandler'
    SecondaryWeaponAkComponent=AkComponent'Default__KFPawn_ZedDAR_Rocket.SecondaryWeaponAkSoundComponent'
    FootstepAkComponent=AkComponent'Default__KFPawn_ZedDAR_Rocket.FootstepAkSoundComponent'
    DialogAkComponent=AkComponent'Default__KFPawn_ZedDAR_Rocket.DialogAkSoundComponent'
    PowerUpAkComponent=AkComponent'Default__KFPawn_ZedDAR_Rocket.PowerUpAkSoundComponent'
    ControllerClass=Class'KFAIController_ZedDAR_Rocket'
    begin object name=KFPawnSkeletalMeshComponent class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedDAR_Rocket.KFPawnSkeletalMeshComponent'
    Mesh=KFPawnSkeletalMeshComponent
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedDAR_Rocket.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=Sprite class=SpriteComponent
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__KFPawn_ZedDAR_Rocket.Sprite'
    Components(0)=Sprite
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedDAR_Rocket.CollisionCylinder'
    Components(1)=CollisionCylinder
    begin object name=Arrow class=ArrowComponent
        ReplacementPrimitive=none
    object end
    // Reference: ArrowComponent'Default__KFPawn_ZedDAR_Rocket.Arrow'
    Components(2)=Arrow
    begin object name=KFPawnSkeletalMeshComponent class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedDAR_Rocket.KFPawnSkeletalMeshComponent'
    Components(3)=KFPawnSkeletalMeshComponent
    Components(4)=AkComponent'Default__KFPawn_ZedDAR_Rocket.AmbientAkSoundComponent'
    Components(5)=AkComponent'Default__KFPawn_ZedDAR_Rocket.AmbientAkSoundComponent_1'
    Components(6)=AkComponent'Default__KFPawn_ZedDAR_Rocket.FootstepAkSoundComponent'
    Components(7)=AkComponent'Default__KFPawn_ZedDAR_Rocket.DialogAkSoundComponent'
    Components(8)=AkComponent'Default__KFPawn_ZedDAR_Rocket.PowerUpAkSoundComponent'
    Components(9)=AkComponent'Default__KFPawn_ZedDAR_Rocket.SecondaryWeaponAkSoundComponent'
    Components(10)=AkComponent'Default__KFPawn_ZedDAR_Rocket.SprintAkComponent0'
    Components(11)=AkComponent'Default__KFPawn_ZedDAR_Rocket.HeadshotAkComponent0'
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedDAR_Rocket.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}