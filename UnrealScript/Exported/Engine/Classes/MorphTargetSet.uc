/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class MorphTargetSet extends Object
	native(Anim);
	
/** Array of pointers to MorphTarget objects, containing vertex deformation information. */ 
var	array<MorphTarget>		Targets;

/** SkeletalMesh that this MorphTargetSet works on. */
var	SkeletalMesh			BaseSkelMesh;

/** morph mesh original wedge point indices for each LOD - used to remap*/
var	const native			Array_Mirror	RawWedgePointIndices{TArrayNoInit< TArray<DWORD> >}; 

/** Find a morph target by name in this MorphTargetSet. */ 
native final function MorphTarget FindMorphTarget( Name MorphTargetName );

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

defaultproperties
{
   Name="Default__MorphTargetSet"
   ObjectArchetype=Object'Core.Default__Object'
}
