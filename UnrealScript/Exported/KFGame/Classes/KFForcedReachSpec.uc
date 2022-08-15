//=============================================================================
// KFForcedReachSpec
//=============================================================================
// Base KF ForcedReachSpec
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFForcedReachSpec extends KFReachSpec
	native(Waypoint);

struct native ForcedSpecInfo
{
	var()	vector2D	SpecSize; 
	var() bool			bSupports;
};

var() Vector2D ForcedSpec;

var() array<ForcedSpecInfo>	ForcedSpecInfoList;

var() bool	bSupportsHumanSize;
var() bool	bSupportsCommonSize;
var() bool	bSupportsMaxSize;

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
   bSupportsHumanSize=True
   bSupportsCommonSize=True
   bSupportsMaxSize=True
   Name="Default__KFForcedReachSpec"
   ObjectArchetype=KFReachSpec'KFGame.Default__KFReachSpec'
}
