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









const KFID_QuickWeaponSelect = 100;
const KFID_CurrentLayoutIndex = 101;
const KFID_ForceFeedbackEnabled = 103;
const KFID_SavedPerkIndex = 105;
const KFID_AllowBloodSplatterDecals = 106;
const KFID_GoreLevel = 107;
const KFID_StoredCharIndex = 111;
const KFID_MasterVolumeMultiplier = 112;
const KFID_DialogVolumeMultiplier = 113;
const KFID_MusicVolumeMultiplier = 114;
const KFID_SFXVolumeMultiplier = 115;
const KFID_GammaMultiplier = 117;
const KFID_MusicVocalsEnabled = 118;
const KFID_MinimalChatter = 119;
const KFID_ShowCrossHair = 121;
const KFID_FOVOptionsPercentageValue = 122;
const KFID_ShowKillTicker = 123;
const KFID_FriendlyHudScale = 125;
const KFID_FavoriteWeapons = 127;
const KFID_GearLoadouts = 128;
const KFID_SetGamma = 129;
const KFID_RequiresPushToTalk = 130;
const KFID_InvertController = 131;
const KFID_AutoTargetEnabled = 132;
const KFID_GamepadSensitivityScale = 133;
const KFID_ZoomedSensitivityScale = 134;
const KFID_GamepadZoomedSensitivityScale = 135;
const KFID_EnableMouseSmoothing = 136;
const KFID_MouseSensitivity = 138;
const KFID_TargetAdhesionEnabled = 139;
const KFID_TargetFrictionEnabled = 140;
const KFID_InvertMouse = 142;
const KFID_DEPRECATED_143 = 143;
const KFID_SavedSoloModeIndex = 144;
const KFID_SavedSoloMapString = 145;
const KFID_SavedSoloDifficultyIndex = 146;
const KFID_SavedSoloLengthIndex = 147;
const KFID_SavedModeIndex = 148;
const KFID_SavedMapString = 149;
const KFID_SavedDifficultyIndex = 150;
const KFID_SavedLengthIndex = 151;
const KFID_SavedPrivacyIndex = 152;
const KFID_SavedServerTypeIndex = 153;
const KFID_SavedInProgressIndex = 154;
const KFID_ControllerSoundEnabled = 155;
const KFID_MatchmakingRegion = 156;
const KFID_UseAltAimOnDuals = 157; 
const KFID_HideBossHealthBar = 158; 
const KFID_AntiMotionSickness = 159; 
const KFID_ShowWelderInInventory = 160; 
const KFID_AutoTurnOff = 161;			
const KFID_ReduceHightPitchSounds = 162; 
const KFID_ShowConsoleCrossHair = 163;
const KFID_VOIPVolumeMultiplier = 164;
const KFID_WeaponSkinAssociations = 165;
const KFID_SavedEmoteId = 166;
const KFID_DisableAutoUpgrade = 167;
const KFID_SafeFrameScale = 168;
const KFID_Native4kResolution = 169;
const KFID_HideRemoteHeadshotEffects = 170;
const KFID_SavedHeadshotID= 171;
#linenumber 16

var string WhatsNewPS;
var string WhatsNewMS;
var string WhatsNewSteam;

var bool bIsLeader;
var bool bIsInParty;
var bool bSearchingForGame;
var bool bLeaderInServerBrowser, bLeaderWasInServerBrowser;

var bool bPendingLeaveMenu;

var transient bool AttemptingJoin;
var transient bool bAttemptingServerCreate;
var transient int CurrentSearchIndex;

var const string ModeKey, DifficultyKey, MapKey, WhitelistedKey, InProgressKey, PermissionsKey, ServerTypeKey;
var const string GameLengthKey;

var KFGFxStartGameContainer_FindGame FindGameContainer;
var KFGFxStartGameContainer_Options OptionsComponent;
var KFGFxStartContainer_InGameOverview OverviewContainer;
var KFGFxStartContainer_ServerBrowserOverview ServerBrowserOverviewContainer;
var KFGFxStartContainer_NewsImageHolder NewsImageHolderContainer;

var KFGFxMissionObjectivesContainer MissionObjectiveContainer;



//@HSL_BEGIN - JRO - 4/28/2016 - Disable certain features for PlayGo
var GFxObject CreateGameButton;
var GFxObject MatchMakingButton;
var GFxObject ServerBrowserButton;
//@HSL_END

var bool bHarrassedPlayerAboutSharedContent;

var localized string FindGameString;
var localized string HostOptionsString;
var localized string OverviewString;

var localized string MatchmakingString;
var localized string CreateMatchString;
var localized string ServerBrowserString;
var localized string NewsPageString;

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

native static function GetMapList( out array<string> MapList, optional int OverrideGameModeIndex = INDEX_NONE, optional bool bStockMapsOnly );

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

function InitializeMenu( KFGFxMoviePlayer_Manager InManager )
{
	local DataStoreClient DSClient;

	super.InitializeMenu(InManager);
	SetSeasonalEventClass();	//based of seasonal event ID

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
		case SEI_Spring:
			return class'KFGFxEndlessDARObjectivesContainer';
		case SEI_Summer:
			return class'KFGFxSummerSideShowObjectivesContainer';
		case SEI_Fall:
			return class'KFGFxFallObjectivesContainer';
		case SEI_Winter:
			return class'KFGFxChristmasObjectivesContainer';
	}

	return class'KFGFxSpecialEventObjectivesContainer';
}

/** Ties the GFxClikWidget variables to the .swf components and handles events */
event bool WidgetInitialized(name WidgetName, name WidgetPath, GFxObject Widget)
{
	switch(WidgetName)
	{
		case('newsPage'):

			if (NewsImageHolderContainer == none)
			{
				NewsImageHolderContainer = KFGFxStartContainer_NewsImageHolder(Widget);
				NewsImageHolderContainer.Initialize(self);
			}
			break;
		//mission objectives UI
		case ('missionObjectivesContainerMC'):

			if(MissionObjectiveContainer == none)
			{
				MissionObjectiveContainer = KFGFxMissionObjectivesContainer(Widget);
				MissionObjectiveContainer.Initialize( self );
			}
			break;
		case ('dailyContainerMC'):
			if(MissionObjectiveContainer.ExpandedObjectiveContainer.DailyObjectiveContainer == none)
			{
				MissionObjectiveContainer.ExpandedObjectiveContainer.DailyObjectiveContainer = KFGFxDailyObjectivesContainer(Widget);
				MissionObjectiveContainer.ExpandedObjectiveContainer.DailyObjectiveContainer.Initialize( self );
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
			if(class'WorldInfo'.static.IsConsoleBuild())
			{
				CheckGameFullyInstalled();
			}
		break;
		case ('createGameButton'):
			CreateGameButton = Widget;
			if (class'WorldInfo'.static.IsConsoleBuild())
			{
				CheckGameFullyInstalled();
			}
			break;
		case ('serverBrowserButton'):
			ServerBrowserButton = Widget;
			if(class'WorldInfo'.static.IsConsoleBuild())
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
			if (MatchMakingButton != none)
			{
				MatchMakingButton.SetBool("enabled", true);
			}
			if(CreateGameButton != none)
			{
				CreateGameButton.SetBool("enabled", true);
			}
			if (ServerBrowserButton != none)
			{
				ServerBrowserButton.SetBool("enabled", true);
			}
			InitializeMenu(Manager);
			ReloadSounds();
		}
		else
		{
			if (MatchMakingButton != none)
			{
				MatchMakingButton.SetBool("enabled", false);
			}
			if (CreateGameButton != none)
			{
				CreateGameButton.SetBool("enabled", false);
			}
			if (ServerBrowserButton != none)
			{
				ServerBrowserButton.SetBool("enabled", false);
			}
			class'WorldInfo'.static.GetWorldInfo().TimerHelper.SetTimer(1.0f, false, nameof(CheckGameFullyInstalled), self);
		}
	}
}

native function ReloadSounds();
//@HSL_END


// OVERVIEW, OVERVIEW_SERVER_BROWSER
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
						//OpenMultiplayerMenu();
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
	if(Manager.CurrentMenuIndex != UI_IIS)
	{
		UpdateMenu();
	}

	if(OverviewContainer != none && Manager.CurrentMenu == self)
	{
		OverviewContainer.UpdateSharedContent();
	}

	if (FindGameContainer != none)
	{
		FindGameContainer.CheckNewsState();
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
		case EServerBrowserOverview:
			if(bClientIsLeader)
			{
				Manager.OpenMenu(UI_ServerBrowserMenu);
				return;
			}
		default:
			if (bClientIsLeader)
			{
				Manager.SetStartMenuState(EStartHome);
				SetInt("externalMenuState", EStartHome);
				//Manager.OpenMenu(UI_Start);
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
		bPendingLeaveMenu = false;
		if( OnlineLobby != none && OnlineLobby.IsInLobby())
		{
			OnlineLobby.QuitLobby();
		}
		CancelGameSearch();

		SetInt("externalMenuState", EStartHome);
		UpdateStartMenuState();

	}
}

function GoToServerBrowser()
{
	Manager.OpenMenu(UI_ServerBrowserMenu);
}

function CancelLeaveMenu()
{
	GetPC().SetTimer(0.5f, false, nameof(ClearLeaveMenuFlag), self);
}

function ClearLeaveMenuFlag()
{
	bPendingLeaveMenu = false;
}

function UpdateStartMenuState()
{
	if( Manager != none )
	{
		Manager.SetStartMenuState(EStartMenuState(GetStartMenuState()));
		Switch(EStartMenuState(GetStartMenuState()))
		{
			case ECreateGame:
				OptionsComponent.bShowLengthNoPref = false;
				OptionsComponent.ModeChanged(OptionsComponent.SavedModeIndex);
				break;
			case EMatchmaking:
				OptionsComponent.bShowLengthNoPref = true;
				OptionsComponent.ModeChanged(OptionsComponent.SavedModeIndex);
				break;
			case ESoloGame:
				OptionsComponent.bShowLengthNoPref = false;
				OptionsComponent.ModeChanged(OptionsComponent.GetAdjustedGameModeIndex(OptionsComponent.SavedModeIndex) );
				break;
		}
	}
}

function ProceedToTutorial()
{
	if (OnlineLobby != none  && OnlineLobby.IsInLobby())
	{
		if (OnlineLobby != none && OnlineLobby.IsInLobby())
		{
			OnlineLobby.QuitLobby();
		}
	}

	CancelGameSearch();

	ConsoleCommand("open KF-EvacuationPoint?game=KFGameContent.KFGameInfo_Tutorial");
}

function ProceedToSoloMenu()
{
	if (OnlineLobby != none  && OnlineLobby.IsInLobby())
	{
		if (OnlineLobby != none && OnlineLobby.IsInLobby())
		{
			OnlineLobby.QuitLobby();
		}
	}

	//set create party button invisible.
	Manager.SoloGameMenuOpened();

	CancelGameSearch();

	SetInt("externalMenuState", ESoloGame);
}

function PostPartyDisbandTutorial()
{
	if (OnlineLobby != none  && OnlineLobby.IsInLobby())
	{
		if (OnlineLobby != none && OnlineLobby.IsInLobby())
		{
			OnlineLobby.QuitLobby();
		}
	}

	CancelGameSearch();

	Manager.DelayedOpenPopup(EConfirmation, EDPPID_Misc, class'KFCommon_LocalizedStrings'.default.ProceedToTutorialString, class'KFCommon_LocalizedStrings'.default.ProceedToTutorialDescriptionString, class'KFCommon_LocalizedStrings'.default.ConfirmString, class'KFCommon_LocalizedStrings'.default.CancelString, ProceedToTutorial);
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
			if (Class'WorldInfo'.Static.IsConsoleBuild(CONSOLE_Orbis) && !OnlineSub.IsGameOwned())
			{
				Manager.OnBuyGamePressed();
				return;
			}
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
							WarnInternal("No PSN signed offer ID for item with product ID"@FindGameContainer.PS4ActiveWhatsNewItems[Index].PSNProductId);
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

function Callback_NewsButtonPressed()
{
	local OnlineSubsystem				OnlineSub;

	OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();

	if (OnlineSub == none)
	{
		return;
	}
	if(class'WorldInfo'.static.IsConsoleBuild(CONSOLE_Orbis))
	{
		OnlineSub.OpenURL(default.WhatsNewPS);
	}
	else if (class'WorldInfo'.static.IsConsoleBuild(CONSOLE_Durango))
	{
		OnlineSub.OpenURL(default.WhatsNewMS);
	}
	else
	{
		OnlineSub.OpenURL(default.WhatsNewSteam);
	}

}

function Callback_SoloButtonPressed()
{
	if (OnlineLobby != none  && OnlineLobby.IsInLobby())
	{
		Manager.DelayedOpenPopup(EConfirmation, EDPPID_Misc, Class'KFCommon_LocalizedStrings'.default.StartOfflineGameString, Class'KFCommon_LocalizedStrings'.default.StartOfflineGameDescriptionString,
			Class'KFCommon_LocalizedStrings'.default.DisbandPartyString,
			Class'KFCommon_LocalizedStrings'.default.CancelString, ProceedToSoloMenu); //middle button
	}
	else
	{
		ProceedToSoloMenu();
	}
}

function Callback_StartTutorial()
{
	local OnlineSubsystem				OnlineSub;

	OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();

	CancelGameSearch();

	if (!OnlineSub.IsGameOwned() && class'WorldInfo'.static.IsConsoleBuild(CONSOLE_Orbis))
	{
		if (OnlineSub.CanCheckFreeTrialState() && !OnlineSub.IsFreeTrialPeriodActive())
		{
			Manager.HandleFreeTrialError(FTN_BuyGame);
			return;
		}

		if(!OnlineSub.CanCheckFreeTrialState())
		{
			Manager.HandleFreeTrialError(FTN_NetworkCheckFailed);
			return;
		}
	}

	if (OnlineLobby != none  && OnlineLobby.IsInLobby())
	{
		Manager.DelayedOpenPopup(EConfirmation, EDPPID_Misc, Class'KFCommon_LocalizedStrings'.default.StartOfflineGameString, Class'KFCommon_LocalizedStrings'.default.StartOfflineGameDescriptionString,
			Class'KFCommon_LocalizedStrings'.default.DisbandPartyString,
			Class'KFCommon_LocalizedStrings'.default.CancelString, PostPartyDisbandTutorial); //middle button
	}
	else
	{
		//make pop up
		Manager.DelayedOpenPopup(EConfirmation, EDPPID_Misc, class'KFCommon_LocalizedStrings'.default.ProceedToTutorialString, class'KFCommon_LocalizedStrings'.default.ProceedToTutorialDescriptionString, class'KFCommon_LocalizedStrings'.default.ConfirmString, class'KFCommon_LocalizedStrings'.default.CancelString, ProceedToTutorial);
	}
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

//Callback
function Callback_OptionListOpened(string ListName, int OptionIndex)
{
	local string MessageString;

	if (OptionsComponent.bIsSoloGame && ListName == "modeList")
	{
		OptionIndex = OptionsComponent.GetAdjustedGameModeIndex(OptionIndex);
	}

	if(ListName == "mapList" || GetPC().WorldInfo.IsConsoleBuild() && ListName == "regionList")
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
		OptionsComponent.bShowLengthNoPref = GetStartMenuState() == EMatchmaking;
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

function Callback_Region(int RegionIndex)
{
	OptionsComponent.SetRegionIndex(RegionIndex);
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
	LengthIndex = InOptionsComponent.GetLengthIndex();	
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
	if( class'WorldInfo'.static.IsConsoleBuild() && OptionsComponent.GetPrivacyIndex() == ESPr_PasswordProtected)
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
		LogInternal("KFGFxMenu_StartGame.OnJoinGameComplete: unable to resolve server address, bLogSearchInfo");
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
	class'WorldInfo'.static.GetWorldInfo().TimerHelper.SetTimer( bAttemptingServerCreate ? 8 : ServerConnectTimeout, false, nameof(ServerConnectGiveUp), self);

	// Attach playfab ID
	OpenCommand $= "?PlayfabPlayerId="$class'GameEngine'.static.GetPlayfabInterface().CachedPlayfabId;

	LogInternal("Going to connect with URL:"@OpenCommand);
	ConsoleCommand( OpenCommand );
}



event SetServerConnectGiveUpTimer(bool ServerTakover)
{
	class'WorldInfo'.static.GetWorldInfo().TimerHelper.SetTimer(ServerTakover ? ServerTakeoverTimeout : ServerConnectTimeout, false, nameof(ServerConnectGiveUp), self);
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
	if (bLogSearchInfo) LogInternal("KFGFxMenu_StartGame.ServerConnectGiveUp: ServerConnectGiveUp");
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
		MissionObjectiveContainer.Refresh(true);
	}
}


function bool OnHandshakeComplete(bool bSuccess, string Description, out int SuppressPasswordRetry)
{
	if (bLogSearchInfo) LogInternal("KFGFxMenu_StartGame.OnHandShakeComplete");
	AttemptingJoin = false;

	KFGameEngine(Class'Engine'.static.GetEngine()).OnHandshakeComplete = None;
	class'WorldInfo'.static.GetWorldInfo().TimerHelper.ClearTimer(nameof(ServerConnectGiveUp), self);
	if (bSuccess)
	{
		if (bLogSearchInfo) LogInternal("KFGFxMenu_StartGame.OnHandShakeComplete: LobbyJoinServer" @ PendingResolvedAddress);
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
		if (bLogSearchInfo) LogInternal("KFGFxMenu_StartGame.OnHandShakeComplete:  TryNextServer");
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
	local string GameTagFilters;
	local ActiveLobbyInfo LobbyInfo;

	Search.ClearServerFilters();

	// TODO: Eventually will want to support this. For now using PLAYFAB_BUILD_VERSION define
	if( class'WorldInfo'.static.IsConsoleBuild() )
	{
		Search.AddGametagFilter(GameTagFilters, 'Region', class'GameEngine'.static.GetPlayfabInterface().CurrRegionName);
	}
	// Consoles MUST set region
	else
	{
		Search.AddServerFilter("version_match", string(class'KFGameEngine'.static.GetKFGameVersion()));
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

        //For modes that don't use filtered difficulty, don't even attempt to send this (Ex: Weekly)
        if (ShouldUseDifficultyFilter(GameMode))
        {
            GameDifficulty = OptionsComponent.GetDifficulty();
            if (GameDifficulty >= 0)
            {
                Search.AddGametagFilter(GameTagFilters, 'Difficulty', string(GameDifficulty));
            }
        }

        //For modes that don't use filtered length, don't even attempt to send this (Ex: Weekly)
        if (ShouldUseLengthFilter(GameMode))
        {
            GameLength = OptionsComponent.GetGameLength();
            if (GameLength >= 0)
            {
                Search.AddGametagFilter(GameTagFilters, 'NumWaves', string(GameLength));
            }
        }

		Search.TestAddBoolGametagFilter(GameTagFilters, true, 'bRequiresPassword', 0);
		Search.TestAddBoolGametagFilter(GameTagFilters, false, 'bInProgress', 0);

		if (!class'WorldInfo'.static.IsConsoleBuild())
		{
			// aka server type "stock"
			Search.TestAddBoolGametagFilter(GameTagFilters, true, 'bCustom', 0);
			Search.TestAddBoolGametagFilter(GameTagFilters, true, 'bUsesStats', 1);
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

function bool ShouldUseDifficultyFilter(int GameModeIndex)
{
    switch (GameModeIndex)
    {
    //Weekly
    case 1:
        return false;
    }

    return true;
}

function bool ShouldUseLengthFilter(int GameModeIndex)
{
    switch (GameModeIndex)
    {
    //Weekly
    case 1:
	//Endless
	case 3:
        return false;
    }

    return true;
}

function Callback_StartGame()
{
	if (OnlineLobby != none  && OnlineLobby.IsInLobby())
	{
		Manager.DelayedOpenPopup(EConfirmation, EDPPID_Misc, Class'KFCommon_LocalizedStrings'.default.StartOfflineGameString, Class'KFCommon_LocalizedStrings'.default.StartOfflineGameDescriptionString,
			Class'KFCommon_LocalizedStrings'.default.DisbandPartyString,
			Class'KFCommon_LocalizedStrings'.default.CancelString, Callback_StartOfflineGame); //middle button
	}
	else
	{
		Callback_StartOfflineGame();
	}

}

function Callback_StartOfflineGame()
{
	local OnlineSubsystem				OnlineSub;

	OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();

	if (OnlineLobby != none && OnlineLobby.IsInLobby())
	{
		OnlineLobby.QuitLobby();
	}

	if (!OnlineSub.IsGameOwned() && class'WorldInfo'.static.IsConsoleBuild(CONSOLE_Orbis))
	{
		if (OnlineSub.CanCheckFreeTrialState() && !OnlineSub.IsFreeTrialPeriodActive())
		{
			Manager.HandleFreeTrialError(FTN_BuyGame);
			return;
		}

		if (!OnlineSub.CanCheckFreeTrialState())
		{
			Manager.HandleFreeTrialError(FTN_NetworkCheckFailed);
			return;
		}
	}
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
			// BWJ - Not clearing this delegate because sometimes you can run into instances where the search fails because one is already in progress.
			// We do not want to clear the delegate when this happens. Players can end up in an "infinite search" because they never get the callback.
		//	class'GameEngine'.static.GetPlayfabInterface().ClearFindOnlineGamesCompleteDelegate( OnFindGameServerComplete );
		}
	}
	else
	{
		bPauseTryingServers = true;
		class'WorldInfo'.static.GetWorldInfo().TimerHelper.SetTimer(InitialSearchPause, false, nameof(UnpauseTryingServers), self);
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
	local OnlineSubsystem				OnlineSub;

	OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();

	if (!OnlineSub.IsGameOwned() && class'WorldInfo'.static.IsConsoleBuild(CONSOLE_Orbis))
	{
		if (OnlineSub.CanCheckFreeTrialState() && !OnlineSub.IsFreeTrialPeriodActive())
		{
			Manager.HandleFreeTrialError(FTN_BuyGame);
			return;
		}

		if (!OnlineSub.CanCheckFreeTrialState())
		{
			Manager.HandleFreeTrialError(FTN_NetworkCheckFailed);
			return;
		}
	}

	if ( class'KFGameEngine'.static.IsFreeConsolePlayOver() )
	{
		Manager.DelayedOpenPopup(EConfirmation, EDPPID_Misc, "",
			class'KFCommon_LocalizedStrings'.default.FreeConsolePlayOverString,
			class'KFCommon_LocalizedStrings'.default.BuyGameString,
			class'KFCommon_LocalizedStrings'.default.OKString, OnBuyGamePressed);
		return;
	}

	bAttemptingServerCreate = false;
	StartOnlineGame();
}

function Callback_CreateOnlineGame()
{
	local OnlineSubsystem				OnlineSub;

	CancelGameSearch();

	OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();

	if (!OnlineSub.IsGameOwned() && class'WorldInfo'.static.IsConsoleBuild(CONSOLE_Orbis))
	{
		if (OnlineSub.CanCheckFreeTrialState() && !OnlineSub.IsFreeTrialPeriodActive())
		{
			Manager.HandleFreeTrialError(FTN_BuyGame);
			return;
		}

		if (!OnlineSub.CanCheckFreeTrialState())
		{
			Manager.HandleFreeTrialError(FTN_NetworkCheckFailed);
			return;
		}
	}

	if (class'KFGameEngine'.static.IsFreeConsolePlayOver())
	{
		Manager.DelayedOpenPopup(EConfirmation, EDPPID_Misc, "",
			class'KFCommon_LocalizedStrings'.default.FreeConsolePlayOverString,
			class'KFCommon_LocalizedStrings'.default.BuyGameString,
			class'KFCommon_LocalizedStrings'.default.OKString, OnBuyGamePressed);
		return;
	}

	LobbyOwnerPassword = "";
	bAttemptingServerCreate = true;
	if (OptionsComponent.GetPrivacyIndex() == ESPr_PasswordProtected && !class'WorldInfo'.static.IsConsoleBuild())
	{
		ShowServerTakeoverPasswordPrompt();
		return;
	}
	else
	{
		StartOnlineGame();
	}
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

event int GetGameModeIndex()
{
	local KFGameReplicationInfo KFGRI;
	LogInternal("IN GET GAME MODE INDEX!!!!");
	KFGRI = KFGameReplicationInfo(class'WorldInfo'.static.GetWorldInfo().GRI);

	if (OptionsComponent != none)
	{
		if (OptionsComponent.bIsSoloGame)
		{
			LogInternal("solo mode index: " @OptionsComponent.GetAdjustedGameModeIndex(OptionsComponent.SavedModeIndex));
			return OptionsComponent.GetAdjustedGameModeIndex(OptionsComponent.SavedModeIndex);
		}
		else
		{
			LogInternal("not solo mode index: " @OptionsComponent.GetAdjustedGameModeIndex(OptionsComponent.SavedModeIndex));
			return OptionsComponent.SavedModeIndex;
		}
	}
	else if(Manager != none)
	{
		LogInternal("SDADAS");
		return Manager.CachedProfile.GetProfileInt(KFID_SavedModeIndex);
	}
	else if (KFGRI != none)
	{
		LogInternal("SDADAS1111111111");
		return class'KFGameInfo'.static.GetGameModeIndexFromName(string(KFGRI.GameClass.name));
	}

	return 0;
}

/********************************************************************************/
//							  End Match Making
/********************************************************************************/

function ShowOverview( bool bShowOverview, bool bLeader, bool bInMainMenu, bool bhostInServerBrowser)
{
	if (bShowOverview)
	{
		if (bInMainMenu)
		{
			if (!bLeader)
			{
				if (bhostInServerBrowser)
				{
					SetInt("externalMenuState", EServerBrowserOverview);
				}
				else
				{
					SetInt("externalMenuState", EOverview);
				}
			}
		}
		else
		{
			SetInt("externalMenuState", EOverview);
		}
	}
}

function OnPartyLeave()
{
	SetInt("externalMenuState", EStartHome);
}

defaultproperties
{
   WhatsNewPS="http://www.killingfloor2.com/psnews"
   WhatsNewMS="http://www.killingfloor2.com/xboxnews"
   WhatsNewSteam="http://www.killingfloor2.com/pcnews"
   ModeKey="ModeKey"
   DifficultyKey="DifficultyKey"
   MapKey="MapKey"
   WhitelistedKey="WhitelistedKey"
   InProgressKey="InProgress"
   PermissionsKey="PermissionsKey"
   ServerTypeKey="ServerTypeKey"
   GameLengthKey="GameLengthKey"
   FindGameString="HOME"
   MatchmakingString="FIND A MATCH"
   CreateMatchString="CREATE MATCH"
   ServerBrowserString="Browse Servers"
   NewsPageString="News"
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
   StockMaps(1)="kf-burningparis"
   StockMaps(2)="kf-outpost"
   StockMaps(3)="kf-voltermanor"
   StockMaps(4)="kf-catacombs"
   StockMaps(5)="kf-evacuationpoint"
   StockMaps(6)="kf-blackforest"
   StockMaps(7)="kf-farmhouse"
   StockMaps(8)="kf-prison"
   StockMaps(9)="kf-containmentstation"
   StockMaps(10)="kf-hostilegrounds"
   StockMaps(11)="kf-infernalrealm"
   StockMaps(12)="kf-zedlanding"
   StockMaps(13)="kf-thedescent"
   StockMaps(14)="kf-nuked"
   StockMaps(15)="kf-nightmare"
   StockMaps(16)="kf-krampuslair"
   StockMaps(17)="kf-diesector"
   StockMaps(18)="kf-powercore_holdout"
   StockMaps(19)="kf-lockdown"
   StockMaps(20)="kf-monsterball"
   StockMaps(21)="kf-airship"
   StockMaps(22)="kf-tragickingdom"
   SubWidgetBindings(0)=(WidgetName="FindGameContainer",WidgetClass=Class'KFGame.KFGFxStartGameContainer_FindGame')
   SubWidgetBindings(1)=(WidgetName="ServerBrowserOverviewContainer",WidgetClass=Class'KFGame.KFGFxStartContainer_ServerBrowserOverview')
   SubWidgetBindings(2)=(WidgetName="gameOptionsContainer",WidgetClass=Class'KFGame.KFGFxStartGameContainer_Options')
   SubWidgetBindings(3)=(WidgetName="OverviewContainer",WidgetClass=Class'KFGame.KFGFxStartContainer_InGameOverview')
   SubWidgetBindings(4)=(WidgetName="dailyContainerMC",WidgetClass=Class'KFGame.KFGFxDailyObjectivesContainer')
   SubWidgetBindings(5)=(WidgetName="weeklyContainerMC",WidgetClass=Class'KFGame.KFGFxWeeklyObjectivesContainer')
   SubWidgetBindings(6)=(WidgetName="missionObjectivesContainerMC",WidgetClass=Class'KFGame.KFGFxMissionObjectivesContainer')
   SubWidgetBindings(7)=(WidgetName="collapsedMissionObjectivesMC",WidgetClass=Class'KFGame.KFGFxCollapsedObjectivesContainer')
   SubWidgetBindings(8)=(WidgetName="specialEventContainerMC",WidgetClass=Class'KFGame.KFGFxSpecialEventObjectivesContainer')
   SubWidgetBindings(9)=(WidgetName="expandedMissionObjectivesMC",WidgetClass=Class'KFGame.KFGFxExpandedObjectivesContainer')
   SubWidgetBindings(10)=(WidgetName="newsPage",WidgetClass=Class'KFGame.KFGFxStartContainer_NewsImageHolder')
   Name="Default__KFGFxMenu_StartGame"
   ObjectArchetype=KFGFxObject_Menu'KFGame.Default__KFGFxObject_Menu'
}
