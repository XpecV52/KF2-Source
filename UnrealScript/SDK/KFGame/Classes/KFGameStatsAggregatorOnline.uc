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

cpptext
{
    /**
	 * Top Level Function that kicks off the serialization for MCP
	 * @param Ar - archive to write out
	 */
	void WriteToMCPStream(FArchive& Archive);

}

/** A chance to do something before the stream starts */
native event PreProcessStream();
