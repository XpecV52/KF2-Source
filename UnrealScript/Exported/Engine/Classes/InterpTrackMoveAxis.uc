class InterpTrackMoveAxis extends InterpTrackFloatBase
	dependson(InterpTrackMove)
	native(Interpolation);

/** 
  * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
  *
  * Subtrack for InterpTrackMove
  * Transforms an interp actor on one axis
  */

/** List of axies this track can use */
enum EInterpMoveAxis
{
	AXIS_TranslationX,
	AXIS_TranslationY,
	AXIS_TranslationZ,
	AXIS_RotationX,
	AXIS_RotationY,
	AXIS_RotationZ,
};

/** The axis which this track will use when transforming an actor */
var EInterpMoveAxis MoveAxis;

/** Lookup track to use when looking at different groups for transform information*/
var	InterpLookupTrack LookupTrack;

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

defaultproperties
{
   TrackTitle="Move Axis Track"
   bSubTrackOnly=True
   Name="Default__InterpTrackMoveAxis"
   ObjectArchetype=InterpTrackFloatBase'Engine.Default__InterpTrackFloatBase'
}
