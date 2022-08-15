/** 
 * InterpTrackNotify
 *
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */

class InterpTrackNotify extends InterpTrack
	native(Interpolation);
 
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

/** Sequence node to pass into the Notify function */
var AnimNodeSequence    Node;

/** Name of the parent node - used for the Notify function */
var name                ParentNodeName;

/** Sequence to be the Outer of the Notifies */
var AnimSequence        OuterSequence;

/** AnimSet to be the Outer of the OuterSequence */
var AnimSet             OuterSet;

/** Information for one notify in the track. */
struct native NotifyTrackKey
{
	var float	    Time;
	var AnimNotify	Notify;
};

/** Array of notifies to fire off. */
var	array<NotifyTrackKey>	NotifyTrack;

defaultproperties
{
   TrackInstClass=Class'Engine.InterpTrackInstNotify'
   TrackTitle="Notify"
   Name="Default__InterpTrackNotify"
   ObjectArchetype=InterpTrack'Engine.Default__InterpTrack'
}
