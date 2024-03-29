/*******************************************************************************
 * KFGFxHUD_ScoreboardVersusWidget generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxHUD_ScoreboardVersusWidget extends KFGFxHUD_ScoreboardWidget within GFxMoviePlayer;

var const localized string ScoreString;
var int AssistValue;
var int KillValue;
var int DamageValue;

function LocalizeText()
{
    local GFxObject LocalizedObject;

    LocalizedObject = Outer.CreateObject("Object");
    LocalizedObject.SetString("playerText", PlayerString);
    LocalizedObject.SetString("scoreText", ScoreString);
    LocalizedObject.SetString("killsText", KillsString);
    LocalizedObject.SetString("assistsText", AssistsString);
    LocalizedObject.SetString("pingText", PingString);
    SetObject("localizeText", LocalizedObject);
}

function TickHud(float DeltaTime)
{
    if((bUpdateScoreboard && Outer.GetPC() != none) && (Outer.GetPC().WorldInfo.TimeSeconds - LastScoreboardUpdateTime) > ScoreboardUpdateInterval)
    {
        LastScoreboardUpdateTime = Outer.GetPC().WorldInfo.TimeSeconds;
        UpdatePlayerList();
    }
}

function UpdatePlayerData()
{
    local GFxObject DataProvider, TempData;
    local int I;
    local KFPlayerReplicationInfo KFPRI;
    local KFPlayerController KFPC;
    local int PlayerIndex;

    KFPC = KFPlayerController(Outer.GetPC());
    PlayerIndex = 0;
    DataProvider = Outer.CreateArray();
    I = 0;
    J0x71:

    if(I < CurrentPlayerList.Length)
    {
        KFPRI = CurrentPlayerList[I];
        if(KFPRI.GetTeamNum() == 255)
        {
            TempData = Outer.CreateObject("Object");
            TempData.SetString("playername", KFPRI.PlayerName);
            TempData.SetInt("score", ((KFPRI.DamageDealtOnTeam * DamageValue) + (KFPRI.Kills * KillValue)) + (KFPRI.Assists * AssistValue));
            TempData.SetInt("assists", KFPRI.Assists);
            TempData.SetInt("kills", KFPRI.Kills);
            TempData.SetInt("ping", int(float(KFPRI.Ping) * 4));
            if(Class'WorldInfo'.static.IsConsoleBuild(8))
            {
                TempData.SetString("avatar", "img://" $ KFPC.GetPS4Avatar(KFPRI.PlayerName));                
            }
            else
            {
                TempData.SetString("avatar", "img://" $ KFPC.GetSteamAvatar(KFPRI.UniqueId));
            }
            if(KFPRI.PlayerHealth < 0)
            {
                TempData.SetFloat("health", 0);
                TempData.SetFloat("healthPercent", 0);                
            }
            else
            {
                TempData.SetFloat("health", float(KFPRI.PlayerHealth));
                TempData.SetFloat("healthPercent", ByteToFloat(KFPRI.PlayerHealthPercent) * float(100));
            }
            DataProvider.SetElementObject(PlayerIndex, TempData);
            ++ PlayerIndex;
        }
        ++ I;
        goto J0x71;
    }
    SetObject("playerData", DataProvider);
}

defaultproperties
{
    ScoreString="SCORE"
    AssistValue=40
    KillValue=100
    DamageValue=1
}