/*******************************************************************************
 * KFGFxStartContainer_InGameOverview generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxStartContainer_InGameOverview extends KFGFxObject_Container within GFxMoviePlayer;

var KFGFxMenu_StartGame StartMenu;
var byte LastDifficultyIndex;
var byte LastLengthIndex;
var byte LastPrivacyIndex;
var const localized string OverviewString;
var const localized string ChangeString;
var const localized string SharedByString;
var const localized string SharedContentString;
var GFxObject SharedContentButton;
var GFxObject ServerWelcomeScreen;
var bool bContentShared;
var KFHTTPImageDownloader ImageDownLoader;

function Initialize(KFGFxObject_Menu NewParentMenu)
{
    StartMenu = KFGFxMenu_StartGame(NewParentMenu);
    ServerWelcomeScreen = GetObject("serverWelcomeScreen");
    LocalizeContainer();
    UpdateOverviewInGame();
    SharedContentButton = GetObject("sharedContentButton");
    if(SharedContentButton != none)
    {
        SharedContentButton.SetVisible(Outer.GetPC().WorldInfo.NetMode != NM_Standalone);
    }
    UpdateSharedContent();
    if(!Class'WorldInfo'.static.IsE3Build())
    {
        ShowWelcomeScreen();
    }
}

function LocalizeContainer()
{
    local byte I;
    local GFxObject DataProvider, TempObj, LocalizedObject;
    local WorldInfo WI;

    LocalizedObject = Outer.CreateObject("Object");
    LocalizedObject.SetString("header", OverviewString);
    LocalizedObject.SetString("gameModeTitle", StartMenu.GameModeTitle);
    LocalizedObject.SetString("mapTitle", StartMenu.MapTitle);
    LocalizedObject.SetString("infoTitle", StartMenu.InfoTitle);
    LocalizedObject.SetString("permissionsTitle", StartMenu.PermissionsTitle);
    WI = Class'WorldInfo'.static.GetWorldInfo();
    if((WI != none) && WI.NetMode != NM_Standalone)
    {
        LocalizedObject.SetString("serverTitle", StartMenu.ServerTypeString);
    }
    LocalizedObject.SetString("difficultyTitle", StartMenu.DifficultyTitle);
    LocalizedObject.SetString("lengthTitle", StartMenu.LengthTitle);
    LocalizedObject.SetString("changeString", ChangeString);
    LocalizedObject.SetString("confirm", Class'KFCommon_LocalizedStrings'.default.ConfirmString);
    LocalizedObject.SetString("sharedContent", SharedContentString);
    DataProvider = Outer.CreateArray();
    I = 0;
    J0x3C5:

    if(I < Class'KFCommon_LocalizedStrings'.static.GetPermissionStringsArray().Length)
    {
        TempObj = Outer.CreateObject("Object");
        TempObj.SetString("label", Class'KFCommon_LocalizedStrings'.static.GetPermissionString(float(I)));
        DataProvider.SetElementObject(I, TempObj);
        ++ I;
        goto J0x3C5;
    }
    LocalizedObject.SetObject("permissionOptions", DataProvider);
    if(!Class'WorldInfo'.static.IsMenuLevel())
    {
        LocalizedObject.SetString("authorName", Outer.GetPC().WorldInfo.Author);
    }
    SetObject("localizedText", LocalizedObject);
    LocalizeWelcomeScreen();
}

function LocalizeWelcomeScreen()
{
    local GFxObject LocalizedObject;

    if(ServerWelcomeScreen == none)
    {
        return;
    }
    LocalizedObject = Outer.CreateObject("Object");
    LocalizedObject.SetString("confirm", Class'KFCommon_LocalizedStrings'.default.ConfirmString);
    ServerWelcomeScreen.SetObject("localizedText", LocalizedObject);
}

function ImageDownloadComplete(bool bWasSuccessful)
{
    if(bWasSuccessful)
    {
        ServerWelcomeScreen.SetString("banner", "Img://" $ PathName(ImageDownLoader.TheTexture));
        ServerWelcomeScreen.ActionScriptVoid("openContainer");        
    }
}

function ShowWelcomeScreen()
{
    local KFGameReplicationInfo KFGRI;
    local WorldInfo WI;

    if(ServerWelcomeScreen == none)
    {
        return;
    }
    WI = Class'WorldInfo'.static.GetWorldInfo();
    if((WI != none) && WI.NetMode != NM_Client)
    {
        LogInternal("WI: " @ string(WI));
        LogInternal("WI.NetMode: " @ string(WI.NetMode));
        return;
    }
    KFGRI = KFGameReplicationInfo(Outer.GetPC().WorldInfo.GRI);
    if(KFGRI == none)
    {
        return;
    }
    if((KFGRI.ServerAdInfo.BannerLink != "") && KFGRI.ServerAdInfo.ServerMOTD != "")
    {
        ImageDownLoader = new (Outer) Class'KFHTTPImageDownloader';
        ImageDownLoader.DownloadImageFromURL(KFGRI.ServerAdInfo.BannerLink, ImageDownloadComplete);
        ServerWelcomeScreen.SetString("messageOfTheDay", KFGRI.ServerAdInfo.ServerMOTD);
        ServerWelcomeScreen.SetString("serverName", WI.GRI.ServerName);
        ServerWelcomeScreen.SetString("serverIP", KFGRI.ServerAdInfo.WebsiteLink);
    }
}

function UpdateSharedContent()
{
    local GFxObject DataProvider, TempWeaponObj;
    local int I, J, ItemCount;
    local class<KFUnlockManager> UnlockManagerClass;
    local string PlayerNameList;
    local KFGameReplicationInfo KFGRI;
    local array<PlayerReplicationInfo> WeaponSharedList;
    local bool bContentPreviouslyShared;

    if(Class'WorldInfo'.static.IsMenuLevel())
    {
        return;
    }
    bContentPreviouslyShared = bContentShared;
    KFGRI = KFGameReplicationInfo(Outer.GetPC().WorldInfo.GRI);
    if(KFGRI == none)
    {
        return;
    }
    ItemCount = 0;
    UnlockManagerClass = Class'KFUnlockManager';
    DataProvider = Outer.CreateArray();
    I = 0;
    J0xF9:

    if(I < UnlockManagerClass.default.SharedContentList.Length)
    {
        if(Class'KFUnlockManager'.static.IsSharedContentUnlocked(byte(I)))
        {
            bContentShared = true;
            TempWeaponObj = Outer.CreateObject("Object");
            TempWeaponObj.SetString("label", Localize(string(UnlockManagerClass.default.SharedContentList[I].Name), "ItemName", "KFGameContent"));
            TempWeaponObj.SetString("sourceText", Localize(string(UnlockManagerClass.default.SharedContentList[I].Name), "SharedUnlockSource", "KFGameContent"));
            TempWeaponObj.SetString("iconPath", "img://" $ UnlockManagerClass.default.SharedContentList[I].IconPath);
            UnlockManagerClass.static.GetSharedContentPlayerList(byte(I), WeaponSharedList);
            J = 0;
            J0x35C:

            if(J < WeaponSharedList.Length)
            {
                if(J == 0)
                {
                    PlayerNameList = SharedByString @ WeaponSharedList[J].PlayerName;                    
                }
                else
                {
                    PlayerNameList = (PlayerNameList $ ",") @ WeaponSharedList[J].PlayerName;
                }
                ++ J;
                goto J0x35C;
            }
            TempWeaponObj.SetString("names", PlayerNameList);
            DataProvider.SetElementObject(ItemCount, TempWeaponObj);
            ++ ItemCount;
        }
        ++ I;
        goto J0xF9;
    }
    SetObject("sharedContent", DataProvider);
    if(SharedContentButton != none)
    {
        if(bContentShared != bContentPreviouslyShared)
        {
            SharedContentButton.SetBool("enabled", bContentShared);
        }
    }
}

function GetKFPRIArray(out array<KFPlayerReplicationInfo> KFPRIArray)
{
    local PlayerController PC;
    local KFGameReplicationInfo KFGRI;

    PC = Outer.GetPC();
    if(((PC == none) || PC.WorldInfo == none) || PC.WorldInfo.GRI == none)
    {
        return;
    }
    KFGRI = KFGameReplicationInfo(Outer.GetPC().WorldInfo.GRI);
    if(KFGRI != none)
    {
        KFGRI.GetKFPRIArray(KFPRIArray);
    }
}

function UpdateGameMode(string Mode)
{
    SetString("gameMode", Mode);
}

function UpdateMap(string MapName, string MapSource)
{
    ActionScriptVoid("updateMap");
}

function UpdateDifficulty(string Difficulty)
{
    SetString("difficultyText", Difficulty);
}

function UpdateLength(string Length)
{
    SetString("lengthText", Length);
}

function UpdateServerType(string ServerType)
{
    local WorldInfo WI;

    WI = Class'WorldInfo'.static.GetWorldInfo();
    if((WI != none) && WI.NetMode != NM_Standalone)
    {
        SetString("serverType", ServerType);
    }
}

function UpdatePrivacy(string Privacy)
{
    SetString("permissionsText", Privacy);
}

function UpdateOverviewInGame()
{
    local KFGameReplicationInfo KFGRI;
    local string GameDifficultyString;
    local float CurrentGameDifficulty;
    local int CurrentLengthIndex, CurrentPrivacyIndex;

    KFGRI = KFGameReplicationInfo(Outer.GetPC().WorldInfo.GRI);
    if(KFGRI != none)
    {
        SetCurrentMapInfo();
        UpdateGameMode(KFGRI.GameClass.default.GameName);
        CurrentGameDifficulty = float(KFGRI.GameDifficulty);
        if(float(LastDifficultyIndex) != CurrentGameDifficulty)
        {
            GameDifficultyString = Class'KFCommon_LocalizedStrings'.static.GetDifficultyString(CurrentGameDifficulty);
            UpdateDifficulty(GameDifficultyString);
            LastDifficultyIndex = byte(CurrentGameDifficulty);
        }
        CurrentLengthIndex = KFGRI.GameLength;
        if(LastLengthIndex != CurrentLengthIndex)
        {
            UpdateLength(Class'KFCommon_LocalizedStrings'.static.GetLengthString(float(CurrentLengthIndex)));
            LastLengthIndex = byte(CurrentLengthIndex);
        }
        UpdateServerType(Class'KFCommon_LocalizedStrings'.static.GetServerTypeString(float(int(KFGRI.bCustom))));
        if(StartMenu.OptionsComponent != none)
        {
            CurrentPrivacyIndex = StartMenu.OptionsComponent.SavedPrivacyIndex;
            if(LastPrivacyIndex != CurrentPrivacyIndex)
            {
                UpdatePrivacy(Class'KFCommon_LocalizedStrings'.static.GetPermissionString(float(CurrentPrivacyIndex)));
                LastPrivacyIndex = byte(CurrentPrivacyIndex);
            }
        }
    }
}

function SetCurrentMapInfo()
{
    local string CurrentMapName, FriendlyName, MapSource;

    CurrentMapName = Outer.GetPC().WorldInfo.GetMapName(true);
    MapSource = StartMenu.GetMapSource(CurrentMapName);
    FriendlyName = StartMenu.GetFriendlyMapName(CurrentMapName);
    UpdateMap(FriendlyName, MapSource);
}

defaultproperties
{
    LastDifficultyIndex=255
    LastLengthIndex=255
    LastPrivacyIndex=255
    OverviewString="MATCH OVERVIEW"
    ChangeString="CHANGE"
    SharedByString="Shared by:"
    SharedContentString="SHARED CONTENT"
}