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
function AddOnLoginCompleteDelegate( delegate<OnLoginComplete> InDelegate) { if (LoginCompleteDelegates.Find(InDelegate) == INDEX_NONE){LoginCompleteDelegates[LoginCompleteDelegates.Length] = InDelegate;}; }
function ClearOnLoginCompleteDelegate( delegate<OnLoginComplete> InDelegate) { local int RemoveIndex;RemoveIndex = LoginCompleteDelegates.Find(InDelegate);if (RemoveIndex != INDEX_NONE){LoginCompleteDelegates.Remove(RemoveIndex,1);}; }

// Logout of playfab services when we get disconnected
native function bool Logout();

// Read store data
native function ReadStoreData();
delegate OnStoreDataRead(bool bWasSuccessful);
function AddStoreDataReadCompleteDelegate( delegate<OnStoreDataRead> InDelegate) { if (StoreDataReadDelegates.Find(InDelegate) == INDEX_NONE){StoreDataReadDelegates[StoreDataReadDelegates.Length] = InDelegate;}; }
function ClearStoreDataReadCompleteDelegate( delegate<OnStoreDataRead> InDelegate) { local int RemoveIndex;RemoveIndex = StoreDataReadDelegates.Find(InDelegate);if (RemoveIndex != INDEX_NONE){StoreDataReadDelegates.Remove(RemoveIndex,1);}; }

// Read inventory for local user
native function ReadInventory();
delegate OnInventoryRead(bool bWasSuccessful);
function AddInventoryReadCompleteDelegate( delegate<OnInventoryRead> InDelegate) { if (InventoryReadDelegates.Find(InDelegate) == INDEX_NONE){InventoryReadDelegates[InventoryReadDelegates.Length] = InDelegate;}; }
function ClearInventoryReadCompleteDelegate( delegate<OnInventoryRead> InDelegate) { local int RemoveIndex;RemoveIndex = InventoryReadDelegates.Find(InDelegate);if (RemoveIndex != INDEX_NONE){InventoryReadDelegates.Remove(RemoveIndex,1);}; }

// Unlocks a container for the user
native function UnlockContainer(string ContainerId);

// Consumes entitlements
native function ConsumeEntitlements();

// Find online games. Results will show up in the search settings supplied if successful
native function bool FindOnlineGames( OnlineGameSearch SearchSettings );
delegate OnFindOnlineGamesComplete(bool bWasSuccessful);
function AddFindOnlineGamesCompleteDelegate(delegate<OnFindOnlineGamesComplete> InDelegate) { if (FindOnlineGamesCompleteDelegates.Find(InDelegate) == INDEX_NONE){FindOnlineGamesCompleteDelegates[FindOnlineGamesCompleteDelegates.Length] = InDelegate;}; }
function ClearFindOnlineGamesCompleteDelegate(delegate<OnFindOnlineGamesComplete> InDelegate) { local int RemoveIndex;RemoveIndex = FindOnlineGamesCompleteDelegates.Find(InDelegate);if (RemoveIndex != INDEX_NONE){FindOnlineGamesCompleteDelegates.Remove(RemoveIndex,1);}; }
// Cancel the current game search
native function CancelGameSearch();

// Query info for a particular server
native function QueryServerInfo( const string LobbyId );
delegate OnQueryServerInfoComplete(bool bWasSuccessful, string LobbyId, string ServerIp, int ServerPort, string AuthTicket);
function AddQueryServerInfoCompleteDelegate( delegate<OnQueryServerInfoComplete> InDelegate) { if (OnQueryServerInfoCompleteDelegates.Find(InDelegate) == INDEX_NONE){OnQueryServerInfoCompleteDelegates[OnQueryServerInfoCompleteDelegates.Length] = InDelegate;}; }
function ClearQueryServerInfoCompleteDelegate( delegate<OnQueryServerInfoComplete> InDelegate) { local int RemoveIndex;RemoveIndex = OnQueryServerInfoCompleteDelegates.Find(InDelegate);if (RemoveIndex != INDEX_NONE){OnQueryServerInfoCompleteDelegates.Remove(RemoveIndex,1);}; }

// Query available regions
delegate OnRegionQueryComplete( bool bWasSuccessful, array<string> OutRegionNames );
native function QueryAvailableRegions();
function AddRegionQueryCompleteDelegate( delegate<OnRegionQueryComplete> InDelegate) { if (RegionQueryCompleteDelegates.Find(InDelegate) == INDEX_NONE){RegionQueryCompleteDelegates[RegionQueryCompleteDelegates.Length] = InDelegate;}; }
function ClearRegionQueryCompleteDelegate( delegate<OnRegionQueryComplete> InDelegate) { local int RemoveIndex;RemoveIndex = RegionQueryCompleteDelegates.Find(InDelegate);if (RemoveIndex != INDEX_NONE){RegionQueryCompleteDelegates.Remove(RemoveIndex,1);}; }

// Starts a new server instance
native function StartNewServerInstance( string GameMode, optional string ServerCommandline );
delegate OnServerStarted( bool bWasSuccessful, string ServerLobbyId, string ServerIp, int ServerPort, string ServerTicket );
function AddOnServerStartedDelegate( delegate<OnServerStarted> InDelegate) { if (ServerStartedDelegates.Find(InDelegate) == INDEX_NONE){ServerStartedDelegates[ServerStartedDelegates.Length] = InDelegate;}; }
function ClearOnServerStartedDelegate( delegate<OnServerStarted> InDelegate) { local int RemoveIndex;RemoveIndex = ServerStartedDelegates.Find(InDelegate);if (RemoveIndex != INDEX_NONE){ServerStartedDelegates.Remove(RemoveIndex,1);}; }

// Executes a cloud script function
native function ExecuteCloudScript( string FunctionName, JsonObject FunctionParms );
delegate OnCloudScriptExecutionComplete( bool bWasSuccessful, string FunctionName, JsonObject FunctionResult );
function AddOnCloudScriptExecutionCompleteDelegate( delegate<OnCloudScriptExecutionComplete> InDelegate ) { if (CloudScriptExecutionCompleteDelegates.Find(InDelegate) == INDEX_NONE){CloudScriptExecutionCompleteDelegates[CloudScriptExecutionCompleteDelegates.Length] = InDelegate;}; }
function ClearOnCloudScriptExecutionCompleteDelegate( delegate<OnCloudScriptExecutionComplete> InDelegate ) { local int RemoveIndex;RemoveIndex = CloudScriptExecutionCompleteDelegates.Find(InDelegate);if (RemoveIndex != INDEX_NONE){CloudScriptExecutionCompleteDelegates.Remove(RemoveIndex,1);}; }


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

	WarnInternal("Failed to find index for current region"@CurrRegionName);
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
		WarnInternal("Failed to set region index"@InRegionIndex);
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
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   SecondsForAuthRefreshTime=3600
   CurrRegionName="USCentral"
   PlayfabNPServiceLabel=1
   HeartbeatInterval=60.000000
   Name="Default__PlayfabInterface"
   ObjectArchetype=Object'Core.Default__Object'
}
