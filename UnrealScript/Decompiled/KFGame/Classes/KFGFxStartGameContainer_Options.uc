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

enum EServerType
{
    ES_Maps,
    ES_Stock,
    ES_Custom,
    ES_Unranked,
    ES_MAX
};

enum EInProgess
{
    EIP_Allow_In_Progress,
    EIP_Not_Started,
    EIP_Create_New,
    EIP_MAX
};

enum EServerPrivacy
{
    ESPr_Public,
    ESPr_FriendsOnly,
    ESPr_PasswordProtected,
    ESPr_MAX
};

var int ModeFilter;
var int DifficultyFilter;
var int LengthFilter;
var int ServerTypeFilter;
var int InProgressFilter;
var int PermissionsFilter;
var bool bModeFilterSet;
var bool bLengthFilterSet;
var bool bServerTypeFilterSet;
var bool bInProgressFilterSet;
var bool bPermissionsFilterSet;
var const config bool bShowLengthNoPref;
var const config bool bShowServerTypeNoPref;
var bool bIsSoloGame;
var int InitialMapIndex;
var byte SavedSoloModeIndex;
var byte SavedSoloDifficultyIndex;
var byte SavedSoloLengthIndex;
var private byte SavedModeIndex;
var private byte SavedDifficultyIndex;
var private byte SavedLengthIndex;
var private byte SavedPrivacyIndex;
var private byte SavedServerTypeIndex;
var private byte SavedInProgressIndex;
var private byte RegionIndex;
var string SavedSoloMapString;
var private string SavedMapString;
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
var const localized string StandardServerString;
var const localized string UnrankedServerString;
var const localized string CustomServerString;
var const localized string AllowInProgressString;
var const localized string NotStartedString;
var array<string> ServerTypeStrings;
var array<string> InProgessOptionStrings;
var const localized array<localized string> GameTypes;
var string PreviousMapName;
var GFxObject ServerTypeButton;
var GFxObject InProgressButton;
var GFxObject PrivacyButton;
var GFxObject LengthButton;
var GFxObject DifficultyButton;

function Initialize(KFGFxObject_Menu NewParentMenu)
{
    super.Initialize(NewParentMenu);
    GetButtons();
    StartMenu = KFGFxMenu_StartGame(NewParentMenu);
    InitializeGameOptions();
    LocalizeArrays();
    SetOptions();
}

function GetButtons()
{
    ServerTypeButton = GetObject("serverTypeButton");
    InProgressButton = GetObject("inProgressButton");
    PrivacyButton = GetObject("privacyButton");
    LengthButton = GetObject("lengthButton");
    DifficultyButton = GetObject("difficultyButton");
}

function ClampSavedFiltersToMode()
{
    local int LengthIndexOffset;

    LengthIndexOffset = ((bShowLengthNoPref) ? 1 : 0);
    SavedDifficultyIndex = byte(Clamp(SavedDifficultyIndex, 0, Class'KFGameInfo'.default.GameModes[SavedModeIndex].DifficultyLevels));
    if(SavedLengthIndex >= (Class'KFGameInfo'.default.GameModes[SavedModeIndex].Lengths + LengthIndexOffset))
    {
        SavedLengthIndex = 1;
    }
    UpdateButtonsEnabled();
}

function UpdateButtonsEnabled()
{
    if(bIsSoloGame)
    {
        LengthButton.SetBool("enabled", true);
        DifficultyButton.SetBool("enabled", true);        
    }
    else
    {
        LengthButton.SetBool("enabled", SavedModeIndex != 1);
        DifficultyButton.SetBool("enabled", SavedModeIndex != 1);
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
    TextObject.SetObject("difficultyList", CreateList(Class'KFCommon_LocalizedStrings'.static.GetDifficultyStringsArray(), ((bIsSoloGame) ? SavedSoloDifficultyIndex : SavedDifficultyIndex), false, false, byte(DifficultyLevels)));
    TextObject.SetObject("lengthList", CreateList(Class'KFCommon_LocalizedStrings'.static.GetLengthStringsArray(), ((bIsSoloGame) ? SavedSoloLengthIndex : SavedLengthIndex), bShowLengthNoPref, false, byte(Lengths)));
}

function InitializeGameOptions()
{
    local GFxObject TextObject;
    local array<string> SupportedGameModeStrings;
    local int I;
    local KFProfileSettings Profile;

    Profile = StartMenu.Manager.CachedProfile;
    SavedSoloModeIndex = byte(Profile.GetProfileInt(144));
    SavedModeIndex = byte(Profile.GetProfileInt(148));
    if(StartMenu.Manager.CachedProfile.GetProfileSettingValue(149, SavedMapString) == false)
    {
        SavedMapString = "";
    }
    if(StartMenu.Manager.CachedProfile.GetProfileSettingValue(145, SavedSoloMapString) == false)
    {
        SavedSoloMapString = "";
    }
    if(Class'KFGameEngine'.static.IsPlaygoModePS4())
    {
        SavedMapString = "KF-EvacuationPoint";
        SavedSoloMapString = "KF-EvacuationPoint";        
    }
    else
    {
        if(SavedSoloMapString == "")
        {
            SavedSoloMapString = "KF-BioticsLab";
        }
    }
    SavedSoloDifficultyIndex = byte(Profile.GetProfileInt(146));
    SavedSoloLengthIndex = byte(Profile.GetProfileInt(147));
    SavedLengthIndex = byte(Profile.GetProfileInt(151));
    SavedInProgressIndex = byte(Profile.GetProfileInt(154));
    SavedServerTypeIndex = byte(Profile.GetProfileInt(153));
    SavedPrivacyIndex = byte(Profile.GetProfileInt(152));
    SavedModeIndex = byte(Profile.GetProfileInt(148));
    SavedDifficultyIndex = byte(Profile.GetProfileInt(150));
    bIsSoloGame = GetBool("bIsSoloGame");
    InitialMapIndex = StartMenu.MapStringList.Find(((bIsSoloGame) ? SavedSoloMapString : SavedMapString);
    ClampSavedFiltersToMode();
    if(bIsSoloGame && InitialMapIndex == -1)
    {
        InitialMapIndex = 0;
    }
    TextObject = Outer.CreateObject("Object");
    TextObject.SetString("soloGameString", SoloGameString);
    TextObject.SetString("matchMakingString", StartMenu.MatchmakingString);
    TextObject.SetString("leaveMatchmakingString", LeaveMatchMakingString);
    TextObject.SetString("backString", BackString);
    TextObject.SetString("lauchGameString", LaunchGameString);
    TextObject.SetString("multiplayerLaunchString", MultiplayerLaunchString);
    TextObject.SetString("searchingString", CancelSearchingString);
    TextObject.SetString("mode", StartMenu.GameModeTitle);
    TextObject.SetString("map", ((Class'WorldInfo'.static.IsConsoleBuild()) ? ConsoleLocalize("MapPreference") : StartMenu.MapTitle));
    TextObject.SetString("difficulty", StartMenu.DifficultyTitle);
    TextObject.SetString("length", StartMenu.LengthTitle);
    TextObject.SetString("privacy", StartMenu.PermissionsTitle);
    if(Class'WorldInfo'.static.IsConsoleBuild())
    {
        TextObject.SetString("serverType", ConsoleLocalize("MatchmakingRegionString"));
        RegionIndex = ((Class'WorldInfo'.static.IsE3Build()) ? 0 : byte(Class'GameEngine'.static.GetPlayfabInterface().GetIndexForCurrentRegion()));
        TextObject.SetObject("serverTypeList", CreateList(Class'PlayfabInterface'.static.GetLocalizedRegionList(), RegionIndex, false));        
    }
    else
    {
        TextObject.SetString("serverType", ServerTypeString);
        TextObject.SetObject("serverTypeList", CreateList(ServerTypeStrings, SavedServerTypeIndex, bShowServerTypeNoPref));
    }
    TextObject.SetString("inProgress", InProgressString);
    SupportedGameModeStrings = Class'KFCommon_LocalizedStrings'.static.GetGameModeStringsArray();
    if(bIsSoloGame)
    {
        I = 0;
        J0x9C6:

        if(I < SupportedGameModeStrings.Length)
        {
            if(!Class'KFGameInfo'.static.IsGameModeSoloPlayAllowed(I))
            {
                SupportedGameModeStrings.Remove(I, 1;
                -- I;
            }
            ++ I;
            goto J0x9C6;
        }
    }
    TextObject.SetObject("modeList", CreateList(SupportedGameModeStrings, byte(Min(((bIsSoloGame) ? SavedSoloModeIndex : SavedModeIndex), SupportedGameModeStrings.Length)), false));
    SetModeMenus(TextObject, Min(SavedModeIndex, SupportedGameModeStrings.Length));
    TextObject.SetObject("mapList", CreateList(StartMenu.MapStringList, byte(((bIsSoloGame) ? InitialMapIndex : InitialMapIndex + 1)), true, true));
    TextObject.SetObject("inProgressList", CreateList(InProgessOptionStrings, SavedInProgressIndex, false));
    TextObject.SetObject("privacyList", CreateList(Class'KFCommon_LocalizedStrings'.static.GetPermissionStringsArray(Class'WorldInfo'.static.IsConsoleBuild()), SavedPrivacyIndex, false));
    SetObject("localizedText", TextObject);
}

function LocalizeArrays()
{
    ServerTypeStrings[1] = Localize("KFGFxStartGameContainer_Options", "StandardServerString", "KFGame");
    ServerTypeStrings[2] = Localize("KFGFxStartGameContainer_Options", "CustomServerString", "KFGame");
    ServerTypeStrings[3] = Localize("KFGFxStartGameContainer_Options", "UnrankedServerString", "KFGame");
    ServerTypeStrings[0] = Localize("KFGFxStartGameContainer_Options", "AnyMapServerString", "KFGame");
    InProgessOptionStrings[0] = Localize("KFGFxStartGameContainer_Options", "AllowInProgressString", "KFGame");
    InProgessOptionStrings[1] = Localize("KFGFxStartGameContainer_Options", "NotStartedString", "KFGame");
    if(!Class'WorldInfo'.static.IsConsoleBuild())
    {
        InProgessOptionStrings[2] = Localize("KFGFxStartGameContainer_Options", "CreateNewGameString", "KFGame");
    }
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

function SetOptions()
{
    InProgressChanged(SavedInProgressIndex);
    PrivacyChanged(SavedPrivacyIndex);
}

function SetSearching(bool bSearching)
{
    SetBool("bSearchingForGame", bSearching);
    InProgressChanged(SavedInProgressIndex);
    PrivacyChanged(SavedPrivacyIndex);
    if(!bSearching)
    {
        CheckAndUpdateBasedOnPrivacy();
        UpdateButtonsEnabled();        
    }
    else
    {
        ServerTypeButton.SetBool("enabled", false);
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

function ModeChanged(int Index)
{
    if(bIsSoloGame)
    {
        SavedSoloModeIndex = byte(Index);
        StartMenu.Manager.CachedProfile.SetProfileSettingValueInt(144, SavedSoloModeIndex);        
    }
    else
    {
        SavedModeIndex = byte(Index);
        StartMenu.Manager.CachedProfile.SetProfileSettingValueInt(148, SavedModeIndex);
    }
    ClampSavedFiltersToMode();
    InitializeGameOptions();
    SaveConfig();
}

function LengthChanged(int Index)
{
    if(bIsSoloGame)
    {
        SavedSoloLengthIndex = byte(Index);
        StartMenu.Manager.CachedProfile.SetProfileSettingValueInt(147, SavedSoloLengthIndex);        
    }
    else
    {
        SavedLengthIndex = byte(Index);
        StartMenu.Manager.CachedProfile.SetProfileSettingValueInt(151, SavedLengthIndex);
    }
    SaveConfig();
}

function DifficultyChanged(int Index)
{
    if(bIsSoloGame)
    {
        SavedSoloDifficultyIndex = byte(Index);
        StartMenu.Manager.CachedProfile.SetProfileSettingValueInt(146, SavedSoloDifficultyIndex);        
    }
    else
    {
        SavedDifficultyIndex = byte(Index);
        StartMenu.Manager.CachedProfile.SetProfileSettingValueInt(150, SavedDifficultyIndex);
    }
    SaveConfig();
}

function MapChanged(string MapName, optional bool bSave)
{
    bSave = true;
    if(bIsSoloGame)
    {
        SavedSoloMapString = MapName;
        StartMenu.Manager.CachedProfile.SetProfileSettingValue(145, SavedSoloMapString);        
    }
    else
    {
        SavedMapString = MapName;
        StartMenu.Manager.CachedProfile.SetProfileSettingValue(149, SavedMapString);
    }
    if(bSave)
    {
        SaveConfig();
    }
}

function PrivacyChanged(int Index, optional bool bSetText)
{
    if(Index != SavedPrivacyIndex)
    {
        SavedPrivacyIndex = byte(Index);
        SaveConfig();
        CheckAndUpdateBasedOnPrivacy();
        if(bSetText)
        {
            PrivacyButton.SetString("infoString", Class'KFCommon_LocalizedStrings'.static.GetPermissionStringsArray(Outer.GetPC().WorldInfo.IsConsoleBuild())[SavedInProgressIndex]);
        }
    }
}

function CheckAndUpdateBasedOnPrivacy()
{
    if(GetPartyPrivacy() == 0)
    {
        InProgressChanged(0, true);
        ServerTypeButton.SetBool("enabled", true);
        InProgressButton.SetBool("enabled", true);        
    }
    else
    {
        if(!Class'WorldInfo'.static.IsConsoleBuild())
        {
            InProgressChanged(2, true);
        }
        InProgressButton.SetBool("enabled", false);
    }
}

function ServerTypeChanged(int Index, optional bool bSetText)
{
    LogInternal("Server Type changed to" @ string(Index));
    ScriptTrace();
    if(Class'WorldInfo'.static.IsConsoleBuild())
    {
        RegionIndex = byte(Index);
        Class'GameEngine'.static.GetPlayfabInterface().SetIndexForCurrentRegion(RegionIndex);        
    }
    else
    {
        SavedServerTypeIndex = byte(Index);
        StartMenu.Manager.CachedProfile.SetProfileSettingValueInt(153, SavedServerTypeIndex);
        SaveConfig();
        if(bSetText)
        {
            ServerTypeButton.SetString("infoString", ServerTypeStrings[SavedServerTypeIndex]);
        }
    }
}

function InProgressChanged(int Index, optional bool bSetText)
{
    SavedInProgressIndex = byte(Index);
    StartMenu.Manager.CachedProfile.SetProfileSettingValueInt(154, SavedInProgressIndex);
    SaveConfig();
    if(SavedInProgressIndex == 2)
    {
        ServerTypeChanged(1, true);
        ServerTypeButton.SetBool("enabled", false);        
    }
    else
    {
        ServerTypeButton.SetBool("enabled", true);
    }
    if(bSetText)
    {
        InProgressButton.SetString("infoString", InProgessOptionStrings[SavedInProgressIndex]);
    }
}

function UpdateFilters()
{
    local GFxObject DataObject;

    DataObject = GetObject("options");
    ModeFilter = ((bIsSoloGame) ? SavedSoloModeIndex : SavedModeIndex);
    bModeFilterSet = ModeFilter < Class'KFCommon_LocalizedStrings'.static.GetGameModeStringsArray().Length;
    DifficultyFilter = ((bIsSoloGame) ? SavedSoloDifficultyIndex : SavedDifficultyIndex);
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
    ServerTypeFilter = SavedServerTypeIndex;
    bServerTypeFilterSet = LengthFilter < ServerTypeStrings.Length;
    InProgressFilter = SavedInProgressIndex;
    bInProgressFilterSet = SavedInProgressIndex == 0;
    PermissionsFilter = SavedPrivacyIndex;
    bPermissionsFilterSet = GetPartyPrivacy() != 0;
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

function bool GetMakeNewServer()
{
    return SavedInProgressIndex == 2;
}

function bool GetAllowInProgress()
{
    return bInProgressFilterSet;
}

private final function int HandleNoPref(int Index, bool bShowNoPref)
{
    if(bShowNoPref)
    {
        if(Index == 0)
        {
            return 127;            
        }
        else
        {
            return Index - 1;
        }        
    }
    else
    {
        return Index;
    }
}

function int GetModeIndex()
{
    if(bIsSoloGame)
    {
        return SavedSoloModeIndex;        
    }
    else
    {
        return SavedModeIndex;
    }
}

function int GetDifficultyIndex()
{
    if(bIsSoloGame)
    {
        return SavedSoloDifficultyIndex;        
    }
    else
    {
        return SavedDifficultyIndex;
    }
}

function int GetLengthIndex(optional int DefaultLength)
{
    DefaultLength = -1;
    if(bIsSoloGame)
    {
        return SavedSoloLengthIndex;        
    }
    else
    {
        if((bShowLengthNoPref && SavedLengthIndex == 0) && DefaultLength >= 0)
        {
            return DefaultLength;
        }
        return HandleNoPref(SavedLengthIndex, bShowLengthNoPref);
    }
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
    return SavedPrivacyIndex;
}

function string GetMapName()
{
    if(bIsSoloGame)
    {
        return SavedSoloMapString;        
    }
    else
    {
        return SavedMapString;
    }
}

event Engine.TWOnlineLobby.ELobbyVisibility GetPartyPrivacy()
{
    switch(SavedPrivacyIndex)
    {
        case 0:
            return 0;
        case 1:
            return 1;
        case 2:
        default:
            return 2;
            break;
    }
}

function byte GetServerTypeIndex()
{
    return byte(HandleNoPref(SavedServerTypeIndex, bShowServerTypeNoPref));
}

// Export UKFGFxStartGameContainer_Options::execDoesFilterMatchGameSettings(FFrame&, void* const)
native function bool DoesFilterMatchGameSettings(const KFOnlineGameSettings InGameSettings);

defaultproperties
{
    bShowLengthNoPref=true
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
    StandardServerString="Ranked - Stock"
    UnrankedServerString="Unranked"
    CustomServerString="Ranked - Custom"
    AllowInProgressString="Allow In Progress Games"
    NotStartedString="Not Started"
}