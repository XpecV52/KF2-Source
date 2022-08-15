/*******************************************************************************
 * KFGFxControlsContainer_Input generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxControlsContainer_Input extends KFGFxObject_Container within GFxMoviePlayer;

var const localized string SensitivityString;
var const localized string InvertedString;
var const localized string ControllerSensitivityString;
var const localized string ControllerString;
var const localized string MouseString;
var const localized string MouseSmoothingString;
var const localized string ZoomSensitivityString;
var const localized string ControllerZoomSensitivityString;
var const localized string AimAssistLockOnString;
var const localized string AimAssistRotationString;
var const localized string AimAssistSlowDownString;
var const localized string ForceFeedbackString;
var KFGFxOptionsMenu_Controls ControlsMenu;

function Initialize(KFGFxObject_Menu NewParentMenu)
{
    super.Initialize(NewParentMenu);
    ControlsMenu = KFGFxOptionsMenu_Controls(NewParentMenu);
    LocalizeText();
    InitializeOptions();
}

function LocalizeText()
{
    local GFxObject LocalizedObject;

    LocalizedObject = Outer.CreateObject("Object");
    LocalizedObject.SetString("sensitivityLabel", SensitivityString);
    LocalizedObject.SetString("invertedLabel", InvertedString);
    LocalizedObject.SetString("Mouse", MouseString);
    LocalizedObject.SetString("controllerSensitivityLabel", SensitivityString);
    LocalizedObject.SetString("controllerInvertedLabel", InvertedString);
    LocalizedObject.SetString("controllerString", ControllerString);
    LocalizedObject.SetString("mouseSmoothingLabel", MouseSmoothingString);
    LocalizedObject.SetString("zoomSensitivityLabel", ZoomSensitivityString);
    LocalizedObject.SetString("controllerZoomSensitivityLabel", ControllerZoomSensitivityString);
    LocalizedObject.SetString("aimAssistLockOnLabel", AimAssistLockOnString);
    LocalizedObject.SetString("aimAssistRotationLabel", AimAssistRotationString);
    LocalizedObject.SetString("aimAssistSlowDownLabel", AimAssistSlowDownString);
    LocalizedObject.SetString("forceFeedbackLabel", ForceFeedbackString);
    SetObject("localizedText", LocalizedObject);
}

function InitializeOptions()
{
    local GFxObject ValuesObject;
    local KFPlayerInput KFPI;

    KFPI = KFPlayerInput(Outer.GetPC().PlayerInput);
    ValuesObject = Outer.CreateObject("Object");
    ValuesObject.SetFloat("sensitivityValue", KFPI.MouseSensitivity);
    ValuesObject.SetFloat("sensitivityValueMin", 100 * ControlsMenu.MinMouseLookSensitivity);
    ValuesObject.SetFloat("sensitivityValueMax", 100 * ControlsMenu.MaxMouseLookSensitivity);
    ValuesObject.SetFloat("zoomSensitivityValue", 100 * KFPI.ZoomedSensitivityScale);
    ValuesObject.SetFloat("zoomSensitivityValueMin", 100 * ControlsMenu.MinMouseLookZoomSensitivity);
    ValuesObject.SetFloat("zoomSensitivityValueMax", 100 * ControlsMenu.MaxMouseLookZoomSensitivity);
    ValuesObject.SetBool("invertedValue", KFPI.bInvertMouse);
    ValuesObject.SetBool("mouseSmoothingLabel", KFPI.bEnableMouseSmoothing);
    ValuesObject.SetFloat("controllerSensitivityValue", 100 * KFPI.GamepadSensitivityScale);
    ValuesObject.SetFloat("controllerSensitivityValueMin", 100 * ControlsMenu.MinControllerLookSensitivity);
    ValuesObject.SetFloat("controllerSensitivityValueMax", 100 * ControlsMenu.MaxControllerLookSensitivity);
    ValuesObject.SetFloat("controllerZoomSensitivityValue", 100 * KFPI.GamepadZoomedSensitivityScale);
    ValuesObject.SetFloat("controllerZoomSensitivityValueMin", 100 * ControlsMenu.MinControllerZoomLookSensitivity);
    ValuesObject.SetFloat("controllerZoomSensitivityValueMax", 100 * ControlsMenu.MaxControllerZoomLookSensitivity);
    ValuesObject.SetBool("controllerInvertedValue", KFPI.bInvertController);
    ValuesObject.SetBool("aimAssistLockOnValue", KFPI.bAutoTargetEnabled);
    ValuesObject.SetBool("aimAssistRotationValue", KFPI.bTargetAdhesionEnabled);
    ValuesObject.SetBool("aimAssistSlowDownValue", KFPI.bTargetFrictionEnabled);
    ValuesObject.SetBool("forceFeedbackValue", KFPI.bForceFeedbackEnabled);
    SetObject("initializeOptions", ValuesObject);
}

defaultproperties
{
    SensitivityString="Sensitivity"
    InvertedString="Invert Y"
    ControllerSensitivityString="Look Sensitivity"
    ControllerString="Controller"
    MouseString="Mouse"
    MouseSmoothingString="Mouse Smoothing"
    ZoomSensitivityString="Zoom Sensitivity"
    ControllerZoomSensitivityString="Zoom Sensitivity"
    AimAssistLockOnString="Aim Assist Zoom Lock-On"
    AimAssistRotationString="Aim Assist Rotation"
    AimAssistSlowDownString="Aim Assist Slowdown"
    ForceFeedbackString="Controller Vibration"
}