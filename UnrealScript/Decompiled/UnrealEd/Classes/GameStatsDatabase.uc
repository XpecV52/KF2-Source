/*******************************************************************************
 * GameStatsDatabase generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class GameStatsDatabase extends Object
    native(GameStats)
    config(Editor);

cpptext
{
public:

	/** @return TRUE if this database is able to access a remote database */
	UBOOL HasRemoteConnection() { return RemoteDB != NULL; }

	/** 
	* Query this database
	* @param SearchQuery - the query to run on the database
	* @param Events - out array of indices of relevant events in the database
	* @return the number of results found for this query
	*/
	virtual INT QueryDatabase(const struct FGameStatsSearchQuery& Query, struct FGameStatsRecordSet& RecordSet);

	/**
	* Allows a visitor interface access to every database entry of interest
	* @param SessionID - session we're interested in
	* @param EventIndices - all events the visitor wants access to
	* @param Visitor - the visitor interface that will be accessing the data
	* @return TRUE if the visitor got what it needed from the visit, FALSE otherwise
	*/
	virtual UBOOL VisitEntries(const struct FGameStatsRecordSet& RecordSet, class IGameStatsDatabaseVisitor* Visitor);

	/**
	 *   Fill in database structures for a given sessionID if necessary
	 * @param SessionID - session to cache data for
	 */
	virtual void PopulateSessionData(const FString& SessionID);

protected:
	/*
	 * Get all events associated with a given session
	 * @param SessionID - session we're interested in
	 * @param Events - array of indices related to relevant session events
	 */
	virtual INT GetEventsBySessionID(const FString& SessionID, TArray<INT>& Events);

	/*
	 * Get all game events associated with a given session (neither player nor team)
	 * @param SessionID - session we're interested in
	 * @param Events - array of indices related to relevant game events
	 */
	virtual INT GetGameEventsBySession(const FString& SessionID, TArray<INT>& Events);

	/*
	 * Get all events associated with a given team
	 * @param SessionID - session we're interested in
	 * @param TeamIndex - the team to return the events for (INDEX_NONE is all teams)
	 * @param Events - array of indices related to relevant team events
	 */
	virtual INT GetEventsByTeam(const FString& SessionID, INT TeamIndex, TArray<INT>& Events);

	/*
	 * Get all events associated with a given player
	 * @param SessionID - session we're interested in
	 * @param PlayerIndex - the player to return the events for (INDEX_NONE is all players)
	 * @param Events - array of indices related to relevant player events
	 */
	virtual INT GetEventsByPlayer(const FString& SessionID, INT PlayerIndex, TArray<INT>& Events);

	/*
	 * Get all events associated with a given round
	 * @param SessionID - session we're interested in
	 * @param RoundNumber - the round to return events for  (INDEX_NONE is all rounds)
	 * @param Events - array of indices related to relevant round events
	 */
	virtual INT GetEventsByRound(const FString& SessionID, INT RoundNumber, TArray<INT>& Events);
	
	/*
	 * Get all events associated with a given event ID
	 * @param SessionID - session we're interested in
	 * @param EventID - the event of interest (INDEX_NONE is all events)
	 * @param Events - array of indices related to relevant events
	 */
	virtual INT GetEventsByID(const FString& SessionID, INT EventID, TArray<INT>& Events);

	/** Searches the stats directory for relevant data files and populates the database */
	virtual void LoadLocalData(const FString& MapName, GameStatsDateFilters DateFilter);

	/** Connects to the remote database and populates the db with data */
	virtual void LoadRemoteData(const FString& MapName, GameStatsDateFilters DateFilter);

	/** 
	 *   Open a game stats file for reading
	 * @param Filename - name of the file that will be open for serialization
	 * @return TRUE if successful, else FALSE
	 */
	virtual UBOOL OpenStatsFile(const FString& Filename);

}

enum GameStatsDateFilters
{
    GSDF_Today,
    GSDF_Last3Days,
    GSDF_LastWeek,
    GSDF_LastYear,
    GSDF_MAX
};

struct native SessionIndexPair
{
    structcpptext
    {

		FSessionIndexPair(EEventParm)
		{
			appMemzero(this, sizeof(FSessionIndexPair));
		}

		FSessionIndexPair(const FString& InSessionId, const INT InIndex) 
			: SessionId(InSessionId), Index(InIndex) {}
	
    }

    var init string SessionId;
    var int Index;

    structdefaultproperties
    {
        SessionId=""
        Index=0
    }
};

struct native GameStatsSearchQuery
{
    structcpptext
    {

		/** Constructors */
		FGameStatsSearchQuery() {}
		FGameStatsSearchQuery(EEventParm)
		{
			appMemzero(this, sizeof(FGameStatsSearchQuery));
		}

		enum SearchQueryTypes
		{
			ALL_PLAYERS =  INDEX_NONE,
			ALL_TEAMS =    INDEX_NONE,
			ALL_EVENTS =   INDEX_NONE,
		};
	
    }

    var int StartTime;
    var int EndTime;
    var array<string> SessionIDs;
    var array<int> EventIDs;
    var array<SessionIndexPair> TeamIndices;
    var array<SessionIndexPair> PlayerIndices;

    structdefaultproperties
    {
        StartTime=0
        EndTime=0
        SessionIDs=none
        EventIDs=none
        TeamIndices=none
        PlayerIndices=none
    }
};

struct native GameSessionEntry
{
    structcpptext
    {

		/** Constructors */
		FGameSessionEntry() {}
		FGameSessionEntry(EEventParm)
		{
			appMemzero(this, sizeof(FGameSessionEntry));
		}

		/* Clear out all contained data */
		void Empty()
		{
			AllEvents.Empty();
			GameEvents.Empty();
			EventsByPlayer.Empty();
			EventsByRound.Empty();
			EventsByType.Empty();
			EventsByTeam.Empty();
		}
	
    }

    var init const transient array<init int> AllEvents;
    var const transient array<int> GameEvents;
    var native const transient MultiMap_Mirror EventsByPlayer;
    var native const transient MultiMap_Mirror EventsByRound;
    var native const transient MultiMap_Mirror EventsByType;
    var native const transient MultiMap_Mirror EventsByTeam;

    structdefaultproperties
    {
        AllEvents=none
        GameEvents=none
    }
};

struct native IGameStatEntry
{
    structcpptext
    {

		FIGameStatEntry() {}
		FIGameStatEntry(const struct FGameEventHeader& GameEvent);
		FIGameStatEntry(class FDataBaseRecordSet* RecordSet);

		/** 
		 * Every entry type must handle/accept the visitor interface 
		 * @param Visitor - Interface class wanting access to the entry
		 */
		virtual void Accept(class IGameStatsDatabaseVisitor* Visitor)
		{
			ensureMsg(0, TEXT("Game stats database entry type didn't implement Accept function!"));
		}
	
    }

    var native const noexport Pointer Vtbl_IGameStatEntry;
    var init string EventName;
    var int EventID;
    var float EventTime;

    structdefaultproperties
    {
        EventName=""
        EventID=0
        EventTime=0
    }
};

struct native GameStatsRecordSet
{
    structcpptext
    {

		INT GetNumResults() { return LocalRecordSet.Num() + RemoteRecordSet.Num(); }
	
    }

    var init array<init int> LocalRecordSet;
    var init native array<init Pointer> RemoteRecordSet;

    structdefaultproperties
    {
        LocalRecordSet=none
    }
};

var private native const transient MultiMap_Mirror MapNameToFilenameMapping;
var private native const transient array<Pointer> AllEvents;
var private native const transient Map_Mirror AllSessions;
var private native const transient Map_Mirror SessionFilenamesBySessionID;
var private native const transient Map_Mirror SessionInfoBySessionID;
var private native const transient Map_Mirror PlayerListBySessionID;
var private native const transient Map_Mirror TeamListBySessionID;
var private native const transient Map_Mirror SupportedEventsBySessionID;
var private native const transient Map_Mirror WeaponClassesBySessionID;
var private native const transient Map_Mirror DamageClassesBySessionID;
var private native const transient Map_Mirror ProjectileClassesBySessionID;
var private native const transient Map_Mirror PawnClassesBySessionID;
var const transient array<string> AllGameTypes;
var private native const transient Pointer RemoteDB;
var config string GameStatsFileReaderClassname;
var config string GameStateClassname;

// Export UGameStatsDatabase::execInit(FFrame&, void* const)
native function Init(const string MapName, GameStatsDatabase.GameStatsDateFilters DateFilter);

// Export UGameStatsDatabase::execCacheLocalFilenames(FFrame&, void* const)
native function CacheLocalFilenames();

// Export UGameStatsDatabase::execGetGameTypes(FFrame&, void* const)
native function GetGameTypes(out array<string> GameTypes);

// Export UGameStatsDatabase::execGetSessionIDs(FFrame&, void* const)
native function GetSessionIDs(GameStatsDatabase.GameStatsDateFilters DateFilter, const string GameTypeFilter, out array<string> SessionIDs);

// Export UGameStatsDatabase::execIsSessionIDLocal(FFrame&, void* const)
native function bool IsSessionIDLocal(const string SessionId);

// Export UGameStatsDatabase::execGetSessionInfoBySessionID(FFrame&, void* const)
native function GetSessionInfoBySessionID(const string SessionId, out GameSessionInformation OutSessionInfo);

// Export UGameStatsDatabase::execGetPlayersListBySessionID(FFrame&, void* const)
native function GetPlayersListBySessionID(const string SessionId, out array<PlayerInformation> OutPlayerList);

// Export UGameStatsDatabase::execGetTeamListBySessionID(FFrame&, void* const)
native function GetTeamListBySessionID(const string SessionId, out array<TeamInformation> OutTeamList);

// Export UGameStatsDatabase::execGetEventsListBySessionID(FFrame&, void* const)
native function GetEventsListBySessionID(const string SessionId, out array<GameplayEventMetaData> OutGameplayEvents);

// Export UGameStatsDatabase::execGetWeaponListBySessionID(FFrame&, void* const)
native function GetWeaponListBySessionID(const string SessionId, out array<WeaponClassEventData> OutWeaponList);

// Export UGameStatsDatabase::execGetDamageListBySessionID(FFrame&, void* const)
native function GetDamageListBySessionID(const string SessionId, out array<DamageClassEventData> OutDamageList);

// Export UGameStatsDatabase::execGetProjectileListBySessionID(FFrame&, void* const)
native function GetProjectileListBySessionID(const string SessionId, out array<ProjectileClassEventData> OutProjectileList);

// Export UGameStatsDatabase::execGetPawnListBySessionID(FFrame&, void* const)
native function GetPawnListBySessionID(const string SessionId, out array<PawnClassEventData> OutPawnList);

// Export UGameStatsDatabase::execGetEventCountByType(FFrame&, void* const)
native function int GetEventCountByType(const string SessionId, int EventID);

// Export UGameStatsDatabase::execClearDatabase(FFrame&, void* const)
native function ClearDatabase();

// Export UGameStatsDatabase::execUploadSession(FFrame&, void* const)
native function bool UploadSession(const string SessionId);
