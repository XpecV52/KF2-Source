/*******************************************************************************
 * KFGFxStartGameContainer_Options generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxStartGameContainer_Options extends KFGFxObject_Container within GFxMoviePlayer
    native(UI)
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
const KFID_DisableAutoUpgrade = 167;
const KFID_SafeFrameScale = 168;
const KFID_Native4kResolution = 169;
const KFID_HideRemoteHeadshotEffects = 170;
const KFID_SavedHeadshotID = 171;
const KFID_ToggleToRun = 172;
const KFID_ClassicPlayerInfo = 173;

enum EServerPrivacy
{
    ESPr_Public,
    ESPr_PasswordProtected,
    ESPr_MAX
};

enum EGameMode
{
    EGameMode_Survival,
    EGameMode_Weekly,
    EGameMode_VsSurvival,
    EGameMode_Endless,
    EGameMode_Objective,
    EGameMode_MAX
};

var int ModeFilter;
var int DifficultyFilter;
var int LengthFilter;
var int PermissionsFilter;
var bool bModeFilterSet;
var bool bLengthFilterSet;
var bool bPermissionsFilterSet;
var bool bShowLengthNoPref;
var const config bool bShowServerTypeNoPref;
var bool bIsSoloGame;
var private byte RegionIndex;
var KFGFxMenu_StartGame StartMenu;
var const localized string BackString;
var const localized string StartGameString;
var const localized string LaunchGameString;
var const localized string ServerTypeString;
var const localized string InProgressString;
var const localized string SoloGameString;
var const localized string LeaveMatchMakingString;
var const localized string MultiplayerLaunchString;
var const localized string SearchingString;
var const localized string CancelSearchingString;
var const localized array<localized string> GameTypes;
var string PreviousMapName;
var private array<string> SupportedGameModeStrings;
var GFxObject PrivacyButton;
var GFxObject LengthButton;
var GFxObject DifficultyButton;
var GFxObject MapButton;
var GFxObject RegionButton;

function Initialize(KFGFxObject_Menu NewParentMenu)
{
    super.Initialize(NewParentMenu);
    GetButtons();
    StartMenu = KFGFxMenu_StartGame(NewParentMenu);
    InitializeGameOptions();
    SetOptions();
}

function GetButtons()
{
    PrivacyButton = GetObject("privacyButton");
    LengthButton = GetObject("lengthButton");
    DifficultyButton = GetObject("difficultyButton");
    MapButton = GetObject("mapButton");
    RegionButton = GetObject("regionButton");
}

function UpdateButtonsEnabled()
{
    local int AdjustedGameModeIndex;

    if(bIsSoloGame)
    {
        AdjustedGameModeIndex = ParentMenu.Manager.GetModeIndex(false);
        LengthButton.SetBool("enabled", Class'KFGameInfo'.default.GameModes[AdjustedGameModeIndex].Lengths > 0);
        DifficultyButton.SetBool("enabled", Class'KFGameInfo'.default.GameModes[AdjustedGameModeIndex].DifficultyLevels > 0);        
    }
    else
    {
        LengthButton.SetBool("enabled", Class'KFGameInfo'.default.GameModes[ParentMenu.Manager.GetModeIndex()].Lengths > 0);
        DifficultyButton.SetBool("enabled", Class'KFGameInfo'.default.GameModes[ParentMenu.Manager.GetModeIndex()].DifficultyLevels > 0);
    }
}

function SetHelpText(string TextValue)
{
    SetString("helpText", TextValue);
}

function SetModeMenus(GFxObject TextObject, int ModeIndex)
{
    local int DifficultyLevels, Lengths;
    local byte NewDifficultyIndex, NewLengthIndex;

    DifficultyLevels = Class'KFGameInfo'.default.GameModes[ModeIndex].DifficultyLevels;
    Lengths = Class'KFGameInfo'.default.GameModes[ModeIndex].Lengths;
    NewDifficultyIndex = byte(Clamp(NewDifficultyIndex, 0, DifficultyLevels));
    NewLengthIndex = byte(Clamp(NewLengthIndex, 0, Lengths));
    TextObject.SetObject("difficultyList", CreateList(Class'KFCommon_LocalizedStrings'.static.GetDifficultyStringsArray(), byte(GetDifficultyIndex()), false, false, byte(DifficultyLevels)));
    TextObject.SetObject("lengthList", CreateList(Class'KFCommon_LocalizedStrings'.static.GetLengthStringsArray(), byte(GetLengthIndex()), bShowLengthNoPref, false, byte(Lengths)));
}

event int GetNormalizedGameModeIndex(int ModeIndex)
{
    if(bIsSoloGame)
    {
        if(ModeIndex < 2)
        {
            return ModeIndex;            
        }
        else
        {
            return ModeIndex + 1;
        }
    }
    return ModeIndex;
}

simulated function int GetInitialMapIndex()
{
    local int InitialMapIndex;

    InitialMapIndex = StartMenu.MapStringList.Find(GetMapName();
    if(bIsSoloGame && InitialMapIndex == -1)
    {
        if(!Class'GameEngine'.static.IsGameFullyInstalled())
        {
            InitialMapIndex = StartMenu.MapStringList.Find("KF-EvacuationPoint";            
        }
        else
        {
            if(ParentMenu.Manager.GetModeIndex(false) == 4)
            {
                InitialMapIndex = StartMenu.MapStringList.Find("KF-SteamFortress";                
            }
            else
            {
                InitialMapIndex = StartMenu.MapStringList.Find("KF-BioticsLab";
            }
        }
        MapChanged(StartMenu.MapStringList[InitialMapIndex]);
    }
    return InitialMapIndex;
}

simulated function KFProfileSettings GetCachedProfile()
{
    return KFProfileSettings(Class'GameEngine'.static.GetOnlineSubsystem().PlayerInterface.GetProfileSettings(byte(Outer.GetLP().ControllerId)));
}

function InitializeGameOptions()
{
    local GFxObject TextObject;
    local int I, InitialMapIndex;
    local KFProfileSettings Profile;
    local array<string> PlayfabRegionList;

    Profile = GetCachedProfile();
    bIsSoloGame = GetBool("bIsSoloGame");
    StartMenu.GetMapList(StartMenu.MapStringList, ParentMenu.Manager.GetModeIndex(false), StartMenu.GetStartMenuState() == 1);
    InitialMapIndex = GetInitialMapIndex();
    UpdateButtonsEnabled();
    SupportedGameModeStrings = Class'KFCommon_LocalizedStrings'.static.GetGameModeStringsArray();
    I = SupportedGameModeStrings.Length - 1;
    J0x12A:

    if(I >= 0)
    {
        if(((bIsSoloGame && !Class'KFGameInfo'.static.IsGameModeSoloPlayAllowed(I)) || !Class'GameEngine'.static.IsGameFullyInstalled() && I == 4) || !Class'GameEngine'.static.IsGameFullyInstalled() && I == 1)
        {
            SupportedGameModeStrings.Remove(I, 1;
        }
        -- I;
        goto J0x12A;
    }
    TextObject = Outer.CreateObject("Object");
    TextObject.SetString("soloGameString", SoloGameString);
    TextObject.SetString("matchMakingString", StartMenu.MatchmakingString);
    TextObject.SetString("createGameString", StartMenu.CreateMatchString);
    TextObject.SetString("leaveMatchmakingString", LeaveMatchMakingString);
    TextObject.SetString("backString", BackString);
    TextObject.SetString("lauchGameString", LaunchGameString);
    TextObject.SetString("multiplayerLaunchString", MultiplayerLaunchString);
    TextObject.SetString("searchingString", CancelSearchingString);
    TextObject.SetString("mode", StartMenu.GameModeTitle);
    TextObject.SetString("map", StartMenu.MapTitle);
    TextObject.SetString("difficulty", StartMenu.DifficultyTitle);
    TextObject.SetString("length", StartMenu.LengthTitle);
    TextObject.SetString("privacy", StartMenu.PermissionsTitle);
    TextObject.SetString("inProgress", InProgressString);
    TextObject.SetObject("modeList", CreateList(SupportedGameModeStrings, byte(Min(ParentMenu.Manager.GetModeIndex(), SupportedGameModeStrings.Length)), false));
    SetModeMenus(TextObject, Min(ParentMenu.Manager.GetModeIndex(), SupportedGameModeStrings.Length));
    TextObject.SetObject("lengthList", CreateList(Class'KFCommon_LocalizedStrings'.static.GetLengthStringsArray(), byte(GetLengthIndex()), bShowLengthNoPref));
    TextObject.SetObject("mapList", CreateList(StartMenu.MapStringList, byte(((bIsSoloGame) ? InitialMapIndex : InitialMapIndex + 1)), true, true));
    TextObject.SetObject("difficultyList", CreateList(Class'KFCommon_LocalizedStrings'.static.GetDifficultyStringsArray(), byte(GetDifficultyIndex()), false));
    TextObject.SetObject("privacyList", CreateList(Class'KFCommon_LocalizedStrings'.static.GetPermissionStringsArray(Class'WorldInfo'.static.IsConsoleBuild()), byte(Profile.GetProfileInt(152)), false));
    if(Class'WorldInfo'.static.IsConsoleBuild())
    {
        TextObject.SetString("regionTitle", ConsoleLocalize("MatchmakingRegionString"));
        PlayfabRegionList = Class'PlayfabInterface'.static.GetLocalizedRegionList();
        RegionIndex = ((Class'WorldInfo'.static.IsE3Build()) ? 0 : byte(Class'GameEngine'.static.GetPlayfabInterface().GetIndexForCurrentRegion()));
        TextObject.SetObject("regionListData", CreateList(PlayfabRegionList, RegionIndex, false));
        TextObject.SetObject("regionList", CreateList(PlayfabRegionList, byte(Class'GameEngine'.static.GetPlayfabInterface().GetIndexForCurrentRegion()), false));
    }
    SetObject("localizedText", TextObject);
}

function GFxObject CreateList(array<string> TextArray, byte SelectedIndex, bool bAddNoPrefString, optional bool bIsMapList, optional byte MaxLength)
{
    local int I, ArrayOffset;
    local GFxObject OptionList, DataProvider, ItemSlot;
    local string TempString;
    local byte ArrayLen;

    OptionList = Outer.CreateObject("Object");
    DataProvider = Outer.CreateArray();
    if(MaxLength > 0)
    {
        ArrayLen = byte(Min(MaxLength, TextArray.Length));        
    }
    else
    {
        ArrayLen = byte(TextArray.Length);
    }
    ArrayOffset = 0;
    if(bAddNoPrefString && !GetBool("bIsSoloGame"))
    {
        ItemSlot = Outer.CreateObject("Object");
        TempString = Class'KFCommon_LocalizedStrings'.default.NoPreferenceString;
        ItemSlot.SetString("label", TempString);
        ItemSlot.SetString("imagePath", StartMenu.GetMapSource("Omlette Du Fromage"));
        DataProvider.SetElementObject(ArrayOffset, ItemSlot);
        ++ ArrayOffset;
    }
    I = 0;
    J0x214:

    if(I < ArrayLen)
    {
        ItemSlot = Outer.CreateObject("Object");
        if(bIsMapList)
        {
            TempString = Class'KFCommon_LocalizedStrings'.static.GetFriendlyMapName(TextArray[I]);
            ItemSlot.SetString("mapItemKey", TextArray[I]);
            ItemSlot.SetString("imagePath", StartMenu.GetMapSource(TextArray[I]));            
        }
        else
        {
            TempString = TextArray[I];
        }
        ItemSlot.SetString("label", TempString);
        DataProvider.SetElementObject(I + ArrayOffset, ItemSlot);
        ++ I;
        goto J0x214;
    }
    OptionList.SetInt("selectedIndex", SelectedIndex);
    OptionList.SetObject("dataProvider", DataProvider);
    OptionList.ActionScriptVoid("invalidateData");
    return OptionList;
}

function SetOptions(optional bool bMenuOpening)
{
    local array<string> PlayfabRegionList;

    if(Class'WorldInfo'.static.IsConsoleBuild())
    {
        if(bMenuOpening && !bIsSoloGame)
        {
            if(Class'WorldInfo'.static.IsConsoleBuild(9) && Class'GameEngine'.static.GetPlayfabInterface().CurrRegionName == "")
            {
                Class'GameEngine'.static.GetOnlineSubsystem().StartRegionPingAndSelectDefaultRegion(None);
                ParentMenu.Manager.DelayedOpenPopup(2, 0, Localize("Notifications", "NewRegionTitle", "KFGameConsole"), Localize("Notifications", "NewRegionMessage", "KFGameConsole"), Class'KFCommon_LocalizedStrings'.default.OKString);
                RegionIndex = byte(Class'GameEngine'.static.GetPlayfabInterface().GetIndexForCurrentRegion());
                Class'GameEngine'.static.GetPlayfabInterface().SetIndexForCurrentRegion(RegionIndex);
                PlayfabRegionList = Class'PlayfabInterface'.static.GetLocalizedRegionList();
                RegionButton.SetString("infoString", PlayfabRegionList[RegionIndex]);
            }
        }
    }
}

function SetSearching(bool bSearching)
{
    SetBool("bSearchingForGame", bSearching);
    PrivacyChanged(GetCachedProfile().GetProfileInt(152));
    if(!bSearching)
    {
        UpdateButtonsEnabled();
    }
    if(bSearching)
    {
        SetHelpText(SearchingString);        
    }
    else
    {
        SetHelpText("");
    }
}

event bool GetMakeNewServer()
{
    return StartMenu.bAttemptingServerCreate;
}

function ModeChanged(int Index)
{
    local int NormalizedModeIndex;

    NormalizedModeIndex = GetNormalizedGameModeIndex(Index);
    GetCachedProfile().SetProfileSettingValueInt(148, NormalizedModeIndex);
    InitializeGameOptions();
    SaveConfig();
}

function LengthChanged(int Index)
{
    GetCachedProfile().SetProfileSettingValueInt(151, Index);
    SaveConfig();
}

function DifficultyChanged(int Index)
{
    GetCachedProfile().SetProfileSettingValueInt(150, Index);
    SaveConfig();
}

function MapChanged(string MapName, optional bool bSave)
{
    bSave = true;
    GetCachedProfile().SetProfileSettingValue(149, MapName);
    if(bSave)
    {
        SaveConfig();
    }
}

function PrivacyChanged(int Index, optional bool bSetText)
{
    if(Index != GetCachedProfile().GetProfileInt(152))
    {
        SaveConfig();
        if(bSetText)
        {
            PrivacyButton.SetString("infoString", Class'KFCommon_LocalizedStrings'.static.GetPermissionStringsArray(Outer.GetPC().WorldInfo.IsConsoleBuild())[Index]);
        }
        GetCachedProfile().SetProfileSettingValueInt(152, Index);
    }
}

function SetRegionIndex(int InRegionIndex, optional bool bSetText)
{
    local array<string> PlayfabRegionList;

    if(!Class'WorldInfo'.static.IsConsoleBuild())
    {
        return;
    }
    if(RegionIndex != InRegionIndex)
    {
        RegionIndex = byte(InRegionIndex);
        Class'GameEngine'.static.GetPlayfabInterface().SetIndexForCurrentRegion(RegionIndex);
        if(bSetText)
        {
            PlayfabRegionList = Class'PlayfabInterface'.static.GetLocalizedRegionList();
            RegionButton.SetString("infoString", PlayfabRegionList[RegionIndex]);
        }
    }
}

function UpdateFilters()
{
    local GFxObject DataObject;

    DataObject = GetObject("options");
    ModeFilter = ParentMenu.Manager.GetModeIndex();
    bModeFilterSet = ModeFilter < Class'KFCommon_LocalizedStrings'.static.GetGameModeStringsArray().Length;
    DifficultyFilter = GetDifficultyIndex();
    if(DifficultyFilter >= Class'KFCommon_LocalizedStrings'.static.GetDifficultyStringsArray().Length)
    {
        DifficultyFilter = 0;
    }
    if(bShowLengthNoPref)
    {
        LengthFilter = DataObject.GetInt("length") - 1;
        bLengthFilterSet = (LengthFilter >= 0) && LengthFilter < Class'KFCommon_LocalizedStrings'.static.GetLengthStringsArray().Length;        
    }
    else
    {
        LengthFilter = DataObject.GetInt("length");
        bLengthFilterSet = LengthFilter < Class'KFCommon_LocalizedStrings'.static.GetLengthStringsArray().Length;
    }
    bPermissionsFilterSet = (GetPartyPrivacy() != 0) && GetMakeNewServer();
    PermissionsFilter = ((bPermissionsFilterSet) ? byte(GetCachedProfile().GetProfileInt(152)) : byte(0));
}

event int GetGameLength()
{
    if(!bLengthFilterSet)
    {
        return -1;
    }
    switch(LengthFilter)
    {
        case 0:
            return 4;
        case 1:
            return 7;
        case 2:
            return 10;
        default:
            return -1;
            break;
    }
}

function int GetDifficultyIndex()
{
    local int SavedDifficultyIndex, SavedModeIndex;

    SavedDifficultyIndex = GetCachedProfile().GetProfileInt(150);
    SavedModeIndex = GetCachedProfile().GetProfileInt(148);
    return Clamp(SavedDifficultyIndex, 0, Class'KFGameInfo'.default.GameModes[SavedModeIndex].DifficultyLevels);
}

function int GetLengthIndex()
{
    local int SavedLengthIndex, LengthIndexOffset;

    SavedLengthIndex = GetCachedProfile().GetProfileInt(151);
    if(!bShowLengthNoPref)
    {
        SavedLengthIndex = Clamp(SavedLengthIndex, 0, 2);        
    }
    else
    {
        if(SavedLengthIndex == 0)
        {
            SavedLengthIndex = 127;            
        }
        else
        {
            return SavedLengthIndex - 1;
        }
    }
    LengthIndexOffset = ((bShowLengthNoPref) ? 1 : 0);
    if(SavedLengthIndex >= (Class'KFGameInfo'.default.GameModes[ParentMenu.Manager.GetModeIndex()].Lengths + LengthIndexOffset))
    {
        SavedLengthIndex = 1;
    }
    return SavedLengthIndex;
}

function int GetDifficulty()
{
    if(DifficultyFilter >= Class'KFCommon_LocalizedStrings'.static.GetDifficultyStringsArray().Length)
    {
        DifficultyFilter = 0;
    }
    return DifficultyFilter;
}

function int GetPrivacyIndex()
{
    return GetCachedProfile().GetProfileInt(152);
}

function string GetMapName()
{
    local string SavedMapString;

    if(GetCachedProfile().GetProfileSettingValue(149, SavedMapString) == false)
    {
        SavedMapString = "";
    }
    if(!Class'GameEngine'.static.IsGameFullyInstalled())
    {
        SavedMapString = "KF-EvacuationPoint";
    }
    return SavedMapString;
}

event Engine.TWOnlineLobby.ELobbyVisibility GetPartyPrivacy()
{
    switch(GetCachedProfile().GetProfileInt(152))
    {
        case 0:
            return 0;
        case 1:
            return ((Class'WorldInfo'.static.IsConsoleBuild()) ? 1 : 2);
        default:
            break;
    }
}

// Export UKFGFxStartGameContainer_Options::execDoesFilterMatchGameSettings(FFrame&, void* const)
native function bool DoesFilterMatchGameSettings(const KFOnlineGameSettings InGameSettings);

defaultproperties
{
    RegionIndex=255
    BackString="BACK"
    StartGameString="LAUNCH GAME"
    LaunchGameString="LAUNCH GAME"
    ServerTypeString="SERVER TYPE"
    InProgressString="GAME PROGRESS"
    SoloGameString="SOLO GAME"
    LeaveMatchMakingString="LEAVE MATCHMAKING"
    MultiplayerLaunchString="PLAY ONLINE NOW"
    SearchingString="SEARCHING FOR ONLINE GAME...PLEASE WAIT"
    CancelSearchingString="CANCEL SEARCH"
}