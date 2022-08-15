/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class InterpTrackInstVectorMaterialParam extends InterpTrackInst
	native(Interpolation);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** list of MICs we are using and optionally also the original value of the parameter we're editing
 * array size should match owner track's Materials array
 */
struct native VectorMaterialParamMICData
{
	/** MICs we're using to set the desired parameter on PrimitiveComponents - size of array should match track's AffectedMaterialRefs */
	var const array<MaterialInstanceConstant> MICs;
	/** saved values for restoring state when exiting Matinee - size of array should match MICs */
	var const array<vector> MICResetVectors;
};
var array<VectorMaterialParamMICData> MICInfos;

/** track we are an instance of - used in the editor to propagate changes to the track's Materials array immediately */
var InterpTrackVectorMaterialParam InstancedTrack;

defaultproperties
{
   Name="Default__InterpTrackInstVectorMaterialParam"
   ObjectArchetype=InterpTrackInst'Engine.Default__InterpTrackInst'
}
