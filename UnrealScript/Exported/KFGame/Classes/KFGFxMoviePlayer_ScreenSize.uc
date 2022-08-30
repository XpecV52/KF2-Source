//=============================================================================
// KFGFxMoviePlayer_Tutorial
//=============================================================================
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Zane Gholson 4/21/2016
//=============================================================================

class KFGFxMoviePlayer_ScreenSize extends GFxMoviePlayer;









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
#linenumber 12

var name SoundThemeName;
var bool bUsingGamepad;
var GFxObject ManagerObject;
var KFGFxMoviePlayer_Manager GFxMenuManager;
var KFPlayerController KFPC;
var const float AdjustMovePercentage;
var const float SafeFrameMinScale;
var KFGameEngine KFEngine;
var KFProfileSettings Profile;

var KFGFxScreenSizeContainer ScreenSizeContainer;

function Init(optional LocalPlayer LocPlay)
{
	super.Init(LocPlay);
	
	KFPC = KFPlayerController(GetPC());
	GFxMenuManager = KFPC.MyGFxManager;
	KFEngine = KFGameEngine(class'Engine'.static.GetEngine());
	Profile = GFxMenuManager.CachedProfile;
}


/** Ties the GFxClikWidget variables to the .swf components and handles events */
event bool WidgetInitialized(name WidgetName, name WidgetPath, GFxObject Widget)
{
	local bool bHandled;
	LogInternal("widgetname: " @WidgetName);
	bHandled = true;

	switch ( WidgetName )
	{
		case ( 'root1' ):
			if ( ManagerObject == none )
			{
				ManagerObject = Widget;
				// Let the menuManager know if we are on console.
				if ( class'WorldInfo'.static.IsConsoleBuild() )
				{
					ManagerObject.SetBool("bUsingGamepad", true);					
				}
			}
		break;
		case ( 'screenSizePopup' ):
			if ( ScreenSizeContainer == none )
			{
				ScreenSizeContainer = KFGFxScreenSizeContainer(Widget);
				ScreenSizeContainer.InitMenu();
			}
		break;
		default:
			bHandled = false;
	}

	return bHandled;
}


/* This is only used for the controller to switch between different components in the trader menu
 and open / close the perk selector */
event bool FilterButtonInput(int ControllerId, name ButtonName, EInputEvent InputEvent)
{
	if ( !class'WorldInfo'.static.IsConsoleBuild() )
	{
		CheckIfUsingGamepad();
	}

 	return false;
}

// Checks if our form of input has changed
function CheckIfUsingGamepad()
{
	local bool bGamepad;
	
    bGamepad = GetUsingGamepad();
	if ( bUsingGamepad != bGamepad )
	{
		OnInputTypeChanged(bGamepad);
	}
}

function OnInputTypeChanged(bool bGamePad)
{
	bUsingGamepad = bGamepad;
	if(ManagerObject != none)
	{
		ManagerObject.SetBool("bUsingGamepad", bGamePad);
	}	
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


function NotifyControllerDisconnected()
{
	SetVisibility(false);
	SetPriority(1);
	GFxMenuManager.SetPriority(2);
}


function NotifyControllerReconnected()
{
	SetVisibility(true);
	SetPriority(2);
	GFxMenuManager.SetPriority(1);
}

function Callback_Enlarge()
{
	KFEngine.SafeFrameScale += AdjustMovePercentage;
	KFEngine.SafeFrameScale = FClamp( KFEngine.SafeFrameScale, SafeFrameMinScale, 1.0f );
}

function Callback_Shrink()
{
	KFEngine.SafeFrameScale -= AdjustMovePercentage;
	KFEngine.SafeFrameScale = FClamp(KFEngine.SafeFrameScale, SafeFrameMinScale, 1.0f);
}

function Callback_Confirm()
{
	SaveAndClose();
}

function Callback_Cancel()
{
	//SaveAndClose(); //do not want to use B button
}


function SaveAndClose()
{
	Profile.SetProfileSettingValueFloat(KFID_SafeFrameScale, KFEngine.SafeFrameScale);
	Profile.Save( GetLP().ControllerId );
	GFxMenuManager.CloseScreenSizeMovie();
}

defaultproperties
{
   SoundThemeName="ButtonSoundTheme"
   AdjustMovePercentage=0.005000
   SafeFrameMinScale=0.850000
   MovieInfo=SwfMovie'UI_ScreenSize.ScreenSizeManager_SWF'
   bAutoPlay=True
   bCaptureInput=True
   bCaptureMouseInput=True
   CaptureKeys(0)="XboxTypeS_A"
   CaptureKeys(1)="XboxTypeS_B"
   CaptureKeys(2)="XboxTypeS_DPad_Left"
   CaptureKeys(3)="XboxTypeS_DPad_Up"
   CaptureKeys(4)="XboxTypeS_DPad_Down"
   CaptureKeys(5)="XboxTypeS_DPad_Right"
   CaptureKeys(6)="XboxTypeS_LeftTrigger"
   CaptureKeys(7)="XboxTypeS_RightTrigger"
   SoundThemes(0)=(ThemeName="ButtonSoundTheme",Theme=UISoundTheme'SoundsShared_UI.SoundTheme_Buttons')
   SoundThemes(1)=(ThemeName="UI",Theme=UISoundTheme'SoundsShared_UI.SoundTheme_UI')
   WidgetBindings(0)=(WidgetName="screenSizePopup",WidgetClass=Class'KFGame.KFGFxScreenSizeContainer')
   Name="Default__KFGFxMoviePlayer_ScreenSize"
   ObjectArchetype=GFxMoviePlayer'GFxUI.Default__GFxMoviePlayer'
}
