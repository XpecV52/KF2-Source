/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class InterpTrackSkelControlStrength extends InterpTrackFloatBase
	native(Interpolation);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Name of property in Group Actor which this track mill modify over time. */
var()	name	SkelControlName;

defaultproperties
{
   TrackInstClass=Class'Engine.InterpTrackInstSkelControlStrength'
   TrackTitle="SkelControl Strength"
   bIsAnimControlTrack=True
   Name="Default__InterpTrackSkelControlStrength"
   ObjectArchetype=InterpTrackFloatBase'Engine.Default__InterpTrackFloatBase'
}
