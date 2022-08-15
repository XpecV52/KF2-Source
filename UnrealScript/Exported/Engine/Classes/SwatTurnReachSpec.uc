/**
 *
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */


class SwatTurnReachSpec extends ForcedReachSpec
	native;

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
   Name="Default__SwatTurnReachSpec"
   ObjectArchetype=ForcedReachSpec'Engine.Default__ForcedReachSpec'
}
