/*******************************************************************************
 * KFGFxServerBrowser_Filters generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxServerBrowser_Filters extends KFGFxObject_Container within GFxMoviePlayer
    native(UI)
    config(UI);

enum EFilter_Key
{
    NO_PASSWORD,
    NO_MUTATORS,
    NOT_FULL,
    NOT_EMPTY,
    Custom,
    DEDICATED,
    IN_LOBBY,
    IN_PROGRESS,
    LIMIT_SERVER_RESULTS,
    FILTERS_MAX,
    EFilter_Key_MAX
};

var KFGFxMenu_ServerBrowser ServerMenu;
var const localized string NoPasswordString;
var const localized string NoMutatorsString;
var const localized string NotFullString;
var const localized string NotEmptyString;
var const localized string NoRankedStandardString;
var const localized string NoRankedCustomString;
var const localized string NoUnrankedString;
var const localized string DedicatedString;
var const localized string VACSecureString;
var const localized string InLobbyString;
var const localized string InProgressString;
var const localized string OnlyStockMapsString;
var const localized string OnlyCustomMapsString;
var const localized string LimitServerResultsString;
var array<string> FilterStrings;
var config bool bNoPassword;
var config bool bNoMutators;
var config bool bNotFull;
var config bool bNotEmpty;
var config bool bUsesStats;
var config bool bCustom;
var config bool bDedicated;
var config bool bVAC_Secure;
var config bool bInLobby;
var config bool bInProgress;
var config bool bOnlyStockMaps;
var config bool bOnlyCustomMaps;
var config bool bLimitServerResults;
var bool bNoPasswordPending;
var bool bNoMutatorsPending;
var bool bNotFullPending;
var bool bNotEmptyPending;
var bool bUsesStatsPending;
var bool bCustomPending;
var bool bDedicatedPending;
var bool bVAC_SecurePending;
var bool bInLobbyPending;
var bool bInProgressPending;
var bool bOnlyStockMapsPending;
var bool bOnlyCustomMapsPending;
var bool bLimitServerResultsPending;
var config byte SavedGameModeIndex;
var config byte SavedMapIndex;
var config byte SavedDifficultyIndex;
var config byte SavedLengthIndex;
var config byte SavedPingIndex;
var byte SavedGameModeIndexPending;
var byte SavedMapIndexPending;
var byte SavedDifficultyIndexPending;
var byte SavedLengthIndexPending;
var byte SavedPingIndexPending;
var transient string CachedMapName;
var transient string CachedModeName;
var transient int CachedDifficulty;
var transient int CachedLength;
var transient array<string> MapList;
var int NumDifficultyStrings;

function Initialize(KFGFxObject_Menu NewParentMenu)
{
    super.Initialize(NewParentMenu);
    ServerMenu = KFGFxMenu_ServerBrowser(NewParentMenu);
    if((SavedGameModeIndex < 0) || SavedGameModeIndex >= Class'KFGameInfo'.default.GameModes.Length)
    {
        SavedGameModeIndex = 255;
    }
    SavedGameModeIndexPending = SavedGameModeIndex;
    NumDifficultyStrings = Class'KFCommon_LocalizedStrings'.static.GetDifficultyStringsArray().Length;
    AdjustSavedFiltersToMode();
    ServerMenu.Manager.StartMenu.GetMapList(MapList);
    InitFiltersArray();
    LocalizeText();
    ClearPendingValues();
}

function int GetUsableGameMode(int ModeIndex)
{
    if((ModeIndex >= Class'KFGameInfo'.default.GameModes.Length) || ModeIndex < 0)
    {
        return 0;        
    }
    else
    {
        return ModeIndex;
    }
}

function AdjustSavedFiltersToMode()
{
    if(SavedDifficultyIndex >= Class'KFGameInfo'.default.GameModes[GetUsableGameMode(SavedGameModeIndex)].DifficultyLevels)
    {
        SavedDifficultyIndex = 255;
    }
    SavedDifficultyIndexPending = SavedDifficultyIndex;
    if(SavedLengthIndex >= Class'KFGameInfo'.default.GameModes[GetUsableGameMode(SavedGameModeIndex)].Lengths)
    {
        SavedLengthIndex = 255;
    }
    SavedLengthIndexPending = SavedLengthIndex;
}

// Export UKFGFxServerBrowser_Filters::execGetSelectedMap(FFrame&, void* const)
native exec function string GetSelectedMap();

// Export UKFGFxServerBrowser_Filters::execGetSelectedDifficulty(FFrame&, void* const)
native exec function int GetSelectedDifficulty();

// Export UKFGFxServerBrowser_Filters::execGetSelectedGameLength(FFrame&, void* const)
native exec function int GetSelectedGameLength();

function InitFiltersArray()
{
    FilterStrings[0] = NoPasswordString;
    FilterStrings[1] = NoMutatorsString;
    FilterStrings[2] = NotFullString;
    FilterStrings[3] = NotEmptyString;
    FilterStrings[4] = NoRankedCustomString;
    FilterStrings[5] = DedicatedString;
    FilterStrings[6] = InLobbyString;
    FilterStrings[7] = InProgressString;
    FilterStrings[8] = LimitServerResultsString @ string(Class'KFGFxServerBrowser_ServerList'.default.MaxSearchResults);
}

function LocalizeText()
{
    local GFxObject LocalizedObject;

    LocalizedObject = Outer.CreateObject("Object");
    LocalizedObject.SetString("back", ServerMenu.BackString);
    LocalizedObject.SetString("reset", ServerMenu.ResetString);
    LocalizedObject.SetString("apply", ServerMenu.ApplyString);
    LocalizedObject.SetString("filters", ServerMenu.FiltersString);
    LocalizedObject.SetString("gameMode", ServerMenu.GameModeString);
    LocalizedObject.SetString("map", ServerMenu.MapString);
    LocalizedObject.SetString("difficulty", ServerMenu.DifficultyString);
    LocalizedObject.SetString("length", ServerMenu.LengthString);
    LocalizedObject.SetString("ping", ServerMenu.PingString);
    SetObject("localizedText", LocalizedObject);
    CreateList("gameModeScrollingList", Class'KFCommon_LocalizedStrings'.static.GetGameModeStringsArray(), ((SavedGameModeIndex == 255) ? Class'KFGameInfo'.default.GameModes.Length : SavedGameModeIndex));
    CreateList("mapScrollingList", MapList, SavedMapIndex);
    SetModeMenus("difficultyScrollingList", "lengthScrollingList", SavedGameModeIndexPending);
    CreateList("pingScrollingList", ServerMenu.PingOptionStrings, SavedPingIndex);
    LocalizeCheckBoxes();
}

function LocalizeCheckBoxes()
{
    local byte I;
    local GFxObject FiltersArray, TempObject;

    FiltersArray = Outer.CreateArray();
    I = 0;
    J0x35:

    if(I < 9)
    {
        TempObject = Outer.CreateObject("Object");
        TempObject.SetString("label", FilterStrings[I]);
        TempObject.SetInt("key", I);
        TempObject.SetBool("selected", GetBoolByEFilter_Key(I));
        FiltersArray.SetElementObject(I, TempObject);
        ++ I;
        goto J0x35;
    }
    SetObject("filterLabels", FiltersArray);
}

function SetModeMenus(string DifficultyListString, string LengthListString, int ModeIndex)
{
    local int NewDifficultyIndex, NewLengthIndex, UseModeIndex;
    local GFxObject DifficultyDataProvider, LengthDataProvider;
    local int I;

    DifficultyDataProvider = GetObject(DifficultyListString).GetObject("dataProvider");
    LengthDataProvider = GetObject(LengthListString).GetObject("dataProvider");
    I = 0;
    J0x91:

    if(I < 5)
    {
        DifficultyDataProvider.SetElementObject(I, none);
        if(I < 4)
        {
            LengthDataProvider.SetElementObject(I, none);
        }
        ++ I;
        goto J0x91;
    }
    if(SavedDifficultyIndexPending >= Class'KFGameInfo'.default.GameModes[UseModeIndex].DifficultyLevels)
    {
        NewDifficultyIndex = 255;        
    }
    else
    {
        NewDifficultyIndex = SavedDifficultyIndexPending;
    }
    if(SavedLengthIndexPending >= Class'KFGameInfo'.default.GameModes[UseModeIndex].Lengths)
    {
        NewLengthIndex = 255;        
    }
    else
    {
        NewLengthIndex = SavedLengthIndexPending;
    }
    UseModeIndex = GetUsableGameMode(ModeIndex);
    CreateList(DifficultyListString, Class'KFCommon_LocalizedStrings'.static.GetDifficultyStringsArray(), NewDifficultyIndex, Class'KFGameInfo'.default.GameModes[UseModeIndex].DifficultyLevels);
    CreateList(LengthListString, Class'KFCommon_LocalizedStrings'.static.GetLengthStringsArray(), NewLengthIndex, Class'KFGameInfo'.default.GameModes[UseModeIndex].Lengths);
}

function CreateList(string ListString, array<string> TextArray, int SelectedIndex, optional int MaxListLength)
{
    local int I;
    local GFxObject OptionList, DataProvider, ItemSlot;
    local string TempString, ButtonLabel;
    local int ListLength;

    OptionList = GetObject(ListString);
    DataProvider = OptionList.GetObject("dataProvider");
    if(MaxListLength > 0)
    {
        ListLength = Min(MaxListLength, TextArray.Length);        
    }
    else
    {
        ListLength = TextArray.Length;
    }
    if(MaxListLength >= ListLength)
    {
        SelectedIndex = 255;
    }
    I = 0;
    J0xCA:

    if(I < ListLength)
    {
        ItemSlot = Outer.CreateObject("Object");
        TempString = TextArray[I];
        ItemSlot.SetString("label", TempString);
        DataProvider.SetElementObject(I, ItemSlot);
        ++ I;
        goto J0xCA;
    }
    ItemSlot = Outer.CreateObject("Object");
    ItemSlot.SetString("label", Class'KFCommon_LocalizedStrings'.default.NoPreferenceString);
    DataProvider.SetElementObject(I, ItemSlot);
    if(SelectedIndex != 255)
    {
        OptionList.SetInt("selectedIndex", SelectedIndex);
    }
    OptionList.SetObject("dataProvider", DataProvider);
    if(SelectedIndex < ListLength)
    {
        ButtonLabel = TextArray[SelectedIndex];        
    }
    else
    {
        ButtonLabel = "-";
    }
    OptionList.GetObject("associatedButton").SetString("label", ButtonLabel);
    OptionList.ActionScriptVoid("invalidateData");
}

function ModeChanged(int Index)
{
    if((Index >= 0) && Index < Class'KFGameInfo'.default.GameModes.Length)
    {
        SavedGameModeIndexPending = byte(Index);        
    }
    else
    {
        SavedGameModeIndexPending = 255;
    }
    AdjustSavedFiltersToMode();
    LocalizeText();
}

function MapChanged(int Index)
{
    SavedMapIndexPending = byte(Index);
}

function DifficultyChanged(int Index)
{
    SavedDifficultyIndexPending = byte(Index);
}

function LengthChanged(int Index)
{
    SavedLengthIndexPending = byte(Index);
}

function PingChanged(int Index)
{
    SavedPingIndexPending = byte(Index);
}

function ApplyFilters()
{
    bNoPassword = bNoPasswordPending;
    bNoMutators = bNoMutatorsPending;
    bNotFull = bNotFullPending;
    bNotEmpty = bNotEmptyPending;
    bCustom = bCustomPending;
    bDedicated = bDedicatedPending;
    bVAC_Secure = bVAC_SecurePending;
    bInLobby = bInLobbyPending;
    bInProgress = bInProgressPending;
    bOnlyStockMaps = bOnlyStockMapsPending;
    bOnlyCustomMaps = bOnlyCustomMapsPending;
    bLimitServerResults = bLimitServerResultsPending;
    SavedGameModeIndex = SavedGameModeIndexPending;
    SavedMapIndex = SavedMapIndexPending;
    SavedDifficultyIndex = SavedDifficultyIndexPending;
    SavedLengthIndex = SavedLengthIndexPending;
    SavedPingIndex = SavedPingIndexPending;
    SaveConfig();
}

function ClearPendingValues()
{
    bNoPasswordPending = bNoPassword;
    bNoMutatorsPending = bNoMutators;
    bNotFullPending = bNotFull;
    bNotEmptyPending = bNotEmpty;
    bUsesStatsPending = bUsesStats;
    bCustomPending = bCustom;
    bDedicatedPending = bDedicated;
    bVAC_SecurePending = bVAC_Secure;
    bInLobbyPending = bInLobby;
    bInProgressPending = bInProgress;
    bOnlyStockMapsPending = bOnlyStockMaps;
    bOnlyCustomMapsPending = bOnlyCustomMaps;
    bLimitServerResultsPending = bLimitServerResults;
    SavedGameModeIndexPending = SavedGameModeIndex;
    SavedMapIndexPending = SavedMapIndex;
    SavedDifficultyIndexPending = SavedDifficultyIndex;
    SavedLengthIndexPending = SavedLengthIndex;
    SavedPingIndexPending = SavedPingIndex;
}

function ResetFilters()
{
    bNoPassword = false;
    bNoMutators = false;
    bNotFull = false;
    bNotEmpty = false;
    bUsesStats = true;
    bCustom = true;
    bDedicated = false;
    bVAC_Secure = false;
    bInLobby = false;
    bInProgress = false;
    bOnlyStockMaps = false;
    bOnlyCustomMaps = false;
    bLimitServerResults = true;
    SavedGameModeIndex = 255;
    SavedMapIndex = 255;
    SavedDifficultyIndex = 255;
    SavedLengthIndex = 255;
    SavedPingIndex = 255;
    ClearPendingValues();
    SaveConfig();
    LocalizeCheckBoxes();
    LocalizeText();
}

function SetBoolByEFilter_Key(KFGFxServerBrowser_Filters.EFilter_Key Filter, bool FilterValue)
{
    switch(Filter)
    {
        case 0:
            bNoPasswordPending = FilterValue;
            break;
        case 1:
            bNoMutatorsPending = FilterValue;
            break;
        case 2:
            bNotFullPending = FilterValue;
            break;
        case 3:
            bNotEmptyPending = FilterValue;
            break;
        case 4:
            bCustomPending = !FilterValue;
            break;
        case 5:
            bDedicatedPending = FilterValue;
            break;
        case 6:
            bInLobbyPending = FilterValue;
            break;
        case 7:
            bInProgressPending = FilterValue;
            break;
        case 8:
            bLimitServerResultsPending = FilterValue;
            break;
        default:
            break;
    }
}

function bool GetBoolByEFilter_Key(KFGFxServerBrowser_Filters.EFilter_Key Filter)
{
    switch(Filter)
    {
        case 0:
            return bNoPassword;
        case 1:
            return bNoMutators;
        case 2:
            return bNotFull;
        case 3:
            return bNotEmpty;
        case 4:
            return bCustom;
        case 5:
            return bDedicated;
        case 6:
            return bInLobby;
        case 7:
            return bInProgress;
        case 8:
            return bLimitServerResults;
        default:
            break;
    }
}

defaultproperties
{
    NoPasswordString="NO PASSWORD"
    NoMutatorsString="NO MUTATORS"
    NotFullString="NOT FULL"
    NotEmptyString="NOT EMPTY"
    NoRankedCustomString="NO CUSTOM SERVERS"
    NoUnrankedString="NO UNRANKED SERVERS"
    DedicatedString="DEDICATED SERVER"
    VACSecureString="VAC SECURE"
    InLobbyString="IN LOBBY"
    InProgressString="IN PROGRESS"
    OnlyStockMapsString="ONLY STOCK MAPS"
    OnlyCustomMapsString="ONLY CUSTOM MAPS"
    LimitServerResultsString="LIMIT RESULTS:"
    bUsesStats=true
    bLimitServerResults=true
    SavedGameModeIndex=255
    SavedMapIndex=255
    SavedDifficultyIndex=255
    SavedLengthIndex=255
    SavedPingIndex=255
}