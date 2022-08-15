//=============================================================================
// KFGameStatsAggregatorMCP
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 11/6/2013
//=============================================================================

class KFGameStatsAggregatorOnline extends GameStatsAggregator
	native(Analytics)
	config(GameStats);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** A chance to do something before the stream starts */
native event PreProcessStream();

defaultproperties
{
   Name="Default__KFGameStatsAggregatorOnline"
   ObjectArchetype=GameStatsAggregator'GameFramework.Default__GameStatsAggregator'
}
