//=============================================================================
// KFGFxMoviePlayer_Manager
//=============================================================================
// The managing movie player for all menu objects.
// The string of the specific menu .swf is passed into action script to be loaded.
// Upon being loaded, WidgetInitialized will get called to initialize each unique menu
// To add a new menu, a WidgetBindings must be based created in the default properties
// based on the on the instance name of the asset and the objects class
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Greg Felber 7/1/2013
//=============================================================================

class KFGFxMoviePlayer_Manager extends GFxMoviePlayer
	config(UI);

/************************************
 *  Menus
 ************************************/









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
const KFID_ToggleToRun=172;
const KFID_ClassicPlayerInfo=173;
#linenumber 22

/** Connects a menu ID with its path */
enum EUIIndex
{
	UI_Start,
	UI_Perks,
	UI_Gear,
	UI_Dosh_Vault,
	UI_Inventory,
	UI_Store,
	UI_OptionsSelection,
	UI_Exit_Menu,
	UI_OptionsControls,
	UI_OptionsAudio,
	UI_OptionsGraphics,
	UI_OptionsGameSettings,
	UI_Achievements,
	UI_Extras,
    UI_PostGame,
	UI_Trader,
	UI_ServerBrowserMenu,
	UI_IIS,
};

// Anything not with a Misc priority will be only displayed once, even if attempted to be queued multiple times.
enum EDelayedPopupPriorityId
{
	EDPPID_Misc,
	EDPPID_SwitchTeams,
	EDPPID_RegionWait,
	EDPPID_RegionBest,
	EDPPID_Gamma,
	EDPPID_ExitToMainMenu,
	EDPPID_JoinFailure,
	EDPPID_ControllerDisconnect,
};
struct SMenuPaths
{
	var string BaseSWFPath;
	var string ConsoleSWFPath;
};
var bool bDisplayedInitialFreePopUp;
var SDelayedPriorityMessage DelayedPriorityMessage;

var float LastForceCloseTime;
var float AllowMenusOpenAfterForceCloseTime;

/** Points to the .swf location of each menu and is controlled by the EUIIndex */
var array<SMenuPaths> MenuSWFPaths;

var KFGFxObject_Menu CurrentMenu;
var byte CurrentMenuIndex;

/** Cached menu objects, set through widget initialized */
var KFGfxMenu_StartGame StartMenu;
var KFGFxMenu_Perks PerksMenu;
var KFGFxMenu_Gear GearMenu;
var KFGFxMenu_Inventory InventoryMenu;
var KFGFxMenu_Store StoreMenu;
var KFGFxOptionsMenu_Controls OptionsControlsMenu;
var KFGFxOptionsMenu_Audio OptionsAudioMenu;
var KFGFxOptionsMenu_Graphics OptionsGraphicsMenu;
var KFGFxOptionsMenu_GameSettings OptionsGameSettingsMenu;
var KFGFxOptionsMenu_Selection OptionsSelectionMenu;
var KFGFxMenu_PostGameReport PostGameMenu;
var KFGFxMenu_Trader TraderMenu;
var KFGFxMenu_ServerBrowser ServerBrowserMenu;
var KFGFxMenu_Exit ExitMenu;
var KFGFxMenu_IIS IISMenu;
var KFGFxMenu_DoshVault DoshVaultMenu;

/** The screen size movie used to adjusted safe frame */
var KFGFxMoviePlayer_ScreenSize ScreenSizeMovie;

var KFProfileSettings CachedProfile;

var bool bPostGameState;

var class<KFGFxWidget_PartyInGame> InGamePartyWidgetClass;

var TextureMovie CurrentBackgroundMovie;

/** Connects the different layers of the start menu with an index */
enum EStartMenuState
{
	EStartHome,
	EMatchmaking,
	ECreateGame,
	EServerBrowser,
	ESoloGame,
	ETutorial,
	EOverview,
	EServerBrowserOverview,
	EOverview_Matchmaking,
	EOverviewCreateGame,
};
var EStartMenuState StartMenuState;


/************************************
 *  Popups
 ************************************/

/** Used to load different types of possible popups */
enum EPopUpType
{
	EConfirmation,
	EGamma,
	ENotification,
	EPopUpMax,
	EInputPrompt,
};

struct DelayedPopup
{
	var bool bShown;
	var int Priority;
	var EPopUpType PopUpType;
	var string TitleString;
	var string DescriptionString;
	var string LeftButtonString;
	var string RightButtonString;
	var delegate<PendingLeftButtonDelegate>LeftButtonDelegate;
	var delegate<PendingRightButtonDelegate>RightButtonDelegate;
	var string MiddleButtonString;
	var delegate<PendingMiddleButtonDelegate>MiddleButtonDelegate;
	var name OverridingSoundEffect;

	structdefaultproperties
	{
		bShown=false
		Priority=0
		PopUpType=EConfirmation
	}
};

var array<DelayedPopup> DelayedPopups;
var transient int ActivePopup;

/** Reference to the popup that is currently open */
var KFGFxObject_Popup CurrentPopup;
/** Reference to which popup type is currently open */
var EPopUpType CurrentPopUpType;

// Stores localization and SWF Movie Path info for a specific popup.
struct SPopupData
{
    var string                      SWFPath;
    var localized array<string>     TitleStrings;
    var localized array<string>     DescriptionStrings;
    var localized string            LeftButtonString;
    var localized string            RightButtonString;
};

var Protected Array<SPopupData> PopupData;

var localized string FailedSearchTitleString;
var localized string FailedSearchString;
var localized string BrowseServersString;
var localized string HasInvitedToGameString;

var localized string JoinGameString;

/************************************
 *  Widgets - UI Menu elements that are persistent
 ************************************/

var KFGFxWidget_MenuBar MenuBarWidget;
var KFGFxWidget_BaseParty PartyWidget;
var KFGFxWidget_ButtonPrompt ButtonPromptWidget;

var array<string> WidgetPaths;

/************************************
 *  Misc
 ************************************/

var bool bStatsInitialized;

//The target PRI for current kick vote
var PlayerReplicationInfo KickVotePRI;

//The target PRI for current skip trader vote
var PlayerReplicationInfo SkipTraderVotePRI;

/** Cached version of the TWOnlineLobby */
var TWOnlineLobby OnlineLobby;
var UniqueNetId CurrentInviteLobbyId;

var const UniqueNetId ZeroUniqueId;


/** Reference to the LoaderManager.swf */
var GFxObject ManagerObject;
/** Reference to the KFHUD */
var KFHUDBase HUD;
/** The main menus background movie */
var array<TextureMovie> BackgroundMovies;
/** The IIS background movie */
var TextureMovie IISMovie;


/** Array of commands that cannot be rebound */
var array<string> IgnoredCommands;
/** Points to the UI sound effects */
var name SoundThemeName;
/** The threshold at which a mouse movement will change the interface from controller to mouse and keyboard */
var const int MouseInputChangedThreshold;

/** TRUE if the kick vote popup is open */
var bool bKickVotePopupActive;
/** TRUE if the skip trader vote popup is open */
var bool bSkipTraderVotePopupActive;
var bool bUsingGamepad; // True if we are using a gamepad, otherwise we are using mouse and keyboard
var bool bAfterLobby;	// Set to true once we have readied up
var bool bMenusOpen;	// true if we're using menus, otherwise we're using the HUD
var bool bMenusActive;  //@HSL - JRO - 6/21/2016 - Same as bMenusOpen but doesn't include the closing animation
var bool bSearchingForGame; // true if we are in the process of finding a game
var bool bCanCloseMenu;	// Set to true after a menu has been completely opened and allows a player to close the menu
var bool bPlayerInLobby;
//@HSL_MOD_BEGIN - amiller 5/11/2016 - Adding support to save extra data into profile settings - removing config
var bool bSetGamma;	// Set to true if we've already set the gamma on the first launch
//@HSL_MOD_END
var OnlineSubsystem OnlineSub;

/** The playfab interface used for console */
var PlayfabInterface PlayfabInter;

//Inventory Pending item
var int SelectIDOnOpen;

//Delegates for popups.  These are used to hold the delegates while the swf is loading. once it is loaded, it will pass it to the GFX object
//@TODO: Rewrite the pop up system to keep the pop ups loaded in at all times so the pending delegates are not needed. (Hide and show them as needed)
delegate PendingRightButtonDelegate();
delegate PendingMiddleButtonDelegate();
delegate PendingLeftButtonDelegate();

/** Called on creation of the movie player */
function Init(optional LocalPlayer LocPlay)
{
	local Vector2D ViewportSize;
	local GameViewportClient GVC;
	local float ScaleStage;

	// Initialize datastores
	class'KFUIDataStore_GameResource'.static.InitializeProviders();

	HUD = KFHUDBase(GetPC().myHUD);

	super.Init( LocPlay );

	if(OnlineSub == none)
	{
		OnlineSub = class'GameEngine'.static.GetOnlineSubsystem();
		if( OnlineSub != none )
		{
			OnlineLobby = OnlineSub.GetLobbyInterface();

			CachedProfile = KFProfileSettings( OnlineSub.PlayerInterface.GetProfileSettings( GetLP().ControllerId ) );
			if( CachedProfile != none )
			{
				bSetGamma = CachedProfile.GetProfileBool( KFID_SetGamma );
			}
		}
	}

	PlayfabInter = class'GameEngine'.static.GetPlayfabInterface();

	class'WorldInfo'.static.GetWorldInfo().TimerHelper.SetTimer( 1.0, true, nameof(OneSecondLoop), self );
	SetTimingMode(TM_Real);

	GVC = GetGameViewportClient();
	if ( GVC != None && class'WorldInfo'.static.IsConsoleBuild(CONSOLE_Orbis))
	{
		GVC.GetViewportSize(ViewportSize);
		ScaleStage = class'Engine'.static.GetTitleSafeArea();
		SetViewport((ViewportSize.X-(ViewportSize.X*ScaleStage))/2,(ViewportSize.Y-(ViewportSize.Y*ScaleStage))/2,(ViewportSize.X*ScaleStage),(ViewportSize.Y*ScaleStage));
	}
	bUsingGamepad = class'WorldInfo'.static.IsConsoleBuild();
	UpdateDynamicIgnoreKeys();
}


function OnProfileSettingsRead()
{
	CachedProfile = KFProfileSettings( OnlineSub.PlayerInterface.GetProfileSettings( GetLP().ControllerId ) );
	// Only set this if profile has finished reading
	if( CachedProfile != None && CachedProfile.AsyncState == OPAS_Finished )
	{
		bSetGamma = CachedProfile.GetProfileBool( KFID_SetGamma );

		// Now that profile settings have been read in, show the gamma popup if needed
		if( !bSetGamma && !class'KFGameEngine'.static.CheckSkipGammaCheck() && !class'WorldInfo'.static.IsConsoleBuild( CONSOLE_Durango ) )
		{
			LogInternal("("$Name$") KFGfxMoviePlayer_Manager::"$GetStateName()$":"$GetFuncName()@"33"@"bSetGamma:'"$bSetGamma$"'"@"CurrentMenu:'"$CurrentMenu$"'");
			ManagerObject.SetBool("bStartUpGamma", true);   // Let the manager know if we are gamma for start up so we can block backing out of the popup - HSL
			DelayedOpenPopup(EGamma,EDPPID_Gamma, "", Class'KFGFxOptionsMenu_Graphics'.default.AdjustGammaDescription, Class'KFGFxOptionsMenu_Graphics'.default.ResetGammaString, Class'KFGFxOptionsMenu_Graphics'.default.SetGammaString);
		}
	}
}


/** Called at the creation of the movie player, used to create the starting menus */
function LaunchMenus( optional bool bForceSkipLobby )
{
	local GFxWidgetBinding WidgetBinding;
	local bool bSkippedLobby, bShowIIS;
	local KFGameViewportClient GVC;
	local KFPlayerController KFPC;
	local bool bShowMenuBg;
	local TextureMovie BGTexture;

	GVC = KFGameViewportClient(GetGameViewportClient());
	KFPC = KFPlayerController(GetPC());

	bStatsInitialized = KFPC.HasReadStats();

	// Add either the in game party or out of game party widget
	WidgetBinding.WidgetName = 'partyWidget';
	if ( class'WorldInfo'.static.IsMenuLevel() )
	{
		WidgetBinding.WidgetClass = class'KFGFxWidget_PartyMainMenu';

		// If this is the menu level see if we've been here before.
		bShowIIS = GVC != None && !GVC.bSeenIIS;

		UpdateBackgroundMovie();

		BGTexture = (GetPC().WorldInfo.IsConsoleBuild() && bShowIIS) ? IISMovie : CurrentBackgroundMovie;

		bShowMenuBg = GVC.bSeenIIS || !GetPC().WorldInfo.IsConsoleBuild();
		ManagerObject.SetBool("backgroundVisible", bShowMenuBg);
		ManagerObject.SetBool("IISMovieVisible", !bShowMenuBg);

		// Only play the movie if we are not in game
		BGTexture.Play();
	}
	else
	{
		bSkippedLobby = bForceSkipLobby || CheckSkipLobby();
		WidgetBinding.WidgetClass = InGamePartyWidgetClass;
		ManagerObject.SetBool("backgroundVisible", false);
		ManagerObject.SetBool("IISMovieVisible", false);

		if (bSkippedLobby)
		{
			CurrentBackgroundMovie.Stop();
		}
	}
	WidgetBindings.AddItem(WidgetBinding);

	// Load the platform-specific graphics options menu
	switch( class'KFGameEngine'.static.GetPlatform() )
	{
		case PLATFORM_PC_DX10:
			WidgetBinding.WidgetName = 'optionsGraphicsMenu';
			WidgetBinding.WidgetClass = class'KFGFxOptionsMenu_Graphics_DX10';
			WidgetBindings.AddItem(WidgetBinding);
			break;
		default:
			WidgetBinding.WidgetName = 'optionsGraphicsMenu';
			WidgetBinding.WidgetClass = class'KFGFxOptionsMenu_Graphics';
			WidgetBindings.AddItem(WidgetBinding);
	}

	if (!bSkippedLobby)
	{
		LoadWidgets(WidgetPaths);
		LogInternal("("$Name$") KFGfxMoviePlayer_Manager::"$GetStateName()$":"$GetFuncName()@"11"@"bShowIIS:'"$bShowIIS$"'");
		// Console should check to see if we've seen the IIS and display it if this is the first time we've launched the menu.
		if(class'WorldInfo'.static.IsConsoleBuild() && bShowIIS)
		{
			OpenMenu(UI_IIS,false);
		}
		else
		{
			OpenMenu(UI_Start);
		}
		AllowCloseMenu();

		//@HSL_BEGIN - JRO - 6/30/2016 - PSN disconnect/logout
		if(GVC.bNeedDisconnectMessage)
		{
			class'WorldInfo'.static.GetWorldInfo().TimerHelper.SetTimer(0.1f, false, 'DelayedShowDisconnectMessage', self);
			GVC.bNeedDisconnectMessage = false;
		}
		if(GVC.bHandlePlayTogether)
		{
			KFPC.OnGameDestroyedForPlayTogetherComplete('Party', true);
			GVC.bHandlePlayTogether = false;
		}
		//@HSL_END
	}

	// do this stuff in case CheckSkipLobby failed
	if( bForceSkipLobby )
	{
		bAfterLobby = true;
		CloseMenus(true);
	}

	// Only read if cached profile has finished reading in
	if( !bSetGamma && !class'KFGameEngine'.static.CheckSkipGammaCheck() && CachedProfile != None && CachedProfile.AsyncState != OPAS_Read && !class'WorldInfo'.static.IsConsoleBuild( CONSOLE_Durango ) )
	{
		LogInternal("("$Name$") KFGfxMoviePlayer_Manager::"$GetStateName()$":"$GetFuncName()@"22"@"bSetGamma:'"$bSetGamma$"'"@"bShowIIS:'"$bShowIIS$"'");
		ManagerObject.SetBool("bStartUpGamma", true);   // Let the manager know if we are gamma for start up so we can block backing out of the popup - HSL
		DelayedOpenPopup(EGamma, EDPPID_Gamma,"", Class'KFGFxOptionsMenu_Graphics'.default.AdjustGammaDescription, Class'KFGFxOptionsMenu_Graphics'.default.ResetGammaString, Class'KFGFxOptionsMenu_Graphics'.default.SetGammaString);
	}
}

function UpdateBackgroundMovie()
{
	local bool bWasPlaying;
    local TextureMovie NewBackgroundMovie;
	if(CurrentBackgroundMovie != none)
	{
		bWasPlaying = !CurrentBackgroundMovie.Stopped;
	}

    NewBackgroundMovie = GetBackgroundMovie();
	if(bWasPlaying)
	{
        //Stop the old one if we're no longer needing it
        if (CurrentBackgroundMovie != NewBackgroundMovie)
        {
            CurrentBackgroundMovie.Stop();
        }
		NewBackgroundMovie.Play();
	}
	else
	{
		if(CurrentBackgroundMovie != none)
		{
			CurrentBackgroundMovie.Stop();
		}

        NewBackgroundMovie.Stop();
	}
    CurrentBackgroundMovie = NewBackgroundMovie;
	SetExternalTexture("background", CurrentBackgroundMovie, true);
	SetExternalTexture("IIS_BG", IISMovie, true);
}

function TextureMovie GetBackgroundMovie()
{
	local int EventIndex;

	//if we launched partial install only show default movie
	if (class'GameEngine'.static.WasLaunchedOnPartialInstall())
	{
		return BackgroundMovies[0];
	}

	EventIndex = class'KFGameEngine'.static.GetSeasonalEventId();

	if(EventIndex != INDEX_NONE && EventIndex < BackgroundMovies.Length)
	{
		return BackgroundMovies[EventIndex];
	}

	return BackgroundMovies[0];
}

function QueueDelayedPriorityMessage(string InPrimaryMessageString, string InSecondaryMessageString, int LifeTime, optional EGameMessageType MessageType)
{
	DelayedPriorityMessage.InPrimaryMessageString = InPrimaryMessageString;
	DelayedPriorityMessage.InSecondaryMessageString = InSecondaryMessageString;
	DelayedPriorityMessage.LifeTime = LifeTime;
	DelayedPriorityMessage.MessageType = MessageType;
	class'WorldInfo'.static.GetWorldInfo().TimerHelper.SetTimer(0.5f, false, nameOf(DisplayDelayedPriorityMessage), self);
}

function DisplayDelayedPriorityMessage()
{
	local KFPlayerController KFPC;
	KFPC = KFPlayerController(class'WorldInfo'.static.GetWorldInfo().GetALocalPlayerController());
	if (KFPC != None && KFPC.MyGFxHUD != None && KFPC.MyGFxManager != none)
	{
		KFPC.MyGFxHUD.DisplayPriorityMessage(DelayedPriorityMessage.InPrimaryMessageString, KFPC.MyGFxManager.DelayedPriorityMessage.InSecondaryMessageString, KFPC.MyGFxManager.DelayedPriorityMessage.LifeTime, EGameMessageType(KFPC.MyGFxManager.DelayedPriorityMessage.MessageType));
	}
}

static function HandleFreeTrialError(EFreeTrialNotification ErrorCode)
{
	local KFPlayerController KFPC;
	local KFGFxMoviePlayer_Manager MovieManager;

	KFPC = KFPlayerController(class'WorldInfo'.static.GetWorldInfo().GetALocalPlayerController());
	if (KFPC == none)
	{
		LogInternal("KFPC is none, cannot display pop up.");
		return;
	}

	MovieManager = KFPC.MyGFxManager;
	If(MovieManager == none)
	{
		LogInternal("Movie manager is none, cannot display pop up.");
		return;
	}

	switch (ErrorCode)
	{
	case FTN_FeatureUnavailable:
		MovieManager.DelayedOpenPopup(ENotification, EDPPID_Misc, Class'KFCommon_LocalizedStrings'.default.NoticeString, Class'KFCommon_LocalizedStrings'.default.NotAvailableInFreeTrialString,
			Class'KFCommon_LocalizedStrings'.default.ConfirmString);
		break;
	case FTN_NetworkCheckFailed:
		MovieManager.DelayedOpenPopup(ENotification, EDPPID_Misc, Class'KFCommon_LocalizedStrings'.default.NoticeString, Class'KFCommon_LocalizedStrings'.default.NetworkCheckFreeTrialFailedString,
			Class'KFCommon_LocalizedStrings'.default.ConfirmString);
		break;
	case FTN_BuyGame:
		MovieManager.DelayedOpenPopup(EConfirmation, EDPPID_Misc, "",
			class'KFCommon_LocalizedStrings'.default.FreeConsolePlayOverString,
			class'KFCommon_LocalizedStrings'.default.BuyGameString,
			class'KFCommon_LocalizedStrings'.default.OKString, MovieManager.OnBuyGamePressed);
		break;
	}
}

static function DisplayFreeTrialFeatureBlockedPopUp()
{
	local KFPlayerController KFPC;
	local KFGFxMoviePlayer_Manager MovieManager;

	KFPC = KFPlayerController(class'WorldInfo'.static.GetWorldInfo().GetALocalPlayerController());
	if (KFPC == none)
	{
		LogInternal("KFPC is none, cannot display pop up.");
		return;
	}

	MovieManager = KFPC.MyGFxManager;
	If(MovieManager == none)
	{
		LogInternal("Movie manager is none, cannot display pop up.");
		return;
	}

	MovieManager.DelayedOpenPopup(ENotification, EDPPID_Misc, Class'KFCommon_LocalizedStrings'.default.NoticeString, Class'KFCommon_LocalizedStrings'.default.NotAvailableInFreeTrialString,
		Class'KFCommon_LocalizedStrings'.default.ConfirmString);
}

static function DisplayCouldNotCheckFreeTrialStatusErrorPopUp()
{
	local KFPlayerController KFPC;
	local KFGFxMoviePlayer_Manager MovieManager;

	KFPC = KFPlayerController(class'WorldInfo'.static.GetWorldInfo().GetALocalPlayerController());
	if (KFPC == none)
	{
		LogInternal("KFPC is none, cannot display pop up.");
		return;
	}

	MovieManager = KFPC.MyGFxManager;
	If(MovieManager == none)
	{
		LogInternal("Movie manager is none, cannot display pop up.");
		return;
	}

	MovieManager.DelayedOpenPopup(ENotification, EDPPID_Misc, Class'KFCommon_LocalizedStrings'.default.NoticeString, Class'KFCommon_LocalizedStrings'.default.NetworkCheckFreeTrialFailedString,
		Class'KFCommon_LocalizedStrings'.default.ConfirmString);
}

static function DisplayFreeTrialOverPopUp()
{
	local KFPlayerController KFPC;
	local KFGFxMoviePlayer_Manager MovieManager;

	KFPC = KFPlayerController(class'WorldInfo'.static.GetWorldInfo().GetALocalPlayerController());
	if (KFPC == none)
	{
		LogInternal("KFPC is none, cannot display pop up.");
		return;
	}

	MovieManager = KFPC.MyGFxManager;
	If(MovieManager == none)
	{
		LogInternal("Movie manager is none, cannot display pop up.");
		return;
	}

	MovieManager.DelayedOpenPopup(EConfirmation, EDPPID_Misc, "",
		class'KFCommon_LocalizedStrings'.default.FreeConsolePlayOverString,
		class'KFCommon_LocalizedStrings'.default.BuyGameString,
		class'KFCommon_LocalizedStrings'.default.OKString, MovieManager.OnBuyGamePressed);
}

/** Called when player selects buy game from the end of demo popup */
function OnBuyGamePressed()
{
	local OnlineSubsystem MyOnlineSub;

	LogInternal("On Buy game pressed");
	if (class'WorldInfo'.static.IsConsoleBuild(CONSOLE_Orbis))
	{
		MyOnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
		MyOnlineSub.OpenGameStorePage();
	}
}

//@HSL_BEGIN - JRO - 6/30/2016 - PSN disconnect/logout
function DelayedShowDisconnectMessage()
{
	if(class'KFGameEngine'.static.IsFullScreenMoviePlaying())
	{
		class'WorldInfo'.static.GetWorldInfo().TimerHelper.SetTimer(0.1f, false, 'DelayedShowDisconnectMessage', self);
	}
	else
	{
		DelayedOpenPopup(ENotification, EDPPID_JoinFailure,
			Localize("Notifications", "ConnectionLostTitle",   "KFGameConsole"),
			Localize("Notifications", class'WorldInfo'.static.IsConsoleBuild(CONSOLE_Durango) ? "ConnectionLostMessageLive" : "ConnectionLostMessage", "KFGameConsole"),
			class'KFCommon_LocalizedStrings'.default.OKString);
	}
}

//function DelayedOpenPopup( EPopUpType PopUpType, string TitleString, string DescriptionString,
//	string LeftButtonString, optional int Priority = 0)
function DelayedOpenPopup( EPopUpType PopUpType, int PopupPriority, string TitleString, string DescriptionString,
	optional string LeftButtonString,
	optional string RightButtonString,
	optional delegate<PendingLeftButtonDelegate>LeftButtonDelegate,
	optional delegate<PendingRightButtonDelegate>RightButtonDelegate,
	optional string MiddleButtonString,
	optional delegate<PendingMiddleButtonDelegate>MiddleButtonDelegate,
	optional name OverridingSoundEffect
	)
{
	local DelayedPopup Popup;
	local int i;

	Popup.PopupType = PopUpType;
	Popup.TitleString = TitleString;
	Popup.DescriptionString = DescriptionString;
	Popup.LeftButtonString = LeftButtonString;
	Popup.RightButtonString = RightButtonString;
	Popup.LeftButtonDelegate = LeftButtonDelegate;
	Popup.RightButtonDelegate = RightButtonDelegate;
	Popup.MiddleButtonString = MiddleButtonString;
	Popup.MiddleButtonDelegate = MiddleButtonDelegate;
	Popup.OverridingSoundEffect = OverridingSoundEffect;
	Popup.Priority = PopupPriority;


	// Special Case - RegionBest Popup replaces RegionWait popup
	if(PopupPriority == EDPPID_RegionBest
		&& DelayedPopups[DelayedPopups.Length - 1].Priority == EDPPID_RegionWait)
	{
		UnloadCurrentPopup();
	}
	// Check to see if the new one is more important, usurper case.
	else if(CurrentPopup != none && DelayedPopups.Length > 0)
	{
		if(DelayedPopups[DelayedPopups.Length - 1].Priority < PopupPriority)
		{
			DelayedPopups[DelayedPopups.Length - 1].bShown = false;
		}
	}

	// Start at Delayed Popups and look at previous elements, back element was already checked in usurper case
	for(i = DelayedPopups.Length; i > 0; --i)
	{
		// A message of this specific priority was already set, so we just display that to prevent the same popup from being queued multiple times.
		if(PopupPriority > 0 && PopupPriority == DelayedPopups[i - 1].Priority)
		{
			;
			return;
		}

		if(DelayedPopups[i - 1].Priority <= PopupPriority)
		{
			DelayedPopups.InsertItem(i, Popup);
			class'WorldInfo'.static.GetWorldInfo().TimerHelper.SetTimer(0.1f, false, 'ShowDelayedPopupMessage', self);
			return;
		}
	}

	// Empty case, simply insert and show
	DelayedPopups.InsertItem(0, Popup);
	class'WorldInfo'.static.GetWorldInfo().TimerHelper.SetTimer(0.1f, false, 'ShowDelayedPopupMessage', self);
}

function ShowDelayedPopupMessage()
{
	if(class'KFGameEngine'.static.IsFullScreenMoviePlaying() || (CurrentMenu == IISMenu && class'WorldInfo'.static.IsConsoleBuild(CONSOLE_Orbis)) )
	{
		class'WorldInfo'.static.GetWorldInfo().TimerHelper.SetTimer(0.1f, false, 'ShowDelayedPopupMessage', self);
		return;
	}

	if(DelayedPopups.Length > 0 && !DelayedPopups[DelayedPopups.Length - 1].bShown)
	{
		OpenPopup(	DelayedPopups[DelayedPopups.Length - 1].PopUpType,
					DelayedPopups[DelayedPopups.Length - 1].TitleString,
					DelayedPopups[DelayedPopups.Length - 1].DescriptionString,
					DelayedPopups[DelayedPopups.Length - 1].LeftButtonString,
					DelayedPopups[DelayedPopups.Length - 1].RightButtonString,
					DelayedPopups[DelayedPopups.Length - 1].LeftButtonDelegate,
					DelayedPopups[DelayedPopups.Length - 1].RightButtonDelegate,
					DelayedPopups[DelayedPopups.Length - 1].MiddleButtonString,
					DelayedPopups[DelayedPopups.Length - 1].MiddleButtonDelegate,
					DelayedPopups[DelayedPopups.Length - 1].OverridingSoundEffect);

		// Setting shown after OpenPopup, in case OpenPopup closes a usurped popup
		DelayedPopups[DelayedPopups.Length - 1].bShown = true;
	}
}
//@HSL_END

/** Skip the UI Lobby if we are using the command line or in the editor */
function bool CheckSkipLobby()
{
	/** if -skiplobby is added to the command line, skip past the lobby menu and spawn as a random perk */
	if (!bAfterLobby && (class'KFGameEngine'.static.CheckSkipLobby() || class'KFGameEngine'.static.IsEditor()))
	{
		if (KFPlayerController( GetPC() ) != none)
		{
			KFPlayerController( GetPC() ).SkipLobby();
			bAfterLobby = true;
			CloseMenus(true);
			return true;
		}
	}
	return false;
}

/** Ties the GFxClikWidget variables to the .swf components and handles events */
event bool WidgetInitialized(name WidgetName, name WidgetPath, GFxObject Widget)
{
	local bool bHandled;

	bHandled = true;

	LogInternal("WidgetInitialized - Menu: " @WidgetName,'DevGFxUI');
	switch ( WidgetName )
	{
		case ( 'root1' ):
			if ( ManagerObject == none )
			{
				ManagerObject = Widget;
				// Let the menuManager know if we are on console.
				ManagerObject.SetBool("bConsoleBuild",class'WorldInfo'.static.IsConsoleBuild());
			}
		break;
		case ( 'doshVaultMenu' ):
			if(DoshVaultMenu == none)
			{
				DoshVaultMenu = KFGFxMenu_DoshVault(Widget);
				DoshVaultMenu.InitializeMenu( self );
			}
			OnMenuOpen( WidgetPath, DoshVaultMenu );
		break;
		case ( 'exitMenu' ):
			if( ExitMenu == none )
			{
				ExitMenu = KFGFxMenu_Exit( Widget );
				ExitMenu.InitializeMenu( self );
			}
			OnMenuOpen( WidgetPath, ExitMenu );
			break;
		case ( 'startMenu' ):
			if (StartMenu == none)
			{
				StartMenu = KFGFxMenu_StartGame( Widget );
				StartMenu.InitializeMenu(self);
			}
			OnMenuOpen( WidgetPath, StartMenu );
		break;
		case ( 'PerksMenu' ):
			if (PerksMenu == none)
			{
				PerksMenu = KFGFxMenu_Perks( Widget );
				PerksMenu.InitializeMenu(self);
			}
			OnMenuOpen( WidgetPath, PerksMenu );
		break;
		case ( 'serverBrowserMenu' ):
			if (ServerBrowserMenu == none)
			{
				ServerBrowserMenu = KFGFxMenu_ServerBrowser( Widget );
				ServerBrowserMenu.InitializeMenu(self);
			}
			OnMenuOpen( WidgetPath, ServerBrowserMenu );
		break;
		case ( 'gearMenu' ):
			if( MenuBarWidget != none && !MenuBarWidget.CanUseGearButton(GetPC(), self) )
			{
				break;
			}
			if (GearMenu == none)
			{
				GearMenu = KFGFxMenu_Gear( Widget );
				GearMenu.InitializeMenu(self);
			}
			OnMenuOpen( WidgetPath, GearMenu );
		break;
		case ( 'inventoryMenu' ):
			if (InventoryMenu == none)
			{
				InventoryMenu = KFGFxMenu_Inventory( Widget );
				InventoryMenu.InitializeMenu(self);
			}
			OnMenuOpen( WidgetPath, InventoryMenu );
		break;

		case ( 'storeMenu' ):
			if (StoreMenu == none)
			{
				StoreMenu = KFGFxMenu_Store( Widget );
				StoreMenu.InitializeMenu(self);
			}
			OnMenuOpen( WidgetPath, StoreMenu );
		break;
		case ('optionsSelectionMenu'):
			if (OptionsSelectionMenu == none)
			{
				OptionsSelectionMenu = KFGFxOptionsMenu_Selection( Widget );
				OptionsSelectionMenu.InitializeMenu(self);
			}
			OnMenuOpen( WidgetPath, OptionsSelectionMenu );
		break;
		case ('optionsControlsMenu'):
			if (OptionsControlsMenu == none)
			{
				OptionsControlsMenu = KFGFxOptionsMenu_Controls( Widget );
				OptionsControlsMenu.InitializeMenu(self);
			}
			OnMenuOpen( WidgetPath, OptionsControlsMenu );
			break;
		case ('optionsAudioMenu'):
			if (OptionsAudioMenu == none)
			{
				OptionsAudioMenu = KFGFxOptionsMenu_Audio( Widget );
				OptionsAudioMenu.InitializeMenu(self);
			}
			OnMenuOpen( WidgetPath, OptionsAudioMenu );
		break;
		case ('optionsGraphicsMenu'):
			if (OptionsGraphicsMenu == none)
			{
				OptionsGraphicsMenu = KFGFxOptionsMenu_Graphics( Widget );
				OptionsGraphicsMenu.InitializeMenu(self);
			}
			OnMenuOpen( WidgetPath, OptionsGraphicsMenu );
			break;
		case ('optionsGameSettingsMenu'):
			if (OptionsGameSettingsMenu == none)
			{
				OptionsGameSettingsMenu = KFGFxOptionsMenu_GameSettings( Widget );
				OptionsGameSettingsMenu.InitializeMenu(self);
			}
			OnMenuOpen( WidgetPath, OptionsGameSettingsMenu );
			break;
		case ( 'traderMenu' ):
			if (TraderMenu == none)
			{
				TraderMenu = KFGFxMenu_Trader(Widget);
				TraderMenu.InitializeMenu(self);
			}
			OnMenuOpen(WidgetPath, TraderMenu);
		break;
		case ( 'postGameMenu' ):
			if( PostGameMenu == none )
			{
				PostGameMenu = KFGFxMenu_PostGameReport( Widget );
				PostGameMenu.InitializeMenu( self );
			}
			OnMenuOpen(WidgetPath, PostGameMenu);
			break;
		case ( 'IISMenu' ):
			if( IISMenu == none )
			{
				IISMenu = KFGFxMenu_IIS( Widget );
				IISMenu.InitializeMenu( self );
			}
			OnMenuOpen( WidgetPath, IISMenu );
			break;
		case ( 'MenuBarWidget' ):
			if ( MenuBarWidget == none )
			{
		        MenuBarWidget = KFGFxWidget_MenuBar( Widget );
		        MenuBarWidget.InitializeMenu( self );
		        MenuBarWidget.InitializeCurrentMenu(UI_Start);
			}
		break;
		case ( 'ButtonPromptWidgetContainer' ):
			if ( ButtonPromptWidget == none )
			{
		        ButtonPromptWidget = KFGFxWidget_ButtonPrompt( Widget );
		        ButtonPromptWidget.InitializeMenu( self );
			}
		break;
		case ( 'partyWidget' ):
			if ( PartyWidget == none )
			{
				if ( class'WorldInfo'.static.IsMenuLevel() )
				{
		        	PartyWidget = KFGFxWidget_PartyMainMenu( Widget );
		    	}
		    	else
		    	{
		        	PartyWidget = KFGFxWidget_PartyInGame( Widget );
		        	PartyWidget.StartCountdown(KFGameReplicationInfo(GetPC().WorldInfo.GRI).RemainingTime, false);
		    	}
		    	PartyWidget.Manager = self;
		        PartyWidget.InitializeWidget();
			}
		break;
		case ( 'ChatBoxWidget' ):
			if(PartyWidget != none)
			{
				if(PartyWidget.PartyChatWidget == none)
				{
					PartyWidget.PartyChatWidget = KFGFxHUD_ChatBoxWidget(Widget);
					PartyWidget.PartyChatWidget.Init();
				}
			}
		break;
        case  'GammaPopup':
        case  'ConnectionErrorPopup':
        case  'ConfirmationPopup':
        case  'InputPromptPopup':
            InitializePopup( WidgetPath, KFGFxObject_Popup( Widget ) );
        break;
		default:
			bHandled = false;
	}

	return bHandled;
}

function StatsInitialized()
{
	if(StartMenu != none && StartMenu.MissionObjectiveContainer != none)
	{
		StartMenu.MissionObjectiveContainer.FullRefresh();
	}

	bStatsInitialized = true;

	//REFRESH ALL THE THINGS!!!


}


function AllowCloseMenu()
{
	bCanCloseMenu = true;
}


function ForceUpdateNextFrame()
{
	// Forces the update on the next frame
	class'WorldInfo'.static.GetWorldInfo().TimerHelper.SetTimer( 0.01, false, nameof(OnForceUpdate), self );
}


function OnForceUpdate()
{
	OneSecondLoop();
	// Make sure this doesn't trigger again for another second
	class'WorldInfo'.static.GetWorldInfo().TimerHelper.SetTimer( 1.0, true, nameof(OneSecondLoop), self );
}


/** Call this every and our current menu every second */
function OneSecondLoop()
{
	if (bMenusOpen)
	{
	 	if ( CurrentMenu != none )
	 	{
			CurrentMenu.OneSecondLoop();
		}
		if ( PartyWidget != none )
		{
			PartyWidget.OneSecondLoop();
		}
		if( PostGameMenu != none )
		{
			PostGameMenu.OneSecondLoop();
		}
		if (IISMenu != none)
		{
			IISMenu.OneSecondLoop();
		}
	}
}

/*********************************************************************************************
* @name Opening / Closing
********************************************************************************************* */

/** Pause/unpause the game when menus are opened */
function SetMenusOpen(bool bIsOpen)
{
	local KFGFxHudWrapper HudWrapper;

	// Pause our 1 second loop if the menu isn't open
	//`TimerHelper.PauseTimer( !bIsOpen, nameof(OneSecondLoop), self ); // not really needed since OneSecondLoop() checks bMenusOpen
	SetPause( !bIsOpen );
	bMenusOpen = bIsOpen;
	bMenusActive = bIsOpen; //@HSL - JRO - 6/21/2016 - Mostly just useful for when bIsOpen is true. Set to false elsewhere, as this gets called too late to be useful in that case
	SetMovieCanReceiveInput(bIsOpen);
	if(bUsingGamepad)
	{
		FlushPlayerInput(false);
	}
	HudWrapper = KFGFxHudWrapper(HUD);
	if( HudWrapper != none && HudWrapper.HudMovie != none )
	{
		HudWrapper.HudMovie.UpdateVisibilityState();
	}
}

/** Tell flash we want to open a new menu */
function OpenMenu( byte NewMenuIndex, optional bool bShowWidgets = true )
{
	local EStartMenuState TempMenuState;
	local WorldInfo WI;
	local PlayerController PC;
	local string MenuPath;

	PC = GetPC();
	LogInternal("open menu: " @NewMenuIndex); 
	if(PC.WorldInfo.TimeSeconds - LastForceCloseTime < AllowMenusOpenAfterForceCloseTime && LastForceCloseTime != 0)
	{
		return;
	}

	if( NewMenuIndex == UI_Gear )
	{
		if( MenuBarWidget != none && !MenuBarWidget.CanUseGearButton(PC, self) )
		{
			return;
		}
	}


	if(CurrentMenuIndex == UI_Dosh_Vault)
	{
		if(DoshVaultMenu != none && !DoshVaultMenu.CanCloseVaultMenu())
		{
			MenuBarWidget.UpdateMenu(CurrentMenuIndex);
			return;
		}
	}

	WI = class'WorldInfo'.static.GetWorldInfo();

	if(NewMenuIndex == UI_PostGame)
	{
		UnloadCurrentPopup();
	}

	if(!bMenusOpen)
	{
		SetMenusOpen(true);
	}

	if(KickVotePRI != none)
	{
		ShowKickVote(KickVotePRI);
	}

	if(SkipTraderVotePRI != none && NewMenuIndex != UI_Trader)
	{
		ShowSkipTraderVote(SkipTraderVotePRI);
	}

	// Close our last menu if we are already in a menu
	if (bMenusOpen && NewMenuIndex != CurrentMenuIndex && CurrentMenu != none)
	{
		CurrentMenu.OnClose();
		CurrentMenu = none;
	}

	if (CurrentMenuIndex == UI_IIS && NewMenuIndex == UI_Start)
	{
		IISMovie.Stop();
		ManagerObject.SetBool("IISMovieVisible", false);
		CurrentBackgroundMovie.Play();
		ManagerObject.SetBool("backgroundVisible", true);
	}

	//@HSL_BEGIN - JRO - 6/30/2016 - PSN disconnect/logout
	if (NewMenuIndex == UI_IIS)
	{
		CurrentBackgroundMovie.Stop();
		ManagerObject.SetBool("backgroundVisible", false);
		IISMovie.Play();
		ManagerObject.SetBool("IISMovieVisible", true);
		class'Engine'.static.GetEngine().GameViewport.bAllowInputFromMultipleControllers = true;
		SetWidgetsVisible( false );
	}
	//@HSL_END

	if (NewMenuIndex != UI_Trader)
	{
		CurrentMenuIndex = NewMenuIndex;
	}
	else
	{
		PlaySoundFromTheme('TRADER_OPEN_MENU', 'UI');

		// fix for auto-close when use/close are bound to the same key
		if( PC != none && PC.PlayerInput != none )
		{
			PC.PlayerInput.ResetInput();
		}

		// The trader menu is not opened through ToggleMenus, set the timer to mark when the menu is completely open
		bCanCloseMenu = false;
		class'WorldInfo'.static.GetWorldInfo().TimerHelper.SetTimer( 0.5, false, nameof(AllowCloseMenu), self );
	}

	if(CurrentMenuIndex == UI_Start)
	{
		if (class'WorldInfo'.Static.IsMenuLevel() && OnlineSub != none && !OnlineSub.IsGameOwned() && class'WorldInfo'.static.IsConsoleBuild(CONSOLE_Orbis) && !bDisplayedInitialFreePopUp)
		{
			if (OnlineSub.CanCheckFreeTrialState() && !OnlineSub.IsFreeTrialPeriodActive())
			{
				bDisplayedInitialFreePopUp = true;
				HandleFreeTrialError(FTN_BuyGame);
			}

			if (!OnlineSub.CanCheckFreeTrialState())
			{
				bDisplayedInitialFreePopUp = true;
				HandleFreeTrialError(FTN_NetworkCheckFailed);
			}
		}

		if (StartMenu != none)
		{
			TempMenuState = EStartMenuState(StartMenu.GetStartMenuState());
			if (TempMenuState >= EOverview  && !IsInLobby() && WI.IsMenuLevel())
			{
				if (StartMenu != none)
				{
					StartMenu.SetOverview();
				}
			}
			else
			{
				SetStartMenuState(TempMenuState);
			}
		}
	}

	UpdateMenuBar();
	if ( class'WorldInfo'.static.IsConsoleBuild() && MenuSWFPaths[NewMenuIndex].ConsoleSWFPath != "" )
	{
		MenuPath = MenuSWFPaths[NewMenuIndex].ConsoleSWFPath;
	}
	else
	{
		MenuPath = MenuSWFPaths[NewMenuIndex].BaseSWFPath;
	}
	LoadMenu( MenuPath, bShowWidgets );
}

/** Tells actionscript which .swf to open up */
function LoadMenu(string Path, bool bShowWidgets)
{
	ManagerObject.ActionScriptVoid("loadCurrentMenu");
}

/** Tells actionscript which widget to load */
function LoadWidgets( array<string> Paths)
{
	ManagerObject.ActionScriptVoid("loadWidgets");
}

/** Called once the menu has been loaded in and exists */
function OnMenuOpen( name WidgetPath, KFGFxObject_Menu Widget )
{
	CurrentMenu = Widget;
	CurrentMenu.OnOpen();

	SetWidgetPathBinding( Widget, WidgetPath );
	if(CurrentPopup == none)
	{
		// This allows External Interface calls from AS to come through on the newly created object
	   SetExternalInterface( Widget );
    }

	ConditionalPauseGame(true);
	SetHUDVisiblity(false);
}

/** closes the current menu and makes the HUD visible */
function ClosePostGameMenu()
{
	if(CurrentMenu == PostGameMenu)
	{
		CloseMenus();
	}
}
function CloseMenus(optional bool bForceClose=false)
{
	LogInternal("("$Name$") KFGfxMoviePlayer_Manager::"$GetStateName()$":"$GetFuncName()@"PartyWidget:'"$PartyWidget$"'"@"bAfterLobby:'"$bAfterLobby$"'"@"bForceClose:'"$bForceClose$"'");

	if ( (bMenusOpen && bCanCloseMenu) || bForceClose)
	{
		UnloadCurrentPopup();

		if ( !bAfterLobby && PartyWidget != none || GetPC() == none || GetPC().WorldInfo.GRI == none || GetPC().WorldInfo.GRI.bMatchIsOver )
		{
			LogInternal("Setting PartyWidget Visibility false, bAfterLobby = true");
			PartyWidget.SetReadyButtonVisibility(false);
		 	bAfterLobby = true;
		}

		if (CurrentMenu != none)
		{
			if( CurrentMenu == TraderMenu )
			{
				PlaySoundFromTheme('TRADER_EXIT_BUTTON_CLICK', 'UI');
			}

			LogInternal("("$Name$") KFGfxMoviePlayer_Manager::"$GetStateName()$":"$GetFuncName()@"CurrentMenu:'"$CurrentMenu$"'");
			CurrentMenu.OnClose();
			CurrentMenu = none;
		}

		bMenusActive = false; //@HSL - JRO - 6/21/2016 - Make sure this is set before the pause conditions are checked
		ConditionalPauseGame(false);
		SetMenuVisibility( false );
		SetHUDVisiblity( true) ;
	}
}

/** Called when the movie player is closed */
event OnClose()
{
	CloseMenus();
	if (!CurrentBackgroundMovie.Stopped)
	{
		CurrentBackgroundMovie.Stop();
	}
}

/** Called after OnClose */
event OnCleanup()
{
	Super.OnCleanup();

	if( OnlineSub != none )
	{
		OnlineSub.ClearAllInventoryReadCompleteDelegates();
	}

	// Nuke all inventory read delegates from playfab
	if( PlayfabInter != none )
	{
		PlayfabInter.InventoryReadDelegates.Length = 0;
	}
	GetGameViewportClient().HandleInputAxis = none;
}

/** Opens / Closes the menus on input */
function bool ToggleMenus()
{
	LogInternal("("$Name$") KFGfxMoviePlayer_Manager::"$GetStateName()$":"$GetFuncName()@"bMenusOpen:'"$bMenusOpen$"'"@"HUD.bShowHUD:'"$HUD.bShowHUD$"'"@"bCanCloseMenu:'"$bCanCloseMenu$"'"@"bPostGameState:'"$bPostGameState$"'"@"CurrentMenuIndex:'"$CurrentMenuIndex$"'");
	if (!bMenusOpen || HUD.bShowHUD)
	{
		ManagerObject.SetBool("bOpenedInGame",true);
		if (CurrentMenuIndex >= MenuSWFPaths.length)
		{
			LaunchMenus();
		}
		else
		{
			LogInternal("("$Name$") KFGfxMoviePlayer_Manager::"$GetStateName()$":"$GetFuncName());
			OpenMenu(UI_Perks);
			UpdateMenuBar();
			if (PartyWidget != none)
			{
				PartyWidget.UpdateReadyButtonVisibility();
			}
		}

		// set the timer to mark when the menu is completely open and we can close the menu down
		bCanCloseMenu = false;
		class'WorldInfo'.static.GetWorldInfo().TimerHelper.SetTimer( 0.5, false, nameof(AllowCloseMenu), self );
		class'WorldInfo'.static.GetWorldInfo().TimerHelper.SetTimer( 0.15, false, nameof(PlayOpeningSound), self );//Delay due to pause
	}
	else if(bCanCloseMenu) //check to make sure
	{
		if(GetPC().WorldInfo.GRI.bMatchIsOver && !bAfterLobby)
		{
			return false; // we are still in the lobby and the game has not proceeded to a point where we can use the esc key
		}

		if (CurrentMenu != TraderMenu)
		{
			PlaySoundFromTheme('MAINMENU_CLOSE', 'UI');
		}

    	CloseMenus();
	}
	else if(bPostGameState)
	{
		if(CurrentMenu == PostGameMenu)
		{
			ManagerObject.SetBool("bOpenedInGame",true);
			bMenusOpen = false;
			OpenMenu(UI_Perks);
			SetWidgetsVisible(true);
		}
		else
		{
			ManagerObject.SetBool("bOpenedInGame",false);
			OpenMenu(UI_PostGame);
			SetWidgetsVisible(false);
		}
	}

	return false;
}

function PlayOpeningSound()
{
	PlaySoundFromTheme('MainMenu_Open', SoundThemeName);
}

/** Called when the menu has finished playing its closing animation */
event MenusFinishedClosing()
{
	if( bMenusOpen )
	{
		SetMenusOpen(false);
	}
}

//This is to force the widgets visible.  AKA a special case for the AAR
function SetWidgetsVisible( bool bVisible )
{
	LogInternal("("$Name$") KFGfxMoviePlayer_Manager::"$GetStateName()$":"$GetFuncName()@"bVisible:'"$bVisible$"'");
	ManagerObject.ActionScriptVoid("setWidgetsVisiblity");
}

/** Set the visibility of the current menus */
function SetMenuVisibility( bool bVisible )
{
	//`log(`location@`showvar(bVisible));
	//ScriptTrace();
	ManagerObject.ActionScriptVoid("setMenuVisibility");
	//SetMovieCanReceiveInput(bVisible);
}

/** Set the visibility of the HUD and change whether input can be taken */
function SetHUDVisiblity(bool bIsVisible)
{
	if (HUD != none)
	{
		HUD.SetVisible( bIsVisible );
	}

	bCaptureInput = !bIsVisible;

	if( GetPC() != none && GetPC().PlayerInput != none )
	{
		GetPC().PlayerInput.ResetInput();
	}
}


/** Called at the start of trader time */
function OnTraderTimeStart()
{
	if(CurrentMenu != none)
	{
		CurrentMenu.OnTraderTimeStart();
	}
}

/** Called when the round ends */
function OnRoundOver()
{
	if( CurrentMenu != none )
	{
		CurrentMenu.OnRoundOver();
	}
}

/** Closes the trader menu if it's open */
function CloseTraderMenu()
{
	if(CurrentMenu == TraderMenu)
	{
		CloseMenus();
	}
}

/*********************************************************************************************
* @name Server Welcome Screen
********************************************************************************************* */

function ShowWelcomeScreen()
{
	if(StartMenu != none && StartMenu.OverviewContainer != none)
	{
		StartMenu.OverviewContainer.ShowWelcomeScreen();
	}
}

/*********************************************************************************************
* @name Popups
********************************************************************************************* */

function NotifyUnsuccessfulSearch()
{
	if(CurrentMenu == StartMenu)
	{
		if(StartMenu.OptionsComponent != none)
		{
			StartMenu.OptionsComponent.SetSearching(false);
		}
		SetSearchingForMatch(false);
		DelayedOpenPopup(EConfirmation, EDPPID_Misc,FailedSearchTitleString, FailedSearchString, BrowseServersString, class'KFCommon_LocalizedStrings'.default.OKString, StartMenu.Callback_OpenServerBrowser );
	}
}

function AssignPendingLeftButtonDelegate( delegate<PendingLeftButtonDelegate> LeftDelegate)
{
	PendingLeftButtonDelegate = LeftDelegate;
}

function AssignPendingMiddleButtonDelegate( delegate<PendingMiddleButtonDelegate> MiddleDelegate)
{
	PendingMiddleButtonDelegate = MiddleDelegate;
}

function AssignPendingRightButtonDelegate( delegate<PendingRightButtonDelegate> RightDelegate)
{
	PendingRightButtonDelegate = RightDelegate;
}

function InitializePopup(name WidgetPath, KFGFxObject_Popup Widget )
{
	CurrentPopup =  Widget ;

	if(CurrentPopup != none)
	{
		SetWidgetPathBinding( Widget, WidgetPath );
		SetExternalInterface( Widget );
		CurrentPopup.InitializePopup( self );
		CurrentPopup.AssignLeftButtonDelegate(PendingLeftButtonDelegate);
		CurrentPopup.AssignMiddleButtonDelegate(PendingMiddleButtonDelegate);
		CurrentPopup.AssignRightButtonDelegate(PendingRightButtonDelegate);

		PendingLeftButtonDelegate = none;
		PendingMiddleButtonDelegate = none;
		PendingRightButtonDelegate = none;
	}
}

/** Open the popup based on it's pop up type and set the response delegates to its buttons */
private function OpenPopup( EPopUpType PopUpType, string TitleString, string DescriptionString,
	optional string LeftButtonString,
	optional string RightButtonString,
	optional delegate<PendingLeftButtonDelegate>LeftButtonDelegate,
	optional delegate<PendingRightButtonDelegate>RightButtonDelegate,
	optional string MiddleButtonString,
	optional delegate<PendingMiddleButtonDelegate>MiddleButtonDelegate,
	optional name OverridingSoundEffect
	)
{
	//@HSL_BEGIN - AGM
	// Don't do this, in case we are actually changing the title, or callbacks associated with the popup.
	//if(CurrentPopup != none && PopUpType == CurrentPopUpType )
	//{
	//	CurrentPopUp.UpdateDescritionText(DescriptionString);
	//}
	//else
	//@HSL_END
	if(PopupData[PopUpType].SWFPath != "")
	{
		UnloadCurrentPopup();
		CurrentPopUpType = PopUpType;

		LoadPopup(PopUpData[PopUpType].SWFPath, TitleString, DescriptionString,
         			LeftButtonString,
        			RightButtonString,
        			MiddleButtonString);

		bCaptureInput = true;
		bBlurLesserMovies=true;

		AssignPendingLeftButtonDelegate(LeftButtonDelegate);
		AssignPendingMiddleButtonDelegate(MiddleButtonDelegate);
		AssignPendingRightButtonDelegate(RightButtonDelegate);

		// Play Alert Sound
		if( OverridingSoundEffect == '' )
		{
			PlaySoundFromTheme('Alert_Popup', SoundThemeName);
		}
		else
		{
			PlaySoundFromTheme(OverridingSoundEffect, SoundThemeName);
		}

		if (!bMenusOpen)
		{
			ToggleMenus();
		}
	}
}

/** Tell actionscript to load the popup */
function LoadPopup( string Path, optional string TitleString, optional string DescriptionString,
    						optional string LeftButtonString, optional string RightButtonString, optional string MiddleButtonString)
{
	ManagerObject.ActionScriptVoid("loadCurrentPopup");
	currentFocus();
}

/** Tell actionscript to remove this popup */
function UnloadCurrentPopup()
{
	ManagerObject.ActionScriptVoid("unloadCurrentPopup");

	//`log(`location@`showvar(CurrentPopup));

	if ( CurrentPopup != none )
	{
		CurrentPopup.OnClosed();
		CurrentPopup = none;
		CurrentPopUpType = EPopUpMax;
		bBlurLesserMovies=false;

        // If we got a popup while no menu was active, enable input again
        if( CurrentMenu == none )
        {
        	bCaptureInput = false;
    	}
	}

	if( DelayedPopups.Length > 0 )
	{
		if(DelayedPopups[DelayedPopups.Length - 1].bShown)
		{
			DelayedPopups.Remove(DelayedPopups.Length - 1, 1);
		}
	}

	class'WorldInfo'.static.GetWorldInfo().TimerHelper.SetTimer(0.1f, false, 'ShowDelayedPopupMessage', self);
}

function LoadPopups( array<string> Paths)
{
	ManagerObject.ActionScriptVoid("loadPopups");
}

function UnloadPopups()
{
    ManagerObject.ActionScriptVoid("unloadPopups");
}

/** Try to pause the game if the escape menu is opened. See also bPauseGameWhileActive */
function ConditionalPauseGame(bool bPause)
{
	local WorldInfo WI;

	WI = class'WorldInfo'.static.GetWorldInfo();
	if( WI.NetMode == NM_Standalone )
	{
		// Uses PlayersOnly instead of the normal PauseGame so that we can still use the gear menu.
		if ( bPause )
		{
			if ( WI.IsMenuLevel() || !bAfterLobby || CurrentMenu == TraderMenu || GetPC() == none || GetPC().WorldInfo.GRI.bMatchIsOver )
			{
				return;
			}

			GetPC().SetPause(true, CanUnpauseMenuClosed); //@HSL - JRO - 6/21/2016 - Giving pause menu a CanUnpause delegate so it can play nicely with controller disconnects
		}
		else if( GetPC() != none )
		{
			if(!bCanCloseMenu)
			{
				LogInternal("("$Name$") KFGfxMoviePlayer_Manager::"$GetStateName()$":"$GetFuncName()@"We were going to unpause here... but maybe that's not correct");
			}
			else
			{
				GetPC().SetPause(false);
			}
		}
	}
}

//@HSL_BEGIN - JRO - 6/21/2016 - Giving pause menu a CanUnpause delegate so it can play nicely with controller disconnects
function bool CanUnpauseMenuClosed()
{
	LogInternal("JOPILA - CanUnpauseMenuClosed"@bMenusActive);
	return !bMenusActive;
}
//@HSL_END

function ClientRecieveNewTeam();

/*********************************************************************************************
`* Game Lobby
********************************************************************************************* */

event SoloGameMenuOpened()
{
	if (PartyWidget != none)
	{
		PartyWidget.SoloGameMenuOpened();
	}
}

/** Called when we exit or join a lobby */
function OnLobbyStatusChanged(bool bIsInLobby)
{
	bPlayerInLobby = bIsInLobby;

	if( PartyWidget != none )
	{
		PartyWidget.UpdateInLobby(bIsInLobby);
	}
	if(CurrentMenu != none)
	{
		CurrentMenu.OnLobbyStatusChanged(bIsInLobby);
	}
	UpdateMenuBar();
}

/** Returns whether we are currently in a lobby */
function bool IsInLobby()
{
	if(OnlineLobby != none)
	{
		return OnlineLobby.IsInLobby();
	}
	return bPlayerInLobby;
}

function OnLoginFailed()
{
	if(PartyWidget != none)
	{
		PartyWidget.SetBool("bShowWaitingSpinner", false);
		PartyWidget.SetBool("bInParty", false);
	}
}

/*********************************************************************************************
`* Start Menu States
********************************************************************************************* */

/** Return whether we are able to perform multiplayer actions (like inviting players to a party) */
function bool GetMultiplayerMenuActive()
{
	if(CurrentMenuIndex == UI_ServerBrowserMenu)
	{
		return true;
	}

	if(StartMenu != none && CurrentMenuIndex == UI_Start && StartMenu.GetStartMenuState() == EMatchmaking)
	{
		return true;
	}
	return false;
}

function EStartMenuState GetStartMenuState()
{
	if( StartMenu != none )
	{
		return EStartMenuState(StartMenu.GetStartMenuState());
	}

	return EMatchmaking;
}

function SetStartMenuState(EStartMenuState MenuState, optional bool bChangeMenu = false)
{
	StartMenuState = MenuState;
	if (bChangeMenu) 
	{
		StartMenu.SetInt("externalMenuState", MenuState);
	}
	
	UpdateMenuBar();
}

function SetSearchingForMatch(bool bSearching)
{
	bSearchingForGame = bSearching;
	//notify party widget
	if(PartyWidget != none)
	{
		PartyWidget.SendSearching();
	}
}

function UpdateMenuBar()
{
	if( MenuBarWidget != none)
	{
		MenuBarWidget.UpdateMenu(CurrentMenuIndex);
	}
}

function HandleSteamLobbyLeaderTakeOver(UniqueNetId AdminId)
{
	if( StartMenu != none )
	{
		StartMenu.HandleSteamLobbyLeaderTakeOver(AdminId);
	}
}

function ChangeOverviewState(bool bLeaderIsOnServerBrowser)
{
	if( StartMenu != none )
	{
		StartMenu.bLeaderInServerBrowser = bLeaderIsOnServerBrowser;
	}
}

/*********************************************************************************************
* @name Controls
********************************************************************************************* */

/* This is only used for the controller to switch between different components in the trader menu
 and open / close the perk selector */
event bool FilterButtonInput(int ControllerId, name ButtonName, EInputEvent InputEvent)
{
	local KFPlayerReplicationInfo KFPRI;
	local KFGameReplicationInfo KFGRI;
	local bool bLoading;

	KFPRI = KFPlayerReplicationInfo(GetPC().PlayerReplicationInfo);
	KFGRI = KFGameReplicationInfo(GetPC().WorldInfo.GRI);

	if ( class'KFGameEngine'.static.IsFullScreenMoviePlaying() )
	{
		return true;
	}

	// Handle closing out of currently active menu
	if ( (bAfterLobby || GetPC().WorldInfo.GRI.bMatchIsOver) && InputEvent == EInputEvent.IE_Pressed
		&& (ButtonName == 'Escape' || ButtonName == 'XboxTypeS_Start')
		&& bMenusOpen && (bCanCloseMenu || bPostGameState))
	{
		return ToggleMenus();
	}
	else if (InputEvent == EInputEvent.IE_Pressed && bMenusOpen)
	{
		if(ButtonName == 'XboxTypeS_Y')
		{
			if(!KFGRI.bMatchIsOver && !bAfterLobby && !class'WorldInfo'.static.IsMenuLevel() && CurrentPopup == none )
			{
				if(!KFPRI.bReadyToPlay)
				{
					PlaySoundFromTheme('PARTYWIDGET_READYUP_BUTTON_CLICK', 'UI');
				}
				CurrentMenu.Callback_ReadyClicked(!KFPRI.bReadyToPlay);
				PartyWidget.SetBool("bReady", KFPRI.bReadyToPlay);
				PartyWidget.ReadyButton.SetBool("selected", KFPRI.bReadyToPlay);

			}
			else if(KFPRI.bHasSpawnedIn && !KFGRI.bMatchIsOver && KFGRI.bMatchHasBegun && KFGRI.bTraderIsOpen && CurrentMenu != TraderMenu && bMenusOpen)
			{
				CurrentMenu.Callback_ReadyClicked(true);
			}
		}
		else if(ButtonName == 'XboxTypeS_RightThumbstick')
		{
			if(CurrentMenu != none)
			{
				CurrentMenu.OnR3Pressed();
			}
		}
		else
		{
			bLoading = ManagerObject.GetBool("_bLoading"); // Make sure we only allow menu tabbing if we aren't in the process of loading a menu - HSL Fixes (K2P4-1664) and mroe
			if(MenuBarWidget != none && !bLoading)
			{
				if(ButtonName == 'XboxTypeS_RightShoulder')
				{
					MenuBarWidget.CalloutButtonBumperPress(1);
				}
				else if(ButtonName == 'XboxTypeS_LeftShoulder')
				{
					MenuBarWidget.CalloutButtonBumperPress(-1);
				}
			}
		}

	}

		if ( CurrentMenu != none )
		{

			if ( !class'WorldInfo'.static.IsConsoleBuild() )
    		{
				CheckIfUsingGamepad();
			}

			return CurrentMenu.FilterButtonInput( ControllerId, ButtonName, InputEvent );
		}

 	return false;
}

// Checks if our form of input has changed
function CheckIfUsingGamepad()
{
	local bool bGamepad;
	if ( CurrentMenu != none )
	{
	    bGamepad = GetUsingGamepad();
		if ( bUsingGamepad != bGamepad )
		{
			OnInputTypeChanged(bGamepad);
		}
	}
}

function OnInputTypeChanged(bool bGamePad)
{
	ManagerObject.SetBool("bUsingGamepad", bGamepad);
	bUsingGamepad = bGamepad;
}

/** Return whether the player input says we are currently using the gamepad */
function bool GetUsingGamepad()
{
	local PlayerController PC;
	PC = GetPC();

	if( class'WorldInfo'.static.IsConsoleBuild() )
	{
		return true;
	}

    if ( PC == none || PC.PlayerInput == none )
	{
		return false;
	}
	// Always using the gamepad if we are on console.
    return PC.PlayerInput.bUsingGamepad;
}

function UpdateDynamicIgnoreKeys()
{
	local name KeyBindName;
	local int i;

	if (GetPC() == None || KFPlayerInput(GetPC().PlayerInput) == none)
	{
		return;
	}

	//clear old keys
	ClearFocusIgnoreKeys();

	//voipKey
	for(i = 0; i < IgnoredCommands.length; i++)
	{
		KeyBindName = GetKeyBindName(IgnoredCommands[i]);

		AddFocusIgnoreKey(KeyBindName);
	}
}

function name GetKeyBindName(string GBA_Command)
{
	local KFPlayerInput KFInput;
	local KeyBind MyKeyBind;

	KFInput = KFPlayerInput(GetPC().PlayerInput);
	KFInput.GetKeyBindFromCommand(MyKeyBind, GBA_Command, false);

	return MyKeyBind.Name;
}

function bool IsFocusIgnoreKey(string GBA_Command)
{
	if(IgnoredCommands.find(GBA_Command) != -1)
	{
		return true;
	}

	return false;
}

/*********************************************************************************************
* @name Player Events
********************************************************************************************* */

function UpdateVOIP( PlayerReplicationInfo PRI, bool bIsTalking)
{
	if( PartyWidget != none )
	{
		PartyWidget.UpdateVOIP(PRI, bIsTalking);
	}
	if(PostGameMenu != none)
	{
		PostGameMenu.VOIPEventTriggered(PRI, bIsTalking);
	}
}

function RemotePlayerDisconnected( UniqueNetId UniqueId )
{

}

function NotifySpectateStateChanged( bool bIsSpectating )
{
	if( MenuBarWidget != none )
	{
		MenuBarWidget.UpdateGearButtonState();
	}
	if( MenuBarWidget != none )
	{
		MenuBarWidget.UpdateInventoryButtonState();
	}
}

/*********************************************************************************************
* @name Skip Trader Vote
********************************************************************************************* */

function ShowSkipTraderVote(PlayerReplicationInfo PRI)
{
	SkipTraderVotePRI = PRI;
	if(bMenusOpen && CurrentMenu != TraderMenu)
	{
		bSkipTraderVotePopupActive = true;
		DelayedOpenPopup(EConfirmation, EDPPID_Misc, Class'KFGFxWidget_KickVote'.default.VoteSkipTraderString, 
		SkipTraderVotePRI.PlayerName@Class'KFGFxWidget_KickVote'.default.VoteSkipTraderDetailString,
		Class'KFCommon_LocalizedStrings'.default.YesString, Class'KFCommon_LocalizedStrings'.default.NoString, CastYesVoteSkipTrader, CastNoVoteSkipTrader);
	}
}

simulated function HideSkipTraderVote()
{
	if( bSkipTraderVotePopupActive )
	{
		bSkipTraderVotePopupActive = false;
		UnloadCurrentPopup();
	}

	SkipTraderVotePRI = none;
}

function CastYesVoteSkipTrader()
{
	local KFplayerReplicationInfo KFPRI;
	local KFPlayerController KFPC;

	KFPC = KFPlayerController(GetPC());
	if(KFPC != none)
	{
		KFPRI = KFplayerReplicationInfo(KFPC.PlayerReplicationInfo);

		if(KFPRI != none)
		{
			KFPRI.CastSkipTraderVote(KFPRI, true);
		}
	}
}

function CastNoVoteSkipTrader()
{
	local KFplayerReplicationInfo KFPRI;
	local KFPlayerController KFPC;

	KFPC = KFPlayerController(GetPC());
	if(KFPC != none)
	{
		KFPRI = KFplayerReplicationInfo(KFPC.PlayerReplicationInfo);

		if(KFPRI != none)
		{
			KFPRI.CastSkipTraderVote(KFPRI, false);
		}
	}
}

/*********************************************************************************************
* @name Kick Vote
********************************************************************************************* */

function ShowKickVote(PlayerReplicationInfo PRI)
{
	KickVotePRI = PRI;
	if(bMenusOpen)
	{
		bKickVotePopupActive = true;
		DelayedOpenPopup(EConfirmation, EDPPID_Misc, Class'KFGFxWidget_KickVote'.default.VoteKickString, KickVotePRI.PLayerName,
		 Class'KFCommon_LocalizedStrings'.default.YesString, Class'KFCommon_LocalizedStrings'.default.NoString, CastYesVoteKick, CastNoVoteKick);
	}
}

simulated function HideKickVote()
{
	if( bKickVotePopupActive )
	{
		bKickVotePopupActive = false;
		UnloadCurrentPopup();
	}

	KickVotePRI = none;
}

function CastYesVoteKick()
{
	local KFplayerReplicationInfo KFPRI;
	local KFPlayerController KFPC;

	KFPC = KFPlayerController(GetPC());
	if(KFPC != none)
	{
		KFPRI = KFplayerReplicationInfo(KFPC.PlayerReplicationInfo);

		if(KFPRI != none)
		{
			KFPRI.CastKickVote(KFPRI, true);
		}
	}
}

function CastNoVoteKick()
{
	local KFplayerReplicationInfo KFPRI;
	local KFPlayerController KFPC;

	KFPC = KFPlayerController(GetPC());
	if(KFPC != none)
	{
		KFPRI = KFplayerReplicationInfo(KFPC.PlayerReplicationInfo);

		if(KFPRI != none)
		{
			KFPRI.CastKickVote(KFPRI, false);
		}
	}
}


function OpenScreenSizeMovie()
{
	if( ScreenSizeMovie == none )
	{
		ScreenSizeMovie = new class'KFGFxMoviePlayer_ScreenSize';
		ScreenSizeMovie.SetTimingMode(TM_Real);
		ScreenSizeMovie.Init();

		// Set UI scale so the new movie gets adjusted properly
		GetPC().SetUIScale( KFGameEngine(class'Engine'.static.GetEngine()).SafeFrameScale );
	}
}

function CloseScreenSizeMovie()
{
	ScreenSizeMovie.Close();
	ScreenSizeMovie = none;

	// See if we need to show tha gamma screen next
	if( class'WorldInfo'.static.IsConsoleBuild(CONSOLE_Durango) && !bSetGamma && !class'KFGameEngine'.static.CheckSkipGammaCheck() )
	{
		ManagerObject.SetBool("bStartUpGamma", true);   // Let the manager know if we are gamma for start up so we can block backing out of the popup - HSL
		DelayedOpenPopup(EGamma, EDPPID_Gamma, "", Class'KFGFxOptionsMenu_Graphics'.default.AdjustGammaDescription, Class'KFGFxOptionsMenu_Graphics'.default.ResetGammaString, Class'KFGFxOptionsMenu_Graphics'.default.SetGammaString);
	}
}


function UpdateViewportSize( int x, int y, int width, int height )
{
	SetViewport( x, y, width, height );

	if( ScreenSizeMovie != none )
	{
		ScreenSizeMovie.SetViewport( x, y, width, height );
	}
}

function currentFocus()
{
	ManagerObject.ActionScriptVoid("currentFocus");
}

function int GetModeIndex(optional bool bAdjustedIndex = true)
{
	local int SavedModeIndex;

	SavedModeIndex = CachedProfile.GetProfileInt(KFID_SavedModeIndex);
	
	if (!class'GameEngine'.Static.IsGameFullyInstalled() && (SavedModeIndex == EGameMode_Objective || SavedModeIndex == EGameMode_Weekly || SavedModeIndex == EGameMode_Endless))
	{
		CachedProfile.SetProfileSettingValueInt(KFID_SavedModeIndex, EGameMode_Survival);
		return EGameMode_Survival;
	}

	if(StartMenu.OptionsComponent != none && StartMenu.OptionsComponent.bIsSoloGame && bAdjustedIndex)
	{
		// if going multiplayer -> solo, need to subtract to account for the removal of the Vs mode
		if (SavedModeIndex >= EGameMode_VsSurvival)
		{
			return SavedModeIndex - 1;
		}
	}

	return SavedModeIndex;
}

defaultproperties
{
   MenuSWFPaths(0)=(BaseSWFPath="../UI_Menus/StartMenu_SWF.swf")
   MenuSWFPaths(1)=(BaseSWFPath="../UI_Menus/PerksMenu_SWF.swf")
   MenuSWFPaths(2)=(BaseSWFPath="../UI_Menus/GearMenu_SWF.swf")
   MenuSWFPaths(3)=(BaseSWFPath="../UI_Menus/DoshVaultMenu_SWF.swf")
   MenuSWFPaths(4)=(BaseSWFPath="../UI_Menus/InventoryMenu_SWF.swf")
   MenuSWFPaths(5)=(BaseSWFPath="../UI_Menus/StoreMenu_SWF.swf")
   MenuSWFPaths(6)=(BaseSWFPath="../UI_Menus/OptionsSelectionMenu_SWF.swf")
   MenuSWFPaths(7)=(BaseSWFPath="../UI_Menus/ExitMenu_SWF.swf")
   MenuSWFPaths(8)=(BaseSWFPath="../UI_Menus/OptionsControlsMenu_SWF.swf",ConsoleSWFPath="../UI_Menus/OptionsControlsMenu_SWF_Console.swf")
   MenuSWFPaths(9)=(BaseSWFPath="../UI_Menus/OptionsAudioMenu_SWF.swf",ConsoleSWFPath="../UI_Menus/OptionsAudioMenu_SWF_Console.swf")
   MenuSWFPaths(10)=(BaseSWFPath="../UI_Menus/OptionsGraphicsMenu_SWF.swf")
   MenuSWFPaths(11)=(BaseSWFPath="../UI_Menus/OptionsGameSettingsMenu_SWF.swf",ConsoleSWFPath="../UI_Menus/OptionsGameSettingsMenu_SWF_Console.swf")
   MenuSWFPaths(12)=()
   MenuSWFPaths(13)=()
   MenuSWFPaths(14)=(BaseSWFPath="../UI_Menus/PostGameMenu_SWF.swf")
   MenuSWFPaths(15)=(BaseSWFPath="../UI_Menus/TraderMenu_SWF.swf")
   MenuSWFPaths(16)=(BaseSWFPath="../UI_Menus/ServerBrowserMenu_SWF.swf")
   MenuSWFPaths(17)=(BaseSWFPath="../UI_Menus/IISMenu_SWF.swf")
   CurrentMenuIndex=255
   InGamePartyWidgetClass=Class'KFGame.KFGFxWidget_PartyInGame'
   PopupData(0)=(SWFPath="../UI_PopUps/ConfirmationPopup_SWF.swf")
   PopupData(1)=(SWFPath="../UI_PopUps/GammaPopup_SWF.swf")
   PopupData(2)=(SWFPath="../UI_PopUps/ConnectionErrorPopup_SWF.swf")
   PopupData(3)=()
   PopupData(4)=(SWFPath="../UI_PopUps/InputPromptPopup_SWF.swf")
   FailedSearchTitleString="FAILED TO FIND MATCH"
   FailedSearchString="Matchmaking failed to find a match with the options provided. Please broaden your search or consider using the server browser to find a match."
   BrowseServersString="BROWSE SERVERS"
   HasInvitedToGameString=" has invited you to a game"
   JoinGameString="Join Game?"
   WidgetPaths(0)="../UI_Widgets/MenuBarWidget_SWF.swf"
   WidgetPaths(1)="../UI_Widgets/PartyWidget_SWF.swf"
   WidgetPaths(2)="../UI_Widgets/ButtonPromptWidget_SWF.swf"
   BackgroundMovies(0)=TextureMovie'UI_Managers.MenuBG'
   BackgroundMovies(1)=TextureMovie'UI_Managers.MenuBG_Cyberpunk'
   BackgroundMovies(2)=TextureMovie'UI_Managers.SummerSideShowBGMovie'
   BackgroundMovies(3)=TextureMovie'UI_Managers.MenuBG_Halloween'
   BackgroundMovies(4)=TextureMovie'UI_Managers.Menu_Winter'
   IISMovie=TextureMovie'UI_Managers.IIS'
   IgnoredCommands(0)="GBA_VoiceChat"
   SoundThemeName="ButtonSoundTheme"
   MouseInputChangedThreshold=5
   SelectIDOnOpen=-1
   MovieInfo=SwfMovie'UI_Managers.LoaderManager_SWF'
   bAutoPlay=True
   bCaptureInput=True
   SoundThemes(0)=(ThemeName="SoundTheme_DoshVault",Theme=UISoundTheme'SoundsShared_UI.SoundTheme_Crate')
   SoundThemes(1)=(ThemeName="SoundTheme_Crate",Theme=UISoundTheme'SoundsShared_UI.SoundTheme_Crate')
   SoundThemes(2)=(ThemeName="ButtonSoundTheme",Theme=UISoundTheme'SoundsShared_UI.SoundTheme_Buttons')
   SoundThemes(3)=(ThemeName="AAR",Theme=UISoundTheme'SoundsShared_UI.SoundTheme_AAR')
   SoundThemes(4)=(ThemeName="UI",Theme=UISoundTheme'SoundsShared_UI.SoundTheme_UI')
   WidgetBindings(0)=(WidgetName="GammaPopup",WidgetClass=Class'KFGame.KFGFxPopup_Gamma')
   WidgetBindings(1)=(WidgetName="ConnectionErrorPopup",WidgetClass=Class'KFGame.KFGFxPopup_ConnectionError')
   WidgetBindings(2)=(WidgetName="ConfirmationPopup",WidgetClass=Class'KFGame.KFGFxPopup_Confirmation')
   WidgetBindings(3)=(WidgetName="InputPromptPopup",WidgetClass=Class'KFGame.KFGFxPopup_InputPrompt')
   WidgetBindings(4)=(WidgetName="DoshVaultMenu",WidgetClass=Class'KFGame.KFGFxMenu_DoshVault')
   WidgetBindings(5)=(WidgetName="ServerBrowserMenu",WidgetClass=Class'KFGame.KFGFxMenu_ServerBrowser')
   WidgetBindings(6)=(WidgetName="root1",WidgetClass=Class'GFxUI.GFxObject')
   WidgetBindings(7)=(WidgetName="StartMenu",WidgetClass=Class'KFGame.KFGFxMenu_StartGame')
   WidgetBindings(8)=(WidgetName="ExitMenu",WidgetClass=Class'KFGame.KFGFxMenu_Exit')
   WidgetBindings(9)=(WidgetName="PerksMenu",WidgetClass=Class'KFGame.KFGFxMenu_Perks')
   WidgetBindings(10)=(WidgetName="GearMenu",WidgetClass=Class'KFGame.KFGFxMenu_Gear')
   WidgetBindings(11)=(WidgetName="InventoryMenu",WidgetClass=Class'KFGame.KFGFxMenu_Inventory')
   WidgetBindings(12)=(WidgetName="StoreMenu",WidgetClass=Class'KFGame.KFGFxMenu_Store')
   WidgetBindings(13)=(WidgetName="OptionsSelectionMenu",WidgetClass=Class'KFGame.KFGFxOptionsMenu_Selection')
   WidgetBindings(14)=(WidgetName="OptionsControlsMenu",WidgetClass=Class'KFGame.KFGFxOptionsMenu_Controls')
   WidgetBindings(15)=(WidgetName="OptionsAudioMenu",WidgetClass=Class'KFGame.KFGFxOptionsMenu_Audio')
   WidgetBindings(16)=(WidgetName="OptionsGameSettingsMenu",WidgetClass=Class'KFGame.KFGFxOptionsMenu_GameSettings')
   WidgetBindings(17)=(WidgetName="PostGameMenu",WidgetClass=Class'KFGame.KFGFxMenu_PostGameReport')
   WidgetBindings(18)=(WidgetName="TraderMenu",WidgetClass=Class'KFGame.KFGFxMenu_Trader')
   WidgetBindings(19)=(WidgetName="ChatBoxWidget",WidgetClass=Class'KFGame.KFGFxHUD_ChatBoxWidget')
   WidgetBindings(20)=(WidgetName="IISMenu",WidgetClass=Class'KFGame.KFGFxMenu_IIS')
   WidgetBindings(21)=(WidgetName="MenuBarWidget",WidgetClass=Class'KFGame.KFGFxWidget_MenuBar')
   WidgetBindings(22)=(WidgetName="ButtonPromptWidgetContainer",WidgetClass=Class'KFGame.KFGFxWidget_ButtonPrompt')
   Name="Default__KFGFxMoviePlayer_Manager"
   ObjectArchetype=GFxMoviePlayer'GFxUI.Default__GFxMoviePlayer'
}
