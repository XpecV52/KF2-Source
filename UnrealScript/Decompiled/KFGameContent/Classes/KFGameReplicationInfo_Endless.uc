/*******************************************************************************
 * KFGameReplicationInfo_Endless generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGameReplicationInfo_Endless extends KFGameReplicationInfo
    config(Game)
    hidecategories(Navigation,Movement,Collision);

const BOSS_WAVE = 5;

var int CurrentWeeklyMode;
var int CurrentSpecialMode;

replication
{
     if(bNetDirty)
        CurrentSpecialMode, CurrentWeeklyMode;
}

simulated function bool IsFinalWave()
{
    return false;
}

simulated function bool IsBossWave()
{
    return (WaveNum > 0) && (WaveNum % 5) == 0;
}

simulated function bool IsBossWaveNext()
{
    return (WaveNum > 0) && ((WaveNum + 1) % 5) == 0;
}

simulated function bool IsSpecialWave(out int ModIndex)
{
    ModIndex = CurrentSpecialMode;
    return CurrentSpecialMode != -1;
}

simulated function bool IsWeeklyWave(out int ModIndex)
{
    if(CurrentWeeklyMode != -1)
    {
        ModIndex = Class'KFOutbreakEvent_Endless'.static.GetOutbreakId(CurrentWeeklyMode);
    }
    return CurrentWeeklyMode != -1;
}

simulated function WaveStarted()
{
    local int ModeIndex;

    ModeIndex = -1;
    if(CurrentSpecialMode != -1)
    {
        ModeIndex = CurrentSpecialMode;        
    }
    else
    {
        if(CurrentWeeklyMode != -1)
        {
            ModeIndex = Class'KFOutbreakEvent_Endless'.static.GetOutbreakId(CurrentWeeklyMode);
        }
    }
    Class'KFTraderDialogManager'.static.BroadcastEndlessStartWaveDialog(WaveNum, ModeIndex, WorldInfo);
}

defaultproperties
{
    CurrentWeeklyMode=-1
    CurrentSpecialMode=-1
    bEndlessMode=true
}