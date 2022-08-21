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
var localized string ControllerSensitivityString;
var localized string ControllerString;
var localized string MouseString;

var localized string MouseSmoothingString;
var localized string ZoomSensitivityString;
var localized string ControllerZoomSensitivityString;
var localized string AimAssistLockOnString;
var localized string AimAssistRotationString;
var localized string AimAssistSlowDownString;
var localized string ForceFeedbackString;

var KFGFxOptionsMenu_Controls ControlsMenu;


function Initialize( KFGFxObject_Menu NewParentMenu )
{
	super.Initialize( NewParentMenu );

	ControlsMenu = KFGFxOptionsMenu_Controls(NewParentMenu);
	LocalizeText();
	InitializeOptions();
}

function LocalizeText()
{
	local GFxObject LocalizedObject;

	LocalizedObject = CreateObject( "Object" );
	LocalizedObject.SetString("sensitivityLabel"				, SensitivityString);
	LocalizedObject.SetString("invertedLabel"					, InvertedString);
	LocalizedObject.SetString("Mouse"							, MouseString);
	LocalizedObject.SetString("controllerSensitivityLabel"		, SensitivityString);
	LocalizedObject.SetString("controllerInvertedLabel"			, InvertedString);
	LocalizedObject.SetString("controllerString"				, ControllerString);

	LocalizedObject.SetString("mouseSmoothingLabel"				, MouseSmoothingString);
	LocalizedObject.SetString("zoomSensitivityLabel"			, ZoomSensitivityString);
	LocalizedObject.SetString("controllerZoomSensitivityLabel"	, ControllerZoomSensitivityString);
	LocalizedObject.SetString("aimAssistLockOnLabel"			, aimAssistLockOnString);
	LocalizedObject.SetString("aimAssistRotationLabel"			, aimAssistRotationString);
	LocalizedObject.SetString("aimAssistSlowDownLabel"			, aimAssistSlowDownString);
	LocalizedObject.SetString("forceFeedbackLabel"				, forceFeedbackString);
	LocalizedObject.SetString("resetDefault", Localize("KFGFxOptionsMenu_Graphics","DefaultString","KFGame"));

	SetObject("localizedText", LocalizedObject);
}

function InitializeOptions()
{
	local GFxObject ValuesObject;
	local KFPlayerInput KFPI;

	KFPI = KFPlayerInput(GetPC().PlayerInput);
	ValuesObject = CreateObject( "Object" );
	// Don't try to set values of objects that aren't there on Console.
	if ( !GetPC().WorldInfo.IsConsoleBuild() )
	{
		ValuesObject.SetFloat("sensitivityValue"					, KFPI.MouseSensitivity);
		ValuesObject.SetFloat("sensitivityValueMin"					, 100 *	ControlsMenu.MinMouseLookSensitivity);
		ValuesObject.SetFloat("sensitivityValueMax"					, 100 * ControlsMenu.MaxMouseLookSensitivity);

		ValuesObject.SetFloat("zoomSensitivityValue"				, 100 * KFPI.ZoomedSensitivityScale);
		ValuesObject.SetFloat("zoomSensitivityValueMin"				, 100 * ControlsMenu.MinMouseLookZoomSensitivity);
		ValuesObject.SetFloat("zoomSensitivityValueMax"				, 100 * ControlsMenu.MaxMouseLookZoomSensitivity);

		ValuesObject.SetBool("invertedValue"						, KFPI.bInvertMouse);
		ValuesObject.SetBool("mouseSmoothingLabel"					, KFPI.bEnableMouseSmoothing);
		ValuesObject.SetBool("forceFeedbackValue"					, KFPI.bForceFeedbackEnabled);
	}
	
	ValuesObject.SetFloat("controllerSensitivityValue"			, 100 * KFPI.GamepadSensitivityScale);
	ValuesObject.SetFloat("controllerSensitivityValueMin"		, 100 * ControlsMenu.MinControllerLookSensitivity);
	ValuesObject.SetFloat("controllerSensitivityValueMax"		, 100 * ControlsMenu.MaxControllerLookSensitivity);

	ValuesObject.SetFloat("controllerZoomSensitivityValue"		, 100 * KFPI.GamepadZoomedSensitivityScale);
	ValuesObject.SetFloat("controllerZoomSensitivityValueMin"	, 100 * ControlsMenu.MinControllerZoomLookSensitivity);
	ValuesObject.SetFloat("controllerZoomSensitivityValueMax"	, 100 * ControlsMenu.MaxControllerZoomLookSensitivity);

	ValuesObject.SetBool("controllerInvertedValue"				, KFPI.bInvertController);
	ValuesObject.SetBool("aimAssistLockOnValue"					, KFPI.bAutoTargetEnabled);
	ValuesObject.SetBool("aimAssistRotationValue"				, KFPI.bTargetAdhesionEnabled);
	ValuesObject.SetBool("aimAssistSlowDownValue"				, KFPI.bTargetFrictionEnabled);

	SetObject("initializeOptions", ValuesObject);
}

function ResetInputOptions()
{
	// Currently doing nothing with the reset button is pressed since current system overrides default .ini settings. HSL_BB
	// TODO: Restore settings back to defaults.
	
	//local GFxObject ValuesObject;
	//local KFPlayerInput KFPI;

	//KFPI = KFPlayerInput(GetPC().PlayerInput);
	//ValuesObject = CreateObject( "Object" );
	//// Don't try to set values of objects that aren't there on Console.
	//if ( !GetPC().WorldInfo.IsConsoleBuild() )
	//{
	//	ValuesObject.SetFloat("sensitivityValue"				, /*Default value*/);
	//	ValuesObject.SetFloat("zoomSensitivityValue"			, /*Default value*/);

	//	ValuesObject.SetBool("invertedValue"					, /*Default value*/);
	//	ValuesObject.SetBool("mouseSmoothingLabel"				, /*Default value*/);
	//	ValuesObject.SetBool("forceFeedbackValue"				, /*Default value*/);
	//}

	//ValuesObject.SetFloat("controllerSensitivityValue"			, /*Default value*/);
	//ValuesObject.SetFloat("controllerZoomSensitivityValue"		, /*Default value*/);

	//ValuesObject.SetBool("controllerInvertedValue"				, /*Default value*/);
	//ValuesObject.SetBool("aimAssistLockOnValue"					, /*Default value*/);
	//ValuesObject.SetBool("aimAssistRotationValue"				, /*Default value*/);
	//ValuesObject.SetBool("aimAssistSlowDownValue"				, /*Default value*/);

	//SetObject("initializeOptions", ValuesObject);
}

