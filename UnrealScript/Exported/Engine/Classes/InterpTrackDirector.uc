class InterpTrackDirector extends InterpTrack
	native(Interpolation);

/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 *
 * A track type used for binding the view of a Player (attached to this tracks group) to the actor of a different group.
 *
 */

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

/** Information for one cut in this track. */
struct native DirectorTrackCut
{
	/** Time to perform the cut. */
	var		float	Time;

	/** Time taken to move view to new camera. */
	var		float	TransitionTime;

	/** GroupName of InterpGroup to cut viewpoint to. */
	var()	name	TargetCamGroup;

	/** Shot number for developer reference */
	var     int     ShotNumber;
};	

/** Array of cuts between cameras. */
var	array<DirectorTrackCut>	CutTrack;

/** True to allow clients to simulate their own camera cuts.  Can help with latency-induced timing issues. */
var() bool bSimulateCameraCutsOnClients;

defaultproperties
{
   bSimulateCameraCutsOnClients=True
   TrackInstClass=Class'Engine.InterpTrackInstDirector'
   TrackTitle="Director"
   bOnePerGroup=True
   bDirGroupOnly=True
   Name="Default__InterpTrackDirector"
   ObjectArchetype=InterpTrack'Engine.Default__InterpTrack'
}
