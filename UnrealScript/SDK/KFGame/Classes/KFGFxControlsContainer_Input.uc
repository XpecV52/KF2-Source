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

`include(KFProfileSettings.uci);

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
	local KFPlayerInput KFPI;
	
	KFPI = KFPlayerInput(GetPC().PlayerInput);

	//SetObject("initializeOptions", ValuesObject);
	if ( !GetPC().WorldInfo.IsConsoleBuild() )
	{
		KFPI.MouseSensitivity = ControlsMenu.Manager.CachedProfile.GetDefaultFloat(KFID_MouseSensitivity);
		ControlsMenu.Manager.CachedProfile.SetProfileSettingValueFloat(KFID_MouseSensitivity, KFPI.MouseSensitivity);

		KFPI.ZoomedSensitivityScale = ControlsMenu.Manager.CachedProfile.GetDefaultFloat(KFID_ZoomedSensitivityScale);
		ControlsMenu.Manager.CachedProfile.SetProfileSettingValueFloat(KFID_ZoomedSensitivityScale, KFPI.ZoomedSensitivityScale);
		
		KFPI.bInvertMouse = ControlsMenu.Manager.CachedProfile.GetDefaultBool(KFID_InvertMouse);
		ControlsMenu.Manager.CachedProfile.SetProfileSettingValueBool(KFID_InvertMouse, KFPI.bInvertMouse);
		
		KFPI.bEnableMouseSmoothing = ControlsMenu.Manager.CachedProfile.GetDefaultBool(KFID_EnableMouseSmoothing);		
		ControlsMenu.Manager.CachedProfile.SetProfileSettingValueBool(KFID_EnableMouseSmoothing, KFPI.bEnableMouseSmoothing);

		KFPI.bForceFeedbackEnabled = ControlsMenu.Manager.CachedProfile.GetDefaultBool(KFID_ForceFeedbackEnabled);
		ControlsMenu.Manager.CachedProfile.SetProfileSettingValueBool(KFID_ForceFeedbackEnabled, KFPI.bForceFeedbackEnabled);
	}

	KFPI.GamepadSensitivityScale = ControlsMenu.Manager.CachedProfile.GetDefaultFloat(KFID_GamepadSensitivityScale);
	ControlsMenu.Manager.CachedProfile.SetProfileSettingValueFloat(KFID_GamepadSensitivityScale, KFPI.GamepadSensitivityScale);

	KFPI.GamepadZoomedSensitivityScale = ControlsMenu.Manager.CachedProfile.GetDefaultFloat(KFID_GamepadZoomedSensitivityScale);
	ControlsMenu.Manager.CachedProfile.SetProfileSettingValueFloat(KFID_GamepadZoomedSensitivityScale, KFPI.GamepadZoomedSensitivityScale);
	
	KFPI.bInvertController = ControlsMenu.Manager.CachedProfile.GetDefaultBool(KFID_InvertController);
	ControlsMenu.Manager.CachedProfile.SetProfileSettingValueBool(KFID_InvertController, KFPI.bInvertController);

	KFPI.bAutoTargetEnabled = ControlsMenu.Manager.CachedProfile.GetDefaultBool(KFID_AutoTargetEnabled);
	ControlsMenu.Manager.CachedProfile.SetProfileSettingValueBool(KFID_AutoTargetEnabled, KFPI.bAutoTargetEnabled);

	KFPI.bTargetAdhesionEnabled = ControlsMenu.Manager.CachedProfile.GetDefaultBool(KFID_TargetAdhesionEnabled);	
	ControlsMenu.Manager.CachedProfile.SetProfileSettingValueBool(KFID_TargetAdhesionEnabled, KFPI.bTargetAdhesionEnabled);

	KFPI.bTargetFrictionEnabled = ControlsMenu.Manager.CachedProfile.GetDefaultBool(KFID_TargetFrictionEnabled);
	ControlsMenu.Manager.CachedProfile.SetProfileSettingValueBool(KFID_TargetFrictionEnabled, KFPI.bTargetFrictionEnabled);
	
	InitializeOptions();
}

