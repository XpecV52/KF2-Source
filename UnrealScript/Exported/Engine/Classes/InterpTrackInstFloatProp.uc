/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class InterpTrackInstFloatProp extends InterpTrackInstProperty
	native(Interpolation);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Pointer to float property in TrackObject. */
var	pointer		FloatProp; 

/** Saved value for restoring state when exiting Matinee. */
var	float		ResetFloat;

/** Pointer to FMatineeRawFloatDistribution if the FloatProp pointer belongs to one, NULL otherwise. */
var	pointer		DistributionProp;

defaultproperties
{
   Name="Default__InterpTrackInstFloatProp"
   ObjectArchetype=InterpTrackInstProperty'Engine.Default__InterpTrackInstProperty'
}
