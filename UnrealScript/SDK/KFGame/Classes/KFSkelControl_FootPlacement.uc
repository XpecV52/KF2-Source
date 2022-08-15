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

cpptext
{
	// USkelControlBase interface
	virtual void TickSkelControl(FLOAT DeltaSeconds, USkeletalMeshComponent* SkelComp);
	virtual void CalculateNewBoneTransforms(INT BoneIndex, USkeletalMeshComponent* SkelComp, TArray<FBoneAtom>& OutBoneTransforms);
	virtual void DrawSkelControl3D(const FSceneView* View, FPrimitiveDrawInterface* PDI, USkeletalMeshComponent* SkelComp, INT BoneIndex);

	//virtual void CalcEffectorLocation(INT BoneIndex, USkeletalMeshComponent* SkelComp);
}

defaultproperties
{
	bProjectOntoPlane=true
	InterpUpSpeed=128.f
	InterpDownSpeed=128.f
	FloorNormal=(Z=1.f)

	EffectorLocationSpace=BCS_WorldSpace
	JointTargetLocationSpace=BCS_ParentBoneSpace
	JointAxis=AXIS_X

	MaxDownAdjustment=60.0

	// Lift the foot off the ground a bit (<= MAXFLOORDIST) to reduce clipping.
	// If set properly, UpdateFloorConform will choose not to pull down the mesh on even floor.
	//	aka: the LegAdjust will be ~= 0 (erroring on neg)
	FootOffset=1.9f

	// This is the value that GOW3 uses for its stretch limits
	StretchLimits=(X=0.95f,Y=1.33f)
}
