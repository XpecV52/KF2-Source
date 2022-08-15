//=============================================================================
// KFGameplayEventsHandlerMCP
//=============================================================================
// Writes data from binary archive into JSON object
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Jonathan Howard 07/10/2014
//=============================================================================

class KFGameplayEventsHandlerOnline extends GameplayEventsHandler
	native(Analytics);

/** FArchive pointer to hold MCP payload */
var const native pointer MemoryArchive{FArchive};
var const native pointer JsonPayload{FString};

var transient KFGameStateObject KFGameState;

function native GenerateFilters();

cpptext
{
	/** The function that does the actual handling of data (override with particular implementation) */
	virtual void HandleEvent(struct FGameEventHeader& GameEvent, class IGameEvent* GameEventData);
};


/** A chance to do something before the stream starts */
native event PreProcessStream();

/** A chance to do something after the stream ends */
native event PostProcessStream();

defaultproperties
{
}
