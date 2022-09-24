/*******************************************************************************
 * KFProfileSettings generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFProfileSettings extends OnlineProfileSettings
    native;

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
const KFID_ToggleToRun = 172;
const KFID_ClassicPlayerInfo = 173;
const KFID_VOIPMicVolumeMultiplier = 174;
const KFID_GamepadDeadzoneScale = 175;
const KFID_GamepadAccelerationJumpScale = 176;
const KFID_HasTabbedToStore = 177;
const KFID_AllowSwapTo9mm = 178;
const KFID_SurvivalStartingWeapIdx = 179;
const KFID_SurvivalStartingGrenIdx = 180;
const KFID_MouseLookUpScale = 181;
const KFID_MouseLookRightScale = 182;
const KFID_ViewSmoothingEnabled = 183;
const KFID_ViewAccelerationEnabled = 184;

struct native WeaponSkinPairs
{
    var init string ClassPath;
    var int SkinID;

    structdefaultproperties
    {
        ClassPath=""
        SkinID=0
    }
};

var transient array<CustomizationInfo> Characters;
var transient array<string> FavoriteWeapons;
var transient array<WeaponSkinPairs> ActiveSkins;
var transient bool Dirty;

event FavoriteWeapon(name WeaponName)
{
    if(FavoriteWeapons.Find(string(WeaponName) == -1)
    {
        FavoriteWeapons.AddItem(string(WeaponName);
        Dirty = true;
    }
}

event UnFavoriteWeapon(name WeaponName)
{
    local int Index;

    Index = FavoriteWeapons.Find(string(WeaponName);
    if(Index != -1)
    {
        FavoriteWeapons.Remove(Index, 1;
        Dirty = true;
    }
}

event Save(byte ControllerId)
{
    if(Dirty)
    {
        FlattenExtraToProfileSettings();
        if(KFGameEngine(Class'Engine'.static.GetEngine()).LocalLoginStatus != 1)
        {
            Class'GameEngine'.static.GetOnlineSubsystem().PlayerInterface.WriteProfileSettings(ControllerId, self);
        }
        Dirty = false;
    }
}

// Export UKFProfileSettings::execSaveWeaponSkin(FFrame&, void* const)
native function SaveWeaponSkin(string ClassPath, int Id);

// Export UKFProfileSettings::execClearWeaponSkin(FFrame&, void* const)
native function ClearWeaponSkin(string ClassPath);

event ApplyWeaponSkin(int ItemDefinition)
{
    local class<KFWeaponDefinition> WeaponDef;
    local int ItemIndex;

    ItemIndex = Class'KFWeaponSkinList'.default.Skins.Find('Id', ItemDefinition;
    if(ItemIndex == -1)
    {
        return;
    }
    WeaponDef = Class'KFWeaponSkinList'.default.Skins[ItemIndex].WeaponDef;
    if(WeaponDef != none)
    {
        Class'KFWeaponSkinList'.static.SaveWeaponSkin(WeaponDef, ItemDefinition);
    }
}

function bool HasSafeFrameSet()
{
    return (GetProfileFloat(168)) != 0;
}

function bool SetProfileSettingValueInt(int ProfileSettingId, int Value)
{
    if(super(OnlinePlayerStorage).SetProfileSettingValueInt(ProfileSettingId, Value))
    {
        Dirty = true;
        return true;
    }
    return false;
}

function bool SetProfileSettingValueBool(int ProfileSettingId, bool Value)
{
    if(SetProfileSettingValueInt(ProfileSettingId, ((Value) ? 1 : 0)))
    {
        Dirty = true;
        return true;
    }
    return false;
}

function bool SetProfileSettingValueFloat(int ProfileSettingId, float Value)
{
    if(super(OnlinePlayerStorage).SetProfileSettingValueFloat(ProfileSettingId, Value))
    {
        Dirty = true;
        return true;
    }
    return false;
}

event int GetProfileInt(int ProfileSettingId)
{
    local int tempInt;

    GetProfileSettingValueInt(ProfileSettingId, tempInt);
    return tempInt;
}

event bool GetProfileBool(int ProfileSettingId)
{
    local int tempInt;

    GetProfileSettingValueInt(ProfileSettingId, tempInt);
    return tempInt != 0;
}

event float GetProfileFloat(int ProfileSettingId)
{
    local float TempFloat;

    GetProfileSettingValueFloat(ProfileSettingId, TempFloat);
    return TempFloat;
}

event string GetProfileString(int ProfileSettingId)
{
    local string TempStr;

    GetProfileSettingValue(ProfileSettingId, TempStr);
    return TempStr;
}

function int GetDefaultInt(int ProfileSettingId)
{
    local int tempInt;

    GetProfileSettingDefaultInt(ProfileSettingId, tempInt);
    return tempInt;
}

function bool GetDefaultBool(int ProfileSettingId)
{
    local int tempInt;

    GetProfileSettingDefaultInt(ProfileSettingId, tempInt);
    return tempInt != 0;
}

function float GetDefaultFloat(int ProfileSettingId)
{
    local float TempFloat;

    GetProfileSettingDefaultFloat(ProfileSettingId, TempFloat);
    return TempFloat;
}

// Export UKFProfileSettings::execSetCharacterGear(FFrame&, void* const)
native function bool SetCharacterGear(const out CustomizationInfo GearSet);

// Export UKFProfileSettings::execPushProfileSettingsToClasses(FFrame&, void* const)
native function PushProfileSettingsToClasses();

// Export UKFProfileSettings::execSetToDefaults(FFrame&, void* const)
native event SetToDefaults();

// Export UKFProfileSettings::execFlattenExtraToProfileSettings(FFrame&, void* const)
native function FlattenExtraToProfileSettings();

// Export UKFProfileSettings::execExpandExtraFromProfileSettings(FFrame&, void* const)
native function ExpandExtraFromProfileSettings();

defaultproperties
{
    DefaultSettings=/* Array type was not detected. */
    VersionNumber=6
    ProfileMappings=/* Array type was not detected. */
}