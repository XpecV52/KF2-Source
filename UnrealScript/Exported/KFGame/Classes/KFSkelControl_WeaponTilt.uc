//=============================================================================
// KFAnimNotify_ViewShake
//=============================================================================
// Controller used by 1st person weapon to tilt based on player movement
// -- see UDKSkelControl_Rotate and GearSkelCtrl_Copy
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// -- Andrew "Strago" Ladenberger
//=============================================================================

class KFSkelControl_WeaponTilt extends SkelControlSingleBone
	hidecategories(Translation,Rotation)
	native(Anim);

/** Where we wish to get to */
var() rotator	WeaponBoneRotation;
/** Cosine of angle to ignore strafing motion */
var() float		StrafeDeadzoneCos;

/** The rate we wish to rotate */
var transient float	BoneRotationRate;
/** Cached Weapon */
var transient KFWeapon WeaponOwner;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   WeaponBoneRotation=(Pitch=0,Yaw=0,Roll=1820)
   StrafeDeadzoneCos=0.500000
   bApplyRotation=True
   bAddRotation=True
   BoneRotationSpace=BCS_ActorSpace
   BlendInTime=0.100000
   BlendOutTime=0.100000
   bIgnoreWhenNotRendered=True
   Name="Default__KFSkelControl_WeaponTilt"
   ObjectArchetype=SkelControlSingleBone'Engine.Default__SkelControlSingleBone'
}
