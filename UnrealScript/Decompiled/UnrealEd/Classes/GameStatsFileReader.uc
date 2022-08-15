/*******************************************************************************
 * GameStatsFileReader generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class GameStatsFileReader extends GameplayEventsHandler
    native(GameStats)
    config(GameStats);

cpptext
{
public:
	/** 
	 * The function that does the actual handling of data (override with particular implementation) 
	 * @param GameEvent - header of the current game event from disk
	 * @param GameEventData - payload immediately following the header
	 */
	virtual void HandleEvent(struct FGameEventHeader& GameEvent, class IGameEvent* GameEventData);

	/*
	 *   Set the game state this handler will use
	 * @param InGameState - game state object to use
	 */
	virtual void SetGameState(class UGameStateObject* InGameState);

	/** 
	 * Adds a new event created to the array of all events in the file 
	 * @param NewEvent - new event to add
	 * @param TeamIndex - Team Index for team events (INDEX_NONE if not a team event)
	 * @param PlayerIndex - Player Index for player events (INDEX_NONE if not a player event)
	 * @param TargetIndex - Target Index for player events (INDEX_NONE if event has no target)
	 */
	void AddNewEvent(struct FIGameStatEntry* NewEvent, INT TeamIndex, INT PlayerIndex, INT TargetIndex);

}

var private GameStateObject GameState;
var GameSessionEntry SessionData;
var int EventsOffset;
var private native const transient array<Pointer> AllEvents;

// Export UGameStatsFileReader::execCleanup(FFrame&, void* const)
native event Cleanup();
