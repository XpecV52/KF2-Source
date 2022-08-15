/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class InterpTrackInstToggle extends InterpTrackInst
	native(Interpolation);

var()	ETrackToggleAction	Action;
/** 
 *	Position we were in last time we evaluated.
 *	During UpdateTrack, toggles between this time and the current time will be processed.
 */
var		float				LastUpdatePosition; 

/** Cached 'active' state for the toggleable actor before we possessed it; restored when Matinee exits */
var bool bSavedActiveState;


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
   Name="Default__InterpTrackInstToggle"
   ObjectArchetype=InterpTrackInst'Engine.Default__InterpTrackInst'
}
