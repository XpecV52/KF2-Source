/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class MantleReachSpec extends ForcedReachSpec
	native;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** This mantle spec climbs up a surface instead of jumping over */
var() bool bClimbUp;

defaultproperties
{
   bSkipPrune=True
   Name="Default__MantleReachSpec"
   ObjectArchetype=ForcedReachSpec'Engine.Default__ForcedReachSpec'
}
