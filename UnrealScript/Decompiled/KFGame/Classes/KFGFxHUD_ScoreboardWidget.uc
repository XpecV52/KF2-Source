/*******************************************************************************
 * KFGFxHUD_ScoreboardWidget generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxHUD_ScoreboardWidget extends GFxObject within GFxMoviePlayer;

var bool bUpdateScoreboard;
var const float ScoreboardUpdateInterval;
var protected float LastScoreboardUpdateTime;
var KFGFxHUD_ScoreboardMapInfoContainer MatchInfoContainer;
var array<KFPlayerReplicationInfo> CurrentPlayerList;
var const localized string PlayerString;
var const localized string DoshString;
var const localized string KillsString;
var const localized string AssistsString;
var const localized string PingString;

function InitializeHUD()
{
    LocalizeText();
    UpdatePlayerList();
    UpdateMatchInfo();
    SendServerInfoToGFX();
}

function LocalizeText()
{
    local GFxObject LocalizedObject;

    LocalizedObject = Outer.CreateObject("Object");
    LocalizedObject.SetString("playerText", PlayerString);
    LocalizedObject.SetString("doshText", DoshString);
    LocalizedObject.SetString("killsText", KillsString);
    LocalizedObject.SetString("assistsText", AssistsString);
    LocalizedObject.SetString("pingText", PingString);
    SetObject("localizeText", LocalizedObject);
}

function SendServerInfoToGFX()
{
    local WorldInfo WI;
    local GFxObject ServerObject;

    WI = Class'WorldInfo'.static.GetWorldInfo();
    ServerObject = Outer.CreateObject("Object");
    if((WI != none) && WI.NetMode != NM_Standalone)
    {
        if(WI.GRI != none)
        {
            ServerObject.SetString("serverName", WI.GRI.ServerName);
        }
        ServerObject.SetString("serverIP", WI.GetAddressURL());
    }
    SetObject("serverInfo", ServerObject);
}

event bool WidgetInitialized(name WidgetName, name WidgetPath, GFxObject Widget)
{
    switch(WidgetName)
    {
        case 'ScoreboardMapInfo':
            if(MatchInfoContainer == none)
            {
                MatchInfoContainer = KFGFxHUD_ScoreboardMapInfoContainer(Widget);
                MatchInfoContainer.InitializeHUD();
            }
            break;
        default:
            break;
    }
    return true;
}

function TickHud(float DeltaTime)
{
    if((bUpdateScoreboard && Outer.GetPC() != none) && (Outer.GetPC().WorldInfo.TimeSeconds - LastScoreboardUpdateTime) > ScoreboardUpdateInterval)
    {
        LastScoreboardUpdateTime = Outer.GetPC().WorldInfo.TimeSeconds;
        UpdatePlayerList();
        UpdateMatchInfo();
        SendServerInfoToGFX();
    }
}

function SetOpen(bool bOpen)
{
    SetBool("showScore", bOpen);
}

function UpdateMatchInfo()
{
    if(MatchInfoContainer != none)
    {
        MatchInfoContainer.UpdateMatchInfo();
    }
}

function UpdatePlayerList()
{
    local KFGameReplicationInfo KFGRI;

    KFGRI = KFGameReplicationInfo(Outer.GetPC().WorldInfo.GRI);
    if(KFGRI != none)
    {
        KFGRI.GetKFPRIArray(CurrentPlayerList);
        SortPlayerList(CurrentPlayerList);
        UpdatePlayerData();
    }
}

function SortPlayerList(out array<KFPlayerReplicationInfo> PlayerList)
{
    local int I, J, HighestScore, HighestScoreIndex;
    local KFPlayerReplicationInfo TempPRI;

    I = 0;
    J0x0B:

    if(I < PlayerList.Length)
    {
        HighestScore = -1000000000;
        J = I;
        J0x45:

        if(J < PlayerList.Length)
        {
            if(PlayerList[J].Kills > HighestScore)
            {
                HighestScore = PlayerList[J].Kills;
                HighestScoreIndex = J;                
            }
            else
            {
                if(PlayerList[J].Kills == HighestScore)
                {
                    if(PlayerList[J].Assists > PlayerList[HighestScoreIndex].Assists)
                    {
                        HighestScore = PlayerList[J].Kills;
                        HighestScoreIndex = J;
                    }
                }
            }
            ++ J;
            goto J0x45;
        }
        TempPRI = PlayerList[I];
        PlayerList[I] = PlayerList[HighestScoreIndex];
        PlayerList[HighestScoreIndex] = TempPRI;
        ++ I;
        goto J0x0B;
    }
}

function UpdatePlayerData()
{
    local GFxObject DataProvider, TempData;
    local int I;
    local KFPlayerReplicationInfo KFPRI;
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(Outer.GetPC());
    DataProvider = Outer.CreateArray();
    I = 0;
    J0x66:

    if(I < CurrentPlayerList.Length)
    {
        KFPRI = CurrentPlayerList[I];
        TempData = Outer.CreateObject("Object");
        TempData.SetString("playername", KFPRI.PlayerName);
        TempData.SetInt("dosh", int(KFPRI.Score));
        TempData.SetInt("assists", KFPRI.Assists);
        TempData.SetInt("kills", KFPRI.Kills);
        TempData.SetInt("ping", int(float(KFPRI.Ping) * 4));
        TempData.SetInt("perkLevel", KFPRI.GetActivePerkLevel());
        if(KFPRI.CurrentPerkClass != none)
        {
            TempData.SetString("perkName", KFPRI.CurrentPerkClass.default.PerkName);
            TempData.SetString("iconPath", "img://" $ KFPRI.CurrentPerkClass.static.GetPerkIconPath());
        }
        TempData.SetString("avatar", KFPC.GetSteamAvatar(KFPRI.UniqueId));
        TempData.SetFloat("health", float(KFPRI.PlayerHealth));
        if(float(KFPRI.PlayerHealthMax) != float(0))
        {
            TempData.SetFloat("healthPercent", (float(KFPRI.PlayerHealth) / float(KFPRI.PlayerHealthMax)) * float(100));
        }
        DataProvider.SetElementObject(I, TempData);
        ++ I;
        goto J0x66;
    }
    SetObject("playerData", DataProvider);
}

defaultproperties
{
    ScoreboardUpdateInterval=1
    PlayerString="PLAYER"
    DoshString="DOSH"
    KillsString="KILLS"
    AssistsString="ASSISTS"
    PingString="PING"
    SubWidgetBindings=/* Array type was not detected. */
}