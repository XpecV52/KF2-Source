/*******************************************************************************
 * KFGFxMenu_PostGameReport generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxMenu_PostGameReport extends KFGFxObject_Menu within GFxMoviePlayer;

var const localized string MapVoteString;
var const localized string PlayerStatsString;
var const localized string TeamAwardsString;
var const localized string PostGameReportString;
var const localized string NextMapString;
var const localized string WaveString;
var const localized string XPString;
var const localized string VictoryString;
var const localized string DefeatString;
var const localized string ItemDropTitleString;
var KFGFxPostGameContainer_PlayerStats PlayerStatsContainer;
var KFGFxPostGameContainer_MapVote MapVoteContainer;
var KFGFxPostGameContainer_TeamAwards TeamAwardsContainer;
var KFGFxPostGameContainer_PlayerXP playerXPContainer;
var KFGFxHUD_ChatBoxWidget ChatBoxWidget;
var OnlineSubsystem OnlineSub;
var int LastNextMapTimeRemaining;
var array<KFPlayerReplicationInfo> CurrentPlayerList;
var array<KFPlayerReplicationInfo> TalkerPRIs;

function InitializeMenu(KFGFxMoviePlayer_Manager InManager)
{
    local KFGameReplicationInfo KFGRI;

    super.InitializeMenu(InManager);
    KFGRI = KFGameReplicationInfo(Outer.GetPC().WorldInfo.GRI);
    if(KFGRI != none)
    {
        KFGRI.ProcessChanceDrop();
    }
    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    OnlineSub.AddOnInventoryReadCompleteDelegate(SearchInventoryForNewItem);
    LocalizeText();
    SetPlayerInfo();
    SetSumarryInfo();
    InitPlayerList();
}

function OneSecondLoop()
{
    UpdateNextMapTime();
}

function LocalizeText()
{
    local GFxObject TextObject;
    local WorldInfo WI;

    WI = Class'WorldInfo'.static.GetWorldInfo();
    TextObject = Outer.CreateObject("Object");
    TextObject.SetString("nextMap", NextMapString);
    TextObject.SetString("mapVote", MapVoteString);
    TextObject.SetString("playerStats", PlayerStatsString);
    TextObject.SetString("xp", XPString);
    TextObject.SetString("teamAwards", TeamAwardsString);
    TextObject.SetString("dropTitle", ItemDropTitleString);
    if((WI != none) && WI.NetMode != NM_Standalone)
    {
        if(WI.GRI != none)
        {
            TextObject.SetString("serverName", WI.GRI.ServerName);
        }
        TextObject.SetString("serverIP", WI.GetAddressURL());
    }
    SetObject("localizedText", TextObject);
}

function SearchInventoryForNewItem()
{
    local int ItemIndex, InventoryIndex;
    local CurrentInventoryEntry TempInventoryDetailsHolder;
    local ItemProperties TempItemDetailsHolder;

    ItemIndex = -1;
    InventoryIndex = -1;
    if(OnlineSub == none)
    {
        return;
    }
    InventoryIndex = OnlineSub.CurrentInventory.Find('NewlyAdded', 1;
    if(InventoryIndex != -1)
    {
        TempInventoryDetailsHolder = OnlineSub.CurrentInventory[InventoryIndex];
        ItemIndex = OnlineSub.ItemPropertiesList.Find('Definition', TempInventoryDetailsHolder.Definition;
        if(ItemIndex != -1)
        {
            TempItemDetailsHolder = OnlineSub.ItemPropertiesList[ItemIndex];
            OnItemRecieved(TempItemDetailsHolder.Name, "img://" $ TempItemDetailsHolder.IconURL);
        }
    }
}

function OnItemRecieved(string ItemName, string IconPath)
{
    local GFxObject ItemObject;

    ItemObject = Outer.CreateObject("Object");
    ItemObject.SetString("itemName", ItemName);
    ItemObject.SetString("iconImage", IconPath);
    SetObject("itemDrop", ItemObject);
}

function SetSumarryInfo()
{
    local string GameDifficultyString, GameTypeString, CurrentMapName;
    local KFGameReplicationInfo KFGRI;
    local GFxObject TextObject;

    TextObject = Outer.CreateObject("Object");
    CurrentMapName = Outer.GetPC().WorldInfo.GetMapName();
    GameTypeString = Class'KFCommon_LocalizedStrings'.static.GetGameModeString(0);
    if(Outer.GetPC().WorldInfo.GRI != none)
    {
        KFGRI = KFGameReplicationInfo(Outer.GetPC().WorldInfo.GRI);
        GameDifficultyString = Class'KFCommon_LocalizedStrings'.static.GetDifficultyString(float(KFGRI.GameDifficulty));
        GameTypeString = Class'KFCommon_LocalizedStrings'.static.GetGameModeString(0);
        TextObject.SetString("mapName", CurrentMapName);
        TextObject.SetString("typeDifficulty", (GameTypeString @ "-") @ GameDifficultyString);
        TextObject.SetString("waveTime", ((((WaveString @ string(KFGRI.WaveNum)) $ "/") $ string(KFGRI.WaveMax - 1)) @ "-") @ (FormatTime(KFGRI.ElapsedTime)));
        TextObject.SetString("winLost", ((KFGRI.bMatchVictory) ? VictoryString : DefeatString));
    }
    SetObject("gameSummary", TextObject);
}

function SetPlayerInfo()
{
    local GFxObject TextObject;
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(Outer.GetPC());
    TextObject = Outer.CreateObject("Object");
    if(KFPC.PlayerReplicationInfo.GetTeamNum() != 255)
    {
        TextObject.SetString("playerName", KFPC.PlayerReplicationInfo.PlayerName);
        TextObject.SetString("perkIcon", "img://" $ KFPC.CurrentPerk.GetPerkIconPath());
        TextObject.SetString("perkName", KFPC.CurrentPerk.default.PerkName);
        TextObject.SetInt("perkLevel", KFPC.GetLevel());        
    }
    else
    {
        TextObject.SetString("playerName", KFPC.PlayerReplicationInfo.PlayerName);
        TextObject.SetString("perkIcon", "img://" $ PathName(Class'KFGFxWidget_PartyInGame_Versus'.default.ZedIConTexture));
        TextObject.SetString("perkName", Class'KFCommon_LocalizedStrings'.default.ZedString);
        TextObject.SetInt("perkLevel", 0);
    }
    SetObject("playerInfo", TextObject);
}

function InitPlayerList()
{
    local KFGameReplicationInfo KFGRI;

    KFGRI = KFGameReplicationInfo(Outer.GetPC().WorldInfo.GRI);
    if(KFGRI != none)
    {
        KFGRI.GetKFPRIArray(CurrentPlayerList);
    }
    SendVoipData();
}

function SendVoipData()
{
    local int I;
    local GFxObject DataProvider, TempObj;

    DataProvider = Outer.CreateArray();
    I = 0;
    J0x34:

    if(I < CurrentPlayerList.Length)
    {
        TempObj = Outer.CreateObject("Object");
        TempObj.SetString("label", CurrentPlayerList[I].PlayerName);
        TempObj.SetBool("bTalking", TalkerPRIs.Find(CurrentPlayerList[I] != -1);
        DataProvider.SetElementObject(I, TempObj);
        ++ I;
        goto J0x34;
    }
    SetObject("playerList", DataProvider);
}

function VOIPEventTriggered(PlayerReplicationInfo TalkerPRI, bool bIsTalking)
{
    local KFPlayerReplicationInfo KFPRI;

    KFPRI = KFPlayerReplicationInfo(TalkerPRI);
    if(KFPRI == none)
    {
        return;
    }
    if(!bIsTalking)
    {
        TalkerPRIs.RemoveItem(KFPRI;        
    }
    else
    {
        if(TalkerPRIs.Find(KFPRI != -1)
        {
            TalkerPRIs.RemoveItem(KFPRI;
        }
        if(!Outer.GetPC().IsPlayerMuted(KFPRI.UniqueId))
        {
            TalkerPRIs.AddItem(KFPRI;
        }
    }
    SendVoipData();
}

function UpdateNextMapTime()
{
    local int CurrentNextMapTimeRemaining;
    local KFGameReplicationInfo KFGRI;

    KFGRI = KFGameReplicationInfo(Outer.GetPC().WorldInfo.GRI);
    CurrentNextMapTimeRemaining = KFGRI.GetTraderTimeRemaining();
    if(LastNextMapTimeRemaining != CurrentNextMapTimeRemaining)
    {
        SetInt("remainingTime", CurrentNextMapTimeRemaining);
        LastNextMapTimeRemaining = CurrentNextMapTimeRemaining;
    }
}

function string FormatTime(int TimeInSeconds)
{
    local string TimeString;
    local int Minutes;

    Minutes = TimeInSeconds / 60;
    TimeInSeconds -= (Minutes * 60);
    TimeString = string(Minutes) $ ":";
    if(TimeInSeconds >= 10)
    {
        TimeString = TimeString $ string(TimeInSeconds);        
    }
    else
    {
        TimeString = (TimeString $ "0") $ string(TimeInSeconds);
    }
    return TimeString;
}

function OnOpen()
{
    if(OnlineSub != none)
    {
        OnlineSub.AddOnInventoryReadCompleteDelegate(SearchInventoryForNewItem);
    }
}

function OnClose()
{
    if(OnlineSub != none)
    {
        OnlineSub.ClearOnInventoryReadCompleteDelegate(SearchInventoryForNewItem);
    }
}

event bool WidgetInitialized(name WidgetName, name WidgetPath, GFxObject Widget)
{
    switch(WidgetName)
    {
        case 'PlayerStatsContainer':
            if(PlayerStatsContainer == none)
            {
                PlayerStatsContainer = KFGFxPostGameContainer_PlayerStats(Widget);
                PlayerStatsContainer.PlayerStatsString = PlayerStatsString;
                PlayerStatsContainer.Initialize(self);
            }
            break;
        case 'MapVoteContainer':
            if(MapVoteContainer == none)
            {
                MapVoteContainer = KFGFxPostGameContainer_MapVote(Widget);
                MapVoteContainer.MapVoteString = MapVoteString;
                MapVoteContainer.Initialize(self);
            }
            break;
        case 'TeamAwardsContainer':
            if(TeamAwardsContainer == none)
            {
                TeamAwardsContainer = KFGFxPostGameContainer_TeamAwards(Widget);
                TeamAwardsContainer.Initialize(self);
            }
            break;
        case 'playerXPContainer':
            if(playerXPContainer == none)
            {
                playerXPContainer = KFGFxPostGameContainer_PlayerXP(Widget);
                playerXPContainer.Initialize(self);
            }
            break;
        case 'ChatBoxWidget':
            if(ChatBoxWidget == none)
            {
                ChatBoxWidget = KFGFxHUD_ChatBoxWidget(Widget);
                ChatBoxWidget.SetLobbyChatVisible(true);
            }
            break;
        default:
            break;
    }
    return true;
}

function ReceiveMessage(string Message, optional string MessageColor)
{
    if(ChatBoxWidget != none)
    {
        if(MessageColor != "")
        {
            ChatBoxWidget.AddChatMessage(Message, MessageColor);            
        }
        else
        {
            ChatBoxWidget.AddChatMessage(Message, Class'KFLocalMessage'.default.SayColor);
        }
    }
}

function RecieveTopMaps(const out TopVotes VoteObject)
{
    if(MapVoteContainer != none)
    {
        MapVoteContainer.RecieveTopMaps(VoteObject);
    }
}

function StartCountdown(int CountdownTime, bool bFinalCountdown)
{
    ActionScriptVoid("startCountdown");
}

function Callback_BroadcastChatMessage(string Message)
{
    super.Callback_BroadcastChatMessage(Message);
}

function Callback_MapVote(int MapVoteIndex, bool bDoubleClick)
{
    local KFPlayerReplicationInfo KFPRI;

    KFPRI = KFPlayerReplicationInfo(Outer.GetPC().PlayerReplicationInfo);
    KFPRI.CastMapVote(MapVoteIndex, bDoubleClick);
}

defaultproperties
{
    MapVoteString="MAP VOTE"
    PlayerStatsString="PLAYER STATS"
    TeamAwardsString="AWARDS"
    PostGameReportString="POST GAME REPORT"
    NextMapString="Next map in:"
    WaveString="WAVE"
    XPString="XP"
    VictoryString="Victory"
    DefeatString="Defeat"
    ItemDropTitleString="NEW ITEM OBTAINED!"
    SubWidgetBindings=/* Array type was not detected. */
}