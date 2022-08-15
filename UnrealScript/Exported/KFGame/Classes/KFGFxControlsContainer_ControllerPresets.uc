//=============================================================================
// KFGFxControlsContainer_ControllerPresets
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Zane Gholson -  11/19/2014
//=============================================================================

class KFGFxControlsContainer_ControllerPresets extends KFGFxObject_Container
	config(UI);

var const string InputSectionName;
var const string PackageName;

var localized string MovementString;
var localized string LookString;
var localized string ShowScoardBoardString;
var localized string ShowIngameMenuString;
var localized string HoldString;

struct KeyBinding
{
	var string Key;
	var string Command;
	var string HoldCommand;
};

var config array<KeyBinding> ControllerPreset0;

var byte CurrentLocalizedIndex;
var byte CurrentPresetIndex;

function Initialize( KFGFxObject_Menu NewParentMenu )
{
	super.Initialize( NewParentMenu );
	UpdateCurrentPresetArray(0);
}

function UpdateCurrentPresetArray(byte PresetIndex)
{
	if( PresetIndex != CurrentPresetIndex )
	{
		CurrentPresetIndex = PresetIndex;
		switch (CurrentPresetIndex)
		{
			case 0:
				LocalizeText(ControllerPreset0);	
			break;		
		}
	}
}

function LocalizeText(out array<KeyBinding> PresetArray)
{
	local GFxObject LocalizedObject, BindingsArray;
	local byte i;

	CurrentLocalizedIndex = 0;

	LocalizedObject = CreateObject( "Object" );

	BindingsArray = CreateArray();
	
	LocalizedObject.SetString("leftThumbstick", 				MovementString);
	LocalizedObject.SetString("rightThumbstick", 				LookString);
	LocalizedObject.SetString("back", 							ShowScoardBoardString);
	LocalizedObject.SetString("start", 							ShowIngameMenuString);

	for (i = 0; i < ControllerPreset0.length; i++)
	{
		AddBindingToGFxObject(BindingsArray, PresetArray[i].Key, PresetArray[i].Command, PresetArray[i].HoldCommand, i);
	}

	LocalizedObject.SetObject("bindings", BindingsArray);
	
	SetObject("localizedText", LocalizedObject);
}

function AddBindingToGFxObject(out GFxObject ObjectArray, string Key, string Command, string HoldCommand, byte i)
{
	local GFxObject TempObject;
	local string CommandString, HoldCommandString;

	TempObject = CreateObject("Object");

	CommandString = Localize(InputSectionName,  Command,  PackageName);

	if(HoldCommand != "")
	{

		HoldCommandString = Localize(InputSectionName,  HoldCommand,  PackageName);
		HoldCommandString -= HoldString;
		CommandString = CommandString $"\n" $HoldCommandString @HoldString;
	}
	TempObject.SetString("Key", 			Key);
	TempObject.SetString("Command", 		CommandString);

	ObjectArray.SetElementObject(i, TempObject);
}

defaultproperties
{
   InputSectionName="LocalizedControls"
   PackageName="KFGame"
   MovementString="Movement Control"
   LookString="Look Control"
   ShowScoardBoardString="Show Scoreboard"
   ShowIngameMenuString="Toggle In Game Menu"
   HoldString="(Hold)"
   ControllerPreset0(0)=(Key="rightTrigger",Command="GBA_Fire")
   ControllerPreset0(1)=(Key="leftTrigger",Command="GBA_IronSightsToggle",HoldCommand="GBA_IronSightsHold")
   ControllerPreset0(2)=(Key="rightBumper",Command="GBA_AltFire")
   ControllerPreset0(3)=(Key="leftBumper",Command="GBA_Grenade")
   ControllerPreset0(4)=(Key="l3",Command="GBA_SprintAndCrouch")
   ControllerPreset0(5)=(Key="r3",Command="GBA_Use")
   ControllerPreset0(6)=(Key="a",Command="GBA_Jump")
   ControllerPreset0(7)=(Key="b",Command="GBA_TertiaryFire")
   ControllerPreset0(8)=(Key="x",Command="GBA_Reload")
   ControllerPreset0(9)=(Key="y",Command="GBA_PrevWeapon",HoldCommand="GBA_WeaponSelect_Gamepad")
   ControllerPreset0(10)=(Key="left",Command="GBA_ToggleFlashlight")
   ControllerPreset0(11)=(Key="right",Command="GBA_ShowVoiceComms")
   ControllerPreset0(12)=(Key="up",Command="GBA_TossMoney",HoldCommand="GBA_DropWeapon")
   ControllerPreset0(13)=(Key="down",Command="GBA_QuickHeal")
   CurrentPresetIndex=255
   Name="Default__KFGFxControlsContainer_ControllerPresets"
   ObjectArchetype=KFGFxObject_Container'KFGame.Default__KFGFxObject_Container'
}
