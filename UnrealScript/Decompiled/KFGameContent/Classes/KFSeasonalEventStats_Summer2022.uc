/*******************************************************************************
 * KFSeasonalEventStats_Summer2022 generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFSeasonalEventStats_Summer2022 extends KFSeasonalEventStats within KFOnlineStatsWrite;

var private const transient int ZedsKillRequired;
var private const transient int WavesRequired;
var private const transient int ZedsThrowSeaRequired;
var private const transient int EndlessWaveRequired;
var transient int LastWaveFinished;

private final event Initialize(string MapName)
{
    local string CapsMapName;

    CapsMapName = Caps(MapName);
    bObjectiveIsValidForMap[0] = 1;
    bObjectiveIsValidForMap[1] = 0;
    bObjectiveIsValidForMap[2] = 0;
    bObjectiveIsValidForMap[3] = 0;
    bObjectiveIsValidForMap[4] = 0;
    if(CapsMapName == "KF-RIG")
    {
        bObjectiveIsValidForMap[1] = 1;
        bObjectiveIsValidForMap[2] = 1;
        bObjectiveIsValidForMap[3] = 1;
        bObjectiveIsValidForMap[4] = 1;
    }
    SetSeasonalEventStatsMax(ZedsKillRequired, 0, WavesRequired, ZedsThrowSeaRequired, EndlessWaveRequired);
}

private final event GrantEventItems()
{
    if((((Outer.IsEventObjectiveComplete(0) && Outer.IsEventObjectiveComplete(1)) && Outer.IsEventObjectiveComplete(2)) && Outer.IsEventObjectiveComplete(3)) && Outer.IsEventObjectiveComplete(4))
    {
        GrantEventItem(9334);
    }
}

simulated event OnGameWon(class<GameInfo> GameClass, int Difficulty, int GameLength, bool bCoop)
{
    if(bObjectiveIsValidForMap[1] != 0)
    {
        if(GameClass == Class'KFGameInfo_WeeklySurvival')
        {
            FinishedObjective(2, 1);
        }
    }
}

simulated function OnZedKilled(class<KFPawn_Monster> MonsterClass, int Difficulty, class<DamageType> DT)
{
    local int ObjIdx;

    ObjIdx = 0;
    if(bObjectiveIsValidForMap[ObjIdx] != 0)
    {
        IncrementSeasonalEventStat(ObjIdx, 1);
        if(Outer.GetSeasonalEventStatValue(ObjIdx) >= ZedsKillRequired)
        {
            FinishedObjective(2, ObjIdx);
        }
    }
}

simulated function OnTriggerUsed(class<Trigger_PawnsOnly> TriggerClass)
{
    local int ObjIdx;

    ObjIdx = 3;
    if(bObjectiveIsValidForMap[ObjIdx] != 0)
    {
        if(TriggerClass == Class'KFSeaTrigger')
        {
            IncrementSeasonalEventStat(ObjIdx, 1);
            if(Outer.GetSeasonalEventStatValue(ObjIdx) >= ZedsThrowSeaRequired)
            {
                FinishedObjective(2, ObjIdx);
            }
        }
    }
}

simulated event OnWaveCompleted(class<GameInfo> GameClass, int Difficulty, int WaveNum)
{
    local int ObjIdx;
    local bool canIncreaseWave;

    canIncreaseWave = false;
    ObjIdx = 2;
    if(bObjectiveIsValidForMap[ObjIdx] != 0)
    {
        if(GameClass == Class'KFGameInfo_Endless')
        {
            if(LastWaveFinished != WaveNum)
            {
                canIncreaseWave = true;
                LastWaveFinished = WaveNum;
            }            
        }
        else
        {
            canIncreaseWave = true;
        }
        if(canIncreaseWave)
        {
            IncrementSeasonalEventStat(ObjIdx, 1);
        }
        if(Outer.GetSeasonalEventStatValue(ObjIdx) >= WavesRequired)
        {
            FinishedObjective(2, ObjIdx);
        }
    }
    ObjIdx = 4;
    if(bObjectiveIsValidForMap[ObjIdx] != 0)
    {
        if(((WaveNum >= EndlessWaveRequired) && GameClass == Class'KFGameInfo_Endless') && float(Difficulty) >= 1)
        {
            FinishedObjective(2, ObjIdx);
        }
    }
}

defaultproperties
{
    ZedsKillRequired=1500
    WavesRequired=100
    ZedsThrowSeaRequired=50
    EndlessWaveRequired=15
    LastWaveFinished=-1
}