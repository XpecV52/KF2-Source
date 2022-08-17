//=============================================================================
// KFGFxWidget_VoiceComms
//=============================================================================
// HUD Widget that displays options for voice communication
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Zane Gholson 09/11/2014
//=============================================================================

class KFGFxWidget_VoiceComms extends GFxObject;

var Vector RawJoyVector;
var PlayerController PC;

var array<string> IconPaths;
var bool bActive;

var const float MouseDampening;
var const float ControllerDampening;

function InitializeHUD()
{
	SetLocalizedText();
	PC = GetPC();
}

function SetLocalizedText()
{
	local GFxObject DataProvider, TempObj;
	local byte i;

	DataProvider = CreateArray();
	for (i = 0; i < VCT_MAX; i++)
	{
		TempObj = CreateObject("Object");
		TempObj.SetString("text", class'KFLocalMessage_VoiceComms'.default.VoiceCommsOptionStrings[i]);
		TempObj.SetString("iconPath", "img://"$IconPaths[i]);

		DataProvider.SetElementObject(i,TempObj);
	}

	SetObject("textOptions", DataProvider);
}

function SayVoiceCommms(int CommsIndex)
{	
	KFPlayerController(GetPC()).ServerPlayVoiceCommsDialog(CommsIndex);
}

function EnableComm()
{
	//Don't allow the user to open voice comms if they are dead. 
	if(!PC.IsDead() && PC.Pawn != none)
	{
		bActive = true;
		//Disable player rotate and click
		PC.IgnoreLookInput( true );  // Calling this instead of SetCinematicMode so we can avoid the Performance issue associated with opening comms on Console.
		GetGameViewportClient().HandleInputAxis = OnAxisModified;
		SetBool("bUsingGamePad", PC.PlayerInput.bUsingGamepad);
		ActionScriptVoid("enableComm");
	}
}

function DisableComm()
{
	if(bActive)
	{
		bActive = false;
		PC.IgnoreLookInput( false );  // Since we are no longer toggling CinematicMode return lookInput to normal.
		GetGameViewportClient().HandleInputAxis = None;
		ActionScriptVoid("disableComm");
	}
}

//==============================================================
//@name Mouse/Controller Support
//==============================================================

function bool OnAxisModified( int ControllerId, name Key, float Delta, float DeltaTime, bool bGamepad )
{
	local Vector MouseVector;
	if ( PC.PlayerInput.bUsingGamepad )
	{
	 	UpdateJoystickDirection( Key, Delta );
		// Pass the raw values and let scaleform determine the position of the selector. -HSL_BB
		UpdateUICursorPosition(RawJoyVector.X, RawJoyVector.Y, false);
	}
	else
	{
		if(Key == 'MouseX')
		{
			MouseVector.X = Delta;
		}
		else if(Key == 'MouseY')
		{
			MouseVector.Y = Delta;
		}
		
		UpdateUICursorPosition( MouseVector.X * MouseDampening, -MouseVector.Y * MouseDampening,true);
	}
	return false;
}

function UpdateJoystickDirection( name Key, float Delta )
{
	if ( Key == 'XboxTypeS_RightX')
	{
    	RawJoyVector.X = Delta;
	}
	if ( Key == 'XboxTypeS_RightY')
	{
		RawJoyVector.Y = Delta;
	}
}

function UpdateUICursorPosition(float newX, float newY, bool bMouseInput)
{
	ActionScriptVoid("setNormalizedMousePosition");
}

DefaultProperties
{
	ControllerDampening=2.5f
	MouseDampening=0.2f
	//defaults
	bActive=false
	IconPaths[VCT_REQUEST_HEALING]="UI_VoiceComms_TEX.UI_VoiceCommand_Icon_Heal"
	IconPaths[VCT_REQUEST_DOSH]="UI_VoiceComms_TEX.UI_VoiceCommand_Icon_Dosh"
	IconPaths[VCT_REQUEST_HELP]="UI_VoiceComms_TEX.UI_VoiceCommand_Icon_Help"
	IconPaths[VCT_TAUNT_ZEDS]="UI_VoiceComms_TEX.UI_VoiceCommand_Icon_Taunt"
	IconPaths[VCT_FOLLOW_ME]="UI_VoiceComms_TEX.UI_VoiceCommand_Icon_Follow"
	IconPaths[VCT_GET_TO_THE_TRADER]="UI_VoiceComms_TEX.UI_VoiceCommand_Icon_Trader"
	IconPaths[VCT_AFFIRMATIVE]="UI_VoiceComms_TEX.UI_VoiceCommand_Icon_Affirmative"
	IconPaths[VCT_NEGATIVE]="UI_VoiceComms_TEX.UI_VoiceCommand_Icon_Negative"
}