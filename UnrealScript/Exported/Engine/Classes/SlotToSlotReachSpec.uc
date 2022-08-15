/**
 *
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class SlotToSlotReachSpec extends ForcedReachSpec
	native;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

// Value CoverLink.ECoverDirection for movement direction along this spec
var() editconst Byte SpecDirection;

defaultproperties
{
   PruneSpecList(0)=Class'Engine.ReachSpec'
   Name="Default__SlotToSlotReachSpec"
   ObjectArchetype=ForcedReachSpec'Engine.Default__ForcedReachSpec'
}
