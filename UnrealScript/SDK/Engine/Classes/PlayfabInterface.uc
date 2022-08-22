//=============================================================================
// PlayFabInterface
//=============================================================================
// Interface class for all playfab calls
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//  - Author 4/5/2016
//=============================================================================
class PlayfabInterface extends Object
	config(Engine)
	native
	inherits(FTickableObject);

`define FillAddDel(aname)\
	if (`aname.Find(InDelegate) == INDEX_NONE)\
	{\
	`aname[`aname.Length] = InDelegate;\
	}\

`define FillClearDel( aname )\
	local int RemoveIndex;\
	RemoveIndex = `aname.Find(InDelegate);\
	if (RemoveIndex != INDEX_NONE)\
	{\
	`aname.Remove(RemoveIndex,1);\
	}\


/** The current pending game search */
var OnlineGameSearch PendingGameSearch;

/** The playfab ID with successful login */
var const string CachedPlayfabId;
/** The session ticket with successful login */
var const string CachedSessionTicket;

/** TRUE if login process has finished */
var const private bool bLoginProcessFinished;

/** The time of the last auth refresh to determine if re-auth is needed. Represents appseconds converted to an INT */
var const private INT LastAuthRefreshTime;

/** The time in seconds for when auth should be refreshed */
var const private INT SecondsForAuthRefreshTime;

/** Current game mode search index. Used for batching multiple searches */
var const private INT CurrentGameModeSearchIndex;

/** The name of the catalog to use */
var const private{private} config string CatalogName;

/** The list of available region names */
var const config array<string> RegionNames;

/** The current region index for the player */
var string CurrRegionName;

/** Service label used to consume PSN entitlements */
var const int PlayfabNPServiceLabel;


// SERVER ONLY
/////////////////////////////////////////////////////////////////

/** TRUE if this server was launched by playfab */
var const private{private} bool bLaunchedByPlayfab;

/** The lobby ID of the server */
var const private{private} string CachedLobbyId;

/** The elapsed time since the last heartbeat for the server */
var const private{private} float ElapsedTimeSinceLastHeartBeat;

/** The interval needed for sending heartbeats to playfab */
var const private{private} float HeartbeatInterval;

/** The cached game settings */
var private{private} OnlineGameSettings CachedGameSettings;

// SERVER END
/////////////////////////////////////////////////////////////////

/** Array of delegates to multicast */
var array<delegate<OnFindOnlineGamesComplete> > FindOnlineGamesCompleteDelegates;
var array<delegate<OnQueryServerInfoComplete> > OnQueryServerInfoCompleteDelegates;
var array<delegate<OnLoginComplete> > LoginCompleteDelegates;
var array<delegate<OnRegionQueryComplete> > RegionQueryCompleteDelegates;
var array<delegate<OnServerStarted> > ServerStartedDelegates;
var array<delegate<OnInventoryRead> > InventoryReadDelegates;
var array<delegate<OnStoreDataRead> > StoreDataReadDelegates;
var array<delegate<OnCloudScriptExecutionComplete> > CloudScriptExecutionCompleteDelegates;

// Client API calls
/////////////////////////////////////////////////////////////////////////

// Login to playfab service. Will create account if login fails
native function bool Login( string UserName );
delegate OnLoginComplete(bool bWasSuccessful, string SessionTicket, string PlayfabId);
function AddOnLoginCompleteDelegate( delegate<OnLoginComplete> InDelegate) { `FillAddDel(LoginCompleteDelegates); }
function ClearOnLoginCompleteDelegate( delegate<OnLoginComplete> InDelegate) { `FillClearDel(LoginCompleteDelegates); }

// Logout of playfab services when we get disconnected
native function bool Logout();

// Read store data
native function ReadStoreData();
delegate OnStoreDataRead(bool bWasSuccessful);
function AddStoreDataReadCompleteDelegate( delegate<OnStoreDataRead> InDelegate) { `FillAddDel(StoreDataReadDelegates); }
function ClearStoreDataReadCompleteDelegate( delegate<OnStoreDataRead> InDelegate) { `FillClearDel(StoreDataReadDelegates); }

// Read inventory for local user
native function ReadInventory();
delegate OnInventoryRead(bool bWasSuccessful);
function AddInventoryReadCompleteDelegate( delegate<OnInventoryRead> InDelegate) { `FillAddDel(InventoryReadDelegates); }
function ClearInventoryReadCompleteDelegate( delegate<OnInventoryRead> InDelegate) { `FillClearDel(InventoryReadDelegates); }

// Unlocks a container for the user
native function UnlockContainer(string ContainerId);

// Consumes entitlements
native function ConsumeEntitlements();

// Find online games. Results will show up in the search settings supplied if successful
native function bool FindOnlineGames( OnlineGameSearch SearchSettings );
delegate OnFindOnlineGamesComplete(bool bWasSuccessful);
function AddFindOnlineGamesCompleteDelegate(delegate<OnFindOnlineGamesComplete> InDelegate) { `FillAddDel(FindOnlineGamesCompleteDelegates); }
function ClearFindOnlineGamesCompleteDelegate(delegate<OnFindOnlineGamesComplete> InDelegate) { `FillClearDel(FindOnlineGamesCompleteDelegates); }
// Cancel the current game search
native function CancelGameSearch();

// Query info for a particular server
native function QueryServerInfo( const string LobbyId );
delegate OnQueryServerInfoComplete(bool bWasSuccessful, string LobbyId, string ServerIp, int ServerPort, string AuthTicket);
function AddQueryServerInfoCompleteDelegate( delegate<OnQueryServerInfoComplete> InDelegate) { `FillAddDel(OnQueryServerInfoCompleteDelegates); }
function ClearQueryServerInfoCompleteDelegate( delegate<OnQueryServerInfoComplete> InDelegate) { `FillClearDel(OnQueryServerInfoCompleteDelegates); }

// Query available regions
delegate OnRegionQueryComplete( bool bWasSuccessful, array<string> OutRegionNames );
native function QueryAvailableRegions();
function AddRegionQueryCompleteDelegate( delegate<OnRegionQueryComplete> InDelegate) { `FillAddDel(RegionQueryCompleteDelegates); }
function ClearRegionQueryCompleteDelegate( delegate<OnRegionQueryComplete> InDelegate) { `FillClearDel(RegionQueryCompleteDelegates); }

// Starts a new server instance
native function StartNewServerInstance( string GameMode, optional string ServerCommandline );
delegate OnServerStarted( bool bWasSuccessful, string ServerLobbyId, string ServerIp, int ServerPort, string ServerTicket );
function AddOnServerStartedDelegate( delegate<OnServerStarted> InDelegate) { `FillAddDel(ServerStartedDelegates); }
function ClearOnServerStartedDelegate( delegate<OnServerStarted> InDelegate) { `FillClearDel(ServerStartedDelegates); }

// Executes a cloud script function
native function ExecuteCloudScript( string FunctionName, JsonObject FunctionParms );
delegate OnCloudScriptExecutionComplete( bool bWasSuccessful, string FunctionName, JsonObject FunctionResult );
function AddOnCloudScriptExecutionCompleteDelegate( delegate<OnCloudScriptExecutionComplete> InDelegate ) { `FillAddDel(CloudScriptExecutionCompleteDelegates); }
function ClearOnCloudScriptExecutionCompleteDelegate( delegate<OnCloudScriptExecutionComplete> InDelegate ) { `FillClearDel(CloudScriptExecutionCompleteDelegates); }


function bool IsRegisteredWithPlayfab()
{
	return CachedLobbyId != "";
}


function string GetCachedLobbyId()
{
	return CachedLobbyId;
}


function int GetIndexForCurrentRegion()
{
	local int i;

	for( i = 0; i < RegionNames.Length; i++ )
	{
		if( RegionNames[i] == CurrRegionName )
		{
			return i;
		}
	}

	`warn("Failed to find index for current region"@CurrRegionName);
	return -1;
}


function SetIndexForCurrentRegion( int InRegionIndex )
{
	if( InRegionIndex >= 0 && InRegionIndex < RegionNames.Length )
	{
		CurrRegionName = RegionNames[InRegionIndex];
	}
	else
	{
		`warn("Failed to set region index"@InRegionIndex);
	}
}



// Server API calls
/////////////////////////////////////////////////////////////////////////
native function ServerValidatePlayer( const string ClientAuthTicket );
native function ServerNotifyPlayerLeft( const string PlayfabId );
native function ServerUpdateOnlineGame();
native function ServerRegisterGame( const string GameMode );

native function ServerUpdateInternalUserData( const string ForPlayerId, array<string> InKeys, array<string> InValues );
native function ServerRetrieveInternalUserData( const string ForPlayerId, array<string> InKeys );
native function ServerAddVirtualCurrencyForUser( const string ForPlayerId, const int AmountToAdd, optional string CurrencyName = "GM" );
native function ServerRemoveVirtualCurrencyForUser( const string ForPlayerId, const int AmountToRemove, optional string CurrencyName = "GM" );
native function ServerGrantItemsForUser( const string ForPlayerId, array<string> ItemIds );

function CreateGameSettings( class<OnlineGameSettings> GameSettingsClass )
{
	if( CachedGameSettings == none )
	{
		CachedGameSettings = new GameSettingsClass;
	}
}

function OnlineGameSettings GetGameSettings()
{
	return CachedGameSettings;
}


// Private calls
/////////////////////////////////////////////////////////////////////////////

// Auths with online service (ex. PSN). Calls into OSS to do this
private event AuthWithOnlineService()
{
	local OnlineSubsystem OSS;

	OSS = class'GameEngine'.static.GetOnlineSubsystem();
	if( OSS != none && OSS.PlayerInterface != none )
	{
		OSS.PlayerInterface.AddOnlineServiceAuthCompleteDelegate( OnOnlineServiceAuthComplete );
		OSS.PlayerInterface.AuthWithOnlineService();
	}
}


private function OnOnlineServiceAuthComplete()
{
	class'GameEngine'.static.GetOnlineSubsystem().PlayerInterface.ClearOnlineServiceAuthCompleteDelegate( OnOnlineServiceAuthComplete );
	OnlineServiceAuthComplete();
}

// The rest is handled in native
private native function OnlineServiceAuthComplete();

cpptext
{
	virtual void Initialize();

	virtual UBOOL IsTickable() const
	{
		// We cannot tick objects that are unreachable or are in the process of being loaded in the background.
		return !HasAnyFlags( RF_Unreachable | RF_AsyncLoading );
	}

	virtual UBOOL IsTickableWhenPaused() const
	{
		return TRUE;
	}

	virtual void Tick( FLOAT DeltaSeconds );

	virtual void Shutdown();
	
	UBOOL WasLaunchedByPlayfab() { return bLaunchedByPlayfab; }

	virtual void SetLobbyId( const FString& InLobbyId ) { CachedLobbyId = InLobbyId; }

	// Notification from OSS after entitlements have been read
	virtual void OnEntitlementsRead();

	// Called on the event inventory is updated
	virtual void InventoryUpdated( TArray<FCurrentInventoryEntry>& NewInvList );

	// Adds durable entitlements to inventory list
	virtual void AddDurableEntitlementsToInventory( TArray<FCurrentInventoryEntry>& InvList );
}


defaultproperties
{
	CurrRegionName="USCentral"
	// Auth refreshed every hour
	SecondsForAuthRefreshTime=3600
	// 60 seconds for every heartbeat
	HeartbeatInterval=60.0
	PlayfabNPServiceLabel=1
}