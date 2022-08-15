/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */

class MorphNodeWeightByBoneAngle extends MorphNodeWeightBase
	dependson(MaterialInstanceConstant)
	native(Anim);

/**
 * This node gets the shortest angle between 2 bones (0d to 180d),
 * and translates that into a weight scaling morph targets using used defined values.
 */

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
 
// Internal variables
var	const transient float	Angle;
var	const transient float	NodeWeight;

/** Base Bone Name */
var(BaseBone)	Name	BaseBoneName;
/** Axis to use on Base Bone, X, Y or Z */
var(BaseBone)	EAxis	BaseBoneAxis;
/** Should the Angle bone axis be inverted? */
var(BaseBone)	bool	bInvertBaseBoneAxis;

/** Angle bone name */
var(AngleBone)	Name	AngleBoneName;
/** Axis to use on Angle Bone, X, Y or Z */
var(AngleBone)	EAxis	AngleBoneAxis;
/** Should the Angle bone axis be inverted? */
var(AngleBone)	bool	bInvertAngleBoneAxis;

// Material Parameter control
var(Material)				bool						bControlMaterialParameter;
var(Material)				INT							MaterialSlotId;
var(Material)				Name						ScalarParameterName;
var				transient	MaterialInstanceConstant	MaterialInstanceConstant;

/** Structure defining Angle to Morph weight correspondance */
struct native BoneAngleMorph
{
	var()	FLOAT	Angle;
	var()	FLOAT	TargetWeight;

	structdefaultproperties
	{
		TargetWeight=1.f
	}
};
/** Array of points translating angles into morph weights */
var()	Array<BoneAngleMorph> WeightArray;

defaultproperties
{
   BaseBoneAxis=AXIS_X
   AngleBoneAxis=AXIS_X
   WeightArray(0)=(TargetWeight=0.000000)
   WeightArray(1)=(Angle=180.000000)
   NodeConns(0)=(ConnName="In")
   Name="Default__MorphNodeWeightByBoneAngle"
   ObjectArchetype=MorphNodeWeightBase'Engine.Default__MorphNodeWeightBase'
}
