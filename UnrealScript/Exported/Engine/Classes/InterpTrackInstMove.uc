/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class InterpTrackInstMove extends InterpTrackInst
	native(Interpolation);


// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Saved position. Used in editor for resetting when quitting Matinee. */
var	vector	ResetLocation;

/** Saved rotation. Used in editor for resetting when quitting Matinee. */
var rotator ResetRotation;

/** Transform of group's actor when sequence was started. This is used to reset sequence and also as basis when using IMF_RelativeToInitial. */
var	matrix	InitialTM;

/** Orientation of group's actor when sequence was started. @see InitialTM */
var quat	InitialQuat;

defaultproperties
{
   Name="Default__InterpTrackInstMove"
   ObjectArchetype=InterpTrackInst'Engine.Default__InterpTrackInst'
}
