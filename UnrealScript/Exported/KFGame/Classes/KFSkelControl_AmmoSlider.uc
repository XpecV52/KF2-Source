//=============================================================================
// KFSkelControl_AmmoSlider
//=============================================================================
// Controller used by 1st person weapon to adjust based on ammo percentage
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// -- Andrew "Strago" Ladenberger
//=============================================================================

class KFSkelControl_AmmoSlider extends SkelControlSingleBone
	hidecategories(Translation, Rotation)
	native(Anim);

/** Bone translation used when the weapon is empty. */
var() vector	MaxBoneTranslation;
/** Time it takes for slider to move (UU/sec) */
var() float		BoneInterpInSpeed;
/** Time it takes for slider to move (UU/sec) */
var() float		BoneInterpOutSpeed;

/** Cached Weapon */
var transient KFWeapon WeaponOwner;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   BoneInterpInSpeed=5.000000
   BoneInterpOutSpeed=5.000000
   bApplyTranslation=True
   BoneTranslationSpace=BCS_BoneSpace
   BlendInTime=0.000000
   BlendOutTime=0.000000
   bIgnoreWhenNotRendered=True
   Name="Default__KFSkelControl_AmmoSlider"
   ObjectArchetype=SkelControlSingleBone'Engine.Default__SkelControlSingleBone'
}
