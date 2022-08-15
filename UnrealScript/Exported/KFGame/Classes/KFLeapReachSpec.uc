//=============================================================================
// KFLeapReachSpec
//=============================================================================
// Special reachspec for wall/ceiling related navigation (Based on GOW2-3)
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFLeapReachSpec extends AdvancedReachSpec
	native(Waypoint);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

var() editconst Vector	CachedVelocity;
var() editconst float	RequiredJumpZ;

defaultproperties
{
   bSkipPrune=True
   Name="Default__KFLeapReachSpec"
   ObjectArchetype=AdvancedReachSpec'Engine.Default__AdvancedReachSpec'
}
