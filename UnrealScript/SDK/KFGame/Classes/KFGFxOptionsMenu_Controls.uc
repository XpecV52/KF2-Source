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
	
	DataProvider = CreateArray();
	for( i = 0; i < TabStrings.length; i++ )
	{
		DataObject = CreateObject( "Object" );
		DataObject.SetString( "label", TabStrings[i] );
		DataProvider.SetElementObject( i, DataObject );
	}

	SetObject("tabStrings", DataProvider);

	LocalizedObject = CreateObject("Object");

	LocalizedObject.SetString("header", HeaderText);
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
}

function Callback_ControllerZoomSensitivity( float NewSensitivity )
{
	local KFPlayerInput KFPI;

	KFPI = KFPlayerInput(GetPC().PlayerInput);

	KFPI.GamepadZoomedSensitivityScale = NewSensitivity / 100;
}

function Callback_ControllerInvertChanged( bool bInvertController )
{
	local KFPlayerInput KFPI;

	KFPI = KFPlayerInput(GetPC().PlayerInput);
	KFPI.bInvertController = bInvertController;
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
}

function Callback_AimAssistRotationChanged( bool NewValue )
{
	local KFPlayerInput KFPI;

	KFPI = KFPlayerInput(GetPC().PlayerInput);

	KFPI.bTargetAdhesionEnabled = NewValue;
}

function Callback_AimAssistSlowDownChanged( bool NewValue )
{
	local KFPlayerInput KFPI;

	KFPI = KFPlayerInput(GetPC().PlayerInput);

	KFPI.bTargetFrictionEnabled = NewValue;
}

function Callback_ForceFeedbackChanged( bool NewValue )
{
	local KFPlayerInput KFPI;

	KFPI = KFPlayerInput(GetPC().PlayerInput);
	KFPI.bForceFeedbackEnabled = NewValue;	
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
}

function Callback_UpdateControllerPreset(int PresetIndex)
{
	if(ControllerPresetsContainer != none)
	{
		ControllerPresetsContainer.UpdateCurrentPresetArray(PresetIndex);
	}

}

defaultproperties
{
	MinControllerLookSensitivity=.4 
	MaxControllerLookSensitivity=1.2 
	MinControllerZoomLookSensitivity=.3
	MaxControllerZoomLookSensitivity=1
	MinMouseLookSensitivity=.01
	MaxMouseLookSensitivity=.7
	MinMouseLookZoomSensitivity=.2
	MaxMouseLookZoomSensitivity=1

	SubWidgetBindings.Add((WidgetName="keybindingsContainer",WidgetClass=class'KFGFxControlsContainer_Keybinding'))
	SubWidgetBindings.Add((WidgetName="inputContainer",WidgetClass=class'KFGFxControlsContainer_Input'))
	SubWidgetBindings.Add((WidgetName="controllerPresetsContainer",WidgetClass=class'KFGFxControlsContainer_ControllerPresets'))	
}