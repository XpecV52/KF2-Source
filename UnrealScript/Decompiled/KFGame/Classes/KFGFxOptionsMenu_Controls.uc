/*******************************************************************************
 * KFGFxOptionsMenu_Controls generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxOptionsMenu_Controls extends KFGFxObject_Menu within GFxMoviePlayer;

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

var KFGFxControlsContainer_Keybinding KeybindingsContainer;
var KFGFxControlsContainer_Input InputContainer;
var KFGFxControlsContainer_ControllerPresets ControllerPresetsContainer;
var const float MinControllerLookSensitivity;
var const float MaxControllerLookSensitivity;
var const float MinControllerZoomLookSensitivity;
var const float MaxControllerZoomLookSensitivity;
var const float MinMouseLookSensitivity;
var const float MaxMouseLookSensitivity;
var const float MinMouseLookZoomSensitivity;
var const float MaxMouseLookZoomSensitivity;
var const localized array<localized string> TabStrings;
var const localized string HeaderText;

function InitializeMenu(KFGFxMoviePlayer_Manager InManager)
{
    super.InitializeMenu(InManager);
    LocalizeText();
}

function LocalizeText()
{
    local byte I;
    local GFxObject DataProvider, DataObject, LocalizedObject;
    local array<string> DisplayedStrings;

    DataProvider = Outer.CreateArray();
    DisplayedStrings = TabStrings;
    if(Outer.GetPC().WorldInfo.IsConsoleBuild())
    {
        DisplayedStrings.Remove(1, 1;
    }
    I = 0;
    J0xA3:

    if(I < DisplayedStrings.Length)
    {
        DataObject = Outer.CreateObject("Object");
        DataObject.SetString("label", DisplayedStrings[I]);
        DataProvider.SetElementObject(I, DataObject);
        ++ I;
        goto J0xA3;
    }
    SetObject("tabStrings", DataProvider);
    LocalizedObject = Outer.CreateObject("Object");
    LocalizedObject.SetString("header", Caps(Class'KFGFxOptionsMenu_Selection'.default.OptionStrings[2]));
    LocalizedObject.SetString("close", Class'KFCommon_LocalizedStrings'.default.BackString);
    SetObject("localizedText", LocalizedObject);
}

function OnInputTypeChanged(bool bGamepad)
{
    if(KeybindingsContainer != none)
    {
        KeybindingsContainer.UpdateAllBindings();
    }
}

event bool WidgetInitialized(name WidgetName, name WidgetPath, GFxObject Widget)
{
    switch(WidgetName)
    {
        case 'KeybindingsContainer':
            if(KeybindingsContainer == none)
            {
                KeybindingsContainer = KFGFxControlsContainer_Keybinding(Widget);
                KeybindingsContainer.Initialize(self);
            }
            break;
        case 'ControllerPresetsContainer':
            if(ControllerPresetsContainer == none)
            {
                ControllerPresetsContainer = KFGFxControlsContainer_ControllerPresets(Widget);
                ControllerPresetsContainer.Initialize(self);
            }
            break;
        case 'InputContainer':
            if(InputContainer == none)
            {
                InputContainer = KFGFxControlsContainer_Input(Widget);
                InputContainer.Initialize(self);
            }
            break;
        default:
            break;
    }
    return true;
}

function OnOpen()
{
    if(KeybindingsContainer != none)
    {
        KeybindingsContainer.UpdateAllBindings();
    }
}

event OnClose()
{
    if(KeybindingsContainer != none)
    {
        KeybindingsContainer.ClearInputOnContainer();
    }
    SaveConfigValues();
}

function SaveConfigValues()
{
    local KFPlayerInput KFPI;

    KFPI = KFPlayerInput(Outer.GetPC().PlayerInput);
    KFPI.SaveConfig();
}

event bool FilterButtonInput(int ControllerId, name ButtonName, Core.Object.EInputEvent InputEvent)
{
    if(KeybindingsContainer != none)
    {
        KeybindingsContainer.BindKey(ButtonName, InputEvent);
    }
    return super.FilterButtonInput(ControllerId, ButtonName, InputEvent);
}

function Callback_ControllerSensitivity(float NewSensitivity)
{
    local KFPlayerInput KFPI;

    KFPI = KFPlayerInput(Outer.GetPC().PlayerInput);
    KFPI.GamepadSensitivityScale = NewSensitivity / float(100);
    Manager.CachedProfile.SetProfileSettingValueFloat(133, KFPI.GamepadSensitivityScale);
}

function Callback_ControllerZoomSensitivity(float NewSensitivity)
{
    local KFPlayerInput KFPI;

    KFPI = KFPlayerInput(Outer.GetPC().PlayerInput);
    KFPI.GamepadZoomedSensitivityScale = NewSensitivity / float(100);
    Manager.CachedProfile.SetProfileSettingValueFloat(135, KFPI.GamepadZoomedSensitivityScale);
}

function Callback_ControllerInvertChanged(bool bInvertController)
{
    local KFPlayerInput KFPI;

    KFPI = KFPlayerInput(Outer.GetPC().PlayerInput);
    KFPI.bInvertController = bInvertController;
    Manager.CachedProfile.SetProfileSettingValueInt(131, ((KFPI.bInvertController) ? 1 : 0));
}

function Callback_MouseSensitivity(float NewSensitivity)
{
    Outer.GetPC().PlayerInput.SetSensitivity(NewSensitivity);
}

function Callback_MouseZoomSensitivity(float NewSensitivity)
{
    KFPlayerInput(Outer.GetPC().PlayerInput).SetZoomedSensitivity(NewSensitivity / float(100));
}

function Callback_InvertChanged(bool bInvertMouse)
{
    Outer.GetPC().PlayerInput.bInvertMouse = bInvertMouse;
}

function Callback_MouseSmoothingChanged(bool NewValue)
{
    local KFPlayerInput KFPI;

    KFPI = KFPlayerInput(Outer.GetPC().PlayerInput);
    KFPI.bEnableMouseSmoothing = NewValue;
}

function Callback_AimAssistZoomLockOnChanged(bool NewValue)
{
    local KFPlayerInput KFPI;

    KFPI = KFPlayerInput(Outer.GetPC().PlayerInput);
    KFPI.bAutoTargetEnabled = NewValue;
    Manager.CachedProfile.SetProfileSettingValueInt(132, ((KFPI.bAutoTargetEnabled) ? 1 : 0));
}

function Callback_AimAssistRotationChanged(bool NewValue)
{
    local KFPlayerInput KFPI;

    KFPI = KFPlayerInput(Outer.GetPC().PlayerInput);
    KFPI.bTargetAdhesionEnabled = NewValue;
    Manager.CachedProfile.SetProfileSettingValueInt(139, ((KFPI.bTargetAdhesionEnabled) ? 1 : 0));
}

function Callback_AimAssistSlowDownChanged(bool NewValue)
{
    local KFPlayerInput KFPI;

    KFPI = KFPlayerInput(Outer.GetPC().PlayerInput);
    KFPI.bTargetFrictionEnabled = NewValue;
    Manager.CachedProfile.SetProfileSettingValueInt(140, ((KFPI.bTargetFrictionEnabled) ? 1 : 0));
}

function Callback_ForceFeedbackChanged(bool NewValue)
{
    local KFPlayerInput KFPI;

    KFPI = KFPlayerInput(Outer.GetPC().PlayerInput);
    KFPI.bForceFeedbackEnabled = NewValue;
    Manager.CachedProfile.SetProfileSettingValueInt(103, ((KFPI.bForceFeedbackEnabled) ? 1 : 0));
}

function Callback_ChangeBind(string ChangedCommand, byte SelectedSection)
{
    if(KeybindingsContainer != none)
    {
        KeybindingsContainer.ChangeBind(ChangedCommand, SelectedSection);
    }
}

function Callback_ResetControls()
{
    if(KeybindingsContainer != none)
    {
        KeybindingsContainer.ResetControls();
    }
}

function Callback_AcceptBind()
{
    if(KeybindingsContainer != none)
    {
        KeybindingsContainer.AcceptBind();
    }
}

function Callback_CloseMenu()
{
    Manager.OpenMenu(5);
    Manager.CachedProfile.Save(byte(Outer.GetLP().ControllerId));
}

function Callback_UpdateControllerPreset(int PresetIndex)
{
    if(ControllerPresetsContainer != none)
    {
        ControllerPresetsContainer.UpdateCurrentPresetArray(byte(PresetIndex));
        Manager.CachedProfile.SetProfileSettingValueInt(101, PresetIndex);
    }
}

function CallBack_ResetPresetOptions()
{
    if(ControllerPresetsContainer != none)
    {
        Manager.DelayedOpenPopup(0, 0, Localize("KFGFxOptionsMenu_Graphics", "WarningPromptString", "KFGame"), Localize("KFGFxObject_Menu", "ResetDefaults", "KFGameConsole"), Localize("KFGFxOptionsMenu_Graphics", "OKString", "KFGame"), Localize("KFGFxOptionsMenu_Graphics", "CancelString", "KFGame"), ControllerPresetsContainer.ResetPresetOptions);
    }
}

function CallBack_ResetInputOptions()
{
    if(InputContainer != none)
    {
        Manager.DelayedOpenPopup(0, 0, Localize("KFGFxOptionsMenu_Graphics", "WarningPromptString", "KFGame"), Localize("KFGFxObject_Menu", "ResetDefaults", "KFGameConsole"), Localize("KFGFxOptionsMenu_Graphics", "OKString", "KFGame"), Localize("KFGFxOptionsMenu_Graphics", "CancelString", "KFGame"), InputContainer.ResetInputOptions);
    }
}

defaultproperties
{
    MinControllerLookSensitivity=0.4
    MaxControllerLookSensitivity=3.5
    MinControllerZoomLookSensitivity=0.1
    MaxControllerZoomLookSensitivity=1
    MinMouseLookSensitivity=0.01
    MaxMouseLookSensitivity=0.7
    MinMouseLookZoomSensitivity=0.2
    MaxMouseLookZoomSensitivity=1
    TabStrings(0)="INPUT"
    TabStrings(1)="KEY BINDINGS"
    TabStrings(2)="BUTTON LAYOUT"
    HeaderText="CONTROLS OPTIONS"
    SubWidgetBindings=/* Array type was not detected. */
}