class InterpGroupInst extends Object
	native(Interpolation);

/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 *
 * 
 * An instance of an InterpGroup for a particular Actor. There may be multiple InterpGroupInsts for a single
 * InterpGroup in the InterpData, if multiple Actors are connected to the same InterpGroup. 
 * The Outer of an InterpGroupInst is the SeqAct_Interp
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

/** InterpGroup within the InterpData that this is an instance of. */
var		InterpGroup				Group; 

/** 
 *	Actor that this Group instance is acting upon.
 *	NB: that this may be set to NULL at any time as a result of the Actor being destroyed.
 */
var		Actor					GroupActor;

/** Array if InterpTrack instances. TrackInst.Num() == InterpGroup.InterpTrack.Num() must be true. */
var		array<InterpTrackInst>	TrackInst;

/** A cached copy of the group actor's pps (if it's a CameraActor) to prevent overwriting defaults */
var		private native transient pointer	CachedCamOverridePostProcess{FPostProcessSettings};		// Just need to cache the bOverride_* flags

defaultproperties
{
   Name="Default__InterpGroupInst"
   ObjectArchetype=Object'Core.Default__Object'
}
