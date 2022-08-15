/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class InterpTrackInstParticleReplay extends InterpTrackInst
	native(Interpolation);

/** 
 *	Position we were in last time we evaluated.
 *	During UpdateTrack, events between this time and the current time will be processed.
 */
var		float				LastUpdatePosition; 

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
   Name="Default__InterpTrackInstParticleReplay"
   ObjectArchetype=InterpTrackInst'Engine.Default__InterpTrackInst'
}
