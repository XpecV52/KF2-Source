/*******************************************************************************
 * KFLocalMessage_Priority generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFLocalMessage_Priority extends KFLocalMessage;

enum EGameMessageType
{
    GMT_WaveStart,
    GMT_WaveEnd,
    GMT_MatchWon,
    GMT_MatchLost,
    GMT_ObjectiveStart,
    GMT_ObjectiveWon,
    GMT_ObjectiveLost,
    GMT_ObjEndPlayerNeeded,
    GMT_ObjEndTimeLimit,
    GMT_LevelUp,
    GMT_TierUnlocked,
    GMT_Died,
    GMT_ZedsWin,
    GMT_HumansWin,
    GMT_AttackHumanPlayers,
    GMT_NextRoundBegin,
    GMT_MAX
};

var const localized string WaveStartMessage;
var const localized string WaveEndMessage;
var const localized string GetToTraderMessage;
var const localized string YouLostMessage;
var const localized string YouWonMessage;
var const localized string SquadWipedOutMessage;
var const localized string SquadSurvivedMessage;
var const localized string ObjectiveStartMessage;
var const localized string ObjectiveWonMessage;
var const localized string ObjectiveLostMessage;
var const localized string ObjectiveEndedMessage;
var const localized string ObjNotEnoughPlayersMessage;
var const localized string ObjTimeRanOutMessage;
var const localized string HumansLoseMessage;
var const localized string HumansWinMessage;
var const localized string AttackHumanPlayersString;
var const localized string ZedGroupRegroupingString;
var const localized string NextRoundBeginString;
var const localized string PlayerCanChangePerksString;
var const localized string ZedWaitingForNextRoundString;

static function ClientReceive(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    local string MessageString, SecondaryMessageString;
    local KFGFxMoviePlayer_HUD MyGFxHUD;
    local KFGameReplicationInfo KFGRI;

    MessageString = GetMessageString(Switch, SecondaryMessageString, P.PlayerReplicationInfo.GetTeamNum());
    if((MessageString != "") && KFGFxHudWrapper(P.myHUD) != none)
    {
        MyGFxHUD = KFGFxHudWrapper(P.myHUD).HudMovie;
        if(MyGFxHUD != none)
        {
            MyGFxHUD.DisplayPriorityMessage(MessageString, SecondaryMessageString, int(GetMessageLifeTime(Switch)));
        }
    }
    switch(Switch)
    {
        case 0:
            Class'KFMusicStingerHelper'.static.PlayWaveStartStinger(P);
            break;
        case 1:
            Class'KFMusicStingerHelper'.static.PlayWaveCompletedStinger(P);
            break;
        case 2:
            KFGRI = KFGameReplicationInfo(P.WorldInfo.GRI);
            if(KFGRI != none)
            {
                KFGRI.bMatchVictory = true;
            }
            if(P.PlayerReplicationInfo.GetTeamNum() == 255)
            {
                Class'KFMusicStingerHelper'.static.PlayMatchLostStinger(P);                
            }
            else
            {
                Class'KFMusicStingerHelper'.static.PlayMatchWonStinger(P);
            }
            break;
        case 3:
            if(P.PlayerReplicationInfo.GetTeamNum() == 255)
            {
                Class'KFMusicStingerHelper'.static.PlayMatchWonStinger(P);                
            }
            else
            {
                Class'KFMusicStingerHelper'.static.PlayMatchLostStinger(P);
            }
            break;
        case 13:
            KFGRI = KFGameReplicationInfo(P.WorldInfo.GRI);
            if(KFGRI != none)
            {
                KFGRI.bMatchVictory = true;
            }
            if(P.PlayerReplicationInfo.GetTeamNum() == 255)
            {
                Class'KFMusicStingerHelper'.static.PlayRoundLostStinger(P);                
            }
            else
            {
                Class'KFMusicStingerHelper'.static.PlayRoundWonStinger(P);
            }
            break;
        case 12:
            if(P.PlayerReplicationInfo.GetTeamNum() == 255)
            {
                Class'KFMusicStingerHelper'.static.PlayRoundWonStinger(P);                
            }
            else
            {
                Class'KFMusicStingerHelper'.static.PlayRoundLostStinger(P);
            }
            break;
        case 9:
            Class'KFMusicStingerHelper'.static.PlayLevelUpStinger(P);
            break;
        case 10:
            Class'KFMusicStingerHelper'.static.PlayTierUnlockedStinger(P);
            break;
        case 5:
            Class'KFMusicStingerHelper'.static.PlayObjectiveWonStinger(P);
            break;
        case 6:
            Class'KFMusicStingerHelper'.static.PlayObjectiveLostStinger(P);
            break;
        case 11:
            Class'KFMusicStingerHelper'.static.PlayPlayerDiedStinger(P);
            break;
        default:
            break;
    }
}

static function string GetMessageString(int Switch, optional out string SecondaryString, optional byte TeamIndex)
{
    SecondaryString = "";
    switch(Switch)
    {
        case 13:
            SecondaryString = default.HumansWinMessage;
            if(TeamIndex == 255)
            {
                return default.YouLostMessage;                
            }
            else
            {
                return default.YouWonMessage;
            }
        case 12:
            SecondaryString = default.HumansLoseMessage;
            if(TeamIndex == 255)
            {
                return default.YouWonMessage;                
            }
            else
            {
                return default.YouLostMessage;
            }
        case 0:
            return default.WaveStartMessage;
        case 1:
            if(TeamIndex == 255)
            {
                return default.ZedGroupRegroupingString;                
            }
            else
            {
                SecondaryString = default.GetToTraderMessage;
                return default.WaveEndMessage;
            }
        case 2:
            SecondaryString = default.SquadSurvivedMessage;
            return default.YouWonMessage;
        case 3:
            SecondaryString = default.SquadWipedOutMessage;
            return default.YouLostMessage;
        case 4:
            return default.ObjectiveStartMessage;
        case 5:
            return default.ObjectiveWonMessage;
        case 6:
            return default.ObjectiveLostMessage;
        case 7:
            SecondaryString = default.ObjNotEnoughPlayersMessage;
            return default.ObjectiveEndedMessage;
        case 8:
            SecondaryString = default.ObjTimeRanOutMessage;
            return default.ObjectiveLostMessage;
        case 9:
            SecondaryString = "";
            return "";
        case 10:
            SecondaryString = "";
            return "";
        case 14:
            return default.AttackHumanPlayersString;
        case 15:
            if(TeamIndex == 255)
            {
                SecondaryString = default.ZedWaitingForNextRoundString;                
            }
            else
            {
                SecondaryString = default.PlayerCanChangePerksString;
                OpenPerkMenu();
            }
            return default.NextRoundBeginString;
        default:
            return "";
            break;
    }
}

static function OpenPerkMenu()
{
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(Class'WorldInfo'.static.GetWorldInfo().GetALocalPlayerController());
    if((KFPC != none) && KFPC.MyGFxManager != none)
    {
        LogInternal("OPEN PERK MENU CALLED DUE TO RECIEVE MESSAGE!!!");
        KFPC.MyGFxManager.OpenMenu(1, true);
    }
}

static function float GetMessageLifeTime(int Switch)
{
    switch(Switch)
    {
        case 0:
            return 5;
        case 1:
            return 4;
        case 4:
        case 5:
        case 6:
            return 3;
        case 9:
        case 10:
            return 0.01;
        case 2:
        case 3:
            return 0;
        case 14:
            return 2;
        case 15:
            return 5;
        default:
            return default.Lifetime;
            break;
    }
}

defaultproperties
{
    WaveStartMessage="W A V E  I N C O M I N G"
    WaveEndMessage="W A V E  C O M P L E T E"
    GetToTraderMessage="Get to the Trader Pod"
    YouLostMessage="D E F E A T"
    YouWonMessage="V I C T O R Y"
    SquadWipedOutMessage="Your squad was wiped out!"
    SquadSurvivedMessage="Your squad survived!"
    ObjectiveStartMessage="Objective Started!"
    ObjectiveWonMessage="Objective Won!"
    ObjectiveLostMessage="Objective Lost!"
    ObjectiveEndedMessage="Objective Ended!"
    ObjNotEnoughPlayersMessage="Not Enough Players!"
    ObjTimeRanOutMessage="Time Limit Reached!"
    HumansLoseMessage="Human squad wiped out!"
    HumansWinMessage="Human squad survived!"
    AttackHumanPlayersString="Attack the Human Players!"
    ZedGroupRegroupingString="Zed Horde regrouping!"
    NextRoundBeginString="N E X T  R O U N D"
    PlayerCanChangePerksString="Perk changes are allowed"
    ZedWaitingForNextRoundString="Zed Horde invasion imminent!"
}