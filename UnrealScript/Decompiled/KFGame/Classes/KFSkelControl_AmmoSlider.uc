/*******************************************************************************
 * KFSkelControl_AmmoSlider generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFSkelControl_AmmoSlider extends SkelControlSingleBone
    native(Anim)
    hidecategories(Object,Object,Translation,Rotation);

/** Bone translation used when the weapon is empty. */
var() Vector MaxBoneTranslation;
/** Time it takes for slider to move (UU/sec) */
var() float BoneInterpInSpeed;
/** Time it takes for slider to move (UU/sec) */
var() float BoneInterpOutSpeed;
var transient KFWeapon WeaponOwner;

defaultproperties
{
    BoneInterpInSpeed=5
    BoneInterpOutSpeed=5
    bApplyTranslation=true
    BoneTranslationSpace=EBoneControlSpace.BCS_BoneSpace
    BlendInTime=0
    BlendOutTime=0
    bIgnoreWhenNotRendered=true
}