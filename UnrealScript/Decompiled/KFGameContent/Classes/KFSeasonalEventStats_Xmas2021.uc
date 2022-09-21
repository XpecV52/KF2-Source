/*******************************************************************************
 * KFSeasonalEventStats_Xmas2021 generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFSeasonalEventStats_Xmas2021 extends KFSeasonalEventStats within KFOnlineStatsWrite;

var private int WeaponRequiredPrice;
var private const transient int DecapitationsRequired;
var private const transient int DoshRequired;
var private const transient int WeaponsRequired;
var private const transient int EndlessWaveRequired;

private final event Initialize(string MapName)
{
    local string CapsMapName;

    CapsMapName = Caps(MapName);
    bObjectiveIsValidForMap[0] = 1;
    bObjectiveIsValidForMap[1] = 0;
    bObjectiveIsValidForMap[2] = 0;
    bObjectiveIsValidForMap[3] = 0;
    bObjectiveIsValidForMap[4] = 0;
    if(CapsMapName == "KF-CARILLONHAMLET")
    {
        bObjectiveIsValidForMap[1] = 1;
        bObjectiveIsValidForMap[2] = 1;
        bObjectiveIsValidForMap[3] = 1;
        bObjectiveIsValidForMap[4] = 1;
    }
    SetSeasonalEventStatsMax(DecapitationsRequired, 0, DoshRequired, WeaponsRequired, 0);
}

private final event GrantEventItems()
{
    if((((Outer.IsEventObjectiveComplete(0) && Outer.IsEventObjectiveComplete(1)) && Outer.IsEventObjectiveComplete(2)) && Outer.IsEventObjectiveComplete(3)) && Outer.IsEventObjectiveComplete(4))
    {
        GrantEventItem(9177);
    }
}

simulated function OnZedKilledByHeadshot(class<KFPawn_Monster> MonsterClass, int Difficulty, class<DamageType> DT)
{
    local int ObjIdx;

    ObjIdx = 0;
    if(bObjectiveIsValidForMap[ObjIdx] != 0)
    {
        IncrementSeasonalEventStat(ObjIdx, 1);
        if(Outer.GetSeasonalEventStatValue(ObjIdx) >= DecapitationsRequired)
        {
            FinishedObjective(4, ObjIdx);
        }
    }
}

simulated event OnGameWon(class<GameInfo> GameClass, int Difficulty, int GameLength, bool bCoop)
{
    local int ObjIdx;

    ObjIdx = 1;
    if(bObjectiveIsValidForMap[ObjIdx] != 0)
    {
        if(GameClass == Class'KFGameInfo_WeeklySurvival')
        {
            FinishedObjective(4, ObjIdx);
        }
    }
}

simulated event OnWeaponPurchased(class<KFWeaponDefinition> WeaponDef, int Price)
{
    local int ObjIdx;

    ObjIdx = 3;
    if((bObjectiveIsValidForMap[ObjIdx] != 0) && Price >= WeaponRequiredPrice)
    {
        IncrementSeasonalEventStat(ObjIdx, 1);
        if(Outer.GetSeasonalEventStatValue(ObjIdx) >= WeaponsRequired)
        {
            FinishedObjective(4, ObjIdx);
        }
    }
}

simulated event OnWaveCompleted(class<GameInfo> GameClass, int Difficulty, int WaveNum)
{
    local int ObjIdx, TotalDoshEarned;

    ObjIdx = 2;
    if(bObjectiveIsValidForMap[ObjIdx] != 0)
    {
        TotalDoshEarned = Outer.MyKFPC.MatchStats.TotalDoshEarned + Outer.MyKFPC.MatchStats.GetDoshEarnedInWave();
        if(TotalDoshEarned > 0)
        {
            IncrementSeasonalEventStat(ObjIdx, TotalDoshEarned);
            if(Outer.GetSeasonalEventStatValue(ObjIdx) >= DoshRequired)
            {
                FinishedObjective(4, ObjIdx);
            }
        }
    }
    ObjIdx = 4;
    if(bObjectiveIsValidForMap[ObjIdx] != 0)
    {
        if(((WaveNum >= EndlessWaveRequired) && GameClass == Class'KFGameInfo_Endless') && float(Difficulty) >= 1)
        {
            FinishedObjective(4, ObjIdx);
        }
    }
}

defaultproperties
{
    WeaponRequiredPrice=1500
    DecapitationsRequired=1000
    DoshRequired=75000
    WeaponsRequired=20
    EndlessWaveRequired=15
}