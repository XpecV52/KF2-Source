/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class InterpTrackInstEvent extends InterpTrackInst
	native(Interpolation);


// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** 
 *	Position we were in last time we evaluated Events. 
 *	During UpdateTrack, events between this time and the current time will be fired. 
 */
var	float LastUpdatePosition;

defaultproperties
{
   Name="Default__InterpTrackInstEvent"
   ObjectArchetype=InterpTrackInst'Engine.Default__InterpTrackInst'
}
