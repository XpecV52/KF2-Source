/*******************************************************************************
 * KFGFxOptionsMenu_GameSettings generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxOptionsMenu_GameSettings extends KFGFxObject_Menu within GFxMoviePlayer;

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
const KFID_Native4kResolution = 169;
const KFID_HideRemoteHeadshotEffects = 170;
const KFID_SavedHeadshotID = 171;

var const localized string SectionNameString;
var const localized string GameSettingsString;
var const localized string FOVString;
var const localized string FriendlyHudScaleString;
var const localized string GoreString;
var const localized string ShowCrosshairString;
var const localized string WiderString;
var const localized string NormalString;
var const localized string ClassicWeaponSelectString;
var const localized string KillTickerString;
var const localized string DisableAutoUpgradeString;
var const localized string HideBossHealthBarString;
var const localized string ShowWelderInInvString;
var const localized string UseAltAimOnDualString;
var const localized string AntiMotionSicknessString;
var const localized string AutoTurnOffString;
var const localized string ReduceHighPitchNoiseString;
var const localized string EnableMixerString;
var const localized string DisableMixerString;
var const localized array<localized string> GoreOptionStrings;
var const localized string HideRemodeHeadshotEffectsString;
var float FOVMinValue;
var float FOVMaxValue;
var float FOVCurrentValue;
var float FriendlyHudScaleMinValue;
var float FriendlyHudScaleMaxValue;
var const byte SHOW_NO_GORE_LEVEL;

function InitializeMenu(KFGFxMoviePlayer_Manager InManager)
{
    super.InitializeMenu(InManager);
    LocalizeText();
    InitValues();
}

function LocalizeText()
{
    local GFxObject LocalizedObject, GoreOptions;
    local byte I;

    LocalizedObject = Outer.CreateObject("Object");
    GoreOptions = Outer.CreateArray();
    I = 0;
    J0x68:

    if(I < GoreOptionStrings.Length)
    {
        GoreOptions.SetElementString(I, GoreOptionStrings[I]);
        ++ I;
        goto J0x68;
    }
    LocalizedObject.SetString("header", Caps(Class'KFGFxOptionsMenu_Selection'.default.OptionStrings[3]));
    LocalizedObject.SetString("fov", FOVString);
    LocalizedObject.SetString("friendlyHud", FriendlyHudScaleString);
    LocalizedObject.SetString("gore", GoreString);
    LocalizedObject.SetString("crosshair", ShowCrosshairString);
    LocalizedObject.SetString("classicWeaponSelect", ClassicWeaponSelectString);
    LocalizedObject.SetObject("goreOptions", GoreOptions);
    LocalizedObject.SetString("wider", WiderString);
    LocalizedObject.SetString("normal", NormalString);
    LocalizedObject.SetString("killTicker", KillTickerString);
    LocalizedObject.SetString("disableAutoUpgrade", DisableAutoUpgradeString);
    LocalizedObject.SetString("close", Class'KFCommon_LocalizedStrings'.default.BackString);
    LocalizedObject.SetString("resetDefault", Localize("KFGFxOptionsMenu_Graphics", "DefaultString", "KFGame"));
    LocalizedObject.SetString("hideRemoteHeadshotEffects", HideRemodeHeadshotEffectsString);
    LocalizedObject.SetString("hideBossHealthBar", HideBossHealthBarString);
    LocalizedObject.SetString("showWelderInInv", ShowWelderInInvString);
    LocalizedObject.SetString("useAltAimOnDual", UseAltAimOnDualString);
    LocalizedObject.SetString("autoTurnOff", AutoTurnOffString);
    LocalizedObject.SetString("enableMixer", EnableMixerString);
    LocalizedObject.SetString("disableMixer", DisableMixerString);
    SetObject("localizedText", LocalizedObject);
}

function InitValues()
{
    local GFxObject DataObject;

    SetFOVMinMax(FOVMinValue, FOVMaxValue);
    SetFriendlyHudMinMax(FriendlyHudScaleMinValue, FriendlyHudScaleMaxValue);
    DataObject = Outer.CreateObject("Object");
    if(Class'WorldInfo'.static.IsConsoleBuild())
    {
        LogInternal((((((("(" $ string(Name)) $ ") KFGFxOptionsMenu_GameSettings::") $ string(GetStateName())) $ ":") $ string(GetFuncName())) @ "CONSOLE") @ string(Manager.CachedProfile.GetProfileFloat(122)));
        DataObject.SetFloat("fov", Manager.CachedProfile.GetProfileFloat(122));        
    }
    else
    {
        LogInternal((((((("(" $ string(Name)) $ ") KFGFxOptionsMenu_GameSettings::") $ string(GetStateName())) $ ":") $ string(GetFuncName())) @ "PC") @ string(Manager.CachedProfile.GetProfileFloat(122)));
        DataObject.SetFloat("fov", Class'KFGameEngine'.default.FOVOptionsPercentageValue);
        DataObject.SetBool("classicWeaponSelect", Manager.CachedProfile.GetProfileBool(100));
    }
    DataObject.SetFloat("gore", float(Manager.CachedProfile.GetProfileInt(107)));
    DataObject.SetFloat("friendlyHud", Manager.CachedProfile.GetProfileFloat(125));
    DataObject.SetBool("crosshair", ((Class'WorldInfo'.static.IsConsoleBuild()) ? Manager.CachedProfile.GetProfileBool(163) : Manager.CachedProfile.GetProfileBool(121)));
    DataObject.SetBool("killTicker", Manager.CachedProfile.GetProfileBool(123));
    DataObject.SetBool("disableAutoUpgrade", Manager.CachedProfile.GetProfileBool(167));
    DataObject.SetBool("disableRemoteHeadShotEffects", Manager.CachedProfile.GetProfileBool(170));
    DataObject.SetBool("hideBossHealthBar", Manager.CachedProfile.GetProfileBool(158));
    DataObject.SetBool("showWelderInInv", Manager.CachedProfile.GetProfileBool(160));
    DataObject.SetBool("useAltAimOnDual", Manager.CachedProfile.GetProfileBool(157));
    DataObject.SetBool("autoTurnOff", Manager.CachedProfile.GetProfileBool(161));
    if(Class'WorldInfo'.static.IsConsoleBuild(9))
    {
        DataObject.SetBool("bDingo", true);
        DataObject.SetBool("bMixerEnabled", Class'MixerIntegration'.static.IsMixerInteractionEnabled());
    }
    SetObject("dataValues", DataObject);
}

function SetFOVMinMax(float MinVol, float MaxVol)
{
    ActionScriptVoid("setfovRange");
}

function SetFriendlyHudMinMax(float MinVol, float MaxVol)
{
    ActionScriptVoid("setFriendlyHudRange");
}

function Callback_CloseMenu()
{
    Manager.CachedProfile.Save(byte(Outer.GetLP().ControllerId));
    Manager.OpenMenu(6);
}

function Callback_ToggleMixer(bool bActive)
{
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(Outer.GetPC());
    if(KFPC != none)
    {
        if(bActive)
        {
            KFPC.InitializeMixer();            
        }
        else
        {
            KFPC.ShutdownMixer();
        }
    }
}

function Callback_ToggleCrosshair(bool bShow)
{
    local KFPlayerController KFPC;
    local KFHUDBase KFHud;
    local OnlineProfileSettings Settings;

    KFPC = KFPlayerController(Outer.GetPC());
    if(KFPC != none)
    {
        KFHud = KFHUDBase(KFPC.myHUD);
        if(KFHud != none)
        {
            KFHud.bDrawCrosshair = bShow;
        }
    }
    Class'KFGameEngine'.static.SetCrosshairEnabled(bShow);
    Settings = Class'GameEngine'.static.GetOnlineSubsystem().PlayerInterface.GetProfileSettings(byte(Outer.GetLP().ControllerId));
    Settings.SetProfileSettingValueInt(((Class'WorldInfo'.static.IsConsoleBuild()) ? 163 : 121), ((bShow) ? 1 : 0));
}

function Callback_FOVChanged(float NewFOVPercentage)
{
    local PlayerController PC;
    local KFGameEngine KFGE;
    local OnlineProfileSettings Settings;

    KFGE = KFGameEngine(Class'Engine'.static.GetEngine());
    KFGE.FOVOptionsPercentageValue = NewFOVPercentage;
    KFGE.SaveConfig();
    Class'KFGameEngine'.default.FOVOptionsPercentageValue = NewFOVPercentage;
    Class'KFGameEngine'.static.StaticSaveConfig();
    PC = Outer.GetPC();
    if(PC != none)
    {
        PC.PlayerCamera.SetFOV(PC.PlayerCamera.DefaultFOV * NewFOVPercentage);
        PC.PlayerCamera.UpdateCamera(0);
    }
    if(Class'WorldInfo'.static.IsConsoleBuild())
    {
        Settings = Class'GameEngine'.static.GetOnlineSubsystem().PlayerInterface.GetProfileSettings(byte(Outer.GetLP().ControllerId));
        Settings.SetProfileSettingValueFloat(122, NewFOVPercentage);
    }
}

function Callback_FriendlyHudChanged(float NewFriendlyHudScale)
{
    local KFPlayerController KFPC;
    local KFHUDBase KFHud;
    local OnlineProfileSettings Settings;

    Settings = Class'GameEngine'.static.GetOnlineSubsystem().PlayerInterface.GetProfileSettings(byte(Outer.GetLP().ControllerId));
    KFPC = KFPlayerController(Outer.GetPC());
    if(KFPC != none)
    {
        KFHud = KFHUDBase(KFPC.myHUD);
        if(KFHud != none)
        {
            KFHud.FriendlyHudScale = NewFriendlyHudScale;
            KFHud.SaveConfig();
        }
        Settings.SetProfileSettingValueFloat(125, NewFriendlyHudScale);
        Class'KFHUDBase'.static.StaticSaveConfig();
    }
}

function Callback_WeaponSelectChanged(bool bActive)
{
    local KFPlayerInput KFPI;
    local OnlineProfileSettings Settings;

    KFPI = KFPlayerInput(Outer.GetPC().PlayerInput);
    KFPI.bQuickWeaponSelect = bActive;
    Settings = Class'GameEngine'.static.GetOnlineSubsystem().PlayerInterface.GetProfileSettings(byte(Outer.GetLP().ControllerId));
    Settings.SetProfileSettingValueInt(100, ((bActive) ? 1 : 0));
}

function Callback_DisableAutoUpgradeChanged(bool bActive)
{
    local KFPlayerController KFPC;
    local OnlineProfileSettings Settings;

    KFPC = KFPlayerController(Outer.GetPC());
    KFPC.bDisableAutoUpgrade = bActive;
    Settings = Class'GameEngine'.static.GetOnlineSubsystem().PlayerInterface.GetProfileSettings(byte(Outer.GetLP().ControllerId));
    Settings.SetProfileSettingValueInt(167, ((bActive) ? 1 : 0));
}

function Callback_DisableRemoteHeadshotEffects(bool bActive)
{
    local KFPlayerController KFPC;
    local OnlineProfileSettings Settings;

    KFPC = KFPlayerController(Outer.GetPC());
    KFPC.bHideRemotePlayerHeadshotEffects = bActive;
    Settings = Class'GameEngine'.static.GetOnlineSubsystem().PlayerInterface.GetProfileSettings(byte(Outer.GetLP().ControllerId));
    Settings.SetProfileSettingValueInt(170, ((bActive) ? 1 : 0));
}

function Callback_KillTickerChanged(bool bActive)
{
    local KFPlayerController KFPC;
    local OnlineProfileSettings Settings;

    KFPC = KFPlayerController(Outer.GetPC());
    KFPC.bShowKillTicker = bActive;
    Settings = Class'GameEngine'.static.GetOnlineSubsystem().PlayerInterface.GetProfileSettings(byte(Outer.GetLP().ControllerId));
    Settings.SetProfileSettingValueInt(123, ((bActive) ? 1 : 0));
}

function Callback_GoreChanged(int NewGoreLevel)
{
    local KFGameInfo KFGI;
    local OnlineProfileSettings Settings;
    local KFGoreManager GoreMgr;

    Settings = Class'GameEngine'.static.GetOnlineSubsystem().PlayerInterface.GetProfileSettings(byte(Outer.GetLP().ControllerId));
    if(Outer.GetPC().WorldInfo.NetMode == NM_Standalone)
    {
        KFGI = KFGameInfo(Outer.GetPC().WorldInfo.Game);
        if(KFGI != none)
        {
            KFGI.GoreLevel = NewGoreLevel;
            KFGI.SaveConfig();
        }        
    }
    else
    {
        if(!Class'WorldInfo'.static.IsConsoleBuild())
        {
            Class'GameInfo'.default.GoreLevel = NewGoreLevel;
            Class'GameInfo'.static.StaticSaveConfig();
        }
    }
    GoreMgr = KFGoreManager(Class'WorldInfo'.static.GetWorldInfo().MyGoreEffectManager);
    if(GoreMgr != none)
    {
        GoreMgr.DesiredGoreLevel = NewGoreLevel;
    }
    Settings.SetProfileSettingValueInt(107, NewGoreLevel);
}

function Callback_UseAltAimOnDualsChanged(bool bActive)
{
    local KFGameEngine KFGEngine;
    local OnlineProfileSettings Settings;

    Settings = Class'GameEngine'.static.GetOnlineSubsystem().PlayerInterface.GetProfileSettings(byte(Outer.GetLP().ControllerId));
    if(Settings != none)
    {
        Settings.SetProfileSettingValueInt(157, ((bActive) ? 1 : 0));
    }
    KFGEngine = KFGameEngine(Class'KFGameEngine'.static.GetEngine());
    if(KFGEngine != none)
    {
        KFGEngine.bUseAltAimOnDual = bActive;
    }
}

function Callback_HideBossHealthBarChanged(bool bActive)
{
    local KFPlayerController KFPC;
    local OnlineProfileSettings Settings;

    Settings = Class'GameEngine'.static.GetOnlineSubsystem().PlayerInterface.GetProfileSettings(byte(Outer.GetLP().ControllerId));
    if(Settings != none)
    {
        Settings.SetProfileSettingValueInt(158, ((bActive) ? 1 : 0));
    }
    KFPC = KFPlayerController(Outer.GetPC());
    KFPC.bHideBossHealthBar = bActive;
}

function Callback_AntiMotionSicknessChanged(bool bActive)
{
    local KFGameEngine KFGEngine;
    local OnlineProfileSettings Settings;

    Settings = Class'GameEngine'.static.GetOnlineSubsystem().PlayerInterface.GetProfileSettings(byte(Outer.GetLP().ControllerId));
    if(Settings != none)
    {
        Settings.SetProfileSettingValueInt(159, ((bActive) ? 1 : 0));
    }
    KFGEngine = KFGameEngine(Class'KFGameEngine'.static.GetEngine());
    if(KFGEngine != none)
    {
        KFGEngine.bAntiMotionSickness = bActive;
    }
}

function Callback_bShowWelderInInvChanged(bool bActive)
{
    local KFGameEngine KFGEngine;
    local OnlineProfileSettings Settings;
    local KFWeapon KFW;
    local KFPlayerController KFPC;
    local KFInventoryManager KFIM;

    KFPC = KFPlayerController(Outer.GetPC());
    Settings = Class'GameEngine'.static.GetOnlineSubsystem().PlayerInterface.GetProfileSettings(byte(Outer.GetLP().ControllerId));
    if(Settings != none)
    {
        Settings.SetProfileSettingValueInt(160, ((bActive) ? 1 : 0));
    }
    KFGEngine = KFGameEngine(Class'KFGameEngine'.static.GetEngine());
    if(KFGEngine != none)
    {
        KFGEngine.bShowWelderInInv = bActive;
        KFIM = KFInventoryManager(KFPC.Pawn.InvManager);
        if(KFIM != none)
        {
            foreach KFIM.InventoryActors(Class'KFWeapon', KFW)
            {
                if(KFW.IsA('KFWeap_Welder'))
                {
                    KFW.SetShownInInventory(bActive);                    
                    return;
                }                
            }            
        }
    }
}

function Callback_AutoTurnOffChanged(bool bActive)
{
    local KFPlayerController KFPC;
    local OnlineProfileSettings Settings;

    Settings = Class'GameEngine'.static.GetOnlineSubsystem().PlayerInterface.GetProfileSettings(byte(Outer.GetLP().ControllerId));
    if(Settings != none)
    {
        Settings.SetProfileSettingValueInt(161, ((bActive) ? 1 : 0));
    }
    KFPC = KFPlayerController(Outer.GetPC());
    KFPC.bSkipNonCriticalForceLookAt = bActive;
}

function Callback_ReduceHighPitchNoiseChanged(bool bActive)
{
    local KFPlayerController KFPC;
    local OnlineProfileSettings Settings;

    Settings = Class'GameEngine'.static.GetOnlineSubsystem().PlayerInterface.GetProfileSettings(byte(Outer.GetLP().ControllerId));
    if(Settings != none)
    {
        Settings.SetProfileSettingValueInt(162, ((bActive) ? 1 : 0));
    }
    KFPC = KFPlayerController(Outer.GetPC());
    KFPC.bNoEarRingingSound = bActive;
}

function CallBack_ResetGameOptions()
{
    Manager.DelayedOpenPopup(0, 0, Localize("KFGFxOptionsMenu_Graphics", "WarningPromptString", "KFGame"), Localize("KFGFxObject_Menu", "ResetDefaults", "KFGameConsole"), Localize("KFGFxOptionsMenu_Graphics", "OKString", "KFGame"), Localize("KFGFxOptionsMenu_Graphics", "CancelString", "KFGame"), ResetGameOptions);
}

function ResetGameOptions()
{
    Callback_GoreChanged(Manager.CachedProfile.GetDefaultInt(107));
    Callback_FriendlyHudChanged(Manager.CachedProfile.GetDefaultFloat(125));
    Callback_ToggleCrosshair(((Class'WorldInfo'.static.IsConsoleBuild()) ? Manager.CachedProfile.GetDefaultInt(163) : Manager.CachedProfile.GetDefaultInt(121)) != 0);
    Callback_KillTickerChanged(Manager.CachedProfile.GetDefaultInt(123) != 0);
    Callback_UseAltAimOnDualsChanged(Manager.CachedProfile.GetDefaultInt(157) != 0);
    Callback_HideBossHealthBarChanged(Manager.CachedProfile.GetDefaultInt(158) != 0);
    Callback_AntiMotionSicknessChanged(Manager.CachedProfile.GetDefaultInt(159) != 0);
    Callback_bShowWelderInInvChanged(Manager.CachedProfile.GetDefaultInt(160) != 0);
    Callback_AutoTurnOffChanged(Manager.CachedProfile.GetDefaultInt(161) != 0);
    Callback_ReduceHighPitchNoiseChanged(Manager.CachedProfile.GetDefaultInt(162) != 0);
    Callback_DisableAutoUpgradeChanged(Manager.CachedProfile.GetDefaultInt(167) != 0);
    if(!Outer.GetPC().WorldInfo.IsConsoleBuild())
    {
        Callback_WeaponSelectChanged(Manager.CachedProfile.GetDefaultInt(100) != 0);        
    }
    else
    {
        Callback_FOVChanged(Manager.CachedProfile.GetDefaultFloat(122));
    }
    InitValues();
}

defaultproperties
{
    SectionNameString="OPTIONS"
    GameSettingsString="GAME SETTINGS"
    FOVString="FOV"
    FriendlyHudScaleString="Friendly HUD Scale"
    GoreString="Gore Intensity"
    ShowCrosshairString="Show Crosshair"
    WiderString="Wider"
    NormalString="Normal"
    ClassicWeaponSelectString="Weapon Quick Select"
    KillTickerString="Show Zed Kill Ticker"
    DisableAutoUpgradeString="Disable Auto-Trade"
    HideBossHealthBarString="Hide Boss Healthbar"
    ShowWelderInInvString="Show Welder In Inventory"
    UseAltAimOnDualString="Use Alt Dual Pistol Aim"
    AntiMotionSicknessString="Anti Motion Sickness"
    AutoTurnOffString="No Auto Turn On Clot Grab"
    ReduceHighPitchNoiseString="Reduce High Pitch Noise"
    EnableMixerString="Enable Mixer"
    DisableMixerString="Disable Mixer"
    GoreOptionStrings(0)="Low Gore"
    GoreOptionStrings(1)="Medium Gore"
    GoreOptionStrings(2)="High Gore"
    HideRemodeHeadshotEffectsString="Disable Remote Headshot effects"
    FOVMinValue=1
    FOVMaxValue=1.25
    FriendlyHudScaleMinValue=0.25
    FriendlyHudScaleMaxValue=1
}