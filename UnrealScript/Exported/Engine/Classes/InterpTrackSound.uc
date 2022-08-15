class InterpTrackSound extends InterpTrackVectorBase
	native(Interpolation);

/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 *
 *
 *	A track that plays sounds on the groups Actor.
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

/** Information for one sound in the track. */
struct native SoundTrackKey
{
	var		float		Time;
	var		float		Volume;
	var		float		Pitch;
	var()	SoundCue	Sound;

	structdefaultproperties
	{
		Volume=1.f
		Pitch=1.f
	}
};

/** Array of sounds to play at specific times. */
var array<SoundTrackKey> Sounds;

/** if set, sound plays only when playing the matinee in reverse instead of when the matinee plays forward */
var() bool bPlayOnReverse;
/** If true, sounds on this track will not be forced to finish when the matinee sequence finishes. */
var() bool bContinueSoundOnMatineeEnd;
/** If TRUE, don't show subtitles for sounds played by this track. */
var() bool bSuppressSubtitles;
/** If true and track is controlling a pawn, makes the pawn "speak" the given audio. */
var() bool bTreatAsDialogue;

defaultproperties
{
   TrackInstClass=Class'Engine.InterpTrackInstSound'
   TrackTitle="Sound"
   Name="Default__InterpTrackSound"
   ObjectArchetype=InterpTrackVectorBase'Engine.Default__InterpTrackVectorBase'
}
