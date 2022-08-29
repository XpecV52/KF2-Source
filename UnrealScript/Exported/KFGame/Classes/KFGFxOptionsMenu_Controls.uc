//=============================================================================
// KFGFxOptionsMenu_Controls
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  Greg Felber -  9/10/2014
//=============================================================================

class KFGFxOptionsMenu_Controls extends KFGFxObject_Menu;









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
#linenumber 13

var KFGFxControlsContainer_Keybinding KeybindingsContainer;
var KFGFxControlsContainer_Input InputContainer;
var KFGFxControlsContainer_ControllerPresets ControllerPresetsContainer;

var const float MinControllerLookSensitivity;
var const float MaxControllerLookSensitivity;
var const float MinControllerZoomLookSensitivity;
var const float MaxControllerZoomLookSensitivity;
var const float MinMouseLookSensitivity;
var const float MaxMouseLookSensitivity;
var const float MinMouseLookZoomSensitivity;
var const float MaxMouseLookZoomSensitivity;

var localized array<string> TabStrings;
var localized string HeaderText;
function InitializeMenu( KFGFxMoviePlayer_Manager InManager )
{
	super.InitializeMenu( InManager );
	LocalizeText();
}

function LocalizeText()
{
	local byte i;
	local GFxObject DataProvider, DataObject;
	local GFxObject LocalizedObject;
	local array<string> DisplayedStrings;
	
	DataProvider = CreateArray();
	DisplayedStrings = TabStrings;

	// Removing the keybindings option.
	if( GetPC().WorldInfo.IsConsoleBuild() )
	{
		DisplayedStrings.Remove(1,1);
	}
	for( i = 0; i < DisplayedStrings.length; i++ )
	{
		DataObject = CreateObject( "Object" );
		DataObject.SetString( "label", DisplayedStrings[i] );
		DataProvider.SetElementObject( i, DataObject );
	}

	SetObject("tabStrings", DataProvider);

	LocalizedObject = CreateObject("Object");

	LocalizedObject.SetString("header", Caps(class'KFGFxOptionsMenu_Selection'.default.OptionStrings[OM_Controls]));
	LocalizedObject.SetString("close", Class'KFCommon_LocalizedStrings'.default.BackString);

	SetObject("localizedText", LocalizedObject);

}

function OnInputTypeChanged(bool bGamePad)
{
	if(KeybindingsContainer != none)
	{
		KeybindingsContainer.UpdateAllBindings();
	}
}

/** Ties unrealscript variables to the .swf components */
event bool WidgetInitialized(name WidgetName, name WidgetPath, GFxObject Widget)
{
	//`log("Frontend Widget: " @WidgetName @" : " @WidgetPath);

	switch(WidgetName)
	{
        case ('keybindingsContainer'):
			if ( KeybindingsContainer == none )
			{
			    KeybindingsContainer = KFGFxControlsContainer_Keybinding( Widget );
			    KeybindingsContainer.Initialize( self );
		    }
        break;
        case ('controllerPresetsContainer'):
			if ( ControllerPresetsContainer == none )
			{
			    ControllerPresetsContainer = KFGFxControlsContainer_ControllerPresets( Widget );
			    ControllerPresetsContainer.Initialize( self );
		    }
        break;
        case ('inputContainer'):
			if ( InputContainer == none )
			{
			    InputContainer = KFGFxControlsContainer_Input( Widget );
			    InputContainer.Initialize( self );
		    }
        break;
	}

	return true;
}

function OnOpen()
{
 	if( KeybindingsContainer != none )
 	{
 		KeybindingsContainer.UpdateAllBindings();
 	}
}

event OnClose()
{
	if( KeybindingsContainer != none )
 	{
 		KeybindingsContainer.ClearInputOnContainer();
 	}	
 	SaveConfigValues();
}

//Do this when we close the menu so that we do not constantly write to the config.
function SaveConfigValues()
{
	local KFPlayerInput KFPI;

	KFPI = KFPlayerInput(GetPC().PlayerInput);	
	KFPI.SaveConfig();
}

/** Detects any input and passes it to the active view*/
event bool FilterButtonInput(int ControllerId, name ButtonName, EInputEvent InputEvent)
{
	if( KeybindingsContainer != none )
 	{
 		KeybindingsContainer.BindKey( ButtonName, InputEvent );
 	}
	return super.FilterButtonInput( ControllerId, ButtonName, InputEvent );
}


function Callback_ControllerSensitivity( float NewSensitivity )
{
	local KFPlayerInput KFPI;

	KFPI = KFPlayerInput(GetPC().PlayerInput);

	KFPI.GamepadSensitivityScale = NewSensitivity / 100;
	Manager.CachedProfile.SetProfileSettingValueFloat(KFID_GamepadSensitivityScale, KFPI.GamepadSensitivityScale);
}

function Callback_ControllerZoomSensitivity( float NewSensitivity )
{
	local KFPlayerInput KFPI;

	KFPI = KFPlayerInput(GetPC().PlayerInput);

	KFPI.GamepadZoomedSensitivityScale = NewSensitivity / 100;
	Manager.CachedProfile.SetProfileSettingValueFloat(KFID_GamepadZoomedSensitivityScale, KFPI.GamepadZoomedSensitivityScale);
}

function Callback_ControllerInvertChanged( bool bInvertController )
{
	local KFPlayerInput KFPI;

	KFPI = KFPlayerInput(GetPC().PlayerInput);
	KFPI.bInvertController = bInvertController;
	Manager.CachedProfile.SetProfileSettingValueInt(KFID_InvertController, KFPI.bInvertController ? 1: 0);
}

function Callback_MouseSensitivity( float NewSensitivity )
{
	GetPC().PlayerInput.SetSensitivity( NewSensitivity );
}

function Callback_MouseZoomSensitivity( float NewSensitivity )
{
	KFPlayerInput(GetPC().PlayerInput).SetZoomedSensitivity( NewSensitivity / 100 );
}

function Callback_InvertChanged( bool bInvertMouse )
{
	GetPC().PlayerInput.bInvertMouse = bInvertMouse;
}

function Callback_MouseSmoothingChanged( bool NewValue )
{
	local KFPlayerInput KFPI;

	KFPI = KFPlayerInput(GetPC().PlayerInput);

	KFPI.bEnableMouseSmoothing = NewValue;
}

function Callback_AimAssistZoomLockOnChanged( bool NewValue )
{
	local KFPlayerInput KFPI;

	KFPI = KFPlayerInput(GetPC().PlayerInput);

	KFPI.bAutoTargetEnabled = NewValue;

	Manager.CachedProfile.SetProfileSettingValueInt(KFID_AutoTargetEnabled, KFPI.bAutoTargetEnabled ? 1: 0);
}

function Callback_AimAssistRotationChanged( bool NewValue )
{
	local KFPlayerInput KFPI;

	KFPI = KFPlayerInput(GetPC().PlayerInput);

	KFPI.bTargetAdhesionEnabled = NewValue;
	Manager.CachedProfile.SetProfileSettingValueInt(KFID_TargetAdhesionEnabled, KFPI.bTargetAdhesionEnabled ? 1: 0);
}

function Callback_AimAssistSlowDownChanged( bool NewValue )
{
	local KFPlayerInput KFPI;

	KFPI = KFPlayerInput(GetPC().PlayerInput);

	KFPI.bTargetFrictionEnabled = NewValue;
	Manager.CachedProfile.SetProfileSettingValueInt(KFID_TargetFrictionEnabled, KFPI.bTargetFrictionEnabled ? 1: 0);

}

function Callback_ForceFeedbackChanged( bool NewValue )
{
	local KFPlayerInput KFPI;

	KFPI = KFPlayerInput(GetPC().PlayerInput);
	KFPI.bForceFeedbackEnabled = NewValue;	
	Manager.CachedProfile.SetProfileSettingValueInt(KFID_ForceFeedbackEnabled , KFPI.bForceFeedbackEnabled ? 1: 0);
}


function Callback_ChangeBind( string ChangedCommand, byte SelectedSection )
{
	if( KeybindingsContainer != none )
 	{
 		KeybindingsContainer.ChangeBind( ChangedCommand, SelectedSection );
 	}
}

function Callback_ResetControls()
{
	if( KeybindingsContainer != none )
 	{
 		KeybindingsContainer.ResetControls();
 	}
}

function Callback_AcceptBind()
{
	if( KeybindingsContainer != none )
 	{
 		KeybindingsContainer.AcceptBind();
 	}
}

function Callback_CloseMenu()
{
	Manager.OpenMenu( UI_OptionsSelection );

	Manager.CachedProfile.Save( GetLP().ControllerId );
}

function Callback_UpdateControllerPreset(int PresetIndex)
{
	if(ControllerPresetsContainer != none)
	{
		ControllerPresetsContainer.UpdateCurrentPresetArray(PresetIndex);
		Manager.CachedProfile.SetProfileSettingValueInt(KFID_CurrentLayoutIndex, PresetIndex);
	}
}

function CallBack_ResetPresetOptions()
{
	if(ControllerPresetsContainer != None)
	{
		Manager.DelayedOpenPopup( EConfirmation, EDPPID_Misc,
			Localize("KFGFxOptionsMenu_Graphics","WarningPromptString","KFGame"), 
			Localize("KFGFxObject_Menu","ResetDefaults","KFGameConsole"),
			Localize("KFGFxOptionsMenu_Graphics","OKString","KFGame"),
			Localize("KFGFxOptionsMenu_Graphics","CancelString","KFGame"),
			controllerPresetsContainer.ResetPresetOptions);
	}
}

function CallBack_ResetInputOptions()
{
	if(InputContainer != None)
	{
		Manager.DelayedOpenPopup( EConfirmation, EDPPID_Misc,
			Localize("KFGFxOptionsMenu_Graphics","WarningPromptString","KFGame"), 
			Localize("KFGFxObject_Menu","ResetDefaults","KFGameConsole"),
			Localize("KFGFxOptionsMenu_Graphics","OKString","KFGame"),
			Localize("KFGFxOptionsMenu_Graphics","CancelString","KFGame"),
			InputContainer.ResetInputOptions);
	}
}

defaultproperties
{
   MinControllerLookSensitivity=0.400000
   MaxControllerLookSensitivity=3.500000
   MinControllerZoomLookSensitivity=0.100000
   MaxControllerZoomLookSensitivity=1.000000
   MinMouseLookSensitivity=0.010000
   MaxMouseLookSensitivity=0.700000
   MinMouseLookZoomSensitivity=0.200000
   MaxMouseLookZoomSensitivity=1.000000
   TabStrings(0)="INPUT"
   TabStrings(1)="KEY BINDINGS"
   TabStrings(2)="BUTTON LAYOUT"
   HeaderText="CONTROLS OPTIONS"
   SubWidgetBindings(0)=(WidgetName="KeybindingsContainer",WidgetClass=Class'KFGame.KFGFxControlsContainer_Keybinding')
   SubWidgetBindings(1)=(WidgetName="InputContainer",WidgetClass=Class'KFGame.KFGFxControlsContainer_Input')
   SubWidgetBindings(2)=(WidgetName="ControllerPresetsContainer",WidgetClass=Class'KFGame.KFGFxControlsContainer_ControllerPresets')
   Name="Default__KFGFxOptionsMenu_Controls"
   ObjectArchetype=KFGFxObject_Menu'KFGame.Default__KFGFxObject_Menu'
}
