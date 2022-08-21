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
	native
	inherits(FTickableObject);




/** The current pending game search */
var OnlineGameSearch PendingGameSearch;

/** The playfab ID with successful login */
var const string CachedPlayfabId;
/** The session ticket with successful login */
var const string CachedSessionTicket;

/** The name used for login, we cache this in case we need to use it again */
var private const string PendingLoginName;

/** The list of available region names */
var const array<string> RegionNames;

/** The current region index for the player */
var string CurrRegionName;

// SERVER ONLY
/////////////////////////////////////////////////////////////////
/** TRUE if this server was spun up by playfab services */
var const private{private} bool bPlayfabServer;

/** The lobby ID of the server */
var const private{private} string CachedLobbyId;
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

// Client API calls
/////////////////////////////////////////////////////////////////////////

// Login to playfab service. Will create account if login fails
native function bool Login( string UserName );
delegate OnLoginComplete(bool bWasSuccessful, string SessionTicket, string PlayfabId);
function AddOnLoginCompleteDelegate( delegate<OnLoginComplete> InDelegate) { if (LoginCompleteDelegates.Find(InDelegate) == INDEX_NONE){LoginCompleteDelegates[LoginCompleteDelegates.Length] = InDelegate;}; }
function ClearOnLoginCompleteDelegate( delegate<OnLoginComplete> InDelegate) { local int RemoveIndex;RemoveIndex = LoginCompleteDelegates.Find(InDelegate);if (RemoveIndex != INDEX_NONE){LoginCompleteDelegates.Remove(RemoveIndex,1);}; }

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


// Server API calls
/////////////////////////////////////////////////////////////////////////
native function ServerValidatePlayer( const string ClientAuthTicket );
native function ServerNotifyPlayerLeft( const string PlayfabId );


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
   CurrRegionName="USCentral"
   Name="Default__PlayfabInterface"
   ObjectArchetype=Object'Core.Default__Object'
}
