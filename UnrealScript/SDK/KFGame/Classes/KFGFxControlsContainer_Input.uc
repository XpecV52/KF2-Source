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

	SetObject("localizedText", LocalizedObject);
}

function InitializeOptions()
{
	local GFxObject ValuesObject;
	local KFPlayerInput KFPI;

	KFPI = KFPlayerInput(GetPC().PlayerInput);
	ValuesObject = CreateObject( "Object" );

	ValuesObject.SetFloat("sensitivityValue"					, KFPI.MouseSensitivity);
	ValuesObject.SetFloat("sensitivityValueMin"					, 100 *	ControlsMenu.MinMouseLookSensitivity);
	ValuesObject.SetFloat("sensitivityValueMax"					, 100 * ControlsMenu.MaxMouseLookSensitivity);

	ValuesObject.SetFloat("zoomSensitivityValue"				, 100 * KFPI.ZoomedSensitivityScale);
	ValuesObject.SetFloat("zoomSensitivityValueMin"				, 100 * ControlsMenu.MinMouseLookZoomSensitivity);
	ValuesObject.SetFloat("zoomSensitivityValueMax"				, 100 * ControlsMenu.MaxMouseLookZoomSensitivity);

	ValuesObject.SetBool("invertedValue"						, KFPI.bInvertMouse);
	ValuesObject.SetBool("mouseSmoothingLabel"					, KFPI.bEnableMouseSmoothing);
	
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
	ValuesObject.SetBool("forceFeedbackValue"					, KFPI.bForceFeedbackEnabled);

	SetObject("initializeOptions", ValuesObject);
}

