/*******************************************************************************
 * KFPawn_ZedSiren generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFPawn_ZedSiren extends KFPawn_Monster
    config(Game)
    hidecategories(Navigation);

function ANIMNOTIFY_SirenScream()
{
    local KFSM_Siren_Scream ScreamSM;

    ScreamSM = KFSM_Siren_Scream(SpecialMoves[SpecialMove]);
    if(ScreamSM != none)
    {
        ScreamSM.ScreamBegan();
    }
}

function int GetKillerDialogID()
{
    return 66;
}

function int GetSpotterDialogID()
{
    return 128;
}

static function int GetTraderAdviceID()
{
    return 44;
}

defaultproperties
{
    CharacterMonsterArch=KFCharacterInfo_Monster'zed_siren_arch.ZED_Siren_Archetype'
    begin object name=MeleeHelper class=KFMeleeHelperAI
        BaseDamage=13
        MyDamageType=Class'KFDT_Slashing_ZedWeak'
    object end
    // Reference: KFMeleeHelperAI'Default__KFPawn_ZedSiren.MeleeHelper'
    MeleeAttackHelper=MeleeHelper
    DoshValue=25
    XPValues[0]=11
    XPValues[1]=15
    XPValues[2]=15
    XPValues[3]=15
    VulnerableDamageTypes=/* Array type was not detected. */
    PawnAnimInfo=KFPawnAnimInfo'ZED_Siren_ANIM.Siren_AnimGroup'
    begin object name=ThirdPersonHead0 class=SkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: SkeletalMeshComponent'Default__KFPawn_ZedSiren.ThirdPersonHead0'
    ThirdPersonHeadMeshComponent=ThirdPersonHead0
    HitZones=/* Array type was not detected. */
    AfflictionHandler=KFPawnAfflictions'Default__KFPawn_ZedSiren.Afflictions'
    InstantIncaps=/* Array type was not detected. */
    StackingIncaps=/* Array type was not detected. */
    PhysRagdollImpulseScale=0.5
    KnockdownImpulseScale=0.5
    SprintSpeed=200
    begin object name=FirstPersonArms class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedSiren.FirstPersonArms'
    ArmsMesh=FirstPersonArms
    begin object name=SpecialMoveHandler class=KFSpecialMoveHandler
        SpecialMoveClasses=/* Array type was not detected. */
    object end
    // Reference: KFSpecialMoveHandler'Default__KFPawn_ZedSiren.SpecialMoveHandler'
    SpecialMoveHandler=SpecialMoveHandler
    AmbientAkComponent=AkComponent'Default__KFPawn_ZedSiren.AmbientAkSoundComponent_1'
    WeaponAkComponent=AkComponent'Default__KFPawn_ZedSiren.AmbientAkSoundComponent'
    WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'Default__KFPawn_ZedSiren.WeaponAmbientEchoHandler'
    FootstepAkComponent=AkComponent'Default__KFPawn_ZedSiren.FootstepAkSoundComponent'
    DialogAkComponent=AkComponent'Default__KFPawn_ZedSiren.DialogAkSoundComponent'
    DamageRecoveryTimeHeavy=0.2
    Mass=50
    GroundSpeed=200
    Health=230
    ControllerClass=Class'KFAIController_ZedSiren'
    begin object name=KFPawnSkeletalMeshComponent class=KFSkeletalMeshComponent
        bPerBoneMotionBlur=false
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedSiren.KFPawnSkeletalMeshComponent'
    Mesh=KFPawnSkeletalMeshComponent
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedSiren.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=Sprite class=SpriteComponent
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__KFPawn_ZedSiren.Sprite'
    Components(0)=Sprite
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedSiren.CollisionCylinder'
    Components(1)=CollisionCylinder
    begin object name=Arrow class=ArrowComponent
        ReplacementPrimitive=none
    object end
    // Reference: ArrowComponent'Default__KFPawn_ZedSiren.Arrow'
    Components(2)=Arrow
    begin object name=KFPawnSkeletalMeshComponent class=KFSkeletalMeshComponent
        bPerBoneMotionBlur=false
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedSiren.KFPawnSkeletalMeshComponent'
    Components(3)=KFPawnSkeletalMeshComponent
    Components(4)=AkComponent'Default__KFPawn_ZedSiren.AmbientAkSoundComponent'
    Components(5)=AkComponent'Default__KFPawn_ZedSiren.AmbientAkSoundComponent_1'
    Components(6)=AkComponent'Default__KFPawn_ZedSiren.FootstepAkSoundComponent'
    Components(7)=AkComponent'Default__KFPawn_ZedSiren.DialogAkSoundComponent'
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedSiren.CollisionCylinder'
    CollisionComponent=CollisionCylinder
    RotationRate=(Pitch=50000,Yaw=20000,Roll=50000)
}