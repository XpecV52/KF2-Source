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

/** Connects a menu ID with its path */
enum EUIIndex
{
	UI_Start,
	UI_Perks,
	UI_Gear,
	UI_OptionsSelection,
	UI_Exit_Menu,
	UI_OptionsControls,
	UI_OptionsAudio,
	UI_OptionsGraphics,
	UI_OptionsGameSettings,
	UI_Achievements,
	UI_Extras,
    UI_Store,
    UI_PostGame,
	UI_Trader,
	UI_ServerBrowserMenu,
	UI_MAX,
};

/** Points to the .swf location of each menu and is controlled by the EUIIndex */
var array<string> MenuSWFPaths;

var KFGFxObject_Menu CurrentMenu;
var byte CurrentMenuIndex;

/** Cached menu objects, set through widget initialized */
var KFGfxMenu_StartGame StartMenu;
var KFGFxMenu_Perks PerksMenu;
var KFGFxMenu_Gear GearMenu;
var KFGFxOptionsMenu_Controls OptionsControlsMenu;
var KFGFxOptionsMenu_Audio OptionsAudioMenu;
var KFGFxOptionsMenu_Graphics OptionsGraphicsMenu;
var KFGFxOptionsMenu_GameSettings OptionsGameSettingsMenu;
var KFGFxOptionsMenu_Selection OptionsSelectionMenu;
var KFGFxMenu_PostGameReport PostGameMenu;
var KFGFxMenu_Trader TraderMenu;
var KFGFxMenu_ServerBrowser ServerBrowserMenu;
var KFGFxMenu_Exit ExitMenu;

var bool bPostGameState;

/** Connects the different layers of the start menu with an index */
enum EStartMenuState
{
	EMatchmaking,
	EServerBrowser,
	ESoloGame,
	EOverview,
	EServerBrowserOverview,
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

//The target PRI for currnet vote
var PlayerReplicationInfo VotePRI;

var() transient KFHUDTimerHelper TimerHelper;

/** Cached version of the TWOnlineLobby */
var TWOnlineLobby OnlineLobby;
var UniqueNetId CurrentInviteLobbyId;

var const UniqueNetId ZeroUniqueId;


/** Reference to the LoaderManager.swf */
var GFxObject ManagerObject;
/** Reference to the KFHUD */
var KFHUDBase HUD;
/** The main menus background movie */
var TextureMovie BackgroundMovie;

/** Array of commands that cannot be rebound */
var array<string> IgnoredCommands;
/** Points to the UI sound effects */
var name SoundThemeName;
/** The threshold at which a mouse movement will change the interface from controller to mouse and keyboard */
var const int MouseInputChangedThreshold;

/** TRUE if the kick vote popup is open */
var bool bKickVotePopupActive;
var bool bUsingGamepad; // True if we are using a gamepad, otherwise we are using mouse and keyboard
var bool bAfterLobby;	// Set to true once we have readied up
var bool bMenusOpen;	// true if we're using menus, otherwise we're using the HUD
var bool bSearchingForGame; // true if we are in the process of finding a game
var bool bCanCloseMenu;	// Set to true after a menu has been completely opened and allows a player to close the menu
var bool bPlayerInLobby;
var config bool bSetGamma;	// Set to true if we've already set the gamma on the first launch

//Delegates for popups.  These are used to hold the delegates while the swf is loading. once it is loaded, it will pass it to the GFX object
//@TODO: Rewrite the pop up system to keep the pop ups loaded in at all times so the pending delegates are not needed. (Hide and show them as needed)
delegate PendingRightButtonDelegate();
delegate PendingMiddleButtonDelegate();
delegate PendingLeftButtonDelegate();

/** Called on creation of the movie player */
function Init(optional LocalPlayer LocPlay)
{
	local OnlineSubsystem OnlineSub;
	TimerHelper = GetPC().Spawn(class'KFHUDTimerHelper');
	// Initialize datastores
	class'KFUIDataStore_GameResource'.static.InitializeProviders();

	HUD = KFHUDBase(GetPC().myHUD);

	super.Init( LocPlay );

	OnlineSub = class'GameEngine'.static.GetOnlineSubsystem();
	OnlineLobby = OnlineSub.GetLobbyInterface();

	TimerHelper.SetTimer( 1.0, true, nameof(OneSecondLoop), self );
	SetTimingMode(TM_Real);

	UpdateDynamicIgnoreKeys();
}

/** Called at the creation of the movie player, used to create the starting menus */
function LaunchMenus( optional bool bForceSkipLobby )
{
	local GFxWidgetBinding WidgetBinding;
	local bool bSkippedLobby;
	// Add either the in game party or out of game party widget
	WidgetBinding.WidgetName = 'partyWidget';
	if ( class'WorldInfo'.static.IsMenuLevel() )
	{
		WidgetBinding.WidgetClass = class'KFGFxWidget_PartyMainMenu';

		SetExternalTexture("background", BackgroundMovie);

		// Only play the movie if we are not in game
		BackgroundMovie.Play();
	}
	else
	{
		bSkippedLobby = bForceSkipLobby || CheckSkipLobby();
		WidgetBinding.WidgetClass = class'KFGFxWidget_PartyInGame';
		ManagerObject.SetBool("backgroundVisible", false);
		if(bSkippedLobby)
		{
			BackgroundMovie.Stop();
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
		OpenMenu(UI_Start);
		AllowCloseMenu();
	}

	// do this stuff in case CheckSkipLobby failed
	if( bForceSkipLobby )
	{
		bAfterLobby = true;
		CloseMenus(true);
	}

	if(!bSetGamma && !class'KFGameEngine'.static.CheckSkipGammaCheck())
	{
		OpenPopup(EGamma, "", Class'KFGFxOptionsMenu_Graphics'.default.AdjustGammaDescription, Class'KFGFxOptionsMenu_Graphics'.default.ResetGammaString, Class'KFGFxOptionsMenu_Graphics'.default.SetGammaString);
	}
}

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
	local PlayerController PC;

	`log("WidgetInitialized - Menu: " @WidgetName,,'DevGFxUI');
	switch ( WidgetName )
	{
		case ( 'root1' ):
			if ( ManagerObject == none )
			{
				ManagerObject = Widget;
			}
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
			PC = GetPC();
			if( PC.PlayerReplicationInfo.bReadyToPlay && PC.WorldInfo.GRI.bMatchHasBegun )
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
			if(PartyWidget.PartyChatWidget == none)
			{
				PartyWidget.PartyChatWidget = KFGFxHUD_ChatBoxWidget(Widget);
				PartyWidget.PartyChatWidget.Init();
			}
		break;
        case  'GammaPopup':
        case  'ConnectionErrorPopup':
        case  'ConfirmationPopup':
        case  'InputPromptPopup':
            InitializePopup( WidgetPath, KFGFxObject_Popup( Widget ) );
        break;
	}

	return true;
}

function StatsInitialized()
{
	if( PartyWidget != none )
	{
		PartyWidget.StatsInit();
	}
}

function AllowCloseMenu()
{
	bCanCloseMenu = true;
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
	}
}

/*********************************************************************************************
* @name Opening / Closing
********************************************************************************************* */

/** Pause/unpause the game when menus are opened */
function SetMenusOpen(bool bIsOpen)
{
	local KFGFxHudWrapper HudWrapper;

	TimerHelper.SetTickIsDisabled( !bIsOpen );
	SetPause( !bIsOpen );
	bMenusOpen = bIsOpen;

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

	if( NewMenuIndex == UI_Gear )
	{
		PC = GetPC();
		if( PC.PlayerReplicationInfo.bReadyToPlay && PC.WorldInfo.GRI.bMatchHasBegun )
		{
			return;
		}
	}

	WI = class'WorldInfo'.static.GetWorldInfo();

	if(!bMenusOpen)
	{
		SetMenusOpen(true);
	}

	if(VotePRI != none)
	{
		ShowKickVote(VotePRI);
	}

	// Close our last menu if we are already in a menu
	if (bMenusOpen && NewMenuIndex != CurrentMenuIndex && CurrentMenu != none)
	{
		CurrentMenu.OnClose();
		CurrentMenu = none;
	}

	if (NewMenuIndex != UI_Trader)
	{
		CurrentMenuIndex = NewMenuIndex;
	}
	else
	{
		PlaySoundFromTheme('TraderMenu_Open', SoundThemeName);

		// The trader menu is not opened through ToggleMenus, set the timer to mark when the menu is completely open
		bCanCloseMenu = false;
		TimerHelper.SetTimer( 0.5, false, nameof(AllowCloseMenu), self );
	}

	if(CurrentMenuIndex == UI_Start)
	{
		 if(StartMenuState == EServerBrowser)
		 {
			CurrentMenuIndex = UI_ServerBrowserMenu;
			NewMenuIndex = UI_ServerBrowserMenu;
		 }
		 else if(StartMenu != none)
		 {
		 	TempMenuState = EStartMenuState(StartMenu.GetStartMenuState());
		 	if( (TempMenuState == EServerBrowserOverview || TempMenuState == EOverview) && !IsInLobby() && WI.IsMenuLevel() )
		 	{
	 			if( StartMenu != none )
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
	LoadMenu( MenuSWFPaths[NewMenuIndex], bShowWidgets );
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
	if (bMenusOpen || bForceClose)
	{
		UnloadCurrentPopup();
		if ( !bAfterLobby && PartyWidget != none || GetPC().WorldInfo.GRI.bMatchIsOver )
		{
			PartyWidget.SetReadyButtonVisibility(false);
		 	bAfterLobby = true;
		}

		if (CurrentMenu != none)
		{
			if( CurrentMenu == TraderMenu )
			{
				PlaySoundFromTheme('TraderMenu_Close', SoundThemeName);
			}

			CurrentMenu.OnClose();
			CurrentMenu = none;
		}

		ConditionalPauseGame(false);
		SetMenuVisibility( false );
		SetHUDVisiblity( true) ;
	}
}

/** Called when the movie player is closed */
event OnClose()
{
	CloseMenus();
	if (!BackgroundMovie.Stopped)
	{
		BackgroundMovie.Stop();
	}
}

/** Called after OnClose */
event OnCleanup()
{
	Super.OnCleanup();
	GetGameViewportClient().HandleInputAxis = none;
}

/** Opens / Closes the menus on input */
function bool ToggleMenus()
{
	if (!bMenusOpen || HUD.bShowHUD)
	{
		if (CurrentMenuIndex >= MenuSWFPaths.length)
		{
			LaunchMenus();
		}
		else
		{
			OpenMenu(UI_Perks);
			UpdateMenuBar();
		}

		// set the timer to mark when the menu is completely open and we can close the menu down
		bCanCloseMenu = false;
		TimerHelper.SetTimer( 0.5, false, nameof(AllowCloseMenu), self );
		TimerHelper.SetTimer( 0.15, false, nameof(PlayOpeningSound), self );//Delay due to pause
	}
	else if(bCanCloseMenu) //check to make sure
	{
		if(GetPC().WorldInfo.GRI.bMatchIsOver && !bAfterLobby)
		{
			return false; // we are still in the lobby and the game has not proceeded to a point where we can use the esc key
		}

		if (CurrentMenu != TraderMenu)
		{
			PlaySoundFromTheme('MainMenu_Close', SoundThemeName);
		}

    	CloseMenus();
	}
	else if(bPostGameState)
	{
		if(CurrentMenu == PostGameMenu)
		{
			bMenusOpen = false;
			OpenMenu(UI_Perks);
			SetWidgetsVisible(true);
		}
		else
		{
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
	ManagerObject.ActionScriptVoid("setWidgetsVisiblity");
}

/** Set the visibility of the current menus */
function SetMenuVisibility( bool bVisible )
{
	ManagerObject.ActionScriptVoid("setMenuVisibility");
}

/** Set the visibility of the HUD and change whether input can be taken */
function SetHUDVisiblity(bool bIsVisible)
{
	if (HUD != none)
	{
		HUD.SetVisible( bIsVisible );
	}

	bCaptureInput = !bIsVisible;
	GetPC().PlayerInput.ResetInput();
}


/** Called at the start of trader time */
event OnTraderTimeStart()
{
	if(CurrentMenu != none)
	{
		CurrentMenu.OnTraderTimeStart();
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
		OpenPopup(EConfirmation, FailedSearchTitleString, FailedSearchString, BrowseServersString, class'KFCommon_LocalizedStrings'.default.OKString, StartMenu.Callback_OpenServerBrowser );
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
function OpenPopup( EPopUpType PopUpType, string TitleString, string DescriptionString,
	string LeftButtonString,
	optional string RightButtonString,
	optional delegate<PendingLeftButtonDelegate>LeftButtonDelegate,
	optional delegate<PendingRightButtonDelegate>RightButtonDelegate,
	optional string MiddleButtonString,
	optional delegate<PendingMiddleButtonDelegate>MiddleButtonDelegate,
	optional name OverridingSoundEffect
	)
{

	if(CurrentPopup != none && PopUpType == CurrentPopUpType )
	{
		CurrentPopUp.UpdateDescritionText(DescriptionString);
	}
	else if(PopupData[PopUpType].SWFPath != "")
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
	}
}

/** Tell actionscript to load the popup */
function LoadPopup( string Path, optional string TitleString, optional string DescriptionString,
    						optional string LeftButtonString, optional string RightButtonString, optional string MiddleButtonString)
{
	ManagerObject.ActionScriptVoid("loadCurrentPopup");
}

/** Tell actionscript to remove this popup */
function UnloadCurrentPopup()
{
	ManagerObject.ActionScriptVoid("unloadCurrentPopup");
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
			if ( WI.IsMenuLevel() || !bAfterLobby || CurrentMenu == TraderMenu || GetPC().WorldInfo.GRI.bMatchIsOver )
			{
				return;
			}

			GetPC().SetPause(true);
		}
		else
		{
			GetPC().SetPause(false);
		}
	}
}

/*********************************************************************************************
`* Game Lobby
********************************************************************************************* */

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

function SetStartMenuState(EStartMenuState MenuState)
{
	StartMenuState = MenuState;
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
	// Handle closing out of currently active menu
	if ( (bAfterLobby || GetPC().WorldInfo.GRI.bMatchIsOver) && InputEvent == EInputEvent.IE_Pressed
		&& (ButtonName == 'Escape' || ButtonName == 'XboxTypeS_Start') )
	{
		return ToggleMenus();
	}

	if ( CurrentMenu != none )
	{
		CurrentMenu.FilterButtonInput( ControllerId, ButtonName, InputEvent );
    	CheckIfUsingGamepad();
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

    if ( PC == none || PC.PlayerInput == none )
	{
		return false;
	}

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

/*********************************************************************************************
* @name Kick Vote
********************************************************************************************* */

function ShowKickVote(PlayerReplicationInfo PRI)
{
	VotePRI = PRI;
	if(bMenusOpen)
	{
		bKickVotePopupActive = true;
		OpenPopup(EConfirmation, Class'KFGFxWidget_KickVote'.default.VoteKickString, VotePRI.PLayerName,
		 Class'KFCommon_LocalizedStrings'.default.YesString, Class'KFCommon_LocalizedStrings'.default.NoString, CastYesVote, CastNoVote);
	}
}

simulated function HideKickVote()
{
	if( bKickVotePopupActive )
	{
		bKickVotePopupActive = false;
		UnloadCurrentPopup();
	}

	VotePRI = none;
}

function CastYesVote()
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

function CastNoVote()
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

defaultproperties
{
	BackgroundMovie=TextureMovie'UI_Managers.MenuBG'
    MovieInfo=SwfMovie'UI_Managers.LoaderManager_SWF'
	bCaptureInput=true
	bAutoPlay=true

	MouseInputChangedThreshold=5

	SoundThemeName=ButtonSoundTheme
	SoundThemes.Add((ThemeName="ButtonSoundTheme",Theme=UISoundTheme'SoundsShared_UI.SoundTheme_Buttons'))
	SoundThemes.Add((ThemeName="AAR",Theme=UISoundTheme'SoundsShared_UI.SoundTheme_AAR'))

	// List of commands whose bind cannot be changed
	IgnoredCommands.Add("GBA_VoiceChat")

	// Menus
	MenuSWFPaths[UI_Start]="../UI_Menus/StartMenu_SWF.swf"
	MenuSWFPaths[UI_Perks]="../UI_Menus/PerksMenu_SWF.swf"
	MenuSWFPaths[UI_ServerBrowserMenu]="../UI_Menus/ServerBrowserMenu_SWF.swf"
	MenuSWFPaths[UI_Gear]="../UI_Menus/GearMenu_SWF.swf"
	MenuSWFPaths[UI_OptionsSelection]="../UI_Menus/OptionsSelectionMenu_SWF.swf"
	MenuSWFPaths[UI_OptionsControls]="../UI_Menus/OptionsControlsMenu_SWF.swf"
	MenuSWFPaths[UI_OptionsAudio]="../UI_Menus/OptionsAudioMenu_SWF.swf"
	MenuSWFPaths[UI_OptionsGraphics]="../UI_Menus/OptionsGraphicsMenu_SWF.swf"
	MenuSWFPaths[UI_OptionsGameSettings]="../UI_Menus/OptionsGameSettingsMenu_SWF.swf"
	MenuSWFPaths[UI_PostGame]="../UI_Menus/PostGameMenu_SWF.swf"
	MenuSWFPaths[UI_Trader]="../UI_Menus/TraderMenu_SWF.swf"
	MenuSWFPaths[UI_Exit_Menu]="../UI_Menus/ExitMenu_SWF.swf"

	CurrentMenuIndex=255
    // Pop-ups
	PopupData(EConfirmation)=(SWFPath="../UI_PopUps/ConfirmationPopup_SWF.swf")
	PopupData(EGamma)=(SWFPath="../UI_PopUps/GammaPopup_SWF.swf")
	PopupData(ENotification)=(SWFPath="../UI_PopUps/ConnectionErrorPopup_SWF.swf")
	PopupData(EInputPrompt)=(SWFPath="../UI_PopUps/InputPromptPopup_SWF.swf")

    // Popup Bindings
	WidgetBindings.Add((WidgetName="GammaPopup",WidgetClass=class'KFGFxPopup_Gamma'))
	WidgetBindings.Add((WidgetName="ConnectionErrorPopup",WidgetClass=class'KFGFxPopup_ConnectionError'))
	WidgetBindings.Add((WidgetName="ConfirmationPopup",WidgetClass=class'KFGFxPopup_Confirmation'))
	WidgetBindings.Add((WidgetName="InputPromptPopup",WidgetClass=class'KFGFxPopup_InputPrompt'))

	// Widgets
	WidgetBindings.Add((WidgetName="serverBrowserMenu",WidgetClass=class'KFGFxMenu_ServerBrowser'))
	WidgetBindings.Add((WidgetName="root1",WidgetClass=class'GFxObject'))
	WidgetBindings.Add((WidgetName="startMenu",WidgetClass=class'KFGFxMenu_StartGame'))
	WidgetBindings.Add((WidgetName="exitMenu",WidgetClass=class'KFGFxMenu_Exit'))
	WidgetBindings.Add((WidgetName="PerksMenu",WidgetClass=class'KFGFxMenu_Perks'))
	WidgetBindings.Add((WidgetName="gearMenu",WidgetClass=class'KFGFxMenu_Gear'))
	WidgetBindings.Add((WidgetName="optionsSelectionMenu",WidgetClass=class'KFGFxOptionsMenu_Selection'))
	WidgetBindings.Add((WidgetName="optionsControlsMenu",WidgetClass=class'KFGFxOptionsMenu_Controls'))
	WidgetBindings.Add((WidgetName="optionsAudioMenu",WidgetClass=class'KFGFxOptionsMenu_Audio'))
	WidgetBindings.Add((WidgetName="optionsGameSettingsMenu",WidgetClass=class'KFGFxOptionsMenu_GameSettings'))
	WidgetBindings.Add((WidgetName="postGameMenu",WidgetClass=class'KFGFxMenu_PostGameReport'))
	WidgetBindings.Add((WidgetName="traderMenu",WidgetClass=class'KFGFxMenu_Trader'))
	WidgetBindings.Add((WidgetName="ChatBoxWidget", WidgetClass=class'KFGFxHUD_ChatBoxWidget'))

	WidgetPaths.Add("../UI_Widgets/MenuBarWidget_SWF.swf")
	WidgetPaths.Add("../UI_Widgets/PartyWidget_SWF.swf")
	WidgetPaths.Add("../UI_Widgets/ButtonPromptWidget_SWF.swf")

	WidgetBindings.Add((WidgetName="MenuBarWidget",WidgetClass=class'KFGFxWidget_MenuBar'))
	WidgetBindings.Add((WidgetName="ButtonPromptWidgetContainer", WidgetClass=class'KFGFxWidget_ButtonPrompt'))
}
