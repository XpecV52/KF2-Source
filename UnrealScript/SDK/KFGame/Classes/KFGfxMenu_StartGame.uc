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

var KFGFxMissionObjectivesContainer MissionObjectiveContainer;



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

/** If we didn't boot up installing, we don't really need to do installation checks */
var transient bool bIsPlayGoRun;

native static function GetMapList( out array<string> MapList );

function InitializeMenu( KFGFxMoviePlayer_Manager InManager )
{
	local DataStoreClient DSClient;

	super.InitializeMenu(InManager);
	SetSeasonalEventClass();	//based of seasonal event ID

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
		bIsPlayGoRun = !class'GameEngine'.static.IsGameFullyInstalled();
		if( bIsPlayGoRun )
		{
			Manager.DelayedOpenPopup(ENotification,EDPPID_Misc, Localize("Notifications", "PlayGoBusyTitle", "KFGameConsole"),  Localize("Notifications", "PlayGoBusyMessage", "KFGameConsole"), class'KFCommon_LocalizedStrings'.default.OKString);
		}
		//@HSL_END
	}
}

function SetSeasonalEventClass()
{
	local GFXWidgetBinding MyWidgetBinding;

	MyWidgetBinding.WidgetName ='specialEventContainerMC';
	MyWidgetBinding.WidgetClass=GetSpecialEventClass(class'KFGameEngine'.static.GetSeasonalEventId());

	SubWidgetBindings[8]=MyWidgetBinding;
}

static function class<KFGFxSpecialeventObjectivesContainer> GetSpecialEventClass(int SpecialEventID)
{
	switch (SpecialEventID)
	{
		case SEI_Summer:
			return class'KFGFxSummerSideShowObjectivesContainer';
	}
	
	return class'KFGFxSpecialEventObjectivesContainer';
}

/** Ties the GFxClikWidget variables to the .swf components and handles events */
event bool WidgetInitialized(name WidgetName, name WidgetPath, GFxObject Widget)
{	
	switch(WidgetName)
	{
		//mission objectives UI
		case ('missionObjectivesContainerMC'):
		
			if(MissionObjectiveContainer == none)
			{
				MissionObjectiveContainer = KFGFxMissionObjectivesContainer(Widget);
				MissionObjectiveContainer.Initialize( self );
			}
			break;
		case ('expandedMissionObjectivesMC'):
		
			if(MissionObjectiveContainer.ExpandedObjectiveContainer == none) //this is not the normal way we do this. This is a special case
			{
				MissionObjectiveContainer.ExpandedObjectiveContainer = KFGFxExpandedObjectivesContainer(Widget);
				MissionObjectiveContainer.ExpandedObjectiveContainer.Initialize( self );
			}
			break;
		case ('collapsedMissionObjectivesMC'):
		
			if(MissionObjectiveContainer.CollapsedObjectiveContainer == none)
			{
				MissionObjectiveContainer.CollapsedObjectiveContainer = KFGFxCollapsedObjectivesContainer(Widget);
				MissionObjectiveContainer.CollapsedObjectiveContainer.Initialize( self );
			}
			break;
		case ('specialEventContainerMC'):
		
			if(MissionObjectiveContainer.ExpandedObjectiveContainer.SpecialEventsContainer == none)
			{
				MissionObjectiveContainer.ExpandedObjectiveContainer.SpecialEventsContainer = KFGFxSpecialEventObjectivesContainer(Widget);
				MissionObjectiveContainer.ExpandedObjectiveContainer.SpecialEventsContainer.Initialize( self );
			}
			break;
		case ('weeklyContainerMC'):
		
			if(MissionObjectiveContainer.ExpandedObjectiveContainer.WeeklyEventContainer == none)
			{
				MissionObjectiveContainer.ExpandedObjectiveContainer.WeeklyEventContainer = KFGFxWeeklyObjectivesContainer(Widget);
				MissionObjectiveContainer.ExpandedObjectiveContainer.WeeklyEventContainer.Initialize( self );
			}
			break;
		//end mission objectives UI 
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
			if(class'WorldInfo'.static.IsConsoleBuild() && ServerBrowserButton != None)
			{
				CheckGameFullyInstalled();
			}
		break;
		case ('serverBrowserButton'):
			ServerBrowserButton = Widget;
			if(class'WorldInfo'.static.IsConsoleBuild() && MatchMakingButton != None)
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
	if (class'WorldInfo'.static.IsConsoleBuild())
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
	if(bIsPlayGoRun)
	{
		if( class'GameEngine'.static.IsGameFullyInstalled() )
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
			`TimerHelper.SetTimer(1.0f, false, nameof(CheckGameFullyInstalled), self);
		}
	}
}

native function ReloadSounds();
//@HSL_END

function SetOverview(optional bool bInitialize)
{
	local UniqueNetId AdminId, MyUID, ZeroId;
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
		
		bCurrentlyLeader = (MyUID == AdminId && MyUID != ZeroId);
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
		if( OnlineLobby != none && OnlineLobby.IsInLobby())
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
			if( FindGameContainer.PS4ActiveWhatsNewItems[Index].PSNProductId != "" )
			{
				for( i = 0; i < OnlineSub.ItemPropertiesList.Length; i++ )
				{
					if( OnlineSub.ItemPropertiesList[i].ProductId == FindGameContainer.PS4ActiveWhatsNewItems[Index].PSNProductId )
					{
						if( OnlineSub.ItemPropertiesList[i].SignedOfferId != "" )
						{
							if( class'WorldInfo'.static.IsConsoleBuild( CONSOLE_Orbis ) )
							{
								OnlineSub.OpenMarketPlaceSearch( OnlineSub.ItemPropertiesList[i] );
							}
							else
							{
								OnlineSub.PlayerInterfaceEx.ShowProductDetailsUI( GetLP().ControllerId, OnlineSub.ItemPropertiesList[i].ProductId );
							}
						}
						else
						{
							`warn("No PSN signed offer ID for item with product ID"@FindGameContainer.PS4ActiveWhatsNewItems[Index].PSNProductId);
						}
						break;
					}
				}
			}
			else if( FindGameContainer.PS4ActiveWhatsNewItems[Index].RedirectURL != "" )
			{
				OnlineSub.OpenURL( FindGameContainer.PS4ActiveWhatsNewItems[Index].RedirectURL);
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
		GetPC().WorldInfo.CancelPendingMapChange();
		KFGameEngine(Class'Engine'.static.GetEngine()).CancelPendingLevel();
	}
}

//Request to close the match making menu
function Callback_RequestLeaveMatchmaking()
{
	if( OptionsComponent != none )
	{
		if(OnlineLobby.IsInLobby())
		{
			if(class'WorldInfo'.static.IsConsoleBuild())
			{
				Manager.DelayedOpenPopup(EConfirmation, EDPPID_Misc, Class'KFCommon_LocalizedStrings'.default.LeaveCurrentMenuString,
					Localize("KFGFxMenu_StartGame", "LeaveMenuString", "KFGameConsole"),
					LeaveString, Class'KFCommon_LocalizedStrings'.default.CancelString, 
					ApproveMatchMakingLeave, CancelLeaveMenu );
			}
			else
			{
			Manager.DelayedOpenPopup(EConfirmation,EDPPID_Misc, Class'KFCommon_LocalizedStrings'.default.LeaveCurrentMenuString, LeaveMenuString,
					Manager.BrowseServersString, Class'KFCommon_LocalizedStrings'.default.CancelString, GoToServerBrowser, CancelLeaveMenu,
					Class'KFCommon_LocalizedStrings'.default.DisbandPartyString, ApproveMatchMakingLeave ); //middle button
			}
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

	if(ListName == "mapList" || GetPC().WorldInfo.IsConsoleBuild() && ListName == "serverTypeList")
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

function OnCanPlayOnlineCheckComplete(byte LocalUserNum, EFeaturePrivilege Privilege, EFeaturePrivilegeLevel PrivilegeLevel, bool bDiffersFromHint)
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
		OptionsComponent.SetOptions(true);
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

function Callback_MapSelection( string MapKeyString )
{
	local string MapName;
	local int MapIndex;

	MapIndex = MapStringList.Find(MapKeyString);

	if(MapIndex == INDEX_NONE)
	{
		MapName = "";
	}
	else
	{
		MapName = MapKeyString;
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
		else if( class'WorldInfo'.static.IsConsoleBuild() )
		{
			// Pick a random map is game is fully installed
			if( class'GameEngine'.static.IsGameFullyInstalled() )
			{
				MapName = MapStringList[rand(MapStringList.Length)];
			}
			// evacuation point is the only map available if still installing
			else
			{
				MapName = "kf-evacuationpoint";
			}
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
	`log("KFGFxMenu_StartGame.OpenNotFoundPopup: No servers found, giving up.");
	KFPC.MyGFxManager.DelayedOpenPopup(ENotification, EDPPID_Misc, CouldNotFindGameTitleString, GetCouldNotFindGameDescription(), class'KFCommon_LocalizedStrings'.default.OKString);
}

event int GetLobbySize()
{
	local ActiveLobbyInfo LobbyInfo;

	if ( OnlineLobby == none || !OnlineLobby.GetCurrentLobby(LobbyInfo) )
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
		// If doing takeover, randomize the list to reduce risk of clients trying to take over the same server. Order is irrelevant for console when (no ping)
		if( bAttemptingServerCreate && class'WorldInfo'.static.IsConsoleBuild() )
		{
			RandomizeSearchResults(SearchDataStore.GetActiveGameSearch());
		}
		// Regular join, sort normally
		else if( class'WorldInfo'.static.IsConsoleBuild() )
		{
			// Sort all entries for console
			SortServers(SearchDataStore.GetActiveGameSearch());
		}
		else
		{
			SortLastEntry(SearchDataStore.GetActiveGameSearch());
		}
	}
	TryNextServer();
}

native function bool SpaceAvailable(const OnlineGameSettings Settings);
native function bool MapGood(const OnlineGameSettings Settings, optional out string CurrentMap);
native function SortLastEntry(OnlineGameSearch Search);
native function SortServers(OnlineGameSearch Search);
native function RandomizeSearchResults(OnlineGameSearch Search);

function string BuildJoinFiltersRequestURL()
{
	local string FiltersURL;
	local int GameMode, GameDifficulty;

	GameMode = OptionsComponent.GetModeIndex();
	GameDifficulty = OptionsComponent.GetDifficulty();

	if( GameMode >= 0 )
	{
		FiltersURL $= "?Game="$class'KFGameInfo'.static.GetGameModeClassFromNum(GameMode);
	}

	if( GameDifficulty >= 0)
	{
		FiltersURL $= "?Difficulty="$GameDifficulty;
	}

	if( OptionsComponent.bLengthFilterSet )
	{
		FiltersURL $= "?GameLength="$OptionsComponent.LengthFilter;
	}

	return FiltersURL;
}

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

private native function SecureTakeover(const out string Address, const string TakeoverURL);

function OnJoinGameComplete(name SessionName, bool bSuccessful)
{
	if(GameInterface != none)
	{
		GameInterface.ClearJoinOnlineGameCompleteDelegate(OnJoinGameComplete);
	}
	
	if (!bSuccessful)
	{
		AttemptingJoin = false;
		`log("KFGFxMenu_StartGame.OnJoinGameComplete: join online game failed completion for server index"@CurrentSearchIndex, bLogSearchInfo);
		TryNextServer();
		return;
	}
	if (GameInterface.GetResolvedConnectString(SessionName, PendingResolvedAddress))
	{
		`log("KFGFxMenu_StartGame.OnJoinGameComplete: OnJoinGameComplete called for server index"@CurrentSearchIndex, bLogSearchInfo);
		KFGameEngine(Class'Engine'.static.GetEngine()).OnHandshakeComplete = OnHandshakeComplete;
		SetServerConnectGiveUpTimer(OptionsComponent.GetMakeNewServer());
		if (OptionsComponent.GetMakeNewServer())
		{
			`log("KFGFxMenu_StartGame.OnJoinGameComplete: servertakeover"@PendingResolvedAddress@BuildTakeoverURL(LobbyOwnerPassword), bLogSearchInfo);
			SecureTakeover(PendingResolvedAddress, BuildTakeoverURL(LobbyOwnerPassword));
		}
		else
		{
			GetPC().ConsoleCommand("open"@PendingResolvedAddress$BuildJoinFiltersRequestURL()$OnlineLobby.GetLobbyURLString());
		}
	}
	else
	{
		AttemptingJoin = false;
		`log("KFGFxMenu_StartGame.OnJoinGameComplete: unable to resolve server address, bLogSearchInfo");
		TryNextServer();
	}
}


function ConnectToPlayfabServer(string ServerIp)
{
	local string OpenCommand;
	local bool bInParty;

	// First we need to know if we're joining or taking over
	OpenCommand = bAttemptingServerCreate ? "servertakeover" : "open";
	OpenCommand @= ServerIp;

	bInParty = OnlineLobby != None && OnlineLobby.IsInLobby() && OnlineLobby.IsLobbyOwner();

	if( bInParty )
	{
		PendingResolvedAddress = ServerIp;
	}
	
	if( bAttemptingServerCreate )
	{
		OpenCommand @= BuildTakeoverURL();
	}
	else if( bInParty )
	{
		OpenCommand $= OnlineLobby.GetLobbyURLString();
	}

	// Regular join
	if( !bAttemptingServerCreate )
	{
		OpenCommand $= BuildJoinFiltersRequestURL();
	}

	KFGameEngine(Class'Engine'.static.GetEngine()).OnHandshakeComplete = OnHandshakeComplete;
	// Give a longer timeout for servers that need to spin up
	`TimerHelper.SetTimer( bAttemptingServerCreate ? 8 : ServerConnectTimeout, false, nameof(ServerConnectGiveUp), self);

	// Attach playfab ID
	OpenCommand $= "?PlayfabPlayerId="$class'GameEngine'.static.GetPlayfabInterface().CachedPlayfabId;

	`log("Going to connect with URL:"@OpenCommand);
	ConsoleCommand( OpenCommand );
}



event SetServerConnectGiveUpTimer(bool ServerTakover)
{
	`TimerHelper.SetTimer(ServerTakover ? ServerTakeoverTimeout : ServerConnectTimeout, false, nameof(ServerConnectGiveUp), self);
}

event AddJoinGameCompleteDelegate(OnlineGameSearch LatestGameSearch)
{
	if( class'WorldInfo'.static.IsConsoleBuild() && !class'WorldInfo'.static.IsE3Build() )
	{
		if( LatestGameSearch.Results[CurrentSearchIndex].GameSettings.JoinString == "" )
		{
			AttemptingJoin = false;
			TryNextServer();
		}
		else
		{
			ConnectToPlayfabServer(LatestGameSearch.Results[CurrentSearchIndex].GameSettings.JoinString);
		}
	}
	else
	{
		GameInterface.AddJoinOnlineGameCompleteDelegate(OnJoinGameComplete);
		GameInterface.JoinOnlineGame(0, 'Game', LatestGameSearch.Results[CurrentSearchIndex]);
	}
}

function ServerConnectGiveUp()
{
	`log("KFGFxMenu_StartGame.ServerConnectGiveUp: ServerConnectGiveUp", bLogSearchInfo);
	KFGameEngine(Class'KFGameEngine'.static.GetEngine()).KillPendingServerConnection();
}

function OnOpen()
{
	if( Manager != none )
	{
		Manager.SetStartMenuState(EStartMenuState(GetStartMenuState()));
	}
	if(MissionObjectiveContainer != none)
	{
		MissionObjectiveContainer.Refresh();
	}
}


function bool OnHandshakeComplete(bool bSuccess, string Description, out int SuppressPasswordRetry)
{
	`log("KFGFxMenu_StartGame.OnHandShakeComplete", bLogSearchInfo);
	AttemptingJoin = false;
	
	KFGameEngine(Class'Engine'.static.GetEngine()).OnHandshakeComplete = None;
	`TimerHelper.ClearTimer(nameof(ServerConnectGiveUp), self);
	if (bSuccess)
	{
		`log("KFGFxMenu_StartGame.OnHandShakeComplete: LobbyJoinServer" @ PendingResolvedAddress, bLogSearchInfo);
		if( class'WorldInfo'.static.IsConsoleBuild() )
		{
			if(OnlineLobby != None && OnlineLobby.IsInLobby() && OnlineLobby.IsLobbyOwner())
			{
				OnlineLobby.LobbyJoinServer(PendingResolvedAddress);
			}
		}
		else
		{
			if (Len(LobbyOwnerPassword) > 0)
			{
				OnlineLobby.SetServerPassword(LobbyOwnerPassword);
			}
			OnlineLobby.LobbyJoinServer(PendingResolvedAddress);
		}
		PendingResolvedAddress = "";
	}
	else
	{
		`log("KFGFxMenu_StartGame.OnHandShakeComplete:  TryNextServer", bLogSearchInfo);
		//@HSL_BEGIN - JRO - Console doesn't make a session until after connect, don't need to clean it up on failure. Also, Party is a session and that needs to *not* be destroyed!
		if( !class'WorldInfo'.static.IsConsoleBuild() )
		{
			GameInterface.DestroyOnlineGame('Game');
		}
		//@HSL_END
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
	// Consoles MUST set region
	else
	{
		Search.AddGametagFilter( GameTagFilters, 'Region', class'GameEngine'.static.GetPlayfabInterface().CurrRegionName  );
	}

	if (OptionsComponent.GetMakeNewServer() || bAttemptingServerCreate )
	{
		Search.AddGametagFilter( GameTagFilters, 'bAvailableForTakeover', "1");
		Search.AddGametagFilter( GameTagFilters, 'bRequiresPassword', "0");
	}
	else
	{
		if( OnlineLobby != none && OnlineLobby.GetCurrentLobby(LobbyInfo) && LobbyInfo.Members.length >= 6)
		{
			Search.AddServerFilter( "noplayers", "");
		}
		else
		{
			Search.AddServerFilter("notfull", "");
		}

		GameMode = OptionsComponent.GetModeIndex();
		if( GameMode >= 0 )
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
	ConsoleCommand("open" @ MakeMapURL(OptionsComponent));
}

event StartOnlineGame()
{
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
		`TimerHelper.SetTimer(InitialSearchPause, false, nameof(UnpauseTryingServers), self);
		bSearchingForGame = true;

		OptionsComponent.SetSearching(bSearchingForGame);
	}
}

function ShowServerTakeoverPasswordPrompt()
{
	Manager.DelayedOpenPopup(EInputPrompt, EDPPID_Misc,class'KFCommon_LocalizedStrings'.default.SetTakeoverServerPasswordTitle, "" , class'KFCommon_LocalizedStrings'.default.ConfirmString, class'KFCommon_LocalizedStrings'.default.CancelString, OnSetTakoverServerPassword);
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
	if ( class'KFGameEngine'.static.IsFreeConsolePlayOver() )
	{
		Manager.DelayedOpenPopup(EConfirmation, EDPPID_Misc, "", 
			class'KFCommon_LocalizedStrings'.default.FreeConsolePlayOverString, 
			class'KFCommon_LocalizedStrings'.default.BuyGameString, 
			class'KFCommon_LocalizedStrings'.default.OKString, OnBuyGamePressed);
		return;
	}

	LobbyOwnerPassword = "";
	if (OptionsComponent.GetMakeNewServer())
	{
		if (OptionsComponent.GetPrivacyIndex() == ESPr_PasswordProtected)
		{
			ShowServerTakeoverPasswordPrompt();
			return;
		}
	}

	bAttemptingServerCreate = false;
	StartOnlineGame();
}

/** Called when player selects buy game from the end of demo popup */
function OnBuyGamePressed()
{
	local OnlineSubsystem OnlineSub;

	if( class'WorldInfo'.static.IsConsoleBuild( CONSOLE_Orbis ) )
	{
		OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
		OnlineSub.OpenGameStorePage();
	}
}

function UnpauseTryingServers()
{
	bPauseTryingServers = false;
	if( bAttemptingServerCreate )
	{
		RandomizeSearchResults(SearchDataStore.GetActiveGameSearch());
	}
	else
	{
		SortServers(SearchDataStore.GetActiveGameSearch());
	}

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
	GameLengthKey="GameLengthKey"
	WhitelistedKey="WhitelistedKey"
	ServerTypeKey="ServerTypeKey"
	InProgressKey="InProgress"
	PermissionsKey="PermissionsKey"
	SearchDSName=KFGameSearch

	CurrentSearchIndex=0

	bIsLeader = false
	bIsInParty = false
	
   	SubWidgetBindings.Add((WidgetName="findGameContainer",WidgetClass=class'KFGFxStartGameContainer_FindGame'))
   	SubWidgetBindings.Add((WidgetName="gameOptionsContainer",WidgetClass=class'KFGFxStartGameContainer_Options'))
   	SubWidgetBindings.Add((WidgetName="overviewContainer",WidgetClass=class'KFGFxStartContainer_InGameOverview'))
   	SubWidgetBindings.Add((WidgetName="serverBrowserOverviewContainer",WidgetClass=class'KFGFxStartContainer_ServerBrowserOverview'))
   	SubWidgetBindings.Add((WidgetName="missionObjectivesContainerMC",WidgetClass=class'KFGFxMissionObjectivesContainer'))
   	SubWidgetBindings.Add((WidgetName="collapsedMissionObjectivesMC",WidgetClass=class'KFGFxCollapsedObjectivesContainer'))
	SubWidgetBindings.Add((WidgetName="expandedMissionObjectivesMC",WidgetClass=class'KFGFxExpandedObjectivesContainer'))
	SubWidgetBindings.Add((WidgetName="weeklyContainerMC",WidgetClass=class'KFGFxWeeklyObjectivesContainer'))
	SubWidgetBindings.Add((WidgetName="specialEventContainerMC",WidgetClass=class'KFGFxSpecialeventObjectivesContainer'))
}



