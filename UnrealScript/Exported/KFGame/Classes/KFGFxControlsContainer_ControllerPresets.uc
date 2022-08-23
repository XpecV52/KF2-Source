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
const KFID_DisableAutoUpgrade = 167;#linenumber 14;

var const string InputSectionName;
var const string PackageName;

var localized string MovementString;
var localized string LookString;
var localized string ShowScoardBoardString;
var localized string ShowIngameMenuString;
var localized string HoldString;
var localized string TapString;
var localized string CurrentControllerPresetString;

var localized array<string> PresetStrings;

var int numGamepadLayouts;

struct KeyBinding
{
    var string Key;
    var string Command;
    var string HoldCommand;
};

var byte CurrentLocalizedIndex;
var byte CurrentPresetIndex;

function Initialize( KFGFxObject_Menu NewParentMenu )
{
    super.Initialize( NewParentMenu );
    CurrentPresetIndex = KFPlayerInput(GetPC().PlayerInput).CurrentLayoutIndex;
    UpdateCurrentPresetArray(CurrentPresetIndex);
}

/**
*   This is function will tell KFPlayerInput to update gamepad button mappings
*   and then update the UI.
*
*   PresetIndex - the index of the controller layout we want applied to the game.
*/
function UpdateCurrentPresetArray(byte PresetIndex)
{
    local KFPlayerInput kfPlayerInput;
    local KFPlayerInput KFPI;

    CurrentPresetIndex = PresetIndex;
    numGamepadLayouts = class'KFGamepadLayoutManager'.static.GetNumLayouts();

    // Wrap around for the index.
    if(CurrentPresetIndex >= numGamepadLayouts)
    {
        CurrentPresetIndex = 0;
    }
    else if( CurrentPresetIndex < 0)
    {
        CurrentPresetIndex = numGamepadLayouts -1;
    }

    // Tell the player input to update the actual controls.
    KFPlayerInput = KFPlayerInput(GetPC().PlayerInput);
    KFPlayerInput.SetGamepadLayout(CurrentPresetIndex);

    // Update the GUI with the new button layout descriptions.
    LocalizeText();
    UpdateButtonDescriptions();
    KFPI = KFPlayerInput(GetPC().PlayerInput);

    KFPI.CurrentLayoutIndex = CurrentPresetIndex;
    KFPI.SaveConfig();  
}

function LocalizeText()
{
    local GfxObject TextField;
    local GFxObject PresetArray;
    local GfxObject StepperOption;
    local GFxObject defaultButton;
    local int i;

    TextField = GetObject("CurrentPresetTextfield");

    PresetArray = CreateArray();

    for (i = 0; i < numGamepadLayouts; i++)
    {
        StepperOption = CreateObject("Object");
        StepperOption.SetString("label", PresetStrings[i]);
        PresetArray.SetElementObject(i, StepperOption);
    }
    SetObject("presetOptions",PresetArray);
    SetInt("currentPreset", CurrentPresetIndex);

    if(TextField != none)
    {
        Textfield.SetText(CurrentControllerPresetString);
    }

    defaultButton = GetObject("defaultButton");
    if ( defaultButton != None )
    {
        defaultButton.SetString("label",Localize("KFGFxOptionsMenu_Graphics","DefaultString","KFGame"));
    }
}

/**
*   This is function updates all the button descriptions based off of the
*   current key bindings in KFPlayerInput.
*/
function UpdateButtonDescriptions( )
{
    local GFxObject LocalizedObject;
    local name gamepadButtonNames[20];
    local KFPlayerInput kfPlayerInput;
    local byte i;
    local string bindCommand;
    local GfxObject TempTextField;
    local string TextFieldName;
    local string localizedCommand;
    //local string localizedLayoutName;

    CurrentLocalizedIndex = 0;

    LocalizedObject = CreateObject( "Object" );
    
    LocalizedObject.SetString("leftThumbstick",                 MovementString);
    LocalizedObject.SetString("rightThumbstick",                LookString);
    LocalizedObject.SetString("back",                           ShowScoardBoardString);
    LocalizedObject.SetString("start",                          ShowIngameMenuString);

    kfPlayerInput = KFPlayerInput(GetPC().PlayerInput);
    class'KFGamepadLayoutManager'.static.GetGamepadButtonNames(gamepadButtonNames);

    //localizedLayoutName = class'KFGamepadLayoutManager'.static.GetLayoutName(CurrentPresetIndex);

    for (i = 0; i < 20; i++)
    {
        TextFieldName = gamepadButtonNames[i]  $"Textfield";
        TempTextField = GetObject(TextFieldName);
        
        if(TempTextField != none)
        {
            // Find out the localized display name of the action assigned to this button.
            bindCommand = kfPlayerInput.GetGameBindableAction( gamepadButtonNames[i]);
            localizedCommand = Localize(InputSectionName,  bindCommand,  PackageName);

            TempTextField.SetText(localizedCommand);
        }
    }
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
    TempObject.SetString("Key",             Key);
    TempObject.SetString("Command",         CommandString);

    ObjectArray.SetElementObject(i, TempObject);
}

function ResetPresetOptions()
{
    CurrentPresetIndex = ParentMenu.Manager.CachedProfile.GetDefaultInt(KFID_CurrentLayoutIndex);
    ParentMenu.Manager.CachedProfile.SetProfileSettingValueInt(KFID_CurrentLayoutIndex, CurrentPresetIndex);

    UpdateCurrentPresetArray(CurrentPresetIndex);
}

defaultproperties
{
   InputSectionName="LocalizedControls"
   PackageName="KFGame"
   MovementString="Movement Control"
   LookString="Look Control"
   ShowScoardBoardString="Show Scoreboard"
   ShowIngameMenuString="Toggle In Game Menu"
   HoldString="HOLD"
   TapString="TAP"
   CurrentControllerPresetString="Current Controller Preset"
   PresetStrings(0)="Default"
   PresetStrings(1)="Quick Draw"
   PresetStrings(2)="Jumper"
   PresetStrings(3)="Southpaw"
   Name="Default__KFGFxControlsContainer_ControllerPresets"
   ObjectArchetype=KFGFxObject_Container'KFGame.Default__KFGFxObject_Container'
}
