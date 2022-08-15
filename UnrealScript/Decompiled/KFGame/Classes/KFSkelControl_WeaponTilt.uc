/*******************************************************************************
 * KFSkelControl_WeaponTilt generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFSkelControl_WeaponTilt extends SkelControlSingleBone
    native(Anim)
    hidecategories(Object,Object,Translation,Rotation);

/** Where we wish to get to */
var() Rotator WeaponBoneRotation;
/** Cosine of angle to ignore strafing motion */
var() float StrafeDeadzoneCos;
var transient float BoneRotationRate;
var transient KFWeapon WeaponOwner;

defaultproperties
{
    WeaponBoneRotation=(Pitch=0,Yaw=0,Roll=1820)
    StrafeDeadzoneCos=0.5
    bApplyRotation=true
    bAddRotation=true
    BoneRotationSpace=EBoneControlSpace.BCS_ActorSpace
    BlendInTime=0.1
    BlendOutTime=0.1
    bIgnoreWhenNotRendered=true
}