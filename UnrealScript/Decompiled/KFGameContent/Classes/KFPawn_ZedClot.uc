/*******************************************************************************
 * KFPawn_ZedClot generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFPawn_ZedClot extends KFPawn_Monster
    abstract
    config(Game)
    hidecategories(Navigation);

simulated event PostInitAnimTree(SkeletalMeshComponent SkelComp)
{
    super.PostInitAnimTree(SkelComp);
    if(bCanHeadTrack)
    {
        IK_Look_Head = SkelControlLookAt(Mesh.FindSkelControl('HeadLook'));
    }
}

function int GetSpotterDialogID()
{
    local int EmergeType;

    if(IsDoingSpecialMove(10))
    {
        EmergeType = SpecialMoveFlags & 15;
        switch(EmergeType)
        {
            case 0:
                return 142;
            case 1:
            case 2:
                return 140;
            case 3:
                return 141;
            default:
                break;
            }
    }
    else
    {
        return 125;
    }
}

defaultproperties
{
    bCanGrabAttack=true
    bKnockdownWhenJumpedOn=true
    bIsClotClass=true
    MonsterArchPath="ZED_ARCH.ZED_Clot_UnDev_Archetype"
    begin object name=MeleeHelper class=KFMeleeHelperAI
        MyDamageType=Class'KFDT_Slashing_ZedWeak'
        MomentumTransfer=25000
        MaxHitRange=172
    object end
    // Reference: KFMeleeHelperAI'Default__KFPawn_ZedClot.MeleeHelper'
    MeleeAttackHelper=MeleeHelper
    DoshValue=7
    DamageTypeModifiers=/* Array type was not detected. */
    KnockedDownBySonicWaveOdds=0.23
    begin object name=ThirdPersonHead0 class=SkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: SkeletalMeshComponent'Default__KFPawn_ZedClot.ThirdPersonHead0'
    ThirdPersonHeadMeshComponent=ThirdPersonHead0
    AfflictionHandler=KFAfflictionManager'Default__KFPawn_ZedClot.Afflictions'
    IncapSettings=/* Array type was not detected. */
    SprintSpeed=400
    begin object name=FirstPersonArms class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedClot.FirstPersonArms'
    ArmsMesh=FirstPersonArms
    begin object name=SpecialMoveHandler class=KFSpecialMoveHandler
        SpecialMoveClasses=/* Array type was not detected. */
    object end
    // Reference: KFSpecialMoveHandler'Default__KFPawn_ZedClot.SpecialMoveHandler'
    SpecialMoveHandler=SpecialMoveHandler
    AmbientAkComponent=AkComponent'Default__KFPawn_ZedClot.AmbientAkSoundComponent_1'
    WeaponAkComponent=AkComponent'Default__KFPawn_ZedClot.AmbientAkSoundComponent'
    WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'Default__KFPawn_ZedClot.WeaponAmbientEchoHandler'
    FootstepAkComponent=AkComponent'Default__KFPawn_ZedClot.FootstepAkSoundComponent'
    DialogAkComponent=AkComponent'Default__KFPawn_ZedClot.DialogAkSoundComponent'
    Mass=50
    GroundSpeed=190
    begin object name=KFPawnSkeletalMeshComponent class=KFSkeletalMeshComponent
        bPerBoneMotionBlur=false
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedClot.KFPawnSkeletalMeshComponent'
    Mesh=KFPawnSkeletalMeshComponent
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedClot.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=Sprite class=SpriteComponent
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__KFPawn_ZedClot.Sprite'
    Components(0)=Sprite
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedClot.CollisionCylinder'
    Components(1)=CollisionCylinder
    begin object name=Arrow class=ArrowComponent
        ReplacementPrimitive=none
    object end
    // Reference: ArrowComponent'Default__KFPawn_ZedClot.Arrow'
    Components(2)=Arrow
    begin object name=KFPawnSkeletalMeshComponent class=KFSkeletalMeshComponent
        bPerBoneMotionBlur=false
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedClot.KFPawnSkeletalMeshComponent'
    Components(3)=KFPawnSkeletalMeshComponent
    Components(4)=AkComponent'Default__KFPawn_ZedClot.AmbientAkSoundComponent'
    Components(5)=AkComponent'Default__KFPawn_ZedClot.AmbientAkSoundComponent_1'
    Components(6)=AkComponent'Default__KFPawn_ZedClot.FootstepAkSoundComponent'
    Components(7)=AkComponent'Default__KFPawn_ZedClot.DialogAkSoundComponent'
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedClot.CollisionCylinder'
    CollisionComponent=CollisionCylinder
    RotationRate=(Pitch=50000,Yaw=30000,Roll=50000)
}