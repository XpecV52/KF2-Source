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
function AddOnLoginCompleteDelegate( delegate<OnLoginComplete> InDelegate) { `FillAddDel(LoginCompleteDelegates); }
function ClearOnLoginCompleteDelegate( delegate<OnLoginComplete> InDelegate) { `FillClearDel(LoginCompleteDelegates); }

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


// Server API calls
/////////////////////////////////////////////////////////////////////////
native function ServerValidatePlayer( const string ClientAuthTicket );
native function ServerNotifyPlayerLeft( const string PlayfabId );


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
	
	UBOOL IsPlayfabServer() { return bPlayfabServer; }
}


defaultproperties
{
	CurrRegionName="USCentral"
}