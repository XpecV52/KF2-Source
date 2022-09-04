/*******************************************************************************
 * KFSeasonalEventStats_Summer2019 generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFSeasonalEventStats_Summer2019 extends KFSeasonalEventStats within KFOnlineStatsWrite;

var private const transient int EndlessWaveRequired;

private final event Initialize(string MapName)
{
    local string CapsMapName;

    CapsMapName = Caps(MapName);
    bObjectiveIsValidForMap[0] = 0;
    bObjectiveIsValidForMap[1] = 0;
    bObjectiveIsValidForMap[2] = 0;
    bObjectiveIsValidForMap[3] = 0;
    bObjectiveIsValidForMap[4] = 0;
    if(CapsMapName == "KF-STEAMFORTRESS")
    {
        bObjectiveIsValidForMap[0] = 1;
        bObjectiveIsValidForMap[1] = 1;
        bObjectiveIsValidForMap[2] = 1;        
    }
    else
    {
        if(CapsMapName == "KF-ZEDLANDING")
        {
            bObjectiveIsValidForMap[3] = 1;            
        }
        else
        {
            if(CapsMapName == "KF-OUTPOST")
            {
                bObjectiveIsValidForMap[4] = 1;
            }
        }
    }
}

private final event GrantEventItems()
{
    if((((Outer.IsEventObjectiveComplete(0) && Outer.IsEventObjectiveComplete(1)) && Outer.IsEventObjectiveComplete(2)) && Outer.IsEventObjectiveComplete(3)) && Outer.IsEventObjectiveComplete(4))
    {
        GrantEventItem(7439);
    }
}

simulated event OnGameWon(class<GameInfo> GameClass, int Difficulty, int GameLength, bool bCoop)
{
    if(bObjectiveIsValidForMap[0] != 0)
    {
        if((GameClass == Class'KFGameInfo_Objective') && float(Difficulty) >= 1)
        {
            FinishedObjective(2, 0);
        }
    }
    if(bObjectiveIsValidForMap[3] != 0)
    {
        if((GameClass == Class'KFGameInfo_Objective') && float(Difficulty) >= 1)
        {
            FinishedObjective(2, 3);
        }
    }
    if(bObjectiveIsValidForMap[4] != 0)
    {
        if((GameClass == Class'KFGameInfo_Objective') && float(Difficulty) >= 1)
        {
            FinishedObjective(2, 4);
        }
    }
    if(bObjectiveIsValidForMap[1] != 0)
    {
        if(GameClass == Class'KFGameInfo_WeeklySurvival')
        {
            FinishedObjective(2, 1);
        }
    }
}

simulated event OnWaveCompleted(class<GameInfo> GameClass, int Difficulty, int WaveNum)
{
    if(bObjectiveIsValidForMap[2] != 0)
    {
        if(((WaveNum >= EndlessWaveRequired) && GameClass == Class'KFGameInfo_Endless') && float(Difficulty) >= 1)
        {
            FinishedObjective(2, 2);
        }
    }
}

defaultproperties
{
    EndlessWaveRequired=15
}