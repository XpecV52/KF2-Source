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
var transient bool bAttemptingServerCreate;
var transient int CurrentSearchIndex;

var const string ModeKey, DifficultyKey, MapKey, WhitelistedKey, InProgressKey, PermissionsKey, ServerTypeKey;
var const string GameLengthKey;

var KFGFxStartGameContainer_FindGame FindGameContainer;
var KFGFxStartGameContainer_Options OptionsComponent;
var KFGFxStartContainer_InGameOverview OverviewContainer;
var KFGFxStartContainer_ServerBrowserOverview ServerBrowserOverviewContainer;
//@HSL_BEGIN - JRO - 4/28/2016 - Disable certain features for PlayGo
var GFxObject MatchMakingButton;
var GFxObject ServerBrowserButton;
//@HSL_END

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

//Do not use these directly! Use the GetCouldNotFindGameDescription() function
//to pick between them based on platform
var private localized string CouldNotFindGameDescriptionStringPC;
var private localized string CouldNotFindGameDescriptionStringOrbis;

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
var config int ServerTakeoverTimeout;

/** Whether to log information about searching for games */
var config bool bLogSearchInfo;

var config array<string> StockMaps;

var transient bool SearchFinished;

/** When taking over a server, holds the password set or auto-generated for
    the server being taken over, for privacy */
var transient string LobbyOwnerPassword;
var config string TestLobbyOwnerPassword;

/** Keeps the current map of the server you are trying to connect to, which might be useful
    if you're doing a server takeover but have the map "filter" set to "Any" */
var transient string CurrentConnectMap;

native function GetMapList( out array<string> MapList );

function InitializeMenu( KFGFxMoviePlayer_Manager InManager )
{
	local DataStoreClient DSClient;
	local PlayerController PC;

	PC = GetPC();

	super.InitializeMenu(InManager);
	GetMapList(MapStringList);

	// Initializations so we can search for a dedicated server to take over
	DSClient = class'UIInteraction'.static.GetDataStoreClient();
	if ( DSClient != None )
	{
		SearchDataStore = KFDataStore_OnlineGameSearch(DSClient.FindDataStore(SearchDSName));
	}
	if(class'GameEngine'.static.GetOnlineSubsystem() != none)
	{
		GameInterface = class'GameEngine'.static.GetOnlineSubsystem().GameInterface;
		
		//@HSL_BEGIN - JRO - 4/28/2016 - Show a message when we're still installing
		if(PC.WorldInfo.IsConsoleBuild(CONSOLE_Orbis) && !class'GameEngine'.static.GetOnlineSubsystem().ContentInterface.IsGameFullyInstalled())
		{
			Manager.OpenPopup(ENotification, Localize("Notifications", "PlayGoBusyTitle", "KFGameConsole"),  Localize("Notifications", "PlayGoBusyMessage", "KFGameConsole"), class'KFCommon_LocalizedStrings'.default.OKString);
		}
		//@HSL_END
	}
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
		//@HSL_BEGIN - JRO - 4/28/2016 - Disable certain features for PlayGo
		case ('matchMakingButton'):
			MatchMakingButton = Widget;
			if(class'WorldInfo'.static.IsConsoleBuild(CONSOLE_Orbis) && ServerBrowserButton != None)
			{
				CheckGameFullyInstalled();
			}
		break;
		case ('serverBrowserButton'):
			ServerBrowserButton = Widget;
			if(class'WorldInfo'.static.IsConsoleBuild(CONSOLE_Orbis) && MatchMakingButton != None)
			{
				CheckGameFullyInstalled();
			}
		break;
		//@HSL_END
	}

	return true;
}

function string GetCouldNotFindGameDescription()
{
	if (class'WorldInfo'.static.IsConsoleBuild(CONSOLE_Orbis))
	{
		return CouldNotFindGameDescriptionStringOrbis;
	}
	else
	{
		return CouldNotFindGameDescriptionStringPC;
	}
}


//@HSL_BEGIN - JRO - 4/28/2016 - Disable certain features for PlayGo
function CheckGameFullyInstalled()
{
	if(class'GameEngine'.static.GetOnlineSubsystem().ContentInterface.IsGameFullyInstalled())
	{
		MatchMakingButton.SetBool("enabled", true);
		ServerBrowserButton.SetBool("enabled", true);
		InitializeMenu(Manager);
		ReloadSounds();
	}
	else
	{
		MatchMakingButton.SetBool("enabled", false);
		ServerBrowserButton.SetBool("enabled", false);
		Manager.TimerHelper.SetTimer(1.0f, false, nameof(CheckGameFullyInstalled), self);
	}
}

native function ReloadSounds();
//@HSL_END

function SetOverview(optional bool bInitialize)
{
	local UniqueNetId AdminId, MyUID;
	local bool bCurrentlyLeader;
	local bool bCurrentlyInParty;

	if (OverviewContainer != none)
	{
    	OverviewContainer.UpdateOverviewInGame();
	}
	
	if(OnlineLobby != none)
	{
		MyUID = OnlineLobby.GetMyId();
		OnlineLobby.GetLobbyAdmin(OnlineLobby.GetCurrentLobbyId(), AdminId);
		
		bCurrentlyLeader = (MyUID == AdminId);
		bCurrentlyInParty = OnlineLobby.IsInLobby();
	}
		
    // Update what our start game looks like if any important options have changed
	if ( bIsLeader != bCurrentlyLeader || bCurrentlyInParty != bIsInParty || bInitialize || bLeaderInServerBrowser != bLeaderWasInServerBrowser )
	{
		bIsLeader = bCurrentlyLeader;
		bIsInParty = bCurrentlyInParty;
		bLeaderWasInServerBrowser = bLeaderInServerBrowser;
		if (class'WorldInfo'.static.IsMenuLevel())
		{
			if (bIsInParty)
			{
				if(bIsLeader)
				{
					if(Manager.CurrentMenuIndex == UI_ServerBrowserMenu)
					{
						ShowOverview(false, bIsLeader, class'WorldInfo'.static.IsMenuLevel(), false);
						Manager.OpenMenu(UI_ServerBrowserMenu);
					}
					else
					{
						ShowOverview(false, bIsLeader, class'WorldInfo'.static.IsMenuLevel(), false);
						OpenMultiplayerMenu();
					}
				}
				else
				{
					ShowOverview(!bIsLeader, bIsLeader, class'WorldInfo'.static.IsMenuLevel(), bLeaderInServerBrowser);
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
	local PlayerController PC;

	PC = GetPC();
	if(bHarrassedPlayerAboutSharedContent)
	{
		return;
	}

	if(OverviewContainer != none && OverviewContainer.bContentShared && PC.WorldInfo.NetMode != NM_Standalone )
	{
		if(Manager.CurrentMenuIndex != UI_Start)
		{
			Manager.OpenMenu(UI_Start);
		}

		// Consoles don't show this screen.  HSL_BB
		if ( !PC.WorldInfo.IsConsoleBuild() )
		{
			OverviewContainer.ActionScriptVoid("showSharedContentList");
		}
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

	if ( class'WorldInfo'.static.IsMenuLevel() && OnlineLobby != none && OnlineLobby.IsInLobby() )
	{
		OnlineLobby.GetLobbyAdmin( OnlineLobby.GetCurrentLobbyId(), AdminId );
		LoggedInPlayer = OnlineLobby.GetMyId();
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
		SetLobbyData(GameLengthKey, String(OptionsComponent.GetLengthIndex()));
		SetLobbyData(DifficultyKey, String(OptionsComponent.GetDifficultyIndex()));
		SetLobbyData(MapKey, OptionsComponent.GetMapName());
		SetLobbyData(ServerTypeKey, String(OptionsComponent.GetServerTypeIndex()));
		SetLobbyData(ModeKey, String(OptionsComponent.GetModeIndex()));
		SetLobbyData(PermissionsKey, String(OptionsComponent.GetPrivacyIndex()));
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
	DisplayMapName = class'KFCommon_LocalizedStrings'.static.GetFriendlyMapName(OptionString);
	MapSource = GetMapSource(OptionString);
	OverviewContainer.UpdateMap( DisplayMapName, MapSource );

	OptionIndex = Int(OnlineLobby.GetLobbyData(0, PermissionsKey));
	OverviewContainer.UpdatePrivacy(class'KFCommon_LocalizedStrings'.static.GetPermissionString(OptionIndex));
}

function ApproveMatchMakingLeave()
{
	if(OptionsComponent != none)
	{
		if( OnlineLobby != none && OnlineLobby.IsInLobby() && !Class'WorldInfo'.Static.IsConsoleBuild()) //@HSL - JRO - Player can be in a PS4 party throughout the game, not just multiplayer menus
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

function Callback_OnWhatsNewClicked(int Index)
{
	local OnlineSubsystem				OnlineSub;
	local int i;

	OnlineSub =  Class'GameEngine'.static.GetOnlineSubsystem();

	if(OnlineSub != none)
	{
		if(Class'WorldInfo'.Static.IsConsoleBuild())
    	{
			// If this is attached to a PSN product ID, we need to look up the signed offer Id
			if( class'KFGFxStartGameContainer_FindGame'.default.PS4WhatsNewItems[Index].PSNProductId != "" )
			{
				for( i = 0; i < OnlineSub.ItemPropertiesList.Length; i++ )
				{
					if( OnlineSub.ItemPropertiesList[i].ProductId == class'KFGFxStartGameContainer_FindGame'.default.PS4WhatsNewItems[Index].PSNProductId )
					{
						if( OnlineSub.ItemPropertiesList[i].SignedOfferId != "" )
						{
							OnlineSub.OpenMarketPlaceSearch( OnlineSub.ItemPropertiesList[i] );
						}
						else
						{
							WarnInternal("No PSN signed offer ID for item with product ID"@class'KFGFxStartGameContainer_FindGame'.default.PS4WhatsNewItems[Index].PSNProductId);
						}
						break;
					}
				}
			}
			else if( class'KFGFxStartGameContainer_FindGame'.default.PS4WhatsNewItems[Index].RedirectURL != "" )
			{
				OnlineSub.OpenURL(class'KFGFxStartGameContainer_FindGame'.default.PS4WhatsNewItems[Index].RedirectURL);
			}
    	}
    	else
    	{
    		OnlineSub.OpenURL(class'KFGFxStartGameContainer_FindGame'.default.WhatsNewItems[Index].RedirectURL);
    	}
		
	}	
}

function Callback_StartTutorial()
{
	ConsoleCommand("open KF-EvacuationPoint?game=KFGameContent.KFGameInfo_Tutorial");
}

function Callback_OnWebLinkClicked(string WebSiteLink)
{
	local OnlineSubsystem				OnlineSub;

	OnlineSub =  Class'GameEngine'.static.GetOnlineSubsystem();

	if(OnlineSub != none)
	{
		OnlineSub.OpenURL(WebSiteLink);
	}
}

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
		if(OnlineLobby.IsInLobby() && !class'WorldInfo'.static.IsConsoleBuild()) //@HSL - JRO - Player can be in a PS4 party throughout the game, not just multiplayer menus
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
function Callback_OptionListOpened(string ListName, int OptionIndex)
{
	local string MessageString;

	if(ListName == "mapList" || GetPC().WorldInfo.IsConsoleBuild(CONSOLE_Orbis) && ListName == "serverTypeList")
	{
		return;
	}

	if(OptionIndex == INDEX_NONE)
	{
		return;
	}

	MessageString = Localize("StartMenuHelperText", ListName$OptionIndex, "KFGame");

	if(OptionsComponent != none)
	{
		OptionsComponent.SetHelpText(MessageString);
	}
}

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


function Callback_OpenMatchMaking()
{
	if(class'WorldInfo'.static.IsConsoleBuild())
	{
		KFPlayerController(GetPC()).StartLogin( ProceedToMatchMaking, true );
	}
	else
	{
		ProceedToMatchMaking();
	}
}


// Call this to allow the player to go to the matchmaking screen on console.
function ProceedToMatchMaking() { ActionScriptVoid("proceedToMatchMaking");}

function Callback_OpenServerBrowser()
{
	if(class'WorldInfo'.static.IsConsoleBuild())
	{
		// BWJ - Disabled for console
	//	CanUseMultiplayerFeatures(OnCanPlayOnlineCheckComplete);
	}
	else
	{
		Manager.OpenMenu(UI_ServerBrowserMenu);
	}
}

function OnCanPlayOnlineCheckComplete(byte LocalUserNum, EFeaturePrivilege Privilege, EFeaturePrivilegeLevel PrivilegeLevel)
{
	// If it's not FP_OnlinePlay, we caught another async check that we don't care about...
	if(Privilege == FP_OnlinePlay)
	{
		Class'GameEngine'.static.GetOnlineSubsystem().PlayerInterface.ClearPrivilegeLevelCheckedDelegate(OnCanPlayOnlineCheckComplete);

		Manager.UnloadCurrentPopup();

		if(PrivilegeLevel == FPL_Enabled)
		{
			Manager.OpenMenu(UI_ServerBrowserMenu);
		}
		else
		{
			Class'GameEngine'.static.GetOnlineSubsystem().PlayerInterfaceEx.UpsellPremiumOnlineService();
		}
	}
}
//@HSL_END

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

	//0 entry is Any now
	if( (MapIndex > 0 || OptionsComponent.bIsSoloGame) && MapIndex <= MapStringList.Length)
	{
		MapName = OptionsComponent.bIsSoloGame ? MapStringList[MapIndex] : MapStringList[MapIndex-1];
	}
	else
	{
		MapName = "";
	}
	OptionsComponent.MapChanged( MapName );	
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

function string MakeMapURL(KFGFxStartGameContainer_Options InOptionsComponent)
{
	local string MapName;
	local int LengthIndex;
	MapName = InOptionsComponent.GetMapName();
	if (MapName == "")
	{
		if (CurrentConnectMap != "")
		{
			MapName = CurrentConnectMap;
		}
		else
		{
			MapName = "kf-bioticslab";
		}
	}
	LengthIndex = InOptionsComponent.GetLengthIndex(1);
	return MapName$"?Game="$class'KFGameInfo'.static.GetGameModeClassFromNum(InOptionsComponent.GetModeIndex())
	       $"?Difficulty="$class'KFGameDifficultyInfo'.static.GetDifficultyValue( InOptionsComponent.GetDifficultyIndex() )
		   $"?GameLength="$LengthIndex;
}

native function bool GetSearchComplete(KFOnlineGameSearch GameSearch);

native function TryNextServer();
native function HandleSearchOver();

event OpenNotFoundPopup()
{
	local KFPlayerController KFPC;

	KFPC = KFPlayerController(GetPC());
	LogInternal("KFGFxMenu_StartGame.OpenNotFoundPopup: No servers found, giving up.");
			KFPC.MyGFxManager.OpenPopup(ENotification, CouldNotFindGameTitleString, GetCouldNotFindGameDescription(), class'KFCommon_LocalizedStrings'.default.OKString);
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
native function bool MapGood(const OnlineGameSettings Settings, optional out string CurrentMap);
native function SortLastEntry(OnlineGameSearch Search);
native function SortServers(OnlineGameSearch Search);

function string BuildTakeoverURL(optional out string Password)
{
	local string TakeoverURL;

	TakeoverURL = MakeMapURL(OptionsComponent);
	if (len(Password) > 0)
	{
		TakeoverURL $= "?gamepassword=" $ Password $ "?password=" $ Password;
	}

	// For console builds, if we're creating a private server, ensure private=1 is part of the takeover.
	TakeoverURL $= "?Private="$OptionsComponent.GetPrivacyIndex();
	if( class'WorldInfo'.static.IsConsoleBuild() && OptionsComponent.GetPrivacyIndex() == 1 )
	{
		TakeoverURL $= "?bJoinViaInvite";
	}

	return TakeoverURL $ OnlineLobby.GetLobbyURLString();
}

function OnJoinGameComplete(name SessionName, bool bSuccessful)
{
	if(GameInterface != none)
	{
		GameInterface.ClearJoinOnlineGameCompleteDelegate(OnJoinGameComplete);
	}
	
	if (!bSuccessful)
	{
		AttemptingJoin = false;
		if (bLogSearchInfo) LogInternal("KFGFxMenu_StartGame.OnJoinGameComplete: join online game failed completion for server index"@CurrentSearchIndex);
		TryNextServer();
		return;
	}
	if (GameInterface.GetResolvedConnectString(SessionName, PendingResolvedAddress))
	{
		if (bLogSearchInfo) LogInternal("KFGFxMenu_StartGame.OnJoinGameComplete: OnJoinGameComplete called for server index"@CurrentSearchIndex);
		KFGameEngine(Class'Engine'.static.GetEngine()).OnHandshakeComplete = OnHandshakeComplete;
		SetServerConnectGiveUpTimer(OptionsComponent.GetMakeNewServer());
		if (OptionsComponent.GetMakeNewServer())
		{
			if (bLogSearchInfo) LogInternal("KFGFxMenu_StartGame.OnJoinGameComplete: servertakeover"@PendingResolvedAddress@BuildTakeoverURL(LobbyOwnerPassword));
			GetPC().ConsoleCommand("servertakeover"@PendingResolvedAddress@BuildTakeoverURL(LobbyOwnerPassword));
		}
		else
		{
			GetPC().ConsoleCommand("open"@PendingResolvedAddress$OnlineLobby.GetLobbyURLString());
		}
	}
	else
	{
		AttemptingJoin = false;
		LogInternal("KFGFxMenu_StartGame.OnJoinGameComplete: unable to resolve server address, bLogSearchInfo");
		TryNextServer();
	}
}

function OnQueryAdditionalServerInfoComplete( bool bWasSuccessful, string LobbyId, string ServerIp, int ServerPort, string ServerTicket )
{
	LogInternal("OnQueryAdditionalServerInfoComplete with success"@bWasSuccessful@"and lobbyID"@LobbyId@"and server IP"@ServerIp@"and port"@ServerPort);
	class'GameEngine'.static.GetPlayfabInterface().ClearQueryServerInfoCompleteDelegate( OnQueryAdditionalServerInfoComplete );

	if( !bWasSuccessful || ServerIp == "" )
	{
		AttemptingJoin = false;
		TryNextServer();
	}
	else
	{
		if (bLogSearchInfo) LogInternal("KFGFxMenu_StartGame.OnQueryAdditionalServerInfoComplete: called for server index"@CurrentSearchIndex);
		ConnectToPlayfabServer(LobbyId, ServerIp, ServerPort, ServerTicket, false);
	}
}


function ConnectToPlayfabServer(string LobbyId, string ServerIp, int ServerPort, string ServerTicket, bool bNewServer)
{
	local string OpenCommand;

	// First we need to know if we're joining or taking over
	OpenCommand = bAttemptingServerCreate ? "servertakeover" : "open";
	OpenCommand @= ServerIp$":"$ServerPort;

	if( bAttemptingServerCreate )
	{
		OpenCommand @= BuildTakeoverURL();
	}

	if(OnlineLobby != None && OnlineLobby.IsInLobby() && OnlineLobby.IsLobbyOwner())
	{
		OnlineLobby.LobbyJoinServer(LobbyId);
		OpenCommand $= OnlineLobby.GetLobbyURLString();
	}

	KFGameEngine(Class'Engine'.static.GetEngine()).OnHandshakeComplete = OnHandshakeComplete;
	// Give a longer timeout for servers that need to spin up
	Manager.TimerHelper.SetTimer(bNewServer ? 20 : ServerConnectTimeout, false, nameof(ServerConnectGiveUp), self);

	// Attach auth ticket and playfab ID
	OpenCommand $= "?AuthTicket="$ServerTicket;
	OpenCommand $= "?PlayfabPlayerId="$class'GameEngine'.static.GetPlayfabInterface().CachedPlayfabId;

	LogInternal("Going to connect with URL:"@OpenCommand);
	ConsoleCommand( OpenCommand );
}



event SetServerConnectGiveUpTimer(bool ServerTakover)
{
	Manager.TimerHelper.SetTimer(ServerTakover ? ServerTakeoverTimeout : ServerConnectTimeout, false, nameof(ServerConnectGiveUp), self);
}

event AddJoinGameCompleteDelegate(OnlineGameSearch LatestGameSearch)
{
	if( class'WorldInfo'.static.IsConsoleBuild() && !class'WorldInfo'.static.IsE3Build() )
	{
		class'GameEngine'.static.GetPlayfabInterface().AddQueryServerInfoCompleteDelegate( OnQueryAdditionalServerInfoComplete );
		class'GameEngine'.static.GetPlayfabInterface().QueryServerInfo( LatestGameSearch.Results[CurrentSearchIndex].GameSettings.LobbyId );
	}
	else
	{
		GameInterface.AddJoinOnlineGameCompleteDelegate(OnJoinGameComplete);
		GameInterface.JoinOnlineGame(0, 'Game', LatestGameSearch.Results[CurrentSearchIndex]);
	}
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
		if (bLogSearchInfo) LogInternal("KFGFxMenu_StartGame.OnHandShakeComplete: LobbyJoinServer" @ PendingResolvedAddress);
		if( !class'WorldInfo'.static.IsConsoleBuild() )
		{
			if (Len(LobbyOwnerPassword) > 0)
			{
				OnlineLobby.SetServerPassword(LobbyOwnerPassword);
				if (OptionsComponent.GetPrivacyIndex() == ESPr_FriendsOnly)
				{
					class'GameEngine'.static.GetOnlineSubsystem().SetSharedPassword(LobbyOwnerPassword);
				}
			}
			OnlineLobby.LobbyJoinServer(PendingResolvedAddress);
		}
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
	if(GameInterface != none)
	{
		GameInterface.ClearFindOnlineGamesCompleteDelegate(OnFindGameServerComplete);
		GameInterface.ClearJoinOnlineGameCompleteDelegate(OnJoinGameComplete);
	}

	Manager.CachedProfile.Save( GetLP().ControllerId );

	if( class'WorldInfo'.static.IsConsoleBuild() && !class'WorldInfo'.static.IsE3Build() )
	{
		class'GameEngine'.static.GetPlayfabInterface().ClearFindOnlineGamesCompleteDelegate( OnFindGameServerComplete );
		class'GameEngine'.static.GetPlayfabInterface().ClearQueryServerInfoCompleteDelegate( OnQueryAdditionalServerInfoComplete );
	}
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
	local int 	GameMode;
	local int	GameDifficulty;
	local int	GameLength;
	local bool  AllowInProgress;
	local string GameTagFilters;
	local ActiveLobbyInfo LobbyInfo;

	Search.ClearServerFilters();

	// TODO: Eventually will want to support this. For now using PLAYFAB_BUILD_VERSION define
	if( !class'WorldInfo'.static.IsConsoleBuild() )
	{
		Search.AddServerFilter( "version_match", string(class'KFGameEngine'.static.GetKFGameVersion()));
	}

	if (OptionsComponent.GetMakeNewServer() || bAttemptingServerCreate )
	{
		// BWJ - Don't see a need for this var when searching. bAvailableForTakeover should give us what we want
		if( !class'WorldInfo'.static.IsConsoleBuild() )
		{
			Search.AddGametagFilter( GameTagFilters, 'bUsedForTakeover', "1");
		}
		Search.AddGametagFilter( GameTagFilters, 'bAvailableForTakeover', "1");
		Search.AddGametagFilter( GameTagFilters, 'bRequiresPassword', "0");
	}
	else
	{
		MapName = OptionsComponent.GetMapName();
		LogInternal("Map searched:" @ MapName);
		if (MapName != "")
		{
			Search.AddServerFilter( "map", MapName);
		}

		if( OnlineLobby != none && OnlineLobby.GetCurrentLobby(LobbyInfo) && LobbyInfo.Members.length >= 6)
		{
			Search.AddServerFilter( "noplayers", "");
		}
		else
		{
			Search.AddServerFilter("notfull", "");
		}

		GameMode = OptionsComponent.GetModeIndex();
		if( GameMode >= 0 && !class'WorldInfo'.static.IsConsoleBuild() )
		{
			Search.AddGametagFilter( GameTagFilters, 'Mode', string(GameMode) );
		}

		GameDifficulty = OptionsComponent.GetDifficulty();
		if (GameDifficulty >= 0)
		{
			Search.AddGametagFilter(GameTagFilters, 'Difficulty', string(GameDifficulty));
		}

		GameLength = OptionsComponent.GetGameLength();
		if (GameLength >= 0)
		{
			Search.AddGametagFilter(GameTagFilters, 'NumWaves', string(GameLength));
		}
	
		Search.TestAddBoolGametagFilter(GameTagFilters, true, 'bRequiresPassword', 0);

		AllowInProgress = OptionsComponent.GetAllowInProgress();
		Search.TestAddBoolGametagFilter(GameTagFilters, !AllowInProgress, 'bInProgress', 0);

		if( !class'WorldInfo'.static.IsConsoleBuild() )
		{
			switch (OptionsComponent.GetServerTypeIndex())
			{
				case ES_Maps:
					Search.TestAddBoolGametagFilter(GameTagFilters, true, 'bCustom', 0);
					Search.TestAddBoolGametagFilter(GameTagFilters, true, 'bUsesStats', 1);
					break;
				case ES_Custom:
					Search.TestAddBoolGametagFilter(GameTagFilters, true, 'bCustom', 1);
					Search.TestAddBoolGametagFilter(GameTagFilters, true, 'bUsesStats', 1);
					break;
				case ES_Unranked:
					Search.TestAddBoolGametagFilter(GameTagFilters, true, 'bUsesStats', 0);
					break;
				default: //ES_Stock
					Search.TestAddBoolGametagFilter(GameTagFilters, true, 'bCustom', 0);
					Search.TestAddBoolGametagFilter(GameTagFilters, true, 'bUsesStats', 1);
					//figure out how to determine stock maps
					break;
			}
		}

	}
	if (Len(GameTagFilters) > 0)
	{
		Search.AddServerFilter( "gametagsand", GameTagFilters);
	}
	if (Search.MasterServerSearchKeys.length > 1)
	{
		Search.AddServerFilter( "and", string(Search.MasterServerSearchKeys.length), 0);
	}
}

function Callback_StartGame()
{
	Callback_StartOfflineGame();
}

function Callback_StartOfflineGame()
{
	if(AttemptingJoin)
	{
		LogInternal("Attmepting to start local game while 'Playfab Game Join' is in progress");
		return;
	}

	ConsoleCommand("open" @ MakeMapURL(OptionsComponent));
}

event StartOnlineGame()
{
	local int i;

	OptionsComponent.UpdateFilters();
/*
	if (OptionsComponent.GetServerTypeListen())
	{
		//`log("******open" @ MakeMapURL(OptionsComponent)$"?listen?steamsockets");
		ConsoleCommand("open" @ MakeMapURL(OptionsComponent)$"?listen?steamsockets");
		OnlineLobby.LobbyJoinGame();

		return;
	}
*/
	GameInterface.SetMatchmakingTypeMode(SMT_Internet);

	CurrentSearchIndex = 0;

	// If this is supposed to be a private game, it has to be a takeover
	if( class'WorldInfo'.static.IsConsoleBuild() && OptionsComponent.GetPrivacyIndex() == 1 )
	{
		bAttemptingServerCreate = true;
	}

	BuildServerFilters(GameInterface, OptionsComponent, SearchDataStore.GetCurrentGameSearch());
	SearchDataStore.GetCurrentGameSearch().MaxSearchResults = MaxResultsToTry;

	if( class'WorldInfo'.static.IsConsoleBuild() && !class'WorldInfo'.static.IsE3Build() )
	{
		AttemptingJoin = false;
		class'GameEngine'.static.GetPlayfabInterface().AddFindOnlineGamesCompleteDelegate( OnFindGameServerComplete );
	}
	else
	{
		// Add a delegate for when the search completes.  We will use this callback to do any post searching work.
		GameInterface.AddFindOnlineGamesCompleteDelegate(OnFindGameServerComplete);
	}

	// Set the game mode on the search
	SearchDataStore.ActiveSearchIndex = 0;
	SearchDataStore.GetActiveGameSearch().GameModes.Length = 1;
	// Quick match only has one option
	SearchDataStore.GetActiveGameSearch().GameModes[0] = class'KFGameInfo'.default.GameModes[OptionsComponent.GetModeIndex()].FriendlyName;

	// If we're attempting a server create, we should search all game modes
	if( bAttemptingServerCreate )
	{
		for( i = 0; i < class'KFGameInfo'.default.GameModes.Length; i++ )
		{
			// Add other game apart from the main one
			if( i != OptionsComponent.GetModeIndex() )
			{
				SearchDataStore.GetActiveGameSearch().GameModes.AddItem( class'KFGameInfo'.default.GameModes[i].FriendlyName );
			}
		}
	}

	// Start a search
	if ( !SearchDataStore.SubmitGameSearch(class'UIInteraction'.static.GetPlayerControllerId(0), false) )
	{
		GameInterface.ClearFindOnlineGamesCompleteDelegate(OnFindGameServerComplete);

		if( class'WorldInfo'.static.IsConsoleBuild() && !class'WorldInfo'.static.IsE3Build() )
		{
			class'GameEngine'.static.GetPlayfabInterface().ClearFindOnlineGamesCompleteDelegate( OnFindGameServerComplete );
		}
	}
	else
	{
		bPauseTryingServers = true;
		Manager.TimerHelper.SetTimer(InitialSearchPause, false, nameof(UnpauseTryingServers), self);
		bSearchingForGame = true;

		OptionsComponent.SetSearching(bSearchingForGame);
	}
}

function ShowServerTakeoverPasswordPrompt()
{
	Manager.OpenPopup(EInputPrompt, class'KFCommon_LocalizedStrings'.default.SetTakeoverServerPasswordTitle, "" , class'KFCommon_LocalizedStrings'.default.ConfirmString, class'KFCommon_LocalizedStrings'.default.CancelString, OnSetTakoverServerPassword);
}

function OnSetTakoverServerPassword()
{
	local string Password;

	Password = KFGFxPopup_InputPrompt(Manager.CurrentPopup).PlayerInputString;

	LobbyOwnerPassword = Password;
	StartOnlineGame();
}

native function string GenerateRandomPassword();

function Callback_StartOnlineGame()
{
	LobbyOwnerPassword = "";
	if (OptionsComponent.GetMakeNewServer())
	{
		if (OptionsComponent.GetPrivacyIndex() == ESPr_PasswordProtected)
		{
			ShowServerTakeoverPasswordPrompt();
			return;
		}
		else if (OptionsComponent.GetPrivacyIndex() == ESPr_FriendsOnly)
		{
			LobbyOwnerPassword = GenerateRandomPassword();
		}
	}

	bAttemptingServerCreate = false;
	StartOnlineGame();
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
		if( class'WorldInfo'.static.IsConsoleBuild() && !class'WorldInfo'.static.IsE3Build() )
		{
			class'GameEngine'.static.GetPlayfabInterface().CancelGameSearch();
			OnCancelSearchComplete(true);
		}
		else
		{
			GameInterface.AddCancelFindOnlineGamesCompleteDelegate(OnCancelSearchComplete);
			GameInterface.CancelFindOnlineGames();
		}
	}
	else
	{
		OnCancelSearchComplete(false);
	}
	OptionsComponent.SetHelpText("");
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
   LeaveMenuString="Leaving matchmaking will disband your party. Go to server browser instead?"
   CouldNotFindGameTitleString="Unable To Find Match"
   CouldNotFindGameDescriptionStringPC="No servers matching the search settings were found. Try different filters or use the server browser."
   CouldNotFindGameDescriptionStringOrbis="No servers matching the search settings were found. Try different filters."
   WhiteListedStrings(0)="YES"
   WhiteListedStrings(1)="NO"
   InitialSearchPause=2.000000
   MaxResultsToTry=20000
   ServerConnectTimeout=4
   ServerTakeoverTimeout=30
   StockMaps(0)="kf-bioticslab"
   StockMaps(1)="kf-outpost"
   StockMaps(2)="kf-burningparis"
   StockMaps(3)="kf-voltermanor"
   StockMaps(4)="kf-catacombs"
   StockMaps(5)="kf-evacuationpoint"
   StockMaps(6)="kf-blackforest"
   StockMaps(7)="kf-farmhouse"
   StockMaps(8)="kf-prison"
   StockMaps(9)="kf-containmentstation"
   StockMaps(10)="kf-hostilegrounds"
   SubWidgetBindings(0)=(WidgetName="FindGameContainer",WidgetClass=Class'KFGame.KFGFxStartGameContainer_FindGame')
   SubWidgetBindings(1)=(WidgetName="gameOptionsContainer",WidgetClass=Class'KFGame.KFGFxStartGameContainer_Options')
   SubWidgetBindings(2)=(WidgetName="OverviewContainer",WidgetClass=Class'KFGame.KFGFxStartContainer_InGameOverview')
   SubWidgetBindings(3)=(WidgetName="ServerBrowserOverviewContainer",WidgetClass=Class'KFGame.KFGFxStartContainer_ServerBrowserOverview')
   Name="Default__KFGFxMenu_StartGame"
   ObjectArchetype=KFGFxObject_Menu'KFGame.Default__KFGFxObject_Menu'
}
