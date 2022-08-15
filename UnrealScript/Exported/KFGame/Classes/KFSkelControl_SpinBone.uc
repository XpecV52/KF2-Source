//=============================================================================
// KFSkelControl_SpinBone
//=============================================================================
// A skel control that continuously rotates (e.g. spinning fan blades)
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Andrew "Strago" Ladenberger
//=============================================================================
class KFSkelControl_SpinBone extends SkelControlSingleBone
    native(Anim)
	hidecategories(Adjustments)
	hidecategories(Translation)
	hidecategories(Rotation);

/** BoneRotation spin rate in seconds */
var() rotator	RotationRate;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   bApplyRotation=True
   BoneRotationSpace=BCS_BoneSpace
   bIgnoreWhenNotRendered=True
   Name="Default__KFSkelControl_SpinBone"
   ObjectArchetype=SkelControlSingleBone'Engine.Default__SkelControlSingleBone'
}
