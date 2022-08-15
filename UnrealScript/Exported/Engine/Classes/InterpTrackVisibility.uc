class InterpTrackVisibility extends InterpTrack
	native(Interpolation);

/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 *
 * 
 *	This track implements support for setting or toggling the visibility of the associated actor
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


/** Visibility track actions */
enum EVisibilityTrackAction
{
	/** Hides the object */
	EVTA_Hide,

	/** Shows the object */
	EVTA_Show,

	/** Toggles visibility of the object */
	EVTA_Toggle
};



/** Required condition for firing this event */
enum EVisibilityTrackCondition
{
	/** Always play this event */
	EVTC_Always,

	/** Only play this event when extreme content (gore) is enabled */
	EVTC_GoreEnabled,

	/** Only play this event when extreme content (gore) is disabled */
	EVTC_GoreDisabled
};



/** Information for one toggle in the track. */
struct native VisibilityTrackKey
{
	var		float					Time;
	var()	EVisibilityTrackAction	Action;

	/** Condition that must be satisfied for this key event to fire */
	var EVisibilityTrackCondition ActiveCondition;
};	

/** Array of events to fire off. */
var	array<VisibilityTrackKey>	VisibilityTrack;

/** If events should be fired when passed playing the sequence forwards. */
var() bool	bFireEventsWhenForwards;

/** If events should be fired when passed playing the sequence backwards. */
var() bool	bFireEventsWhenBackwards;

/** If true, events on this track are fired even when jumping forwads through a sequence - for example, skipping a cinematic. */
var() bool	bFireEventsWhenJumpingForwards;

defaultproperties
{
   bFireEventsWhenForwards=True
   bFireEventsWhenBackwards=True
   bFireEventsWhenJumpingForwards=True
   TrackInstClass=Class'Engine.InterpTrackInstVisibility'
   TrackTitle="Visibility"
   Name="Default__InterpTrackVisibility"
   ObjectArchetype=InterpTrack'Engine.Default__InterpTrack'
}
