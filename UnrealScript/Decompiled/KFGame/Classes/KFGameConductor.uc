/*******************************************************************************
 * KFGameConductor generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGameConductor extends Object within KFGameInfo;

var float PlayersHealthStatus;
var float PlayersAmmoStatus;
var float AggregatePlayersStatus;
var float ZedVisibleAverageLifespan;
var float TotalZedVisibleLifespan;
var int TotalZedsKilled;
var float CurrentWaveZedVisibleAverageLifeSpan;
var float CurrentWaveTotalZedVisibleLifeSpan;
var int CurrentWaveTotalZedsKilled;
var float RecentZedVisibleAverageLifeSpan;
var float RecentTotalZedVisibleLifeSpan;
var int RecentTotalZedsKilled;
var float RecentZedLifeSpanTotalTracker[10];
var float RecentZedKillTotalTracker[10];
var float AggregatePlayerSkill;
var float PlayersAverageAccuracy;
var float PlayersAverageHeadshotAccuracy;
var float AveragePlayerPerkRank;
/** The target perk range for each difficulty level */
var() Vector2D TargetPerkRankRange[4];
var float CurrentTargetPerkRank;
/** How much the spawn rate can be modified by difficulty based on perk rank and how well the team is doing */
var() Vector2D SpawnRateModificationRange[4];
/** Current spawn rate modification */
var() float CurrentSpawnRateModification;
/** How much the ai movement speed can be modified by difficulty based on perk rank and how well the team is doing */
var() Vector2D AIMovementSpeedModificationRange[4];
/** Current AI Movement speed modifier */
var() float CurrentAIMovementSpeedMod;

function HandleZedKill(float ZedVisibleTimeAlive)
{
    ++ TotalZedsKilled;
    TotalZedVisibleLifespan += ZedVisibleTimeAlive;
    ZedVisibleAverageLifespan = TotalZedVisibleLifespan / float(TotalZedsKilled);
    ++ CurrentWaveTotalZedsKilled;
    CurrentWaveTotalZedVisibleLifeSpan += ZedVisibleTimeAlive;
    CurrentWaveZedVisibleAverageLifeSpan = CurrentWaveTotalZedVisibleLifeSpan / float(CurrentWaveTotalZedsKilled);
    ++ RecentTotalZedsKilled;
    RecentTotalZedVisibleLifeSpan += ZedVisibleTimeAlive;
}

function ResetWaveStats()
{
    CurrentWaveTotalZedsKilled = 0;
    CurrentWaveTotalZedVisibleLifeSpan = 0;
    CurrentWaveZedVisibleAverageLifeSpan = 0;
}

function HandlePerkLevelsUpdated()
{
    local KFPlayerController KFPC;
    local KFPerk MyPerk;
    local int NumHumanTeamPlayers;
    local float TotalPerkRank;

    foreach Outer.WorldInfo.AllControllers(Class'KFPlayerController', KFPC)
    {
        if(KFPC.GetTeamNum() == 0)
        {
            MyPerk = KFPC.CurrentPerk;
            if(MyPerk != none)
            {
                ++ NumHumanTeamPlayers;
                TotalPerkRank += float(MyPerk.GetLevel());
            }
        }        
    }    
    if(NumHumanTeamPlayers > 0)
    {
        AveragePlayerPerkRank = TotalPerkRank / float(NumHumanTeamPlayers);
    }
}

function HandlePlayerChangedTeam()
{
    HandlePerkLevelsUpdated();
}

function TimerUpdate()
{
    UpdatePlayerAccuracyStats();
    UpdateZedLifespanStats();
    UpdatePlayersStatus();
    UpdatePlayersAggregateSkill();
}

function UpdatePlayersStatus()
{
    local Controller C;
    local KFPawn_Human KFP;
    local float TotalHealth, TotalAmmo, TotalMaxAmmo;
    local KFInventoryManager KFIM;
    local int I;
    local KFPlayerReplicationInfo KFPRI;
    local float NumHumanPlayers;

    foreach Outer.WorldInfo.AllControllers(Class'Controller', C)
    {
        if(C.GetTeamNum() == 0)
        {
            if(C.Pawn != none)
            {
                KFP = KFPawn_Human(C.Pawn);
                if((KFP != none) && KFPawn_Customization(KFP) == none)
                {
                    TotalHealth += (float(KFP.Health) / float(KFP.HealthMax));
                    NumHumanPlayers += 1;
                    KFIM = KFInventoryManager(KFP.InvManager);
                    if(KFIM != none)
                    {
                        TotalAmmo += KFIM.GetPrimaryAmmoPercentage();
                        TotalMaxAmmo += 1;
                    }
                }
                continue;
            }
            if(((C.PlayerReplicationInfo != none) && !C.PlayerReplicationInfo.bOnlySpectator) && !C.PlayerReplicationInfo.bWaitingPlayer)
            {
                KFPRI = KFPlayerReplicationInfo(C.PlayerReplicationInfo);
                if(KFPRI != none)
                {
                    TotalHealth += (ByteToFloat(KFPRI.PlayerHealth) / ByteToFloat(KFPRI.PlayerHealthMax));
                    NumHumanPlayers += 1;
                }
            }
        }        
    }    
    if(NumHumanPlayers > float(0))
    {
        PlayersHealthStatus = TotalHealth / NumHumanPlayers;        
    }
    else
    {
        PlayersHealthStatus = 0;
    }
    if(TotalMaxAmmo > float(0))
    {
        PlayersAmmoStatus = TotalAmmo / TotalMaxAmmo;        
    }
    else
    {
        PlayersAmmoStatus = 0;
    }
    AggregatePlayersStatus = (PlayersHealthStatus * 0.5) + (PlayersAmmoStatus * 0.5);
    I = 0;
    J0x3CF:

    if(I < (10 - 1))
    {
        Outer.MyKFGRI.PlayersHealthStatusTracker[I] = Outer.MyKFGRI.PlayersHealthStatusTracker[I + 1];
        Outer.MyKFGRI.PlayersAmmoStatusTracker[I] = Outer.MyKFGRI.PlayersAmmoStatusTracker[I + 1];
        Outer.MyKFGRI.AggregatePlayersStatusTracker[I] = Outer.MyKFGRI.AggregatePlayersStatusTracker[I + 1];
        ++ I;
        goto J0x3CF;
    }
    Outer.MyKFGRI.PlayersHealthStatusTracker[10 - 1] = PlayersHealthStatus;
    Outer.MyKFGRI.PlayersAmmoStatusTracker[10 - 1] = PlayersAmmoStatus;
    Outer.MyKFGRI.AggregatePlayersStatusTracker[10 - 1] = AggregatePlayersStatus;
}

function UpdatePlayersAggregateSkill()
{
    local int I;

    AggregatePlayerSkill = (PlayersAverageAccuracy * 0.25) + (PlayersAverageHeadshotAccuracy * 0.75);
    I = 0;
    J0x37:

    if(I < (10 - 1))
    {
        Outer.MyKFGRI.AggregatePlayerSkillTracker[I] = Outer.MyKFGRI.AggregatePlayerSkillTracker[I + 1];
        ++ I;
        goto J0x37;
    }
    Outer.MyKFGRI.AggregatePlayerSkillTracker[10 - 1] = AggregatePlayerSkill;
}

function UpdatePlayerAccuracyStats()
{
    local KFPlayerController KFPC;
    local int NumHumanTeamPlayers;
    local float TotalAccuracy, TotalHeadShotAccuracy;
    local int I;

    foreach Outer.WorldInfo.AllControllers(Class'KFPlayerController', KFPC)
    {
        if(KFPC.GetTeamNum() == 0)
        {
            ++ NumHumanTeamPlayers;
            if(KFPC.ShotsFired > 0)
            {
                TotalAccuracy += ((float(KFPC.ShotsHit) / float(KFPC.ShotsFired)) * 100);
                TotalHeadShotAccuracy += ((float(KFPC.ShotsHitHeadshot) / float(KFPC.ShotsFired)) * 100);
            }
        }        
    }    
    I = 0;
    J0x157:

    if(I < (10 - 1))
    {
        Outer.MyKFGRI.PlayerAccuracyTracker[I] = Outer.MyKFGRI.PlayerAccuracyTracker[I + 1];
        Outer.MyKFGRI.PlayerHeadshotAccuracyTracker[I] = Outer.MyKFGRI.PlayerHeadshotAccuracyTracker[I + 1];
        ++ I;
        goto J0x157;
    }
    if(NumHumanTeamPlayers > 0)
    {
        PlayersAverageAccuracy = TotalAccuracy / float(NumHumanTeamPlayers);
        PlayersAverageHeadshotAccuracy = TotalHeadShotAccuracy / float(NumHumanTeamPlayers);
        Outer.MyKFGRI.PlayerAccuracyTracker[10 - 1] = PlayersAverageAccuracy;
        Outer.MyKFGRI.PlayerHeadshotAccuracyTracker[10 - 1] = PlayersAverageHeadshotAccuracy;
    }
}

function UpdateZedLifespanStats()
{
    local int I;
    local float CurrentTotalLifeSpan;
    local int CurrentTotalKills;

    I = 0;
    J0x0B:

    if(I < (10 - 1))
    {
        CurrentTotalLifeSpan += RecentZedLifeSpanTotalTracker[I];
        CurrentTotalKills += int(RecentZedKillTotalTracker[I]);
        Outer.MyKFGRI.TotalZedLifeSpanAverageTracker[I] = Outer.MyKFGRI.TotalZedLifeSpanAverageTracker[I + 1];
        Outer.MyKFGRI.CurrentWaveZedLifeSpanAverageTracker[I] = Outer.MyKFGRI.CurrentWaveZedLifeSpanAverageTracker[I + 1];
        Outer.MyKFGRI.RecentZedLifeSpanAverageTracker[I] = Outer.MyKFGRI.RecentZedLifeSpanAverageTracker[I + 1];
        RecentZedKillTotalTracker[I] = RecentZedKillTotalTracker[I + 1];
        RecentZedLifeSpanTotalTracker[I] = RecentZedLifeSpanTotalTracker[I + 1];
        ++ I;
        goto J0x0B;
    }
    Outer.MyKFGRI.TotalZedLifeSpanAverageTracker[10 - 1] = ZedVisibleAverageLifespan;
    Outer.MyKFGRI.CurrentWaveZedLifeSpanAverageTracker[10 - 1] = CurrentWaveZedVisibleAverageLifeSpan;
    CurrentTotalLifeSpan += RecentTotalZedVisibleLifeSpan;
    CurrentTotalKills += RecentTotalZedsKilled;
    RecentZedLifeSpanTotalTracker[10 - 1] = RecentTotalZedVisibleLifeSpan;
    RecentZedKillTotalTracker[10 - 1] = float(RecentTotalZedsKilled);
    if(CurrentTotalKills > 0)
    {
        RecentZedVisibleAverageLifeSpan = CurrentTotalLifeSpan / float(CurrentTotalKills);
        Outer.MyKFGRI.RecentZedLifeSpanAverageTracker[10 - 1] = RecentZedVisibleAverageLifeSpan;        
    }
    else
    {
        RecentZedVisibleAverageLifeSpan = Outer.MyKFGRI.RecentZedLifeSpanAverageTracker[10 - 2] * 0.9;
        Outer.MyKFGRI.RecentZedLifeSpanAverageTracker[10 - 1] = RecentZedVisibleAverageLifeSpan;
    }
    RecentTotalZedVisibleLifeSpan = 0;
    RecentTotalZedsKilled = 0;
}

function EvaluateSpawnRateModification()
{
    local float RangePercent;

    if(WithinRange(TargetPerkRankRange[int(Outer.GameDifficulty)], AveragePlayerPerkRank))
    {
        RangePercent = GetRangePctByValue(TargetPerkRankRange[int(Outer.GameDifficulty)], AveragePlayerPerkRank);        
    }
    else
    {
        if(AveragePlayerPerkRank < TargetPerkRankRange[int(Outer.GameDifficulty)].X)
        {
            RangePercent = 0;            
        }
        else
        {
            RangePercent = 1;
        }
    }
    CurrentSpawnRateModification = GetRangeValueByPct(SpawnRateModificationRange[int(Outer.GameDifficulty)], RangePercent);
}

function EvaluateAIMovementSpeedModification()
{
    local float RangePercent, DifficultySpeedAdjustMod;

    if(WithinRange(TargetPerkRankRange[int(Outer.GameDifficulty)], AveragePlayerPerkRank))
    {
        RangePercent = GetRangePctByValue(TargetPerkRankRange[int(Outer.GameDifficulty)], AveragePlayerPerkRank);        
    }
    else
    {
        if(AveragePlayerPerkRank < TargetPerkRankRange[int(Outer.GameDifficulty)].X)
        {
            RangePercent = 0;            
        }
        else
        {
            RangePercent = 1;
        }
    }
    if(Outer.GameDifficulty <= float(0))
    {
        DifficultySpeedAdjustMod = (Outer.DifficultyInfo.Hard.MovementSpeedMod - Outer.DifficultyInfo.Normal.MovementSpeedMod) * 0.5;        
    }
    else
    {
        if(Outer.GameDifficulty <= float(1))
        {
            DifficultySpeedAdjustMod = (Outer.DifficultyInfo.Suicidal.MovementSpeedMod - Outer.DifficultyInfo.Hard.MovementSpeedMod) * 0.5;            
        }
        else
        {
            DifficultySpeedAdjustMod = (Outer.DifficultyInfo.HellOnEarth.MovementSpeedMod - Outer.DifficultyInfo.Suicidal.MovementSpeedMod) * 0.5;
        }
    }
    if(RangePercent < 0.5)
    {
        CurrentAIMovementSpeedMod = 1 - ((DifficultySpeedAdjustMod * (0.5 - RangePercent)) * 2);        
    }
    else
    {
        if(RangePercent > 0.5)
        {
            CurrentAIMovementSpeedMod = 1 + ((DifficultySpeedAdjustMod * (RangePercent - 0.5)) * 2);            
        }
        else
        {
            CurrentAIMovementSpeedMod = 1;
        }
    }
}

function bool WithinRange(Vector2D Range, float TestValue)
{
    if((TestValue >= Range.X) && TestValue <= Range.Y)
    {
        return true;
    }
    return false;
}

defaultproperties
{
    TargetPerkRankRange[0]=(X=0,Y=7)
    TargetPerkRankRange[1]=(X=0,Y=12)
    TargetPerkRankRange[2]=(X=12,Y=25)
    TargetPerkRankRange[3]=(X=25,Y=25)
    SpawnRateModificationRange[0]=(X=1.25,Y=0.75)
    SpawnRateModificationRange[1]=(X=1.25,Y=0.75)
    SpawnRateModificationRange[2]=(X=1.25,Y=0.75)
    SpawnRateModificationRange[3]=(X=1.25,Y=0.75)
    CurrentSpawnRateModification=1
    AIMovementSpeedModificationRange[0]=(X=0.75,Y=1.25)
    AIMovementSpeedModificationRange[1]=(X=0.75,Y=1.25)
    AIMovementSpeedModificationRange[2]=(X=0.75,Y=1.25)
    AIMovementSpeedModificationRange[3]=(X=0.75,Y=1.25)
    CurrentAIMovementSpeedMod=1
}