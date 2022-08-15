class InterpTrackParticleReplay extends InterpTrack
	native(Interpolation);

/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 *
 * 
 *	This track implements support for creating and playing back captured particle system data
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


/** Data for a single key in this track */
struct native ParticleReplayTrackKey
{
	/** Position along timeline */
	var	float Time;

	/** Time length this clip should be captured/played for */
	var() float Duration;

	/** Replay clip ID number that identifies the clip we should capture to or playback from */
	var() int ClipIDNumber;
};	

/** Array of keys */
var	editinline array<ParticleReplayTrackKey> TrackKeys;

/** True in the editor if track should be used to capture replay frames instead of play them back */
var transient editoronly const bool bIsCapturingReplay;

/** Current replay fixed time quantum between frames (one over frame rate) */
var transient editoronly const float FixedTimeStep;

defaultproperties
{
   TrackInstClass=Class'Engine.InterpTrackInstParticleReplay'
   TrackTitle="Particle Replay"
   Name="Default__InterpTrackParticleReplay"
   ObjectArchetype=InterpTrack'Engine.Default__InterpTrack'
}
