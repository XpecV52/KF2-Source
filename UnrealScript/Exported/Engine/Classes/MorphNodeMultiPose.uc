/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class MorphNodeMultiPose extends MorphNodeBase
	native(Anim)
	hidecategories(Object);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Cached pointer to actual MorphTarget object. */
var		transient array<MorphTarget>	Targets;

/** 
 *	Name of morph target to use for this pose node. 
 *	Actual MorphTarget is looked up by name in the MorphSets array in the SkeletalMeshComponent.
 */
var()	array<name>					MorphNames;
 
/** default weight is 1.f. But it can be scaled for tweaking. */
var()	array<float>					Weights;
 
/** 
 *	Add the MorphTarget to use for this MorphNodeMultiPose by name. 
 *	Will find it in the owning SkeletalMeshComponent MorphSets array using FindMorphTarget.
 */
native final function bool AddMorphTarget(Name MorphTargetName, optional float InWeight = 1.0f);

/** 
 *	Remove the MorphTarget from using for this MorphNodeMultiPose by name. 
 *	Will find it in the owning SkeletalMeshComponent MorphSets array using FindMorphTarget.
 */
native final function RemoveMorphTarget(Name MorphTargetName);

/** 
 *	Update weight of the morph target 
 */
native final function bool UpdateMorphTarget(MorphTarget Target, float InWeight);

defaultproperties
{
   Name="Default__MorphNodeMultiPose"
   ObjectArchetype=MorphNodeBase'Engine.Default__MorphNodeBase'
}
