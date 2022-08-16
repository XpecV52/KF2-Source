//=============================================================================
// KFGameConductor
//=============================================================================
// Game conductor which dynamically manages the difficulty and fun of the game
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================
class KFGameConductor extends Object within KFGameInfo
	config(Game);

/*********************************************************************************************
 * @name Player Status
********************************************************************************************* */

/** Represents the health status of all the human team players on the server */
var	float           PlayersHealthStatus;

/** Represents the ammo status of all the human team players on the server */
var	float           PlayersAmmoStatus;

/** Represents the player status of all the human team players on the server */
var	float           AggregatePlayersStatus;

/*********************************************************************************************
 * @name Skill Tracking
********************************************************************************************* */

/** How long are zeds living on average after they have seen an enemy */
var	float           ZedVisibleAverageLifespan;
/** Total time zeds are living after they have seen an enemy */
var	float           TotalZedVisibleLifespan;
/** How many zeds have been killed during this match */
var	int             TotalZedsKilled;

/** How long are zeds living on average after they have seen an enemy, for the current wave */
var	float           CurrentWaveZedVisibleAverageLifeSpan;
/** Total time zeds are living after they have seen an enemy, for the current wave */
var	float           CurrentWaveTotalZedVisibleLifeSpan;
/** How many zeds have been killed during this wave */
var	int             CurrentWaveTotalZedsKilled;

/** How long are zeds living on average after they have seen an enemy, for the last 10 seconds */
var	float           RecentZedVisibleAverageLifeSpan;
/** Total time zeds are living after they have seen an enemy, for the last 10 seconds */
var	float           RecentTotalZedVisibleLifeSpan;
/** How many zeds have been killed during tlast 10 seconds */
var	int             RecentTotalZedsKilled;

/** Keep track of the zed lifespan totals over the last 10 seconds */
var float           RecentZedLifeSpanTotalTracker[10];
/** Keep track of the zed kill totals over the last 10 seconds */
var float           RecentZedKillTotalTracker[10];

/** Represents the player skill level off all the human team players on the server */
var	float           AggregatePlayerSkill;

/** Represents the average shooting accuracy of all the human team players on the server */
var	float           PlayersAverageAccuracy;

/** Represents the average headshot accuracy of all the human team players on the server */
var	float           PlayersAverageHeadshotAccuracy;

/*********************************************************************************************
 * @name Player Experience Level
********************************************************************************************* */

/** The average of the perk rank for all the players on the server */
var	float           AveragePlayerPerkRank;

/** The target perk range for each difficulty level */
var() vector2d      TargetPerkRankRange[4];

/** What is the median target perk rank for the current game */
var float CurrentTargetPerkRank;

/*********************************************************************************************
 * @name Gameplay modification
********************************************************************************************* */

/** How much the spawn rate can be modified by difficulty based on perk rank and how well the team is doing */
var() vector2d      SpawnRateModificationRange[4];

/** Current spawn rate modification */
var() float         CurrentSpawnRateModification;

/** How much the ai movement speed can be modified by difficulty based on perk rank and how well the team is doing */
var() vector2d      AIMovementSpeedModificationRange[4];

/** Current AI Movement speed modifier */
var() float         CurrentAIMovementSpeedMod;

/*********************************************************************************************
 * @name Skill Tracking
********************************************************************************************* */

/** Update stats when a zed is killed */
function HandleZedKill( float ZedVisibleTimeAlive )
{
    TotalZedsKilled++;
    TotalZedVisibleLifespan += ZedVisibleTimeAlive;
    ZedVisibleAverageLifespan = TotalZedVisibleLifespan/float(TotalZedsKilled);

    CurrentWaveTotalZedsKilled++;
    CurrentWaveTotalZedVisibleLifeSpan += ZedVisibleTimeAlive;
    CurrentWaveZedVisibleAverageLifeSpan = CurrentWaveTotalZedVisibleLifeSpan/float(CurrentWaveTotalZedsKilled);

    RecentTotalZedsKilled++;
    RecentTotalZedVisibleLifeSpan += ZedVisibleTimeAlive;

    //`log("TotalZedsKilled = "$TotalZedsKilled$" TotalZedVisibleLifespan = "$TotalZedVisibleLifespan$" ZedVisibleAverageLifespan = "$ZedVisibleAverageLifespan$" seconds");
    //`log("CurrentWaveTotalZedsKilled = "$CurrentWaveTotalZedsKilled$" CurrentWaveZedVisibleAverageLifeSpan = "$CurrentWaveZedVisibleAverageLifeSpan$" CurrentWaveZedVisibleAverageLifeSpan = "$CurrentWaveZedVisibleAverageLifeSpan$" seconds");
}

/** Reset stats that are collected for a single wave */
function ResetWaveStats()
{
    CurrentWaveTotalZedsKilled=0;
    CurrentWaveTotalZedVisibleLifeSpan=0;
    CurrentWaveZedVisibleAverageLifeSpan=0;
}

/** Handle someone's perk levels being updated */
function HandlePerkLevelsUpdated()
{
	local KFPlayerController KFPC;
	local KFPerk MyPerk;
	local int NumHumanTeamPlayers;
	local float TotalPerkRank;

	foreach WorldInfo.AllControllers( class'KFPlayerController', KFPC )
	{
		if( KFPC.GetTeamNum() == 0 )
		{
            MyPerk = KFPC.CurrentPerk;

    		if( MyPerk != none )
    		{
                NumHumanTeamPlayers++;
                TotalPerkRank += Float(MyPerk.GetLevel());
    		}
		}
	}

	if( NumHumanTeamPlayers > 0 )
	{
        AveragePlayerPerkRank = TotalPerkRank/NumHumanTeamPlayers;
        //`log(self@GetFuncName()$" AveragePlayerPerkRank = "$AveragePlayerPerkRank$" TotalPerkRank = "$TotalPerkRank$" NumHumanTeamPlayers = "$NumHumanTeamPlayers);
	}

}

/** Handle someone switching teams */
function HandlePlayerChangedTeam()
{
    // Perk levels are now valid handle that
    HandlePerkLevelsUpdated();
}

/** Called once per second to evaluate changes to gameplay */
function TimerUpdate()
{
//    EvaluateSpawnRateModification();
//    EvaluateAIMovementSpeedModification();
    UpdatePlayerAccuracyStats();
    UpdateZedLifespanStats();
    UpdatePlayersStatus();
    UpdatePlayersAggregateSkill();
}

/** Update the tracking of the status of the players on the server */
function UpdatePlayersStatus()
{
	local Controller C;
	local KFPawn_Human KFP;
	local float TotalHealth, TotalAmmo, TotalMaxAmmo;
	local KFInventoryManager KFIM;
	local int i;
	local KFPlayerReplicationInfo KFPRI;
	local float NumHumanPlayers;

	foreach WorldInfo.AllControllers( class'Controller', C )
	{
		if( C.GetTeamNum() == 0 )
		{
            // Add up the health of living players
            if( C.Pawn != none )
            {
                KFP =  KFPawn_Human(C.Pawn);

                if( KFP != none && KFPawn_Customization(KFP) == none )
                {
                    TotalHealth += Float(KFP.Health)/Float(KFP.HealthMax);
                    NumHumanPlayers += 1.0;
                    //`log("C = "$C$" KFP.Health = "$KFP.Health$" KFP.HealthMax = "$KFP.HealthMax$" C.Pawn = "$C.Pawn);

                	KFIM = KFInventoryManager(KFP.InvManager);
                	if (KFIM !=none)
                	{
                        TotalAmmo += KFIM.GetPrimaryAmmoPercentage();
                        TotalMaxAmmo += 1.0;
                    }
                }
            }
            // Add up the health (or lack thereof) of players that don't have a pawn, so have
            // already died. Doesn't count newly joined players waiting to spawn.
            else if( C.PlayerReplicationInfo != none && !C.PlayerReplicationInfo.bOnlySpectator &&
                !C.PlayerReplicationInfo.bWaitingPlayer )
            {
                KFPRI = KFPlayerReplicationInfo(C.PlayerReplicationInfo);

                if( KFPRI != none )
                {
                    //`log("C = "$C$" KFPRI.PlayerHealthPercent = "$ByteToFloat(KFPRI.PlayerHealthPercent)$" KFP.HealthMax = 100");
                    TotalHealth += ByteToFloat(KFPRI.PlayerHealth)/ByteToFloat(KFPRI.PlayerHealthMax);
                    NumHumanPlayers += 1.0;
                }
            }
		}
	}

	if( NumHumanPlayers > 0 )
	{
        PlayersHealthStatus = TotalHealth/NumHumanPlayers;
    }
    else
    {
        PlayersHealthStatus = 0;
    }

	if( TotalMaxAmmo > 0 )
	{
        PlayersAmmoStatus = TotalAmmo/TotalMaxAmmo;
    }
    else
    {
        PlayersAmmoStatus = 0;
    }

    // Aggregates all player status variables into one value
    AggregatePlayersStatus = (PlayersHealthStatus * 0.5) + (PlayersAmmoStatus * 0.5);

	//`log("PlayersHealthStatus = "$PlayersHealthStatus$" PlayersAmmoStatus = "$PlayersAmmoStatus$" AggregatePlayerStatus = "$AggregatePlayersStatus);

	for( i = 0; i < (ArrayCount(MyKFGRI.PlayersHealthStatusTracker) - 1); i++ )
	{
	   MyKFGRI.PlayersHealthStatusTracker[i] = MyKFGRI.PlayersHealthStatusTracker[i+1];
	   MyKFGRI.PlayersAmmoStatusTracker[i] = MyKFGRI.PlayersAmmoStatusTracker[i+1];
	   MyKFGRI.AggregatePlayersStatusTracker[i] = MyKFGRI.AggregatePlayersStatusTracker[i+1];
	}

    MyKFGRI.PlayersHealthStatusTracker[ArrayCount(MyKFGRI.PlayersHealthStatusTracker) -1] = PlayersHealthStatus;
    MyKFGRI.PlayersAmmoStatusTracker[ArrayCount(MyKFGRI.PlayersAmmoStatusTracker) -1] = PlayersAmmoStatus;
    MyKFGRI.AggregatePlayersStatusTracker[ArrayCount(MyKFGRI.AggregatePlayersStatusTracker) -1] = AggregatePlayersStatus;
}

/** Update the tracking of the status of the players on the server */
function UpdatePlayersAggregateSkill()
{
	local int i;

    // Heuristic for how players are performing.
    AggregatePlayerSkill = PlayersAverageAccuracy * 0.25 + PlayersAverageHeadshotAccuracy * 0.75;

	for( i = 0; i < (ArrayCount(MyKFGRI.AggregatePlayerSkillTracker) - 1); i++ )
	{
	   MyKFGRI.AggregatePlayerSkillTracker[i] = MyKFGRI.AggregatePlayerSkillTracker[i+1];
	}

    MyKFGRI.AggregatePlayerSkillTracker[ArrayCount(MyKFGRI.AggregatePlayerSkillTracker) -1] = AggregatePlayerSkill;
}

/** Update the accuracy stats of the players on the server */
function UpdatePlayerAccuracyStats()
{
	local KFPlayerController KFPC;
	local int NumHumanTeamPlayers;
	local float TotalAccuracy, TotalHeadShotAccuracy;
	local int i;

	foreach WorldInfo.AllControllers( class'KFPlayerController', KFPC )
	{
		if( KFPC.GetTeamNum() == 0 )
		{
            NumHumanTeamPlayers++;
            if( KFPC.ShotsFired > 0 )
            {
                TotalAccuracy += (Float(KFPC.ShotsHit)/Float(KFPC.ShotsFired) * 100.0);
                TotalHeadShotAccuracy += (Float(KFPC.ShotsHitHeadshot)/Float(KFPC.ShotsFired) * 100.0);
            }
		}
	}

	for( i = 0; i < (ArrayCount(MyKFGRI.PlayerAccuracyTracker) - 1); i++ )
	{
	   MyKFGRI.PlayerAccuracyTracker[i] = MyKFGRI.PlayerAccuracyTracker[i+1];
	   MyKFGRI.PlayerHeadshotAccuracyTracker[i] = MyKFGRI.PlayerHeadshotAccuracyTracker[i+1];
	}

    if( NumHumanTeamPlayers > 0 )
    {
        PlayersAverageAccuracy = TotalAccuracy/float(NumHumanTeamPlayers);
        PlayersAverageHeadshotAccuracy = TotalHeadShotAccuracy/float(NumHumanTeamPlayers);

        MyKFGRI.PlayerAccuracyTracker[ArrayCount(MyKFGRI.PlayerAccuracyTracker) -1] = PlayersAverageAccuracy;
        MyKFGRI.PlayerHeadshotAccuracyTracker[ArrayCount(MyKFGRI.PlayerHeadshotAccuracyTracker) -1] = PlayersAverageHeadshotAccuracy;
    }
}

/** Update the stats on how long zeds are surviving on the server */
function UpdateZedLifespanStats()
{
	local int i;
	local float CurrentTotalLifeSpan;
	local int CurrentTotalKills;

	for( i = 0; i < (ArrayCount(MyKFGRI.TotalZedLifeSpanAverageTracker) - 1); i++ )
	{
       CurrentTotalLifeSpan += RecentZedLifeSpanTotalTracker[i];
       CurrentTotalKills += RecentZedKillTotalTracker[i];

       MyKFGRI.TotalZedLifeSpanAverageTracker[i] = MyKFGRI.TotalZedLifeSpanAverageTracker[i+1];
	   MyKFGRI.CurrentWaveZedLifeSpanAverageTracker[i] = MyKFGRI.CurrentWaveZedLifeSpanAverageTracker[i+1];
	   MyKFGRI.RecentZedLifeSpanAverageTracker[i] = MyKFGRI.RecentZedLifeSpanAverageTracker[i+1];
	   RecentZedKillTotalTracker[i] = RecentZedKillTotalTracker[i+1];
	   RecentZedLifeSpanTotalTracker[i] = RecentZedLifeSpanTotalTracker[i+1];
	}

    MyKFGRI.TotalZedLifeSpanAverageTracker[ArrayCount(MyKFGRI.TotalZedLifeSpanAverageTracker) -1] = ZedVisibleAverageLifespan;
    MyKFGRI.CurrentWaveZedLifeSpanAverageTracker[ArrayCount(MyKFGRI.CurrentWaveZedLifeSpanAverageTracker) -1] = CurrentWaveZedVisibleAverageLifeSpan;

    // Keep track of recent kills
    CurrentTotalLifeSpan += RecentTotalZedVisibleLifeSpan;
    CurrentTotalKills += RecentTotalZedsKilled;
    RecentZedLifeSpanTotalTracker[ArrayCount(RecentZedLifeSpanTotalTracker) -1] = RecentTotalZedVisibleLifeSpan;
    RecentZedKillTotalTracker[ArrayCount(RecentZedKillTotalTracker) -1] = RecentTotalZedsKilled;
    if( CurrentTotalKills > 0 )
    {
        RecentZedVisibleAverageLifeSpan = CurrentTotalLifeSpan/float(CurrentTotalKills);
        MyKFGRI.RecentZedLifeSpanAverageTracker[ArrayCount(MyKFGRI.RecentZedLifeSpanAverageTracker) -1] = RecentZedVisibleAverageLifeSpan;
    }
    else
    {
        RecentZedVisibleAverageLifeSpan = MyKFGRI.RecentZedLifeSpanAverageTracker[ArrayCount(MyKFGRI.RecentZedLifeSpanAverageTracker) - 2]*0.9;
        MyKFGRI.RecentZedLifeSpanAverageTracker[ArrayCount(MyKFGRI.RecentZedLifeSpanAverageTracker) -1] = RecentZedVisibleAverageLifeSpan;
    }

    // Clear the recent kill/lifespawn info
    RecentTotalZedVisibleLifeSpan = 0;
    RecentTotalZedsKilled = 0;
}

/** Potentially modify the spawn rate based on various factors */
function EvaluateSpawnRateModification()
{
    local float RangePercent;

    if( WithinRange(TargetPerkRankRange[GameDifficulty],AveragePlayerPerkRank) )
    {
        RangePercent = GetRangePctByValue( TargetPerkRankRange[GameDifficulty], AveragePlayerPerkRank );
    }
    else if( AveragePlayerPerkRank < TargetPerkRankRange[GameDifficulty].X )
    {
        RangePercent = 0;
    }
    else
    {
        RangePercent = 1;
    }

    CurrentSpawnRateModification = GetRangeValueByPct( SpawnRateModificationRange[GameDifficulty], RangePercent );

    //`log("RangePercent = "$RangePercent$" AveragePlayerPerkRank = "$AveragePlayerPerkRank$" CurrentSpawnRateModification = "$CurrentSpawnRateModification);
}

/** Potentially modify the AI movement speed based on various factors */
function EvaluateAIMovementSpeedModification()
{
    local float RangePercent;
    local float DifficultySpeedAdjustMod;

    if( WithinRange(TargetPerkRankRange[GameDifficulty],AveragePlayerPerkRank) )
    {
        RangePercent = GetRangePctByValue( TargetPerkRankRange[GameDifficulty], AveragePlayerPerkRank );
    }
    else if( AveragePlayerPerkRank < TargetPerkRankRange[GameDifficulty].X )
    {
        RangePercent = 0;
    }
    else
    {
        RangePercent = 1;
    }

    if(  GameDifficulty <= 0 ) // Normal
    {
        DifficultySpeedAdjustMod = (DifficultyInfo.Hard.MovementSpeedMod - DifficultyInfo.Normal.MovementSpeedMod) * 0.5;
    }
    else if(  GameDifficulty <= 1 ) // Hard
    {
        DifficultySpeedAdjustMod = (DifficultyInfo.Suicidal.MovementSpeedMod - DifficultyInfo.Hard.MovementSpeedMod) * 0.5;
    }
    else  // Suicidal and HOE
    {
        DifficultySpeedAdjustMod = (DifficultyInfo.HellOnEarth.MovementSpeedMod - DifficultyInfo.Suicidal.MovementSpeedMod) * 0.5;
    }

    if( RangePercent < 0.5 )
    {
        CurrentAIMovementSpeedMod = 1.0 - (DifficultySpeedAdjustMod * (0.5 - RangePercent) * 2.0);
    }
    else if( RangePercent > 0.5 )
    {
        CurrentAIMovementSpeedMod = 1.0 + (DifficultySpeedAdjustMod * (RangePercent - 0.5) * 2.0);
    }
    else
    {
        CurrentAIMovementSpeedMod = 1.0;
    }

    //`log("RangePercent = "$RangePercent$" AveragePlayerPerkRank = "$AveragePlayerPerkRank$" DifficultySpeedAdjustMod = "$DifficultySpeedAdjustMod$" CurrentAIMovementSpeedMod = "$CurrentAIMovementSpeedMod);
}

function bool WithinRange( vector2d Range, float TestValue )
{
    if( TestValue >= Range.X && TestValue <= Range.Y )
    {
        return true;
    }

    return false;
}

defaultproperties
{
   TargetPerkRankRange(0)=(X=0.000000,Y=7.000000)
   TargetPerkRankRange(1)=(X=0.000000,Y=12.000000)
   TargetPerkRankRange(2)=(X=12.000000,Y=25.000000)
   TargetPerkRankRange(3)=(X=25.000000,Y=25.000000)
   SpawnRateModificationRange(0)=(X=1.250000,Y=0.750000)
   SpawnRateModificationRange(1)=(X=1.250000,Y=0.750000)
   SpawnRateModificationRange(2)=(X=1.250000,Y=0.750000)
   SpawnRateModificationRange(3)=(X=1.250000,Y=0.750000)
   CurrentSpawnRateModification=1.000000
   AIMovementSpeedModificationRange(0)=(X=0.750000,Y=1.250000)
   AIMovementSpeedModificationRange(1)=(X=0.750000,Y=1.250000)
   AIMovementSpeedModificationRange(2)=(X=0.750000,Y=1.250000)
   AIMovementSpeedModificationRange(3)=(X=0.750000,Y=1.250000)
   CurrentAIMovementSpeedMod=1.000000
   Name="Default__KFGameConductor"
   ObjectArchetype=Object'Core.Default__Object'
}
