//=============================================================================
// KFGFxMoviePlayer_HUD
//=============================================================================
// This is the managing class for all scaleform HUD items.
// It will tick and update its components to keep them all up to date
// as well as hide and pause items when they are not used
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Greg Felber 5/12/2014
//=============================================================================

class KFGFxMoviePlayer_HUD extends GFxMoviePlayer
	config(UI);

var KFGFxHUD_SpectatorInfo SpectatorInfoWidget;
// Container for Health & Armor widgets
var KFGFxHUD_PlayerStatus PlayerStatusContainer;
// Container for Weapon & ammo widgets
var KFGFxHUD_PlayerBackpack PlayerBackpackContainer;
// Container for Priority local message broadcasts.
var GfxObject PriorityMessageContainer;
// Container for boss name and message.
var GfxObject BossNameplateContainer;
// Container for interaction local message broadcasts.
var GfxObject InteractionMessageContainer;
// Widget for selecting your current weapon
var KFGFxHUD_WeaponSelectWidget KeyboardWeaponSelectWidget;
// Widget for selecting your current weapon
var KFGFxHUD_WeaponSelectWidget ControllerWeaponSelectWidget;
// This is the holder so that we keep track of one weaponselect container depending on user input type
var KFGFxHUD_WeaponSelectWidget WeaponSelectWidget;
// Widget for showing you were the trader is
var KFGFxHUD_TraderCompass TraderCompassWidget;
// Widget for showing how many enemies are left in the wave and which wave you are on.
var KFGFxHUD_WaveInfo WaveInfoWidget;
// Widget for the in-game Scoreboard
var KFGFxHUD_ScoreboardWidget ScoreboardWidget;
// Voip Notification Widget
var KFGFxWidget_VOIPNotification VOIPWidget;
// Widget for in game chat messages
var KFGFxHUD_ChatBoxWidget HudChatBox;
//Widget for displaying a level up.
var KFGFxWidget_LevelUpNotification LevelUpNotificationWidget;
//Widget for voice actions
var KFGFxWidget_VoiceComms VoiceCommsWidget;
//Widget for displaying song info
var KFGFxWidget_MusicNotification MusicNotification;
// widget for displaying a current vote
var KFGFxWidget_KickVote KickVoteWidget;
// Widget that shows unimportant messages such as receiving ammo
var KFGFxWidget_NonCriticalGameMessage NonCriticalGameMessageWidget;
// Widget that shows headshots for gunslinger
var KFGFxWidget_RhythmCounter RhythmCounterWidget;

var KFPlayerController KFPC;

var config float HUDScale;

var GFxObject KFGXHUDManager;

var bool bIsSpectating;
var bool bIsVisible;
var bool bUsingGamepad;

var int CurrentInteractionIndex;

var const string ControllerStringPrefix;

// Interval between updates.  Higher values mean less frequent updates.
var const float UpdateInterval;
// Last time we performed an update.
var Protected float LastUpdateTime;

// The name of the player currently being voted on to kick
var string PendingKickPlayerName;

/** On creation of the HUD */
function Init(optional LocalPlayer LocPlay)
{
	KFPC = KFPlayerController( GetPC() );
	KFPC.SetGFxHUD( self );
	super.Init( LocPlay );
	KFGXHUDManager = GetVariableObject("root");
	UpdateRatio();
	UpdateScale();
	// Let the HUD Manager know if we are in a console build of the game.
	KFGXHUDManager.SetBool("bConsoleBuild",class'WorldInfo'.static.IsConsoleBuild(CONSOLE_Orbis));
}

function UpdateRatio()
{
	local GfxObject GFxStage;
	local float ScaleStage;
	ScaleStage = class'Engine'.static.GetTitleSafeArea();
	GFxStage = KFGXHUDManager.GetObject("stage");
	GFxStage.SetFloat("x", (GFxStage.GetFloat("width") * (1.0f - ScaleStage)) / 2 );
	GFxStage.SetFloat("y", (GFxStage.GetFloat("height") * (1.0f - ScaleStage)) / 2 );
	GFxStage.SetFloat("scaleX", ScaleStage);
	GFxStage.SetFloat("scaleY", ScaleStage);
}

/** Ties the GFxClikWidget variables to the .swf components and handles events */
event bool WidgetInitialized(name WidgetName, name WidgetPath, GFxObject Widget)
{
	switch(WidgetName)
	{
	case 'KickVoteWidget':
		if( KickVoteWidget == none )
		{
			KickVoteWidget = KFGFxWidget_KickVote(Widget);
			SetWidgetPathBinding( Widget, WidgetPath );
			KickVoteWidget.InitializeHUD();
		}
		break;
	case 'SpectatorInfoWidget':
		if( SpectatorInfoWidget == none )
		{
			SpectatorInfoWidget = KFGFxHUD_SpectatorInfo(Widget);
			SetWidgetPathBinding( Widget, WidgetPath );
			SpectatorInfoWidget.InitializeHUD();
		}
		break;
	case 'PlayerStatWidgetMC':
		if ( PlayerStatusContainer == none )
		{
			PlayerStatusContainer = KFGFxHUD_PlayerStatus(Widget);
			SetWidgetPathBinding( Widget, WidgetPath );
			PlayerStatusContainer.InitializeHUD();
		}
		break;
	case 'PlayerBackpackWidget':
		if ( PlayerBackpackContainer == none )
		{
			PlayerBackpackContainer = KFGFxHUD_PlayerBackpack(Widget);
			SetWidgetPathBinding( Widget, WidgetPath );
			PlayerBackpackContainer.InitializeHUD();
		}
		break;
	case 'PriorityMsgWidget':
		if( PriorityMessageContainer == none)
		{
			PriorityMessageContainer = Widget;
			SetWidgetPathBinding( Widget, WidgetPath );
		}
		break;
	case 'BossNamePlate':
		if( BossNameplateContainer == none)
		{
			BossNameplateContainer = Widget;
			SetWidgetPathBinding( Widget, WidgetPath );
		}
		break;
	case 'interactionMsgWidget':
		if( InteractionMessageContainer == none)
		{
			InteractionMessageContainer = Widget;
			SetWidgetPathBinding( Widget, WidgetPath );
		}
		break;
	case 'WeaponSelectContainer':
		if ( KeyboardWeaponSelectWidget == none )
		{
			KeyboardWeaponSelectWidget = KFGFxHUD_WeaponSelectWidget(Widget);
			KeyboardWeaponSelectWidget.RefreshWeaponSelect();
			KeyboardWeaponSelectWidget.InitializeObject();
			if(!bUsingGamepad)
			{
				WeaponSelectWidget = KeyboardWeaponSelectWidget;
			}
		}
		break;
	case 'ControllerWeaponSelectContainer':
		if ( ControllerWeaponSelectWidget == none )
		{
			ControllerWeaponSelectWidget = KFGFxHUD_WeaponSelectWidget(Widget);
			ControllerWeaponSelectWidget.RefreshWeaponSelect();
			ControllerWeaponSelectWidget.InitializeObject();
			if(bUsingGamepad)
			{
				WeaponSelectWidget = ControllerWeaponSelectWidget;
			}
		}
		break;
	case 'CompassContainer':
		if ( TraderCompassWidget == none )
		{
			TraderCompassWidget = KFGFxHUD_TraderCompass(Widget);
			TraderCompassWidget.InitializeHUD();
			SetWidgetPathBinding( Widget, WidgetPath );
		}
		break;
	case 'WaveInfoContainer':
		if ( WaveInfoWidget == none )
		{
			WaveInfoWidget = KFGFxHUD_WaveInfo(Widget);
			WaveInfoWidget.InitializeHUD();
			SetWidgetPathBinding( Widget, WidgetPath );
		}
		break;
	case 'ScoreboardWidgetMC':
		if ( ScoreboardWidget == none )
		{
			ScoreboardWidget = KFGFxHUD_ScoreboardWidget(Widget);
			ScoreboardWidget.InitializeHUD();
			SetWidgetPathBinding( Widget, WidgetPath );
		}
		break;
	case 'ChatBoxWidget':
		if(!(class'WorldInfo'.static.IsPlayInEditor()))
		{
			if(HudChatBox == none)
			{
				HudChatBox = KFGFxHUD_ChatBoxWidget(Widget);
			} 
		}
		break;
	case 'voipWidget':
		if(VOIPWidget == none)
		{
			VOIPWidget = KFGFxWidget_VOIPNotification(Widget);
		}
		break;
	case 'LevelUpNotificationWidget':
		if(LevelUpNotificationWidget == none)
		{
			LevelUpNotificationWidget = KFGFxWidget_LevelUpNotification(Widget);
			LevelUpNotificationWidget.InitializeHUD();
		}
		break;
	case 'VoiceCommsWidget':
		if(VoiceCommsWidget == none)
		{
			VoiceCommsWidget = KFGFxWidget_VoiceComms(Widget);
			VoiceCommsWidget.InitializeHUD();
		}
		break;
	case 'MusicNotification':
		if(MusicNotification == none)
		{
			MusicNotification = KFGFxWidget_MusicNotification(Widget);
			MusicNotification.InitializeHUD();
		}
		break;
	case 'NonCriticalMessageWidget':
		if(NonCriticalGameMessageWidget == none)
		{
			NonCriticalGameMessageWidget = KFGFxWidget_NonCriticalGameMessage(Widget);
		}
		break;
	case 'RhythmCounter':
		if(RhythmCounterWidget == none)
	{
			RhythmCounterWidget = KFGFxWidget_RhythmCounter(Widget);
	}
		break;
	}

	return true;
}

function UpdateWeaponSelect()
{
	if(bUsingGamepad)
	{
		WeaponSelectWidget = ControllerWeaponSelectWidget;
		if(KeyboardWeaponSelectWidget != none)
		{
			KeyboardWeaponSelectWidget.Hide();
		}
	}
	else
	{
		WeaponSelectWidget = KeyboardWeaponSelectWidget;
		if(ControllerWeaponSelectWidget != none)
		{
			ControllerWeaponSelectWidget.Hide();
		}
	}
}

/** Update all the unique HUD pieces */
function TickHud(float DeltaTime)
{
	local PlayerController PC;

	PC = GetPC();

	if(PC == none || PC.WorldInfo.TimeSeconds - LastUpdateTime < UpdateInterval )
    {
    	return;
    }

    if(!PC.MyHUD.bShowHUD)
    {
    	return;
    }

    LastUpdateTime = PC.WorldInfo.TimeSeconds;   // throttle the updates so we're not spamming Actionscript with data.

    // Update current input
    if(bUsingGamepad != PC.PlayerInput.bUsingGamepad)
    {
    	bUsingGamepad = PC.PlayerInput.bUsingGamepad;
    	UpdateUsingGamepad();
    	UpdateWeaponSelect();
    }
        
	if( bIsSpectating )
	{
		if( SpectatorInfoWidget != none )
		{
			SpectatorInfoWidget.TickHud( DeltaTime );
		}
	}
	else
	{
		// Update Health / Armor
		if ( PlayerStatusContainer != none )
		{
			PlayerStatusContainer.TickHud( DeltaTime );
		}

		// Update Ammo
		if ( PlayerBackpackContainer != none )
		{
			PlayerBackpackContainer.TickHud( DeltaTime );
		}  
	}

	if( TraderCompassWidget != none)
	{
		TraderCompassWidget.TickHUD( DeltaTime);
	}

	if( WaveInfoWidget != none)
	{
		WaveInfoWidget.TickHUD( DeltaTime);
	}

	if(ScoreboardWidget != none && ScoreboardWidget.bUpdateScoreboard )
	{
		ScoreboardWidget.TickHUD(DeltaTime);
	} 
}

function UpdateWaveCount()
{
	if(ScoreboardWidget != none && ScoreboardWidget.MatchInfoContainer != none)
	{
		ScoreboardWidget.MatchInfoContainer.UpdateWaveCount();
	}
	if(WaveInfoWidget != none)
	{
		WaveInfoWidget.UpdateWaveCount();
	}
}

//==============================================================
// @name States
//==============================================================

/** Show or hide the HUD */
function NotifyVisibilityChange(bool bValue)
{
	if( bIsVisible != bValue )
	{
		bIsVisible = bValue;
		if(KFPC != none)
		{
			//Clear focus on next frame
			KFPC.SetTimer(0.01, false, nameOf(UpdateVisibilityState), self);
		}
	}
}

/** Make sure the chat box is closed if we've just opened a menu */
function UpdateVisibilityState()
{
	if(bIsVisible)
	{
		if( HudChatBox != none )
		{
			HudChatBox.ClearAndCloseChat();			
		}
	}
	else
	{
		Callback_ChatBoxClosed();
	}
}

/** Hide the HUD elements and only display the spectating part of the HUD */
function SetHUDSpectating( bool bSpectate )
{
	bIsSpectating = bSpectate;

	KFGXHUDManager.SetBool("bSpectating", bIsSpectating);
}

/** Display the scoreboard on screen */
function ShowScoreboard(bool newShowScoreboard)
{
	if(ScoreboardWidget  != none)
	{
		ScoreboardWidget.SetOpen(newShowScoreboard);
		ScoreboardWidget.bUpdateScoreboard = newShowScoreboard;
	}
}

/** Display the voicecoms on screen */
function ShowVoiceComms(bool bShowComms)
{
	if(VoiceCommsWidget != none && !bIsSpectating)
	{
		if(bShowComms)
		{
			VoiceCommsWidget.EnableComm();
			ShowScoreboard(false);
			if(WeaponSelectWidget != none)
			{
				WeaponSelectWidget.Hide();
			}
		}
		else
		{
			VoiceCommsWidget.DisableComm();
		}
		SetMovieCanReceiveFocus(bShowComms);
		SetMovieCanReceiveInput(bShowComms);
	}
}

//==============================================================
// @name Died / Clean up
//==============================================================

function PlayerOwnerDied()
{
	if(VoiceCommsWidget != none)
	{
		VoiceCommsWidget.DisableComm();
	}
	if(WeaponSelectWidget != none)
	{
		WeaponSelectWidget.Hide();
	}
}

function CleanUp()
{
	//Remove the delegate off of the VoiceComms so the game doesn't crash.  Crashes are bad.  They make me sad.
	if(GetGameViewportClient() != none)
	{
		GetGameViewportClient().HandleInputAxis = none;
	}
}

function NotifyHUDofPRIDestroyed(KFPlayerReplicationInfo KFPRI)
{
	if(VOIPWidget != none)
	{
		VOIPWidget.VOIPEventTriggered(KFPRI, false);
	}
}

//==============================================================
// Localized Message rendering
//==============================================================

function ShowKillMessage(string Value, string colorValue)
{
	local GFxObject DataObject;

	if( KFGXHUDManager != none )
	{
		DataObject = CreateObject("Object");
		DataObject.SetString("text", value);
		DataObject.SetString("textColor", colorValue);
		KFGXHUDManager.SetObject("newBark", DataObject);
	}
}

function ShowBossNameplate(string BossName, string InSecondaryMessageString)
{
	local GFxObject TempObject;

	ShowVoiceComms(false);

	if(BossNameplateContainer != none && BossName != "")
	{
		TempObject = CreateObject("Object");
		TempObject.SetString("bossName", BossName);
		TempObject.SetString("subString", InSecondaryMessageString);
		KFGXHUDManager.SetObject("bossData", TempObject);
	}
}

function HideBossNamePlate()
{
	if(BossNameplateContainer != none)
	{
		KFGXHUDManager.ActionScriptVoid("hideBossNamePlate");
	}
}

function DisplayPriorityMessage(string InPrimaryMessageString, string InSecondaryMessageString, int LifeTime)
{
	if(PriorityMessageContainer != none && InPrimaryMessageString != "" )
	{
		PriorityMessageContainer.ActionScriptVoid("showNewPriorityMessage");
	}
}

/** Display a message that corresponds to input */
function DisplayInteractionMessage( string MessageString, int MessageIndex, optional string ButtonName = "", optional float Duration )
{
	if( InteractionMessageContainer != none )
	{
			if( MessageIndex == IMT_None )
			{
				HideInteractionMessage();
			}
		// allow messages of the same priority to replace each other (unless it's the same message)
		else if( MessageIndex != CurrentInteractionIndex && GetInteractionMessagePriority(MessageIndex) >= GetInteractionMessagePriority(CurrentInteractionIndex) )
			{
            	MessageString = Caps(MessageString);
				if ( KFPC != None )
				{
					KFPC.ClearTimer(nameOf(HideInteractionMessage), self);
					if ( Duration > 0.f )
					{
						KFPC.SetTimer(Duration, false, nameOf(HideInteractionMessage), self);
					}
				}

				//Check to see if removing the controller prefix will result in a single character.  If we send a single character
				// bad things will happen. 
				if(class'Actor'.static.Len(ButtonName) - class'Actor'.static.Len(ControllerStringPrefix) > 1)
				{
					//Image Replacing a string in AS3 cannot take a substring larger than 15 characters.  We remove the prefix for controllers
					//because these are common accross all controller inputs.  
					class'Actor'.static.ReplaceText(ButtonName, ControllerStringPrefix, "" );
				}
				// Put the command into the string so that it can be replaced  Scaleform will not try to image replace a keyboard command unless
				// we actually put an icon and object for it. 
				class'Actor'.static.ReplaceText(MessageString, "<%X%>", ButtonName );
				
				SendInteractionMessageToGFX(MessageString);
			CurrentInteractionIndex = MessageIndex;
			}
		}
}

/** Allows client to group message indices together in the same priority (e.g. all usable trigger messages get same priority even though enum id is different) */
function int GetInteractionMessagePriority( int MessageIndex )
{
	// for now, make all usable messages the same priority
	if( MessageIndex < IMT_GamepadWeaponSelectHint )
	{
		return IMT_GamepadWeaponSelectHint - 1;
	}

	return MessageIndex;
}

/** Display a message that corresponds to input */
function SendInteractionMessageToGFX(string MessageString)
{
	InteractionMessageContainer.ActionScriptVoid("showInteractionMessage");
}

/** 
* Close the interaction message 
*/
function HideInteractionMessage()
{
	CurrentInteractionIndex = IMT_None;
	InteractionMessageContainer.ActionScriptVoid("outInteractionMessage");
}

/** Show less important messages */ 
function ShowNonCriticalMessage(string LocalizedMessage)
{
	if(NonCriticalGameMessageWidget != none)
	{
		NonCriticalGameMessageWidget.ShowMessage(LocalizedMessage);
	}
}


function UpdateRhythmCounterWidget(int value, int max)
{
	if(RhythmCounterWidget != none)
	{
		RhythmCounterWidget.SetCount(value, max);
	}
}

//==============================================================
// Input
//==============================================================

/** Set whether the HUD should eat all button input */
function EatMyInput(bool bValue)
{
	local byte HUDPriority;
	
	if( bValue )
	{
		GetPC().PlayerInput.ResetInput();
	}
	
	// Set whether the HUD should eat the input
	SetMovieCanReceiveFocus(bValue);
	SetMovieCanReceiveInput(bValue);

	// Set the HUD as the movie player with the highest priority
	HUDPriority = ( bValue ) ? 255 : 1;
	SetPriority(HUDPriority);
}

/** Update icons with either mouse / keyboard or gamepad */
function UpdateUsingGamepad()
{
    if(SpectatorInfoWidget != none)
    {
    	SpectatorInfoWidget.UpdateUsingGamepad(bUsingGamepad);
    }
    if(KickVoteWidget != none)
    {
    	KickVoteWidget.UpdateUsingGamepad(bUsingGamepad);
    }
}

//==============================================================
// In-Game Chat Box.
//==============================================================

// A player pressed the 'Talk' key. Open the Gfx chat box.
function OpenChatBox()
{
	if(HudChatBox != none)
	{
		HudChatBox.OpenInputField();

		// Give focus to the GfxMovie so player can type in the box.
		EatMyInput(true);
		bIgnoreMouseInput = false;
	}
}

function ShowKickVote(PlayerReplicationInfo PRI, byte VoteDuration, bool bShowChoices)
{
	if(KickVoteWidget != none)
	{
		KickVoteWidget.ShowKickVote(PRI, VoteDuration, bShowChoices);
	}
}

simulated function HideKickVote()
{
	if(KickVoteWidget != none)
	{
		KickVoteWidget.VoteClosed();
	}
}

function UpdateKickVoteCount(byte YesVotes, byte NoVotes)
{
	if(KickVoteWidget != none)
	{
		KickVoteWidget.UpdateKickVoteCount(YesVotes, NoVotes);
	}
}

//==============================================================
// Updates
//==============================================================

/* currently only set in the INI file due to Relow issues with layouts. */
function UpdateScale()
{
	if(KFGXHUDManager != none)
	{
		KFGXHUDManager.SetFloat("HUDScale", HUDScale);
	}
}

/** Refresh the weapon HUD upon obtaining a new one */
function NotifyHUDofWeapon()
{
	if(WeaponSelectWidget != none)
	{
		WeaponSelectWidget.RefreshWeaponSelect();
	}
}

function ClearBuffIcons()
{
	if(PlayerStatusContainer != none)
	{
		PlayerStatusContainer.ClearBuffIcons();
	}
}

//==============================================================
// ActionScript Callbacks
//==============================================================

function Callback_BroadcastChatMessage(string NewMessage)
{
	if(!IsPendingKill())
	{
		if(NewMessage != "")
		{
    		if(KFPC.CurrentTextChatChannel == ETCC_TEAM)
    		{
    			GetPC().TeamSay(NewMessage);	
    		}
    		else
    		{
    			GetPC().Say(NewMessage);	
    		}
		}
	}
}

function Callback_ChatBoxClosed()
{
	EatMyInput(false);
	bIgnoreMouseInput = true;
}

function Callback_SelectWeapon( int GroupIndex, int WeaponIndex )
{
	local KFInventoryManager KFIM;
	if(GetPC().Pawn != none )
	{
		KFIM = KFInventoryManager(GetPC().Pawn.InvManager);
		if ( KFIM != none )
		{
			KFIM.SelectCurrentWeapon( GroupIndex, WeaponIndex );
		}
	}
}

function Callback_WeaponSelectFadedOut()
{
	if ( WeaponSelectWidget != none)
	{
		WeaponSelectWidget.bChangingWeapons = false;
	}
}

function Callback_VoiceCommsSay(int CommsIndex)
{
	if(VoiceCommsWidget != none)
	{
		VoiceCommsWidget.SayVoiceCommms(CommsIndex);
	}
}

function Callback_VoteKick(bool bKick)
{
	local KFPlayerReplicationInfo KFPRI;

	KFPRI = KFPlayerReplicationInfo(GetPC().PlayerReplicationInfo);

	KFPRI.CastKickVote(KFPRI, bKick);
}

defaultproperties
{
   HUDScale=1.000000
   ControllerStringPrefix="XboxTypeS_"
   UpdateInterval=0.100000
   MovieInfo=SwfMovie'UI_HUD.InGameHUD_SWF'
   bDisplayWithHudOff=False
   bAutoPlay=True
   bCaptureInput=True
   WidgetBindings(0)=(WidgetName="SpectatorInfoWidget",WidgetClass=Class'KFGame.KFGFxHUD_SpectatorInfo')
   WidgetBindings(1)=(WidgetName="PlayerStatWidgetMC",WidgetClass=Class'KFGame.KFGFxHUD_PlayerStatus')
   WidgetBindings(2)=(WidgetName="PlayerBackpackWidget",WidgetClass=Class'KFGame.KFGFxHUD_PlayerBackpack')
   WidgetBindings(3)=(WidgetName="PriorityMsgWidget",WidgetClass=Class'GFxUI.GFxObject')
   WidgetBindings(4)=(WidgetName="BossNamePlate",WidgetClass=Class'GFxUI.GFxObject')
   WidgetBindings(5)=(WidgetName="interactionMsgWidget",WidgetClass=Class'GFxUI.GFxObject')
   WidgetBindings(6)=(WidgetName="ControllerWeaponSelectContainer",WidgetClass=Class'KFGame.KFGFxHUD_WeaponSelectWidget')
   WidgetBindings(7)=(WidgetName="WeaponSelectContainer",WidgetClass=Class'KFGame.KFGFxHUD_WeaponSelectWidget')
   WidgetBindings(8)=(WidgetName="CompassContainer",WidgetClass=Class'KFGame.KFGFxHUD_TraderCompass')
   WidgetBindings(9)=(WidgetName="WaveInfoContainer",WidgetClass=Class'KFGame.KFGFxHUD_WaveInfo')
   WidgetBindings(10)=(WidgetName="ScoreboardWidgetMC",WidgetClass=Class'KFGame.KFGFxHUD_ScoreboardWidget')
   WidgetBindings(11)=(WidgetName="ChatBoxWidget",WidgetClass=Class'KFGame.KFGFxHUD_ChatBoxWidget')
   WidgetBindings(12)=(WidgetName="VOIPWidget",WidgetClass=Class'KFGame.KFGFxWidget_VOIPNotification')
   WidgetBindings(13)=(WidgetName="LevelUpNotificationWidget",WidgetClass=Class'KFGame.KFGFxWidget_LevelUpNotification')
   WidgetBindings(14)=(WidgetName="VoiceCommsWidget",WidgetClass=Class'KFGame.KFGFxWidget_VoiceComms')
   WidgetBindings(15)=(WidgetName="KickVoteWidget",WidgetClass=Class'KFGame.KFGFxWidget_KickVote')
   WidgetBindings(16)=(WidgetName="MusicNotification",WidgetClass=Class'KFGame.KFGFxWidget_MusicNotification')
   WidgetBindings(17)=(WidgetName="NonCriticalMessageWidget",WidgetClass=Class'KFGame.KFGFxWidget_NonCriticalGameMessage')
   WidgetBindings(18)=(WidgetName="RhythmCounter",WidgetClass=Class'KFGame.KFGFxWidget_RhythmCounter')
   Name="Default__KFGFxMoviePlayer_HUD"
   ObjectArchetype=GFxMoviePlayer'GFxUI.Default__GFxMoviePlayer'
}
