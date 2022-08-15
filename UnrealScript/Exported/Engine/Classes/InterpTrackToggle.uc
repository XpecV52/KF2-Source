class InterpTrackToggle extends InterpTrack
	native(Interpolation);

/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 *
 * 
 *	A track containing toggle actions that are triggered as its played back. 
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

/** Enumeration indicating toggle action	*/
enum ETrackToggleAction
{
	ETTA_Off,
	ETTA_On,
	ETTA_Toggle,
	ETTA_Trigger
};

/** Information for one toggle in the track. */
struct native ToggleTrackKey
{
	var		float				Time;
	var()	ETrackToggleAction	ToggleAction;
};	

/** Array of events to fire off. */
var	array<ToggleTrackKey>	ToggleTrack;

/** 
 *	If true, the track will call ActivateSystem on the emitter each update (the old 'incorrect' behavior).
 *	If false (the default), the System will only be activated if it was previously inactive.
 */
var() bool	bActivateSystemEachUpdate;

/** 
 *	If true, the track will activate the system w/ the 'Just Attached' flag.
 */
var() bool	bActivateWithJustAttachedFlag;

/** If events should be fired when passed playing the sequence forwards. */
var() bool	bFireEventsWhenForwards;

/** If events should be fired when passed playing the sequence backwards. */
var() bool	bFireEventsWhenBackwards;

/** If true, events on this track are fired even when jumping forwads through a sequence - for example, skipping a cinematic. */
var() bool	bFireEventsWhenJumpingForwards;

defaultproperties
{
   bActivateWithJustAttachedFlag=True
   bFireEventsWhenForwards=True
   bFireEventsWhenBackwards=True
   bFireEventsWhenJumpingForwards=True
   TrackInstClass=Class'Engine.InterpTrackInstToggle'
   TrackTitle="Toggle"
   Name="Default__InterpTrackToggle"
   ObjectArchetype=InterpTrack'Engine.Default__InterpTrack'
}
