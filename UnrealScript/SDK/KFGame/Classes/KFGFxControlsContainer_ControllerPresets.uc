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

DefaultProperties
{
	InputSectionName="LocalizedControls"
	PackageName="KFGame"
	CurrentPresetIndex=255
}