/*******************************************************************************
 * KFGFxPostRoundContainer_Team generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxPostRoundContainer_Team extends GFxObject within GFxMoviePlayer;

var const localized string TitleString;
var const localized string WavesCompleteString;
var const localized string BossDeadString;
var const localized string DeathsString;
var const localized string DamageString;
var const localized string TotalString;
var const localized string YourTeamString;
var const localized string OpponentsString;
var int TeamValue;
var int TeamID;

function Initialize()
{
    LocalizeText();
    CreateResultsForTeam();
}

function CreateResultsForTeam()
{
    local GFxObject DataObject;
    local KFGameReplicationInfo KFGRI;
    local sTeamScoreData TeamScoreDataPacket;

    KFGRI = KFGameReplicationInfo(Outer.GetPC().WorldInfo.GRI);
    TeamScoreDataPacket = KFTeamInfo_Human(KFGRI.Teams[TeamID]).TeamScoreDataPacket;
    DataObject = Outer.CreateObject("Object");
    if(TeamScoreDataPacket.WaveBonus != -1)
    {
        DataObject.SetInt("waveNum", TeamScoreDataPacket.WaveBonus);
        DataObject.SetInt("bossDeadNum", ((KFGRI.bMatchVictory) ? Class'KFGameInfo'.static.GetBossKillScore() : 0));
        DataObject.SetInt("deathNum", TeamScoreDataPacket.Deaths * Class'KFGameInfo'.default.POINTS_PENALTY_FOR_DEATH);
        DataObject.SetInt("damagNum", ((KFGRI.bMatchVictory) ? TeamScoreDataPacket.BossDamageTaken : 0));
        DataObject.SetInt("totalNum", TeamScoreDataPacket.RoundScore);
        DataObject.SetBool("bHasData", true);        
    }
    else
    {
        DataObject.SetBool("bHasData", false);
    }
    SetObject("data", DataObject);
}

function LocalizeText()
{
    local GFxObject TextObject;
    local string TeamNameString;
    local KFGameReplicationInfo KFGRI;

    KFGRI = KFGameReplicationInfo(Outer.GetPC().WorldInfo.GRI);
    TextObject = Outer.CreateObject("Object");
    TeamNameString = TitleString @ string(TeamValue);
    if(KFGRI.GetCurrentRoundNumber() == 1)
    {
        if(KFGRI.Teams[TeamID].TeamIndex != Outer.GetPC().PlayerReplicationInfo.GetTeamNum())
        {
            TeamNameString = TeamNameString $ YourTeamString;            
        }
        else
        {
            TeamNameString = TeamNameString $ OpponentsString;
        }        
    }
    else
    {
        if(KFGRI.GetCurrentRoundNumber() == 2)
        {
            if(KFGRI.Teams[TeamID].TeamIndex == Outer.GetPC().PlayerReplicationInfo.GetTeamNum())
            {
                TeamNameString = TeamNameString $ YourTeamString;                
            }
            else
            {
                TeamNameString = TeamNameString $ OpponentsString;
            }
        }
    }
    TextObject.SetString("title", TeamNameString);
    TextObject.SetString("wavesComp", WavesCompleteString);
    TextObject.SetString("bossDead", BossDeadString);
    TextObject.SetString("deaths", DeathsString);
    TextObject.SetString("damage", DamageString);
    TextObject.SetString("total", TotalString);
    SetObject("localizedText", TextObject);
}

defaultproperties
{
    TitleString="Round "
    WavesCompleteString="Waves Completed Bonus"
    BossDeadString="Boss Defeated"
    DeathsString="Player Deaths Penalty"
    DamageString="Damage From Boss Penalty"
    TotalString="TOTAL"
    YourTeamString=" (Your Team)"
    OpponentsString=" (Opponents)"
}