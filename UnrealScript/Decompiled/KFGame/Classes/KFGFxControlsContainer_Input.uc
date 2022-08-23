/*******************************************************************************
 * KFGFxControlsContainer_Input generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxControlsContainer_Input extends KFGFxObject_Container within GFxMoviePlayer;

const KFID_QuickWeaponSelect = 100;
const KFID_CurrentLayoutIndex = 101;
const KFID_ForceFeedbackEnabled = 103;
const KFID_SavedPerkIndex = 105;
const KFID_AllowBloodSplatterDecals = 106;
const KFID_GoreLevel = 107;
const KFID_StoredCharIndex = 111;
const KFID_MasterVolumeMultiplier = 112;
const KFID_DialogVolumeMultiplier = 113;
const KFID_MusicVolumeMultiplier = 114;
const KFID_SFXVolumeMultiplier = 115;
const KFID_GammaMultiplier = 117;
const KFID_MusicVocalsEnabled = 118;
const KFID_MinimalChatter = 119;
const KFID_ShowCrossHair = 121;
const KFID_FOVOptionsPercentageValue = 122;
const KFID_ShowKillTicker = 123;
const KFID_FriendlyHudScale = 125;
const KFID_FavoriteWeapons = 127;
const KFID_GearLoadouts = 128;
const KFID_SetGamma = 129;
const KFID_RequiresPushToTalk = 130;
const KFID_InvertController = 131;
const KFID_AutoTargetEnabled = 132;
const KFID_GamepadSensitivityScale = 133;
const KFID_ZoomedSensitivityScale = 134;
const KFID_GamepadZoomedSensitivityScale = 135;
const KFID_EnableMouseSmoothing = 136;
const KFID_MouseSensitivity = 138;
const KFID_TargetAdhesionEnabled = 139;
const KFID_TargetFrictionEnabled = 140;
const KFID_InvertMouse = 142;
const KFID_DEPRECATED_143 = 143;
const KFID_SavedSoloModeIndex = 144;
const KFID_SavedSoloMapString = 145;
const KFID_SavedSoloDifficultyIndex = 146;
const KFID_SavedSoloLengthIndex = 147;
const KFID_SavedModeIndex = 148;
const KFID_SavedMapString = 149;
const KFID_SavedDifficultyIndex = 150;
const KFID_SavedLengthIndex = 151;
const KFID_SavedPrivacyIndex = 152;
const KFID_SavedServerTypeIndex = 153;
const KFID_SavedInProgressIndex = 154;
const KFID_ControllerSoundEnabled = 155;
const KFID_MatchmakingRegion = 156;
const KFID_UseAltAimOnDuals = 157;
const KFID_HideBossHealthBar = 158;
const KFID_AntiMotionSickness = 159;
const KFID_ShowWelderInInventory = 160;
const KFID_AutoTurnOff = 161;
const KFID_ReduceHightPitchSounds = 162;
const KFID_ShowConsoleCrossHair = 163;
const KFID_VOIPVolumeMultiplier = 164;
const KFID_WeaponSkinAssociations = 165;
const KFID_SavedEmoteId = 166;
const KFID_DisableAutoUpgrade = 167;
const KFID_SafeFrameScale = 168;

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
    LocalizedObject.SetString("resetDefault", Localize("KFGFxOptionsMenu_Graphics", "DefaultString", "KFGame"));
    SetObject("localizedText", LocalizedObject);
}

function InitializeOptions()
{
    local GFxObject ValuesObject;
    local KFPlayerInput KFPI;

    KFPI = KFPlayerInput(Outer.GetPC().PlayerInput);
    ValuesObject = Outer.CreateObject("Object");
    if(!Outer.GetPC().WorldInfo.IsConsoleBuild())
    {
        ValuesObject.SetFloat("sensitivityValue", KFPI.MouseSensitivity);
        ValuesObject.SetFloat("sensitivityValueMin", 100 * ControlsMenu.MinMouseLookSensitivity);
        ValuesObject.SetFloat("sensitivityValueMax", 100 * ControlsMenu.MaxMouseLookSensitivity);
        ValuesObject.SetFloat("zoomSensitivityValue", 100 * KFPI.ZoomedSensitivityScale);
        ValuesObject.SetFloat("zoomSensitivityValueMin", 100 * ControlsMenu.MinMouseLookZoomSensitivity);
        ValuesObject.SetFloat("zoomSensitivityValueMax", 100 * ControlsMenu.MaxMouseLookZoomSensitivity);
        ValuesObject.SetBool("invertedValue", KFPI.bInvertMouse);
        ValuesObject.SetBool("mouseSmoothingLabel", KFPI.bEnableMouseSmoothing);
        ValuesObject.SetBool("forceFeedbackValue", KFPI.bForceFeedbackEnabled);
    }
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
    SetObject("initializeOptions", ValuesObject);
}

function ResetInputOptions()
{
    local KFPlayerInput KFPI;

    KFPI = KFPlayerInput(Outer.GetPC().PlayerInput);
    if(!Outer.GetPC().WorldInfo.IsConsoleBuild())
    {
        KFPI.MouseSensitivity = ControlsMenu.Manager.CachedProfile.GetDefaultFloat(138);
        ControlsMenu.Manager.CachedProfile.SetProfileSettingValueFloat(138, KFPI.MouseSensitivity);
        KFPI.ZoomedSensitivityScale = ControlsMenu.Manager.CachedProfile.GetDefaultFloat(134);
        ControlsMenu.Manager.CachedProfile.SetProfileSettingValueFloat(134, KFPI.ZoomedSensitivityScale);
        KFPI.bInvertMouse = ControlsMenu.Manager.CachedProfile.GetDefaultBool(142);
        ControlsMenu.Manager.CachedProfile.SetProfileSettingValueBool(142, KFPI.bInvertMouse);
        KFPI.bEnableMouseSmoothing = ControlsMenu.Manager.CachedProfile.GetDefaultBool(136);
        ControlsMenu.Manager.CachedProfile.SetProfileSettingValueBool(136, KFPI.bEnableMouseSmoothing);
        KFPI.bForceFeedbackEnabled = ControlsMenu.Manager.CachedProfile.GetDefaultBool(103);
        ControlsMenu.Manager.CachedProfile.SetProfileSettingValueBool(103, KFPI.bForceFeedbackEnabled);
    }
    KFPI.GamepadSensitivityScale = ControlsMenu.Manager.CachedProfile.GetDefaultFloat(133);
    ControlsMenu.Manager.CachedProfile.SetProfileSettingValueFloat(133, KFPI.GamepadSensitivityScale);
    KFPI.GamepadZoomedSensitivityScale = ControlsMenu.Manager.CachedProfile.GetDefaultFloat(135);
    ControlsMenu.Manager.CachedProfile.SetProfileSettingValueFloat(135, KFPI.GamepadZoomedSensitivityScale);
    KFPI.bInvertController = ControlsMenu.Manager.CachedProfile.GetDefaultBool(131);
    ControlsMenu.Manager.CachedProfile.SetProfileSettingValueBool(131, KFPI.bInvertController);
    KFPI.bAutoTargetEnabled = ControlsMenu.Manager.CachedProfile.GetDefaultBool(132);
    ControlsMenu.Manager.CachedProfile.SetProfileSettingValueBool(132, KFPI.bAutoTargetEnabled);
    KFPI.bTargetAdhesionEnabled = ControlsMenu.Manager.CachedProfile.GetDefaultBool(139);
    ControlsMenu.Manager.CachedProfile.SetProfileSettingValueBool(139, KFPI.bTargetAdhesionEnabled);
    KFPI.bTargetFrictionEnabled = ControlsMenu.Manager.CachedProfile.GetDefaultBool(140);
    ControlsMenu.Manager.CachedProfile.SetProfileSettingValueBool(140, KFPI.bTargetFrictionEnabled);
    InitializeOptions();
}

defaultproperties
{
    SensitivityString="Sensitivity"
    InvertedString="Invert Y"
    ControllerSensitivityString="Look Sensitivity"
    ControllerString="CONTROLLER"
    MouseString="MOUSE"
    MouseSmoothingString="Mouse Smoothing"
    ZoomSensitivityString="Zoom Sensitivity"
    ControllerZoomSensitivityString="Zoom Sensitivity"
    AimAssistLockOnString="Aim Assist Zoom Lock-On"
    AimAssistRotationString="Aim Assist Rotation"
    AimAssistSlowDownString="Aim Assist Slowdown"
    ForceFeedbackString="Controller Vibration"
}