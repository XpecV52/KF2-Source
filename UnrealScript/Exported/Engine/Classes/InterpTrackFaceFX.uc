class InterpTrackFaceFX extends InterpTrack
	native(Interpolation);
	
/** 
 * InterpTrackFaceFX
 *
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
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

/** Structure used for holding information for one FaceFX animation played by the track. */
struct native FaceFXTrackKey
{
	/** Position in the Matinee sequence to start playing this FaceFX animation. */
	var		float	StartTime;

	/** Name of FaceFX group containing sequence to play. */
	var		string	FaceFXGroupName;

	/** Name of FaceFX sequence to play. */
	var		string	FaceFXSeqName;
};	

/** Extra sets of animation that you wish to use on this Group's Actor during the matinee sequence. */
var()	array<FaceFXAnimSet>	FaceFXAnimSets;

/** Track of different animations to play and when to start playing them. */
var	array<FaceFXTrackKey>	FaceFXSeqs;

/** In Matinee, cache a pointer to the Actor's FaceFXAsset, so we can get info like anim lengths. */
var transient FaceFXAsset	CachedActorFXAsset;


/** Structure used for holding information for one FaceFX animation played by the track. */
struct native FaceFXSoundCueKey
{
	/** Sound cue associated with this key's FaceFX sequence.  Currently this is maintained automatically by
	    the editor and saved out when the map is saved to disk.  The game requires the sound cue reference
		in order to play FaceFX animations with audio. */
	var private const SoundCue FaceFXSoundCue;

// WWISEMODIF_START
	/** AkEvent associated with this key's FaceFX sequence.  Currently this is maintained automatically by
	    the editor and saved out when the map is saved to disk.  The game requires the AkEvent reference
		in order to play FaceFX animations with audio. */
	var private const AkEvent FaceFXAkEvent;
// WWISEMODIF_END
};	


/** One key for each key in the associated FaceFX track's array of keys */
var	private const array< FaceFXSoundCueKey > FaceFXSoundCueKeys;

defaultproperties
{
   TrackInstClass=Class'Engine.InterpTrackInstFaceFX'
   TrackTitle="FaceFX"
   bOnePerGroup=True
   Name="Default__InterpTrackFaceFX"
   ObjectArchetype=InterpTrack'Engine.Default__InterpTrack'
}
