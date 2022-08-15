//=============================================================================
// KFGFxMenu_StartGame
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 4/23/2014
//=============================================================================

class KFGFxMenu_StartGame extends KFGFxObject_Menu
	dependson(TWOnlineLobby)
	config(UI)
	native(UI);

var bool bIsLeader;
var bool bIsInParty;
var bool bSearchingForGame;
var bool bLeaderInServerBrowser, bLeaderWasInServerBrowser;

var transient bool AttemptingJoin;
var transient int CurrentSearchIndex;

var const string ModeKey, DifficultyKey, MapKey, WhitelistedKey, InProgressKey, PermissionsKey, ServerTypeKey;
var const string GameLengthKey;

var KFGFxStartGameContainer_FindGame FindGameContainer;
var KFGFxStartGameContainer_Options OptionsComponent;
var KFGFxStartContainer_InGameOverview OverviewContainer;
var KFGFxStartContainer_ServerBrowserOverview ServerBrowserOverviewContainer;

var bool bHarrassedPlayerAboutSharedContent;

var localized string FindGameString;
var localized string HostOptionsString;
var localized string OverviewString;

var localized string MatchmakingString;
var localized string ServerBrowserString;

var localized string GameModeTitle;
var localized string DifficultyTitle;
var localized string LengthTitle;
var localized string MapTitle;
var localized string MutatorTitle;
var localized string PermissionsTitle;
var localized string ServerTypeString;
var localized string WhiteListedTitle;
var localized string InfoTitle;
var localized string InProgressString;

var localized string LeaveMenuString;

var localized string CouldNotFindGameTitleString;
var localized string CouldNotFindGameDescriptionString;

//Match Making
var localized array<string> WhiteListedStrings;

/** Name of the search datastore, for finding a server to take over. */
var	protected	transient	const	name	SearchDSName;
/** Reference to the search datastore, for finding a server to take over. */
var transient KFDataStore_OnlineGameSearch	SearchDataStore;
/** Cached game interface pointer, for finding a server to take over. */
var transient OnlineGameInterface			GameInterface;

var array<string> MapStringList;

var config bool AttemptServerTakeovers;
var transient string MapTakeoverURL;
var transient string PendingResolvedAddress;

var string CurrentPartyLeaderName;

var transient bool bPauseTryingServers;

/** How long to collect servers before sorting them and starting to try to connect */
var config float InitialSearchPause;

/** How many results to quit after (passed to OnlineSubsystem) */
var config int MaxResultsToTry;

/** How long to wait for a server to respond to "open" before giving up on it. */
var config int ServerConnectTimeout;

/** Whether to log information about searching for games */
var config bool bLogSearchInfo;

var transient bool SearchFinished;

native function GetMapList( out array<string> MapList );

function InitializeMenu( KFGFxMoviePlayer_Manager InManager )
{
	local DataStoreClient DSClient;

	super.InitializeMenu(InManager);
	GetMapList(MapStringList);

	// Initializations so we can search for a dedicated server to take over
	DSClient = class'UIInteraction'.static.GetDataStoreClient();
	if ( DSClient != None )
	{
		SearchDataStore = KFDataStore_OnlineGameSearch(DSClient.FindDataStore(SearchDSName));
	}
	GameInterface = class'GameEngine'.static.GetOnlineSubsystem().GameInterface;
}

/** Ties the GFxClikWidget variables to the .swf components and handles events */
event bool WidgetInitialized(name WidgetName, name WidgetPath, GFxObject Widget)
{	
	switch(WidgetName)
	{
        case ('findGameContainer'):
			if ( FindGameContainer == none )
			{
			    FindGameContainer = KFGFxStartGameContainer_FindGame( Widget );
			    FindGameContainer.Initialize( self );
		    }
        break;
        case ('gameOptionsContainer'):
			if ( OptionsComponent == none )
			{
			    OptionsComponent = KFGFxStartGameContainer_Options( Widget );
			    OptionsComponent.Initialize( self );
		    }
        break;
        case ('overviewContainer'):
			if ( OverviewContainer == none )
			{
			    OverviewContainer = KFGFxStartContainer_InGameOverview( Widget );	
			    OverviewContainer.Initialize( self );
			    SetOverview(true);
		    }
        break;
        case ('serverBrowserOverviewContainer'):
			if ( ServerBrowserOverviewContainer == none )
			{
			    ServerBrowserOverviewContainer = KFGFxStartContainer_ServerBrowserOverview( Widget );	
			    ServerBrowserOverviewContainer.Initialize( self );
		    }
        break;
	}

	return true;
}

function SetOverview(optional bool bInitialize)
{
	local UniqueNetId AdminId, MyUID;
	local bool bCurrentlyLeader;
	local bool bCurrentlyInParty;

	if (OverviewContainer != none)
	{
    	OverviewContainer.UpdateOverviewInGame();
	}

	MyUID = GetPC().PlayerReplicationInfo.UniqueId;
	OnlineLobby.GetLobbyAdmin(OnlineLobby.GetCurrentLobbyId(), AdminId);
	
	bCurrentlyLeader = (MyUID == AdminId);
	bCurrentlyInParty = OnlineLobby.IsInLobby();
		
    // Update what our start game looks like if any important options have changed
	if ( bIsLeader != bCurrentlyLeader || bCurrentlyInParty != bIsInParty || bInitialize || bLeaderInServerBrowser != bLeaderWasInServerBrowser )
	{
		bIsLeader = bCurrentlyLeader;
		bIsInParty = bCurrentlyInParty;
		bLeaderWasInServerBrowser = bLeaderInServerBrowser;
		if (class'WorldInfo'.static.IsMenuLevel())
		{
			if (bIsInParty && !bIsLeader)
			{
				if(bLeaderInServerBrowser)
				{
					ShowOverview(!bIsLeader, bIsLeader, true, true);
				}
				else
				{
					ShowOverview(!bIsLeader, bIsLeader, true, false);
				}
			}
		}
		else
		{
			ShowOverview(true, bIsLeader, false, false);
		}
	}
}

//Send the player back to the start menu and open the shared content object if there is content to share and we are not in standalone
function OnPlayerReadiedUp()
{
	if(bHarrassedPlayerAboutSharedContent)
	{
		return;
	}

	if(OverviewContainer != none && OverviewContainer.bContentShared && GetPC().WorldInfo.NetMode != NM_Standalone )
	{
		if(Manager.CurrentMenuIndex != UI_Start)
		{
			Manager.OpenMenu(UI_Start);
		}
		OverviewContainer.ActionScriptVoid("showSharedContentList");
	}
	bHarrassedPlayerAboutSharedContent = true;
}

function OneSecondLoop()
{	
	SetOverview();
	UpdateMenu();

	if(OverviewContainer != none && Manager.CurrentMenu == self)
	{	
		OverviewContainer.UpdateSharedContent();
	}
	
}

//==============================================================
// Get Functions
//==============================================================

function byte GetStartMenuState()
{
	return GetInt("menuState");
}

//get the map's image path from the dataProvider and set it in flash. 
function string GetMapSource(string MapName)
{
	local KFMapSummary MapData;

	MapData = class'KFUIDataStore_GameResource'.static.GetMapSummaryFromMapName(MapName);
	if ( MapData != none )
	{
		return "img://" $MapData.ScreenshotPathName;
    }
    else
    {    	
    	// Failed to find map image, use the default instead
    	MapData = class'KFUIDataStore_GameResource'.static.GetMapSummaryFromMapName("KF-Default");
    	if ( MapData != none )
		{
			return "img://" $MapData.ScreenshotPathName;			
    	}
    }
}

function string GetFriendlyMapName(string MapName)
{
	local KFMapSummary MapData;

	MapData = class'KFUIDataStore_GameResource'.static.GetMapSummaryFromMapName(MapName);

	if ( MapData != none && MapData.DisplayName != "")
	{
		return MapData.DisplayName;
	}
	else
	{
     	return MapName;
	}
}

//==============================================================
// Component Functions
//==============================================================
//When the leader of the lobby is either changed or assigned. 
function HandleSteamLobbyLeaderTakeOver(UniqueNetId AdminId)
{
	local bool bClientIsLeader;

	bClientIsLeader = GetPC().PlayerReplicationInfo.UniqueId == AdminId;		
	switch (GetStartMenuState())
	{
		case EOverview:
			if(bClientIsLeader)
			{
				OpenMultiplayerMenu();
				return;
			}
	
		case EServerBrowserOverview:
			if(bClientIsLeader)
			{
				Manager.OpenMenu(UI_ServerBrowserMenu);
				return;
			}
	}

	if(!bClientIsLeader)
	{
		SendToOverviewOnChange();
	}
}

function SendToOverviewOnChange()
{
	Manager.SetStartMenuState(EOverview);
	Manager.OpenMenu(UI_Start);
	SetOverview(true);	
}

// Make sure our menu information is up to date
function UpdateMenu()
{
	local UniqueNetId AdminId;
	local UniqueNetId LoggedInPlayer;

	if ( class'WorldInfo'.static.IsMenuLevel() && OnlineLobby.IsInLobby() )
	{
		OnlineLobby.GetLobbyAdmin( OnlineLobby.GetCurrentLobbyId(), AdminId );
		OnlineLobby.outer.GetUniquePlayerId(0, LoggedInPlayer);
	    if ( LoggedInPlayer == AdminId )
	    {
	    	// We are the party leader	    	
	    	SendLeaderOptions();
		}
		else
		{
			// We are a party member			
			ReceiveLeaderOptions();
			CurrentPartyLeaderName = OnlineLobby.GetFriendNickname(AdminId);
			if(CurrentPartyLeaderName != "")
		    {
		    	ServerBrowserOverviewContainer.SetDescriptionString(CurrentPartyLeaderName);
		    }
		}
		
	}
}

// As the leader of the party, make sure the members have the latest information
function SendLeaderOptions()
{
	if (OptionsComponent != none)
	{
		SetLobbyData(GameLengthKey, String(OptionsComponent.SavedLengthIndex));
		SetLobbyData(DifficultyKey, String(OptionsComponent.SavedDifficultyIndex));
		SetLobbyData(MapKey, OptionsComponent.SavedMapString);
		SetLobbyData(ServerTypeKey, String(OptionsComponent.SavedServerTypeIndex));
		SetLobbyData(ModeKey, String(OptionsComponent.SavedModeIndex));
		SetLobbyData(PermissionsKey, String(OptionsComponent.SavedPrivacyIndex));
	}
}

// As a member of party, check to see if your options are different than the party leaders
function ReceiveLeaderOptions()
{
	local string OptionString;
	local string DisplayMapName, MapSource;
	local int OptionIndex;

	OptionIndex = Int(OnlineLobby.GetLobbyData(0, ModeKey));
	OverviewContainer.UpdateGameMode(class'KFCommon_LocalizedStrings'.static.GetGameModeString(OptionIndex));
		
	OptionIndex = Int(OnlineLobby.GetLobbyData(0, GameLengthKey));
	OverviewContainer.UpdateLength(class'KFCommon_LocalizedStrings'.static.GetLengthString(OptionIndex));

	OptionIndex = Int(OnlineLobby.GetLobbyData(0, ServerTypeKey));
	OverviewContainer.UpdateServerType(class'KFCommon_LocalizedStrings'.static.GetServerTypeString(OptionIndex));

	OptionIndex = Int(OnlineLobby.GetLobbyData(0, DifficultyKey));
	OverviewContainer.UpdateDifficulty(class'KFCommon_LocalizedStrings'.static.GetDifficultyString(OptionIndex));

	OptionString = OnlineLobby.GetLobbyData(0, MapKey);
	DisplayMapName = GetFriendlyMapName(OptionString);
	MapSource = GetMapSource(OptionString);
	OverviewContainer.UpdateMap( DisplayMapName, MapSource );

	OptionIndex = Int(OnlineLobby.GetLobbyData(0, PermissionsKey));
	OverviewContainer.UpdatePrivacy(class'KFCommon_LocalizedStrings'.static.GetPermissionString(OptionIndex));
}

function ApproveMatchMakingLeave()
{
	if(OptionsComponent != none)
	{
		if(OnlineLobby.IsInLobby())
		{
			OnlineLobby.QuitLobby();
		}

		CancelGameSearch();
		OptionsComponent.SetBool("approveMatchMakingLeave", true);
		UpdateStartMenuState();
		
	}
}

function GoToServerBrowser()
{
	Manager.OpenMenu(UI_ServerBrowserMenu);
}

function CancelLeaveMenu()
{
	//Do nothing for now
}

function OpenMultiplayerMenu()
{
	ActionScriptVoid("openMultiplayerMenu");
}

function UpdateStartMenuState()
{
	if( Manager != none )
	{
		Manager.SetStartMenuState(EStartMenuState(GetStartMenuState()));
	}
}

//==============================================================
// ActionScript Callbacks
//==============================================================

//Request to close the match making menu
function Callback_CancelSearch()
{
	if( OptionsComponent != none )
	{
		CancelGameSearch();
	}
}

//Request to close the match making menu
function Callback_RequestLeaveMatchmaking()
{
	if( OptionsComponent != none )
	{
		if(OnlineLobby.IsInLobby())
		{
			Manager.OpenPopup(EConfirmation, Class'KFCommon_LocalizedStrings'.default.LeaveCurrentMenuString, LeaveMenuString,
			 Manager.BrowseServersString, Class'KFCommon_LocalizedStrings'.default.CancelString, GoToServerBrowser, CancelLeaveMenu,
			 Class'KFCommon_LocalizedStrings'.default.DisbandPartyString, ApproveMatchMakingLeave ); //middle button
		}
		else
		{
			 ApproveMatchMakingLeave();
		}		
	}
}

//Callback
function Callback_InGamePermissionChange( int Index )
{	
	if( OnlineLobby != none )
	{
		if( OnlineLobby.SetVisibility( Index )  && OptionsComponent != none )
		{
			OptionsComponent.PrivacyChanged( Index );
		}
	}
}

function Callback_OpenServerBrowser()
{
	Manager.OpenMenu(UI_ServerBrowserMenu);
}

function Callback_StartMenuRequestReinit()
{
	if( OptionsComponent != none )
	{
		OptionsComponent.InitializeGameOptions();
		OptionsComponent.SetOptions();
	}
}

function Callback_StartMenuChange()
{
	UpdateStartMenuState();
}

function Callback_Mode( int Index )
{
	OptionsComponent.ModeChanged( Index );
}

function Callback_Length( int Index )
{
	OptionsComponent.LengthChanged( Index );
}

function Callback_Difficulty( int Index )
{
	OptionsComponent.DifficultyChanged( Index );
}

function Callback_Privacy( int Index )
{
	OptionsComponent.PrivacyChanged( Index );
}

function Callback_MapSelection( byte MapIndex )
{
	local string MapName;

	if (MapIndex < MapStringList.length)
	{
		MapName = MapStringList[MapIndex];
	}
	else
	{
		MapName = "";
	}
	OptionsComponent.MapChanged( MapName );	
}

function Callback_RecieveMap( int Index )
{
	if(Index >= 0 && Index < MapStringList.Length)
	{
		OptionsComponent.UpdateMapSource(MapStringList[Index]);	
	}
	else
	{
		OptionsComponent.UpdateMapSource("Default");	
	}
	
}

function Callback_ServerType( int Index )
{
	OptionsComponent.ServerTypeChanged( Index );
}

function Callback_InProgress( int Index )
{
	OptionsComponent.InProgressChanged( Index );
}

function SetLobbyData( string KeyName, string ValueData )
{
    OnlineLobby.SetLobbyData( KeyName, ValueData );
}

function string MakeMapURL(string MapName, float GameDifficulty, byte GameLength)
{
	return MapName$"?Difficulty="$GameDifficulty $"?GameLength="$GameLength;
}

native function bool GetSearchComplete(KFOnlineGameSearch GameSearch);

native function TryNextServer();
event OpenNotFoundPopup()
{
	local KFPlayerController KFPC;

	KFPC = KFPlayerController(GetPC());
	LogInternal("KFGFxMenu_StartGame.OpenNotFoundPopup: No servers found, giving up.");
	KFPC.MyGFxManager.OpenPopup(ENotification, CouldNotFindGameTitleString, CouldNotFindGameDescriptionString, class'KFCommon_LocalizedStrings'.default.OKString);
}

event int GetLobbySize()
{
	local ActiveLobbyInfo LobbyInfo;

	if ( !OnlineLobby.GetCurrentLobby(LobbyInfo) )
	{
		return 0;
	}
	else
	{
		return LobbyInfo.Members.length;
	}
}

function OnFindGameServerComplete(bool bWasSuccessful)
{
	if (bWasSuccessful && !bPauseTryingServers)
	{
		SortLastEntry(SearchDataStore.GetActiveGameSearch());
	}
	TryNextServer();
}

native function bool SpaceAvailable(const OnlineGameSettings Settings);
native function SortLastEntry(OnlineGameSearch Search);
native function SortServers(OnlineGameSearch Search);

function OnJoinGameComplete(name SessionName, bool bSuccessful)
{
	GameInterface.ClearJoinOnlineGameCompleteDelegate(OnJoinGameComplete);
	if (!bSuccessful)
	{
		AttemptingJoin = false;
		if (bLogSearchInfo) LogInternal("KFGFxMenu_StartGame.OnJoinGameComplete: join online game failed completion for server index"@CurrentSearchIndex-1);
		TryNextServer();
		return;
	}
	if (GameInterface.GetResolvedConnectString(SessionName, PendingResolvedAddress))
	{
		if (bLogSearchInfo) LogInternal("KFGFxMenu_StartGame.OnJoinGameComplete: OnJoinGameComplete called for server index"@CurrentSearchIndex-1);
		KFGameEngine(Class'Engine'.static.GetEngine()).OnHandshakeComplete = OnHandshakeComplete;
		SetServerConnectGiveUpTimer();
		GetPC().ConsoleCommand("open"@PendingResolvedAddress$OnlineLobby.GetLobbyURLString());
	}
	else
	{
		AttemptingJoin = false;
		LogInternal("KFGFxMenu_StartGame.OnJoinGameComplete: unable to resolve server address, bLogSearchInfo");
		TryNextServer();
	}
}

event SetServerConnectGiveUpTimer()
{
	Manager.TimerHelper.SetTimer(ServerConnectTimeout, false, nameof(ServerConnectGiveUp), self);
}

event AddJoinGameCompleteDelegate(OnlineGameSearch LatestGameSearch)
{
	GameInterface.AddJoinOnlineGameCompleteDelegate(OnJoinGameComplete);
	GameInterface.JoinOnlineGame(0, 'Game', LatestGameSearch.Results[CurrentSearchIndex]);
}

function ServerConnectGiveUp()
{
	if (bLogSearchInfo) LogInternal("KFGFxMenu_StartGame.ServerConnectGiveUp: ServerConnectGiveUp");
	KFGameEngine(Class'KFGameEngine'.static.GetEngine()).KillPendingServerConnection();
}

function OnOpen()
{
	if( Manager != none )
	{
		Manager.SetStartMenuState(EStartMenuState(GetStartMenuState()));
	}
}


function bool OnHandshakeComplete(bool bSuccess, string Description, out int SuppressPasswordRetry)
{
	if (bLogSearchInfo) LogInternal("KFGFxMenu_StartGame.OnHandShakeComplete");
	AttemptingJoin = false;
	KFGameEngine(Class'Engine'.static.GetEngine()).OnHandshakeComplete = None;
	Manager.TimerHelper.ClearTimer(nameof(ServerConnectGiveUp), self);
	if (bSuccess)
	{
		if (bLogSearchInfo) LogInternal("KFGFxMenu_StartGame.OnHandShakeComplete: LobbyJoinServer");
		OnlineLobby.LobbyJoinServer(PendingResolvedAddress);
		PendingResolvedAddress = "";
	}
	else
	{
		if (bLogSearchInfo) LogInternal("KFGFxMenu_StartGame.OnHandShakeComplete:  TryNextServer");
		GameInterface.DestroyOnlineGame('Game');
		PendingResolvedAddress = "";
		TryNextServer();
	}
	return true;
}

event OnClose()
{
	if(OverviewContainer != none)
	{
		OverviewContainer.ActionScriptVoid("hideSharedContentList");
	}
	KFGameEngine(Class'Engine'.static.GetEngine()).OnHandshakeComplete = None;
	GameInterface.ClearFindOnlineGamesCompleteDelegate(OnFindGameServerComplete);
	GameInterface.ClearJoinOnlineGameCompleteDelegate(OnJoinGameComplete);
}

function AddLobbyFilter(out array<LobbyFilter> Filters, bool bIsSet, string Key, coerce String Val, bool bNumeric)
{
	local LobbyFilter filter;

	if ( bIsSet )
	{
		filter.Key = Key;
		filter.Value = Val;
		filter.Operator = OGSCT_Equals;
		filter.bNumeric = bNumeric;

		Filters.AddItem(filter);
	}
}

/********************************************************************************/
//								Match Making
/********************************************************************************/

function BuildServerFilters(OnlineGameInterface GameInterfaceSteam, KFGFxStartGameContainer_Options Options, OnlineGameSearch Search)
{
	local string MapName;
	local int	GameDifficulty;
	local int	GameLength;
	local bool  AllowInProgress;
	local string GameTagFilters;
	local int bCustom, bRanked;
	local ActiveLobbyInfo LobbyInfo;

	GameInterfaceSteam.ClearServerFilters(Search);

	GameInterfaceSteam.AddServerFilter(Search, "version_match", string(class'KFGameEngine'.static.GetKFGameVersion()));

	MapName = OptionsComponent.GetMapName();
	if (MapName != "")
	{
		GameInterfaceSteam.AddServerFilter(Search, "map", MapName);
	}

	if (OnlineLobby.GetCurrentLobby(LobbyInfo) && LobbyInfo.Members.length >= 6)
	{
		GameInterfaceSteam.AddServerFilter(Search, "noplayers", "");
	}
	else
	{
		GameInterfaceSteam.AddServerFilter(Search, "notfull", "");
	}
	GameDifficulty = OptionsComponent.GetDifficulty();
	if (GameDifficulty >= 0)
	{
		GameInterfaceSteam.AddGametagFilter(GameTagFilters, 'Difficulty', string(GameDifficulty));
	}

	GameLength = OptionsComponent.GetGameLength();
	if (GameLength >= 0)
	{
		GameInterfaceSteam.AddGametagFilter(GameTagFilters, 'NumWaves', string(GameLength));
	}

	GameInterfaceSteam.TestAddBoolGametagFilter(GameTagFilters, true, 'bRequiresPassword', 0);

	AllowInProgress = OptionsComponent.GetAllowInProgress();
	GameInterfaceSteam.TestAddBoolGametagFilter(GameTagFilters, !AllowInProgress, 'bInProgress', 0);

	OptionsComponent.GetServerTypeBools(bCustom, bRanked);
	GameInterfaceSteam.TestAddBoolGametagFilter(GameTagFilters, true, 'bCustom', bCustom);

	//In EA release, always filter out unranked servers, because mods aren't supported at all
	GameInterfaceSteam.TestAddBoolGametagFilter(GameTagFilters, true, 'bUsesStats', 1);

	if (Len(GameTagFilters) > 0)
	{
		GameInterfaceSteam.AddServerFilter(Search, "gametagsand", GameTagFilters);
	}
	if (Search.MasterServerSearchKeys.length > 1)
	{
		GameInterfaceSteam.AddServerFilter(Search, "and", string(Search.MasterServerSearchKeys.length), 0);
	}
}

function Callback_StartGame()
{
	Callback_StartOfflineGame();
}

function Callback_StartOfflineGame()
{
	local string MapName;
	local float	GameDifficulty;
	local byte	GameLength;

	MapName = OptionsComponent.SavedMapString;
	GameDifficulty = class'KFDifficultyInfo'.static.GetDifficultyValue( OptionsComponent.SavedDifficultyIndex );
	GameLength = OptionsComponent.SavedLengthIndex;

	ConsoleCommand("open" @ MakeMapURL(MapName, GameDifficulty, GameLength));
}

function Callback_StartOnlineGame()
{
	GameInterface.SetMatchmakingTypeMode(SMT_Internet);

	CurrentSearchIndex = 0;

	OptionsComponent.UpdateFilters();
	BuildServerFilters(GameInterface, OptionsComponent, SearchDataStore.GetCurrentGameSearch());
	SearchDataStore.GetCurrentGameSearch().MaxSearchResults = MaxResultsToTry;

	// Add a delegate for when the search completes.  We will use this callback to do any post searching work.
	GameInterface.AddFindOnlineGamesCompleteDelegate(OnFindGameServerComplete);

	// Start a search
	if ( !SearchDataStore.SubmitGameSearch(class'UIInteraction'.static.GetPlayerControllerId(0), false) )
	{
		GameInterface.ClearFindOnlineGamesCompleteDelegate(OnFindGameServerComplete);
	}
	else
	{
		bPauseTryingServers = true;
		Manager.TimerHelper.SetTimer(InitialSearchPause, false, nameof(UnpauseTryingServers), self);
		bSearchingForGame = true;

		OptionsComponent.SetSearching(bSearchingForGame);
	}
}

function UnpauseTryingServers()
{
	bPauseTryingServers = false;
	SortServers(SearchDataStore.GetActiveGameSearch());
	TryNextServer();
}

event CancelGameSearch()
{
	local KFOnlineGameSearch ActiveGameSearch;

	ActiveGameSearch = KFOnlineGameSearch(SearchDataStore.GetActiveGameSearch());

	if(ActiveGameSearch != none)
	{
		GameInterface.AddCancelFindOnlineGamesCompleteDelegate(OnCancelSearchComplete);
		GameInterface.CancelFindOnlineGames();
	}
	else
	{
		OnCancelSearchComplete(false);
	}
}

function OnCancelSearchComplete(bool bWasSuccessful)
{
	bSearchingForGame = false;
	OptionsComponent.SetSearching(bSearchingForGame);
	Manager.SetSearchingForMatch(bSearchingForGame);	
}

/********************************************************************************/
//							  End Match Making
/********************************************************************************/

function ShowOverview( bool bShowOverview, bool bLeader, bool bInMainMenu, bool bhostInServerBrowser)
{	
	ActionScriptVoid("showOverview");
}

defaultproperties
{
   ModeKey="ModeKey"
   DifficultyKey="DifficultyKey"
   MapKey="MapKey"
   WhitelistedKey="WhitelistedKey"
   InProgressKey="InProgress"
   PermissionsKey="PermissionsKey"
   ServerTypeKey="ServerTypeKey"
   GameLengthKey="GameLengthKey"
   FindGameString="HOME"
   MatchmakingString="ONLINE MATCHMAKING"
   ServerBrowserString="Browse Servers"
   GameModeTitle="GAME MODE"
   DifficultyTitle="DIFFICULTY"
   LengthTitle="LENGTH"
   MapTitle="STARTING MAP"
   MutatorTitle="MUTATORS"
   PermissionsTitle="PERMISSIONS"
   ServerTypeString="SERVER TYPE"
   WhiteListedTitle="STATS ENABLED"
   InfoTitle="INFORMATION"
   InProgressString="IN PROGRESS"
   LeaveMenuString="Leaving matchmaking will disband your party.  Go to server browser instead?"
   CouldNotFindGameTitleString="Unable To Find Match"
   CouldNotFindGameDescriptionString="No servers matching the search settings were found. Try different filters or use the server browser."
   WhiteListedStrings(0)="YES"
   WhiteListedStrings(1)="NO"
   InitialSearchPause=2.000000
   MaxResultsToTry=20000
   ServerConnectTimeout=2
   SubWidgetBindings(0)=(WidgetName="FindGameContainer",WidgetClass=Class'KFGame.KFGFxStartGameContainer_FindGame')
   SubWidgetBindings(1)=(WidgetName="gameOptionsContainer",WidgetClass=Class'KFGame.KFGFxStartGameContainer_Options')
   SubWidgetBindings(2)=(WidgetName="OverviewContainer",WidgetClass=Class'KFGame.KFGFxStartContainer_InGameOverview')
   SubWidgetBindings(3)=(WidgetName="ServerBrowserOverviewContainer",WidgetClass=Class'KFGame.KFGFxStartContainer_ServerBrowserOverview')
   Name="Default__KFGFxMenu_StartGame"
   ObjectArchetype=KFGFxObject_Menu'KFGame.Default__KFGFxObject_Menu'
}
