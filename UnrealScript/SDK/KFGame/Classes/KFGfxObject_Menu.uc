//=============================================================================
// KFGFxObject_Menu
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 4/23/2014
//=============================================================================

class KFGFxObject_Menu extends GFxObject
	native(UI);

var KFGFxMoviePlayer_Manager Manager;
var TWOnlineLobby OnlineLobby;

var localized string LeavePartyTitleString;
var localized string LeavePartyDescriptionString;
var localized string LeaveString;

// This is only called once when a menu is created
function InitializeMenu( KFGFxMoviePlayer_Manager InManager )
{
	Manager = InManager;
	InitOnlineLobby();
  	GetPC().PlayerInput.ResetInput();
}

// This is called whenever we open the menu
function OnOpen();

function InitOnlineLobby()
{
	if(GetPC().OnlineSub != none)
	{
	OnlineLobby = GetPC().OnlineSub.GetLobbyInterface();
	}
}

function OnInputTypeChanged(bool bGamePad);

function OneSecondLoop();

event bool OnAxisModified( int ControllerId, name Key, float Delta, float DeltaTime, bool bGamepad){};

event OnTraderTimeStart();

function OnRoundOver();

event OnClose();

function OnLobbyStatusChanged(bool bIsInParty){}

function ShowLeavePartyPopUp()
{
	if(Manager != none)
	{
		Manager.OpenPopup(EConfirmation, LeavePartyTitleString, LeavePartyDescriptionString, LeaveString, class'KFCommon_LocalizedStrings'.Default.CancelString, ConfirmLeaveParty, CancelLeaveParty);
	}
}

function ConfirmLeaveParty()
{
	local KFPlayerController KFPC;

    KFPC = KFPlayerController(GetPC());
	
	if(OnlineLobby != none)
	{       
        if ( KFPC != none && KFPC.MyGFxManager != none )
        {
        	if(KFPC.MyGFxManager.StartMenu != none && !OnlineLobby.IsLobbyOwner() )
        	{
        		KFPC.MyGFxManager.StartMenu.ShowOverview(false, false, true, false);
        	}
        	OnlineLobby.QuitLobby();
        }
	}

	if (!class'WorldInfo'.static.IsMenuLevel())
	{
		ConsoleCommand("Disconnect");
	}
}

function CancelLeaveParty()
{
	//Do nothing
}

//==============================================================
// ActionScript Callbacks
//==============================================================

function Callback_ControllerCloseMenu()
{
	local KFPlayerReplicationInfo KFPRI;
	KFPRI = KFPlayerReplicationInfo( GetPC().PlayerReplicationInfo );
	    
	if( Manager != none && KFPRI != none )
	{
		if( !class'WorldInfo'.static.IsMenuLevel() && Manager.bUsingGamepad )
		{
			if ( KFPRI.WorldInfo.GRI.bMatchHasBegun )
			{
				Manager.CloseMenus();
			}
			else if ( Manager.bAfterLobby && ( Manager.CurrentMenu != None && Manager.PostGameMenu != None && Manager.CurrentMenu != Manager.PostGameMenu) ) 
			{
				// Allow for backing out of the pause screen into the AAR.
				Manager.ToggleMenus();
			}
		}
	}
}

// Opens the "Are you sure you want to quit" Confirmation
function Callback_Quit()
{
    if(Manager != none)
    {
        Manager.MenuBarWidget.OpenQuitPopUp();
    }
}

function Callback_MenusFinishedClosing()
{
	if( Manager != none && Manager.bMenusOpen)
	{
		Manager.MenusFinishedClosing();
	}
}

function Callback_MenuBarTabChanged( int NewMenuIndex )
{
	if ( Manager != none )
	{
		Manager.OpenMenu( NewMenuIndex );
	}
}

function Callback_RequestTeamSwitch()
{
	local KFPlayerController KFPC;

    KFPC = KFPlayerController(GetPC());
	if ( KFPC != none )
	{
		KFPC.RequestSwitchTeam();
	}
}

function Callback_ReadyClicked( bool bReady )
{
	local KFPlayerReplicationInfo KFPRI;
	KFPRI = KFPlayerReplicationInfo( GetPC().PlayerReplicationInfo );

	if (KFPRI != none)
	{
		KFPRI.SetPlayerReady(bReady);

	    // For game in progress, close menus on ready
	    if (KFPRI.WorldInfo.GRI.bMatchHasBegun)
	    {
	     	KFPlayerController( GetPC() ).MyGFxManager.CloseMenus();
	     	GetPC().ServerRestartPlayer();
	    }
	    else if (Manager != none )
	    {
	    	if(Manager.PartyWidget !=none)
	    	{
				Manager.PartyWidget.RefreshParty();
			}
			if(Manager.StartMenu != none && bReady)
			{
				Manager.StartMenu.OnPlayerReadiedUp();
			}
			if(Manager.PerksMenu != none)
			{
				Manager.PerksMenu.SelectionContainer.SetPerkListEnabled(!bReady);
			}
		}
	}
}

function Callback_PlayerClicked( int SlotIndex )
{
/*
	local array<KFPlayerReplicationInfo> KFPRIArray;
	local KFPawn_Customization KFP;

	GetKFPRIArray( KFPRIArray );
	if ( SlotIndex >= KFPRIArray.length )
	{
    	return;
	}

	foreach GetPC().WorldInfo.AllPawns(class'KFPawn_Customization', KFP)
	{
		// find the selected pawn and view it
		if ( KFP.PlayerReplicationInfo == KFPRIArray[SlotIndex] )
		{
			GetPC().SetViewTarget( KFP );
			if ( KFPlayerCamera( GetPC().PlayerCamera ) != none )
				KFPlayerCamera( GetPC().PlayerCamera ).CustomizationCam.SetBodyView( 0, true );
			break;
		}
	}
	*/
}

//==============================================================
// Party Widget Callbacks
//==============================================================
function Callback_PerkChanged(int PerkIndex)
{
	local KFPlayerController KFPC;

    KFPC = KFPlayerController(GetPC());
	if ( KFPC != none )
	{
		KFPC.RequestPerkChange( PerkIndex );
		KFPC.SetHaveUpdatePerk(true);
		if( KFPC.MyGFxManager != none )
		{
			if(KFPC.MyGFxManager.CurrentMenu == KFPC.MyGFxManager.PerksMenu )
			{
				KFPC.MyGFxManager.PerksMenu.UpdateLock();
			}
		}
		
	}
}

function Callback_ProfileOption(int OptionIndex, int SlotIndex)
{
	`log("Callback_ProfileOption: " @OptionIndex);
	if( Manager != none && Manager.PartyWidget != none)
	{
		Manager.PartyWidget.ProfileOptionClicked(OptionIndex, SlotIndex);
	}
}

function Callback_CreateParty()
{
	if( OnlineLobby != none && Manager.GetMultiplayerMenuActive() )
	{
		OnlineLobby.MakeLobby( `KF_MAX_PLAYERS, LV_Private);	// returns false if we're already in a lobby
		OnlineLobby.ShowLobbyInviteInterface();
	}
}

function Callback_LeaveParty()
{
	ShowLeavePartyPopUp();
}

function Callback_InviteFriend()
{
	if ( Class'WorldInfo'.Static.IsConsoleBuild() )
	{
		class'GameEngine'.static.GetOnlineSubsystem().PlayerInterfaceEx.ShowInviteUI(Manager.GetLP().ControllerId, "");
	}
	else if ( OnlineLobby != none )
	{
		OnlineLobby.ShowLobbyInviteInterface();
	}	
}

/** Plays the view's open animation. */
function PlayOpenAnimation();

/** Plays the view's close animation. */
function PlayCloseAnimation(float AnimationRate )
{
	ActionScriptVoid("closeMenu");
}


//only called from the party widget chat
function Callback_BroadcastChatMessage(string Message)
{
	local PlayerReplicationInfo PRI;
	local string ChatMessage;

	PRI = GetPC().PlayerReplicationInfo;
	
    if(Message != "")
    {
    	if(class'WorldInfo'.static.IsMenuLevel())
    	{
    		ChatMessage = PRI.PlayerName$": " $Message;
			if ( OnlineLobby != none )
			{
				OnlineLobby.LobbyMessage(ChatMessage);
			}
		}
    	else
    	{
    		//game has started
    		if(Manager.bAfterLobby)
    		{
    			GetPC().TeamSay(Message);	
    		}
	    	else
	    	{
	    		GetPC().Say(Message);	
	    	} 
    	}
    }
}

//From Party widget chat and aar chat
function Callback_ChatFocusIn()
{
	Manager.ClearFocusIgnoreKeys();
}

function Callback_ChatFocusOut()
{
	Manager.UpdateDynamicIgnoreKeys();
}

/** RETURN TO THESE FUNCTIONS */

/************************************************************************
* CONTROL FUNCTIONS
* give unreal functionality upon performing an event
* (ex. clicking apply options), if functionality is not listed here
* it is done in actionscript inside the .swf file
*************************************************************************/

/** Detects any input and passes it to the active view*/
event bool FilterButtonInput(int ControllerId, name ButtonName, EInputEvent InputEvent);

function SetControlScheme( bool bUseGamePad )
{
	ActionScriptVoid("setGamepadInput");
}

function Callback_MouseMoved()
{
 	SetControlScheme( false );
}

DefaultProperties
{
	//defaults
}
