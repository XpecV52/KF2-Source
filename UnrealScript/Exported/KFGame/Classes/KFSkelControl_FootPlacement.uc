//=============================================================================
// KFSkelControl_FootPlacement
//=============================================================================
// Based SkelControlFootPlacement, but with a few improvements (see vars)
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// -- Andrew "Strago" Ladenberger
//=============================================================================

class KFSkelControl_FootPlacement extends SkelControlFootPlacement
	native(Anim);

/** Project foot onto floor.  Avoids breaking the animation and allows for IK during walk */
var(KFFootPlacement) bool	bProjectOntoPlane;

/** Interpolation speed when IK adjusted changes */
var(KFFootPlacement) float	InterpUpSpeed, InterpDownSpeed;

/** Floor Normal, to do the traces for the feet. */
var(KFFootPlacement) Vector	FloorNormal;

/** Target Effector Location to interpolate to smoothly */
var	const transient float LegAdjust, LegAdjustInterp;

/** Internal cached pointer to Owner */
var	const transient KFPawn PawnOwner;

// debug
var transient editoronly vector DebugStartLoc, DebugEndLoc, DebugIKLoc;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   bProjectOntoPlane=True
   InterpUpSpeed=128.000000
   InterpDownSpeed=128.000000
   FloorNormal=(X=0.000000,Y=0.000000,Z=1.000000)
   FootOffset=1.900000
   MaxDownAdjustment=60.000000
   JointTargetLocationSpace=BCS_ParentBoneSpace
   JointAxis=AXIS_X
   StretchLimits=(X=0.950000,Y=1.330000)
   Name="Default__KFSkelControl_FootPlacement"
   ObjectArchetype=SkelControlFootPlacement'Engine.Default__SkelControlFootPlacement'
}
