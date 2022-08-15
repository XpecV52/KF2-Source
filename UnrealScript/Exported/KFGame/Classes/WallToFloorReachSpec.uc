//=============================================================================
// WallToFloorReachSpec
//=============================================================================
// Path connection leading from a navigation point based on a wall/ceiling to
// a navigation point on the walkable floor.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class WallToFloorReachSpec extends KFForcedReachSpec
	native(Waypoint);

var() bool bJumpDownTo;

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

defaultproperties
{
   bJumpDownTo=True
   bCanCutCorners=False
   bCheckForObstructions=False
   bSkipPrune=True
   Name="Default__WallToFloorReachSpec"
   ObjectArchetype=KFForcedReachSpec'KFGame.Default__KFForcedReachSpec'
}
