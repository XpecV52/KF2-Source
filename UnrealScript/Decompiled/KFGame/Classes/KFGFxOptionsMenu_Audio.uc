/*******************************************************************************
 * KFGFxOptionsMenu_Audio generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxOptionsMenu_Audio extends KFGFxObject_Menu within GFxMoviePlayer;

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
const KFID_VOIPVolumeMultiplier = 143;
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

var const localized string SectionNameString;
var const localized string OptionsString;
var const localized string AudioString;
var const localized string DialogVolumeString;
var const localized string MasterVolumeString;
var const localized string MusicString;
var const localized string SFxString;
var const localized string VOIPVolumeString;
var const localized string ConfigureMicString;
var const localized string VocalsString;
var const localized string BattleChatterString;
var const localized string PushToVoIPString;
var float VoIPMin;
var float VoIPMax;

function InitializeMenu(KFGFxMoviePlayer_Manager InManager)
{
    super.InitializeMenu(InManager);
    LocalizeText();
    InitValues();
}

function LocalizeText()
{
    local GFxObject LocalizedObject;

    LocalizedObject = Outer.CreateObject("Object");
    LocalizedObject.SetString("master", MasterVolumeString);
    LocalizedObject.SetString("dialog", DialogVolumeString);
    LocalizedObject.SetString("music", MusicString);
    LocalizedObject.SetString("sFx", SFxString);
    if(Outer.GetPC().WorldInfo.IsConsoleBuild())
    {
        LocalizedObject.SetString("header", (Caps(Class'KFGFxOptionsMenu_Selection'.default.OptionStrings[1]) $ "/") $ Caps(Class'KFGFxOptionsMenu_Selection'.default.OptionStrings[0]));
        LocalizedObject.SetString("sectionName", Caps(Class'KFGFxOptionsMenu_Selection'.default.OptionStrings[1]));
        LocalizedObject.SetString("options", Caps(Class'KFGFxOptionsMenu_Selection'.default.OptionStrings[0]));
        LocalizedObject.SetString("configureMic", Class'KFGFxOptionsMenu_Graphics'.default.AdjustGammaString);
        LocalizedObject.SetString("controllerSound", Localize("KFGFxOptionsMenu_Audio", "ControllerSound", "KFGameConsole"));        
    }
    else
    {
        LocalizedObject.SetString("header", Caps(Class'KFGFxOptionsMenu_Selection'.default.OptionStrings[1]));
        LocalizedObject.SetString("sectionName", SectionNameString);
        LocalizedObject.SetString("options", OptionsString);
        LocalizedObject.SetString("configureMic", ConfigureMicString);
        LocalizedObject.SetString("voipVolume", VOIPVolumeString);
        LocalizedObject.SetString("pushToTalk", PushToVoIPString);
        LocalizedObject.SetString("resetDefault", Localize("KFGFxOptionsMenu_Graphics", "DefaultString", "KFGame"));
    }
    LocalizedObject.SetString("vocals", VocalsString);
    LocalizedObject.SetString("battleChatter", BattleChatterString);
    LocalizedObject.SetString("close", Class'KFCommon_LocalizedStrings'.default.BackString);
    SetObject("localizedText", LocalizedObject);
}

function InitValues()
{
    local float VoIPCurrent;
    local KFPlayerInput KFPI;
    local bool bControllerSoundEnabled;

    if(!Outer.GetPC().WorldInfo.IsConsoleBuild())
    {
        KFPI = KFPlayerInput(Outer.GetPC().PlayerInput);
        Class'KFGameEngine'.static.GetVoIPVolumeRange(VoIPMin, VoIPMax, VoIPCurrent);
        VoIPCurrent = Manager.CachedProfile.GetProfileFloat(143);
        SetBool("bPushToTalk", Class'KFPlayerInput'.default.bRequiresPushToTalk);
        SetFloat("voipVolume", (VoIPCurrent / VoIPMax) * float(100));
        SetBool("bPushToTalk", KFPI.bRequiresPushToTalk);        
    }
    else
    {
        bControllerSoundEnabled = Manager.CachedProfile.GetProfileBool(155);
        SetBool("controllerSound", bControllerSoundEnabled);
        Class'KFGameEngine'.static.SetWWisePADVolume(((bControllerSoundEnabled) ? 100 : 0));
    }
    SetFloat("masterVolume", Manager.CachedProfile.GetProfileFloat(112));
    SetFloat("dialogVolume", Manager.CachedProfile.GetProfileFloat(113));
    SetFloat("musicVolume", Manager.CachedProfile.GetProfileFloat(114));
    SetFloat("sFxVolume", Manager.CachedProfile.GetProfileFloat(115));
    SetBool("vocalsEnabled", Manager.CachedProfile.GetProfileBool(118));
    SetBool("battleChatter", Manager.CachedProfile.GetProfileBool(119));
}

function SetVoIPMinMax(float MinVol, float MaxVol)
{
    ActionScriptVoid("setVOIPVolumeRange");
}

event OnClose()
{
    Manager.CachedProfile.Save(byte(Outer.GetLP().ControllerId));
    SaveConfigValues();
}

function SaveConfigValues()
{
    Class'KFGameEngine'.static.StaticSaveConfig();
    Class'KFGameEngine'.static.GetEngine().SaveConfig();
}

function Callback_CloseMenu()
{
    Manager.OpenMenu(5);
}

function Callback_ConfigureMicPress()
{
    local OnlineSubsystem Subsystem;

    if(Outer.GetPC().WorldInfo.IsConsoleBuild())
    {
        Manager.SetVariableBool("bStartUpGamma", false);
        Manager.OpenPopup(1, "", Class'KFGFxOptionsMenu_Graphics'.default.AdjustGammaDescription, Class'KFGFxOptionsMenu_Graphics'.default.ResetGammaString, Class'KFGFxOptionsMenu_Graphics'.default.SetGammaString);        
    }
    else
    {
        Subsystem = Class'GameEngine'.static.GetOnlineSubsystem();
        if(Subsystem != none)
        {
            Subsystem.ShowVoIPConfigUI();
        }
    }
}

function Callback_ConfigureBattleChatter(bool bMinimalChatter)
{
    Manager.CachedProfile.SetProfileSettingValueInt(119, ((bMinimalChatter) ? 1 : 0));
    KFGameEngine(Class'Engine'.static.GetEngine()).bMinimalChatter = bMinimalChatter;
}

function Callback_PushToTalkChanged(bool bValue)
{
    local PlayerController PC;
    local KFPlayerInput KFPI;

    PC = Outer.GetPC();
    if(PC != none)
    {
        KFPI = KFPlayerInput(Outer.GetPC().PlayerInput);
        if(KFPI != none)
        {
            KFPI.UpdatePushToTalk(bValue);
        }
    }
}

function Callback_ConfigureVocals(bool bEnabled)
{
    Manager.CachedProfile.SetProfileSettingValueInt(118, ((bEnabled) ? 1 : 0));
    KFGameEngine(Class'Engine'.static.GetEngine()).bMusicVocalsEnabled = bEnabled;
}

function Callback_ConfigureControllerSound(bool bEnabled)
{
    local bool bWasEnabled;

    bWasEnabled = Manager.CachedProfile.GetProfileBool(155);
    Manager.CachedProfile.SetProfileSettingValueInt(155, ((bEnabled) ? 1 : 0));
    KFGameEngine(Class'Engine'.static.GetEngine()).PadVolumeMultiplier = ((bEnabled) ? 100 : 0);
    Class'KFGameEngine'.static.SetWWisePADVolume(((bEnabled) ? 100 : 0));
}

function Callback_MasterVolumeChanged(float NewVolume)
{
    local float MasterVolumeMultiplier;

    MasterVolumeMultiplier = NewVolume;
    Class'KFGameEngine'.static.SetWWiseMasterVolume(MasterVolumeMultiplier);
    Manager.CachedProfile.SetProfileSettingValueFloat(112, MasterVolumeMultiplier);
    KFGameEngine(Class'Engine'.static.GetEngine()).MasterVolumeMultiplier = MasterVolumeMultiplier;
}

function Callback_DialogVolumeChanged(float NewVolume)
{
    local float DialogVolumeMultiplier;

    DialogVolumeMultiplier = NewVolume;
    Class'KFGameEngine'.static.SetWWiseVoiceVolume(DialogVolumeMultiplier);
    Outer.GetPC().SetAudioGroupVolume('Voice', DialogVolumeMultiplier / float(100));
    Manager.CachedProfile.SetProfileSettingValueFloat(113, DialogVolumeMultiplier);
    KFGameEngine(Class'Engine'.static.GetEngine()).DialogVolumeMultiplier = DialogVolumeMultiplier;
}

function Callback_MusicVolumeChanged(float NewVolume)
{
    local float MusicVolumeMultiplier;

    MusicVolumeMultiplier = NewVolume;
    Class'KFGameEngine'.static.SetWWiseMusicVolume(MusicVolumeMultiplier);
    Outer.GetPC().SetAudioGroupVolume('Music', MusicVolumeMultiplier / float(100));
    Manager.CachedProfile.SetProfileSettingValueFloat(114, MusicVolumeMultiplier);
    KFGameEngine(Class'Engine'.static.GetEngine()).MusicVolumeMultiplier = MusicVolumeMultiplier;
}

function Callback_SFxVolumeChanged(float NewVolume)
{
    local float SFxVolumeMultiplier;

    SFxVolumeMultiplier = NewVolume;
    Class'KFGameEngine'.static.SetWWiseSFXVolume(SFxVolumeMultiplier);
    Outer.GetPC().SetAudioGroupVolume('SFX', SFxVolumeMultiplier / float(100));
    Manager.CachedProfile.SetProfileSettingValueFloat(115, SFxVolumeMultiplier);
    KFGameEngine(Class'Engine'.static.GetEngine()).SFxVolumeMultiplier = SFxVolumeMultiplier;
}

function Callback_VOIPVolumeChanged(float NewVolume)
{
    Manager.CachedProfile.SetProfileSettingValueFloat(143, NewVolume / float(100));
    Class'KFGameEngine'.static.SetVoIPRecieveVolume(NewVolume / float(100));
}

function CallBack_ResetAudioOptions()
{
    Manager.OpenPopup(0, Localize("KFGFxOptionsMenu_Graphics", "WarningPromptString", "KFGame"), Localize("KFGFxObject_Menu", "ResetDefaults", "KFGameConsole"), Localize("KFGFxOptionsMenu_Graphics", "OKString", "KFGame"), Localize("KFGFxOptionsMenu_Graphics", "CancelString", "KFGame"), ResetAudioOptions);
}

function ResetAudioOptions()
{
    local KFGameEngine KFGE;

    if(!Outer.GetPC().WorldInfo.IsConsoleBuild())
    {
        Manager.CachedProfile.SetProfileSettingValueFloat(143, Manager.CachedProfile.GetDefaultFloat(143));
        Manager.CachedProfile.SetProfileSettingValueInt(130, Manager.CachedProfile.GetDefaultInt(130));        
    }
    else
    {
        KFGE = KFGameEngine(Class'Engine'.static.GetEngine());
        KFGE.GammaMultiplier = Manager.CachedProfile.GetDefaultFloat(117);
        KFGE.SetGamma(KFGE.GammaMultiplier);
        Manager.CachedProfile.SetProfileSettingValueFloat(117, KFGE.GammaMultiplier);
        KFGE.SaveConfig();
        Manager.CachedProfile.SetProfileSettingValueInt(155, Manager.CachedProfile.GetDefaultInt(155));
    }
    Manager.CachedProfile.SetProfileSettingValueFloat(112, Manager.CachedProfile.GetDefaultFloat(112));
    Manager.CachedProfile.SetProfileSettingValueFloat(113, Manager.CachedProfile.GetDefaultFloat(113));
    Manager.CachedProfile.SetProfileSettingValueFloat(114, Manager.CachedProfile.GetDefaultFloat(114));
    Manager.CachedProfile.SetProfileSettingValueFloat(115, Manager.CachedProfile.GetDefaultFloat(115));
    Manager.CachedProfile.SetProfileSettingValueInt(118, Manager.CachedProfile.GetDefaultInt(118));
    Manager.CachedProfile.SetProfileSettingValueInt(119, Manager.CachedProfile.GetDefaultInt(119));
    InitValues();
}

defaultproperties
{
    SectionNameString="VOLUME"
    OptionsString="OPTIONS"
    AudioString="AUDIO OPTIONS"
    DialogVolumeString="Dialog Volume"
    MasterVolumeString="Master Volume"
    MusicString="In-Game Music Volume"
    SFxString="SFX Volume"
    VOIPVolumeString="Voice Chat Receive Volume"
    ConfigureMicString="CONFIGURE MICROPHONE"
    VocalsString="Music Vocals"
    BattleChatterString="Minimize Battle Chatter"
    PushToVoIPString="Push to VoIP"
}