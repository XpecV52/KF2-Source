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
var localized array<string> VoiceCommsOptionStrings;
var array<string> IconPaths;
var bool bActive;

var const float MouseDampening;
var const float ControllerDampening;

enum EComms
{
	COMMS_REQUEST_HEALING,
	COMMS_REQUEST_DOSH,
	COMMS_REQUEST_HELP,
	COMMS_TAUNT_ZEDS,
	COMMS_FOLLOW_ME,
	COMMS_GET_TO_THE_TRADER,
	COMMS_AFFIRMATIVE,
	COMMS_NEGATIVE,
	COMMS_MAX
};

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
	for (i = 0; i < COMMS_MAX; i++)
	{
		TempObj = CreateObject("Object");
		TempObj.SetString("text", VoiceCommsOptionStrings[i]);
		TempObj.SetString("iconPath", "img://"$IconPaths[i]);

		DataProvider.SetElementObject(i,TempObj);
	}

	SetObject("textOptions", DataProvider);
}

function SayVoiceCommms(int CommsIndex)
{
	if(CommsIndex < VoiceCommsOptionStrings.length && GetPC() != none)
	{
		GetPC().Say(VoiceCommsOptionStrings[CommsIndex]);
	}
	
	KFPlayerController(GetPC()).ServerPlayVoiceCommsDialog(CommsIndex);
}

function EnableComm()
{
	//Don't allow the user to open voice comms if they are dead. 
	if(!PC.IsDead() && PC.Pawn != none)
	{
		bActive = true;
		//Disable player rotate and click
		PC.SetCinematicMode(true, false, false, false, true, false);
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
	 	UpdateUICursorPosition(RawJoyVector.X * ControllerDampening, RawJoyVector.Y * ControllerDampening);
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
		
		UpdateUICursorPosition( MouseVector.X * MouseDampening, -MouseVector.Y * MouseDampening);
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

function UpdateUICursorPosition(float newX, float newY)
{
	ActionScriptVoid("setNormalizedMousePosition");
}

defaultproperties
{
   VoiceCommsOptionStrings(0)="REQUEST HEALING"
   VoiceCommsOptionStrings(1)="REQUEST DOSH"
   VoiceCommsOptionStrings(2)="REQUEST HELP"
   VoiceCommsOptionStrings(3)="TAUNT ZEDS"
   VoiceCommsOptionStrings(4)="FOLLOW ME"
   VoiceCommsOptionStrings(5)="GET TO THE TRADER"
   VoiceCommsOptionStrings(6)="AFFIRMATIVE"
   VoiceCommsOptionStrings(7)="NEGATIVE"
   IconPaths(0)="UI_VoiceComms_TEX.UI_VoiceCommand_Icon_Heal"
   IconPaths(1)="UI_VoiceComms_TEX.UI_VoiceCommand_Icon_Dosh"
   IconPaths(2)="UI_VoiceComms_TEX.UI_VoiceCommand_Icon_Help"
   IconPaths(3)="UI_VoiceComms_TEX.UI_VoiceCommand_Icon_Taunt"
   IconPaths(4)="UI_VoiceComms_TEX.UI_VoiceCommand_Icon_Follow"
   IconPaths(5)="UI_VoiceComms_TEX.UI_VoiceCommand_Icon_Trader"
   IconPaths(6)="UI_VoiceComms_TEX.UI_VoiceCommand_Icon_Affirmative"
   IconPaths(7)="UI_VoiceComms_TEX.UI_VoiceCommand_Icon_Negative"
   MouseDampening=0.200000
   ControllerDampening=2.500000
   Name="Default__KFGFxWidget_VoiceComms"
   ObjectArchetype=GFxObject'GFxUI.Default__GFxObject'
}
