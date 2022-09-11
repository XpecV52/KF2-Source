/*******************************************************************************
 * KFPawn_ZedGorefast generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFPawn_ZedGorefast extends KFPawn_Monster
    config(Game)
    hidecategories(Navigation);

static function int GetTraderAdviceID()
{
    return 38;
}

defaultproperties
{
    MonsterArchPath="ZED_ARCH.ZED_Gorefast_Archetype"
    ElitePawnClass=/* Array type was not detected. */
    ParryResistance=2
    MinSpawnSquadSizeType=ESquadType.EST_Medium
    begin object name=MeleeHelper class=KFMeleeHelperAI
        BaseDamage=10
        MyDamageType=Class'KFDT_Slashing_Gorefast'
        MomentumTransfer=25000
        MaxHitRange=192
    object end
    // Reference: KFMeleeHelperAI'Default__KFPawn_ZedGorefast.MeleeHelper'
    MeleeAttackHelper=MeleeHelper
    DoshValue=12
    XPValues[0]=11
    XPValues[1]=14
    XPValues[2]=14
    XPValues[3]=14
    DamageTypeModifiers=/* Array type was not detected. */
    DifficultySettings=Class'KFDifficulty_Gorefast'
    SprintAkComponent=AkComponent'Default__KFPawn_ZedGorefast.SprintAkComponent0'
    HeadShotAkComponent=AkComponent'Default__KFPawn_ZedGorefast.HeadshotAkComponent0'
    PawnAnimInfo=KFPawnAnimInfo'ZED_Gorefast_Anim.Gorefast_AnimGroup'
    LocalizationKey=KFPawn_ZedGorefast
    begin object name=ThirdPersonHead0 class=SkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: SkeletalMeshComponent'Default__KFPawn_ZedGorefast.ThirdPersonHead0'
    ThirdPersonHeadMeshComponent=ThirdPersonHead0
    HitZones=/* Array type was not detected. */
    PenetrationResistance=1.5
    AfflictionHandler=KFAfflictionManager'Default__KFPawn_ZedGorefast.Afflictions'
    IncapSettings=/* Array type was not detected. */
    KnockdownImpulseScale=1
    SprintSpeed=450
    begin object name=FirstPersonArms class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedGorefast.FirstPersonArms'
    ArmsMesh=FirstPersonArms
    begin object name=SpecialMoveHandler class=KFSpecialMoveHandler
        SpecialMoveClasses=/* Array type was not detected. */
    object end
    // Reference: KFSpecialMoveHandler'Default__KFPawn_ZedGorefast.SpecialMoveHandler'
    SpecialMoveHandler=SpecialMoveHandler
    AmbientAkComponent=AkComponent'Default__KFPawn_ZedGorefast.AmbientAkSoundComponent_1'
    WeaponAkComponent=AkComponent'Default__KFPawn_ZedGorefast.AmbientAkSoundComponent'
    WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'Default__KFPawn_ZedGorefast.WeaponAmbientEchoHandler'
    SecondaryWeaponAkComponent=AkComponent'Default__KFPawn_ZedGorefast.SecondaryWeaponAkSoundComponent'
    FootstepAkComponent=AkComponent'Default__KFPawn_ZedGorefast.FootstepAkSoundComponent'
    DialogAkComponent=AkComponent'Default__KFPawn_ZedGorefast.DialogAkSoundComponent'
    PowerUpAkComponent=AkComponent'Default__KFPawn_ZedGorefast.PowerUpAkSoundComponent'
    DamageRecoveryTimeHeavy=0.85
    GroundSpeed=240
    MaxFallSpeed=6000
    Health=200
    ControllerClass=Class'KFAIController_ZedGorefast'
    begin object name=KFPawnSkeletalMeshComponent class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedGorefast.KFPawnSkeletalMeshComponent'
    Mesh=KFPawnSkeletalMeshComponent
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionRadius=48
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedGorefast.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=Sprite class=SpriteComponent
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__KFPawn_ZedGorefast.Sprite'
    Components(0)=Sprite
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionRadius=48
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedGorefast.CollisionCylinder'
    Components(1)=CollisionCylinder
    begin object name=Arrow class=ArrowComponent
        ReplacementPrimitive=none
    object end
    // Reference: ArrowComponent'Default__KFPawn_ZedGorefast.Arrow'
    Components(2)=Arrow
    begin object name=KFPawnSkeletalMeshComponent class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedGorefast.KFPawnSkeletalMeshComponent'
    Components(3)=KFPawnSkeletalMeshComponent
    Components(4)=AkComponent'Default__KFPawn_ZedGorefast.AmbientAkSoundComponent'
    Components(5)=AkComponent'Default__KFPawn_ZedGorefast.AmbientAkSoundComponent_1'
    Components(6)=AkComponent'Default__KFPawn_ZedGorefast.FootstepAkSoundComponent'
    Components(7)=AkComponent'Default__KFPawn_ZedGorefast.DialogAkSoundComponent'
    Components(8)=AkComponent'Default__KFPawn_ZedGorefast.PowerUpAkSoundComponent'
    Components(9)=AkComponent'Default__KFPawn_ZedGorefast.SecondaryWeaponAkSoundComponent'
    Components(10)=AkComponent'Default__KFPawn_ZedGorefast.SprintAkComponent0'
    Components(11)=AkComponent'Default__KFPawn_ZedGorefast.HeadshotAkComponent0'
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionRadius=48
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedGorefast.CollisionCylinder'
    CollisionComponent=CollisionCylinder
    RotationRate=(Pitch=50000,Yaw=45000,Roll=50000)
}