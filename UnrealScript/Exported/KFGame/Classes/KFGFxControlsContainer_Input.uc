//=============================================================================
// KFGFxControlsContainer_Input
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Greg Felber -  9/10/2014
//=============================================================================

class KFGFxControlsContainer_Input extends KFGFxObject_Container
	config(UI);

var localized string SensitivityString, InvertedString;
var localized string ControllerSensitivityString, ControllerInvertedString;
var localized string ControllerString;
var localized string MouseString;

function Initialize( KFGFxObject_Menu NewParentMenu )
{
	super.Initialize( NewParentMenu );
	LocalizeText();
	InitializeOptions();
}

function LocalizeText()
{
	local GFxObject LocalizedObject;

	LocalizedObject = CreateObject( "Object" );
	LocalizedObject.SetString("sensitivityLabel", SensitivityString);
	LocalizedObject.SetString("invertedLabel", InvertedString);
	LocalizedObject.SetString("Mouse", MouseString);
	LocalizedObject.SetString("controllerSensitivityLabel", ControllerSensitivityString);
	LocalizedObject.SetString("controllerInvertedLabel", ControllerInvertedString);
	LocalizedObject.SetString("controllerString", ControllerString);

	SetObject("localizedText", LocalizedObject);
}

function InitializeOptions()
{
	local GFxObject ValuesObject;
	local KFPlayerInput KFPI;

	KFPI = KFPlayerInput(GetPC().PlayerInput);
	ValuesObject = CreateObject( "Object" );

	ValuesObject.SetFloat("sensitivityValue", KFPI.MouseSensitivity - class'KFGFxOptionsMenu_Controls'.default.BaseMouseLookSensitivity);
	ValuesObject.SetBool("invertedValue", KFPI.bInvertMouse);
	
	ValuesObject.SetFloat("controllerSensitivityValue", 100 * (KFPI.HorizontalSensitivityScale - class'KFGFxOptionsMenu_Controls'.default.BaseControllerLookSensitivity));
	ValuesObject.SetBool("controllerInvertedValue", KFPI.bInvertController);

	SetObject("initializeOptions", ValuesObject);
}

defaultproperties
{
   SensitivityString="Sensitivity"
   InvertedString="Inverted"
   ControllerSensitivityString="Look Sensitivity"
   ControllerInvertedString="Invert Y"
   ControllerString="Controller"
   MouseString="Mouse"
   Name="Default__KFGFxControlsContainer_Input"
   ObjectArchetype=KFGFxObject_Container'KFGame.Default__KFGFxObject_Container'
}
