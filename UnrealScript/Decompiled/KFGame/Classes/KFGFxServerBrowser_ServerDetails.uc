/*******************************************************************************
 * KFGFxServerBrowser_ServerDetails generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxServerBrowser_ServerDetails extends KFGFxObject_Container within GFxMoviePlayer;

var KFGFxMenu_ServerBrowser ServerMenu;
var const localized string MutatorsString;
var const localized string ServerInfoString;
var const localized string JoinGameString;
var const localized string SpectateGameString;
var const localized string UnfavoriteString;

function Initialize(KFGFxObject_Menu NewParentMenu)
{
    super.Initialize(NewParentMenu);
    ServerMenu = KFGFxMenu_ServerBrowser(NewParentMenu);
    LocalizeText();
}

function LocalizeText()
{
    local GFxObject LocalizedObject;

    LocalizedObject = Outer.CreateObject("Object");
    LocalizedObject.SetString("wave", ServerMenu.WaveString);
    LocalizedObject.SetString("players", ServerMenu.PlayersString);
    LocalizedObject.SetString("zedCount", ServerMenu.ZedCountString);
    LocalizedObject.SetString("ranked", ServerMenu.RankedString);
    LocalizedObject.SetString("unranked", ServerMenu.UnrankedString);
    LocalizedObject.SetString("serverInfo", ServerInfoString);
    LocalizedObject.SetString("vacSecure", ServerMenu.VACSecureString);
    LocalizedObject.SetString("favorite", ServerMenu.FavoriteString);
    LocalizedObject.SetString("unfavorite", UnfavoriteString);
    LocalizedObject.SetString("mutators", MutatorsString);
    LocalizedObject.SetString("joinGame", JoinGameString);
    LocalizedObject.SetString("spectateGame", SpectateGameString);
    SetObject("localizedText", LocalizedObject);
}

function bool GetFavoriteButtonActive()
{
    return GetBool("favoriteButtonSelected");
}

function SetFavoriteButtonActive(bool bActive)
{
    SetBool("favoriteButtonSelected", bActive);
}

function SetDetails(KFOnlineGameSettings ServerResult)
{
    local GFxObject TempObj;
    local int Ping, PlayerCount;
    local KFOnlineGameSettings TempOnlingGamesSettings;

    if(ServerResult != none)
    {
        TempOnlingGamesSettings = ServerResult;
        TempObj = Outer.CreateObject("Object");
        TempObj.SetString("serverName", TempOnlingGamesSettings.OwningPlayerName);
        PlayerCount = TempOnlingGamesSettings.NumPublicConnections - TempOnlingGamesSettings.NumOpenPublicConnections;
        if(PlayerCount < 0)
        {
            PlayerCount = 0;
        }
        TempObj.SetFloat("playerCount", float(PlayerCount));
        TempObj.SetFloat("maxPlayerCount", float(TempOnlingGamesSettings.NumPublicConnections));
        TempObj.SetFloat("waveCount", float(TempOnlingGamesSettings.CurrentWave));
        TempObj.SetFloat("maxWaveCount", float(TempOnlingGamesSettings.NumWaves));
        TempObj.SetFloat("zedCount", float(TempOnlingGamesSettings.ZedCount));
        TempObj.SetFloat("maxZedCount", float(TempOnlingGamesSettings.MaxZedCount));
        TempObj.SetBool("vacEnable", TempOnlingGamesSettings.bAntiCheatProtected);
        TempObj.SetBool("mutators", TempOnlingGamesSettings.bMutators);
        TempObj.SetBool("ranked", TempOnlingGamesSettings.bUsesStats);
        Ping = TempOnlingGamesSettings.PingInMs;
        TempObj.SetString("ping", ((Ping < 0) ? "-" : string(Ping)));
        TempObj.SetString("difficulty", Class'KFCommon_LocalizedStrings'.static.GetDifficultyString(float(TempOnlingGamesSettings.Difficulty)));
        TempObj.SetString("mode", Class'KFCommon_LocalizedStrings'.static.GetGameModeString(TempOnlingGamesSettings.Mode));
        TempObj.SetString("map", TempOnlingGamesSettings.MapName);
        TempObj.SetString("mapImagePath", GetMapSource(TempOnlingGamesSettings.MapName));
        TempObj.SetString("gameStatus", string(TempOnlingGamesSettings.GameState));
        TempObj.SetObject("playersData", CreatePlayerListGFXObject(TempOnlingGamesSettings));
        SetObject("serverDetails", TempObj);        
    }
    else
    {
        LogInternal("NO GAME SEARCH HAS BEEN FOUND!");
    }
}

function GFxObject CreatePlayerListGFXObject(OnlineGameSettings Settings)
{
    local GFxObject PlayerDataProvider, DataObj;
    local byte I;

    PlayerDataProvider = Outer.CreateArray();
    I = 0;
    J0x35:

    if(I < Settings.PlayersInGame.Length)
    {
        DataObj = Outer.CreateObject("Object");
        DataObj.SetString("playerName", Settings.PlayersInGame[I].PlayerName);
        DataObj.SetString("playTime", "Time: " $ string(Settings.PlayersInGame[I].TimePlayed));
        DataObj.SetString("playerPing", "$" $ string(Settings.PlayersInGame[I].Score));
        DataObj.SetString("killCountText", "");
        PlayerDataProvider.SetElementObject(I, DataObj);
        ++ I;
        goto J0x35;
    }
    return PlayerDataProvider;
}

function UpdatePlayerList(out OnlineGameSettings Settings)
{
    SetObject("playersData", CreatePlayerListGFXObject(Settings));
}

function string GetMapSource(string MapName)
{
    local KFMapSummary MapData;

    MapData = Class'KFUIDataStore_GameResource'.static.GetMapSummaryFromMapName(MapName);
    if(MapData != none)
    {
        return "img://" $ MapData.ScreenshotPathName;        
    }
    else
    {
        MapData = Class'KFUIDataStore_GameResource'.static.GetMapSummaryFromMapName("KF-Default");
        if(MapData != none)
        {
            return "img://" $ MapData.ScreenshotPathName;
        }
    }
}

defaultproperties
{
    MutatorsString="MUTATORS"
    ServerInfoString="SERVER INFO"
    JoinGameString="JOIN GAME"
    SpectateGameString="SPECTATE"
    UnfavoriteString="UNFAVORITE"
}