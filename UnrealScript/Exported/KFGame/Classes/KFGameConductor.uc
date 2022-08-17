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
var	    float           PlayersHealthStatus;
/** Represents the ammo status of all the human team players on the server */
var	    float           PlayersAmmoStatus;
/** Represents the player status of all the human team players on the server */
var	    float           AggregatePlayersStatus;
/** Team low health threshold for determining gameplay changes */
var()	float           PlayersLowHealthThreshold;

/*********************************************************************************************
 * @name Skill Tracking
********************************************************************************************* */

/** How long are zeds living on average after they have seen an enemy */
var	    float           ZedVisibleAverageLifespan;
/** Total time zeds are living after they have seen an enemy */
var	    float           TotalZedVisibleLifespan;
/** How many zeds have been killed during this match */
var	    int             TotalZedsKilled;

/** How long are zeds living on average after they have seen an enemy, for the current wave */
var	    float           CurrentWaveZedVisibleAverageLifeSpan;
/** Total time zeds are living after they have seen an enemy, for the current wave */
var	    float           CurrentWaveTotalZedVisibleLifeSpan;
/** How many zeds have been killed during this wave */
var	    int             CurrentWaveTotalZedsKilled;

/** How long are zeds living on average after they have seen an enemy, for the last 10 seconds */
var	    float           RecentZedVisibleAverageLifeSpan;
/** Total time zeds are living after they have seen an enemy, for the last 10 seconds */
var	    float           RecentTotalZedVisibleLifeSpan;
/** How many zeds have been killed during tlast 10 seconds */
var	    int             RecentTotalZedsKilled;

/** Keep track of the zed lifespan totals over the last 10 seconds */
var     float           RecentZedLifeSpanTotalTracker[10];
/** Keep track of the zed kill totals over the last 10 seconds */
var     float           RecentZedKillTotalTracker[10];

/** Represents the player skill level off all the human team players on the server */
var	    float           AggregatePlayerSkill;

/** Represents the average shooting accuracy of all the human team players on the server */
var	    float           PlayersAverageAccuracy;
/** Represents the average headshot accuracy of all the human team players on the server */
var	    float           PlayersAverageHeadshotAccuracy;
/** What we expect the average player shot accuracy to be */
var	    float           ParShotAccuracy;
/** What we expect the average player shot accuracy to be */
var	    float           ParHeadshotAccuracy;

/** What percentage above BaseLinePlayerShootingSkill to consider a players shooting accuracy "highly skilled" */
var()	float           HighlySkilledAccuracyMod;
/** What percentage above BaseLinePlayerShootingSkill to use as the max value for calculating the skill modifer */
var()	float           HighlySkilledAccuracyModMax;
/** What percentage below BaseLinePlayerShootingSkill to consider a players shooting accuracy "less skilled" */
var()	float           LessSkilledAccuracyMod;
/** What percentage below BaseLinePlayerShootingSkill to use as the min value for calculating the skill modifer */
var()	float           LessSkilledAccuracyModMin;

/** What is the baseline player shooting skill value */
var 	float           BaseLinePlayerShootingSkill;
/** What percentage weight should general shooting accuracy have for the BaseLinePlayerShootingSkill */
var()	float           ShootingAccuracySkillWeight;
/** What percentage weight should headshot accuracy have for the BaseLinePlayerShootingSkill */
var()	float           HeadShootingAccuracySkillWeight;

/** What we expect the average zed lifespan to be, by difficulty */
var	    float           ParZedLifeSpan[4];
/** What we expect the average zed lifespan to be, by difficulty on solo*/
var	    float           ParZedLifeSpanSolo[4];

/** What percentage of ParZedLifeSpan to consider how quickly zeds are being killed as "highly skilled" */
var()	float           ZedLifeSpanHighlySkilledThreshold;
/** What percentage of ParZedLifeSpan to use as the min value for calculating the skill modife */
var()	float           ZedLifeSpanHighlySkilledThresholdMin;
/** What percentage of ParZedLifeSpan to consider how quickly zeds are being killed as "less skilled" */
var()	float           ZedLifeSpanLessSkilledThreshold;
/** What percentage of ParZedLifeSpan to use as the max value for calculating the skill modifer */
var()	float           ZedLifeSpanLessSkilledThresholdMax;

/** The overall modifier to use based on the players' perk rank and playing skill */
var	    float           OverallRankAndSkillModifier;
/** What percentage of OverallRankAndSkillModifier does PerkRank count toward */
var()	float           PerkRankPercentOfOverallSkill;
/** What percentage of OverallRankAndSkillModifier does shooting accuracy count toward */
var()	float           AccuracyPercentOfOverallSkill;
/** What percentage of OverallRankAndSkillModifier does zed lifespan count toward */
var()	float           ZedLifeSpanPercentOfOverallSkill;

/*********************************************************************************************
 * @name Game Status
**********************************************************************************************/

enum EGameConductorStatus
{
	GCS_Normal,
	GCS_ForceLull
};

/** Current overall status of the game conductor */
var EGameConductorStatus GameConductorStatus;

/** How long to force a low intensity lull for if a player dies */
var()	float           PlayerDeathForceLullLength;
/** When we lasted forced a low intensity lull for a player dying */
var()	float           PlayerDeathForceLullTime;

/*********************************************************************************************
 * @name Player Experience Level
**********************************************************************************************/

/** The average of the perk rank for all the players on the server */
var	float           AveragePlayerPerkRank;

/** The target perk range for each difficulty level */
var() vector2d      TargetPerkRankRange[4];

/** What is the median target perk rank for the current game */
var float CurrentTargetPerkRank;

/*********************************************************************************************
 * @name Gameplay modification
********************************************************************************************* */

/** How much the spawn rate can be modified by difficulty based on perk rank and how well the team is doing. At 0 it will be as slow is you want it to go, at 1.0 as fast as you want it to go, and at 0.5 should be no change */
var() InterpCurveFloat      SpawnRateModificationRangeCurve[4];

/** Current spawn rate modification */
var() float         CurrentSpawnRateModification;

/**
  * What percentage of the difference between the zed movement speed on the current
  * difficulty, and the zed movement speed on the next highest difficulty, do we want
  * to add/subtract to the movement speed based on how well/poorly a team is doing.
  * X = the % difference to use for slowing zeds down if a team is doing poorly,
  * Y =  the % difference to use for speeding up zeds if the team is doing well.
  * Valid values for X are between 0 (no change) and 0.9. Valid values for Y are
  * between 0 (no change) and 1.0. For example, using 0.5 for X and Y would give
  * you an increase or decrease in movement speed halfway in between the speed of
  * the zeds on the current difficulty, and the speed of the zeds on the next higher
  * difficulty.
  */
var() vector2d      AIMovementSpeedModificationRange[4];

/** Current AI Movement speed modifier */
var     float           CurrentAIMovementSpeedMod;
/** Current modification the game conductor is making to versus player zed health */
var	    float           CurrentVersusZedHealthMod;
/** Current modification the game conductor is making to versus player zed damage */
var	    float           CurrentVersusZedDamageMod;

/** Whether or not this game difficulty allows low intensity zed mode when players get low on health, forced lull, etc */
var()   int             AllowLowIntensityZedModeByDifficulty[4];

/*********************************************************************************************
 * @name Logging and debugging
********************************************************************************************* */

/** Whether or not to log Game Conductor activity */
var() bool          bLogGameConductor;

/** When true bypass the game conductor making any adjustments */
var() bool          bBypassGameConductor;

/*********************************************************************************************
 * @name Player Status
********************************************************************************************* */

/** Initialize the game conductor */
function Initialize()
{
    BaseLinePlayerShootingSkill = ParShotAccuracy * ShootingAccuracySkillWeight + ParHeadshotAccuracy * HeadShootingAccuracySkillWeight;
}

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

/** Let the game conductor know a human team pawn just died */
function NotifyHumanTeamPlayerDeath()
{
    if( !MyKFGRI.IsFinalWave() )
    {
        if (bLogGameConductor) LogInternal("Human team player died, forcing a lull for "$PlayerDeathForceLullLength$" seconds!");

        GameConductorStatus = GCS_ForceLull;
        PlayerDeathForceLullTime = WorldInfo.TimeSeconds;
    }
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
    UpdatePlayerAccuracyStats();
    UpdateZedLifespanStats();
    UpdatePlayersStatus();
    UpdatePlayersAggregateSkill();

    UpdateOverallStatus();

    EvaluateSpawnRateModification();
    EvaluateAIMovementSpeedModification();
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
                    TotalHealth += ByteToFloat(KFPRI.PlayerHealthPercent);
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
		if( KFPC.GetTeamNum() == 0 && KFPC.GetPerk() != none )
		{
            NumHumanTeamPlayers++;
            if( KFPC.ShotsFired > 0 )
            {
                TotalAccuracy += (Float(KFPC.ShotsHit)/Float(KFPC.ShotsFired) * 100.0) + KFPC.GetPerk().HitAccuracyHandicap;
                TotalHeadShotAccuracy += (Float(KFPC.ShotsHitHeadshot)/Float(KFPC.ShotsFired) * 100.0) + KFPC.GetPerk().HeadshotAccuracyHandicap;
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
	local float TotalRecentAverageLifespan;

	for( i = 0; i < (ArrayCount(MyKFGRI.TotalZedLifeSpanAverageTracker) - 1); i++ )
	{
        CurrentTotalLifeSpan += RecentZedLifeSpanTotalTracker[i];
        CurrentTotalKills += RecentZedKillTotalTracker[i];
        if( i > 6 )
        {
            TotalRecentAverageLifespan += MyKFGRI.RecentZedLifeSpanAverageTracker[i+1];
        }

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
        TotalRecentAverageLifespan += RecentZedVisibleAverageLifeSpan;

        // Smooth the value with an average over the last 3 values
        MyKFGRI.RecentZedLifeSpanAverageTracker[ArrayCount(MyKFGRI.RecentZedLifeSpanAverageTracker) -1] = TotalRecentAverageLifespan/3.0;
    }
    else
    {
        // No recent kills, just populate with the last checks values
        RecentZedVisibleAverageLifeSpan = MyKFGRI.RecentZedLifeSpanAverageTracker[ArrayCount(MyKFGRI.RecentZedLifeSpanAverageTracker) -2];
        MyKFGRI.RecentZedLifeSpanAverageTracker[ArrayCount(MyKFGRI.RecentZedLifeSpanAverageTracker) -1] = RecentZedVisibleAverageLifeSpan;
    }

    // Clear the recent kill/lifespawn info
    RecentTotalZedVisibleLifeSpan = 0;
    RecentTotalZedsKilled = 0;
}

/** Returns what we expect the average zed lifespan to be, by difficulty */
function float GetParZedLifeSpan()
{
    if( !bOnePlayerAtStart )
    {
        return ParZedLifeSpan[GameDifficulty];

    }
    else
    {
        return ParZedLifeSpanSolo[GameDifficulty];
    }
}

/** Calculate the overall status of the player's rank and performance */
function UpdateOverallStatus()
{
    local float PerkRankModifier;
    local float SkillModifier;
    local float LifeSpanModifier;
    local float HighlySkilledAccuracy, LessSkilledAccuracy;
    local float HighlySkilledZedLifespan, LessSkilledZedLifespan;
    local int i;

    // Take us out of a forced lull if the time is up
    if( GameConductorStatus == GCS_ForceLull && (WorldInfo.TimeSeconds - PlayerDeathForceLullTime) > PlayerDeathForceLullLength )
    {
        GameConductorStatus = GCS_Normal;
        if (bLogGameConductor) LogInternal("Forced lull completed");
    }

    MyKFGRI.CurrentGameConductorStatus = GameConductorStatus;
    MyKFGRI.CurrentParZedLifeSpan = GetParZedLifeSpan();

	for( i = 0; i < (ArrayCount(MyKFGRI.OverallRankAndSkillModifierTracker) - 1); i++ )
	{
        MyKFGRI.OverallRankAndSkillModifierTracker[i] = MyKFGRI.OverallRankAndSkillModifierTracker[i+1];
	}

    // Bypassing making game conductor adjustments
    if( bBypassGameConductor || MyKFGRI.IsFinalWave() )
    {
        OverallRankAndSkillModifier = 0.5;
        if (bLogGameConductor) LogInternal("Bypassing GameConductor adjustment OverallRankAndSkillModifier = "$OverallRankAndSkillModifier);
        MyKFGRI.OverallRankAndSkillModifierTracker[ArrayCount(MyKFGRI.OverallRankAndSkillModifierTracker) -1] = OverallRankAndSkillModifier;
        return;
    }

    // Forced lull, or most of the team dead, or single player nearly dead, so slow things down
    if( GameConductorStatus == GCS_ForceLull || (PlayersHealthStatus < PlayersLowHealthThreshold) )
    {
        OverallRankAndSkillModifier = 0.0;
        if (bLogGameConductor) LogInternal("Players low on health PlayersHealthStatus: "$PlayersHealthStatus$" chilling things out, OverallRankAndSkillModifier= "$OverallRankAndSkillModifier);
        MyKFGRI.OverallRankAndSkillModifierTracker[ArrayCount(MyKFGRI.OverallRankAndSkillModifierTracker) -1] = OverallRankAndSkillModifier;
        return;
    }

    if( WithinRange(TargetPerkRankRange[GameDifficulty],AveragePlayerPerkRank) )
    {
        PerkRankModifier = GetRangePctByValue( TargetPerkRankRange[GameDifficulty], AveragePlayerPerkRank );
    }
    else if( AveragePlayerPerkRank < TargetPerkRankRange[GameDifficulty].X )
    {
        PerkRankModifier = 0;
    }
    else
    {
        PerkRankModifier = 1;
    }

    // Evaluate player skill if its greater than 15 seconds into the match,
    // so you have some data to go by
    if( MyKFGRI != none && MyKFGRI.ElapsedTime > 15 && AggregatePlayerSkill != 0 )
    {
        HighlySkilledAccuracy = BaseLinePlayerShootingSkill * HighlySkilledAccuracyMod;
        LessSkilledAccuracy = BaseLinePlayerShootingSkill * LessSkilledAccuracyMod;

        if( AggregatePlayerSkill > HighlySkilledAccuracy )
        {
            // Highly skilled players
            SkillModifier = Lerp(0.51,1.0, FMin(1.0,(AggregatePlayerSkill - HighlySkilledAccuracy)/((BaseLinePlayerShootingSkill * HighlySkilledAccuracyModMax) - HighlySkilledAccuracy)));
        }
        else if( AggregatePlayerSkill < LessSkilledAccuracy )
        {
            // Less skilled players
            SkillModifier = Lerp(0.49,0.0, FMax(0,(LessSkilledAccuracy - AggregatePlayerSkill)/(LessSkilledAccuracy - (BaseLinePlayerShootingSkill * LessSkilledAccuracyModMin))));
        }
        else
        {
            // Standard skilled players
            SkillModifier = 0.5;
        }
    }
    else
    {
        // Standard skilled players
        SkillModifier = 0.5;
    }

    if( RecentZedVisibleAverageLifeSpan > 0 )
    {
        HighlySkilledZedLifespan = GetParZedLifeSpan() * ZedLifeSpanHighlySkilledThreshold;
        LessSkilledZedLifespan = GetParZedLifeSpan() * ZedLifeSpanLessSkilledThreshold;

        if( RecentZedVisibleAverageLifeSpan < HighlySkilledZedLifespan )
        {
            // Highly skilled players
            LifeSpanModifier = Lerp(0.51,1.0, FMin(1.0,(HighlySkilledZedLifespan - RecentZedVisibleAverageLifeSpan)/( HighlySkilledZedLifespan - (GetParZedLifeSpan() * ZedLifeSpanHighlySkilledThresholdMin))));

        }
        else if( RecentZedVisibleAverageLifeSpan > LessSkilledZedLifespan )
        {
            // Less skilled players
            LifeSpanModifier = Lerp(0.49,0.0, FMin(1.0,(RecentZedVisibleAverageLifeSpan - LessSkilledZedLifespan)/((GetParZedLifeSpan() * ZedLifeSpanLessSkilledThresholdMax) - LessSkilledZedLifespan)));
        }
        else
        {
            // Standard skilled players
            LifeSpanModifier = 0.5;
        }
    }
    else
    {
        // Standard skilled players
        LifeSpanModifier = 0.5;
    }

    OverallRankAndSkillModifier = PerkRankModifier * PerkRankPercentOfOverallSkill + SkillModifier * AccuracyPercentOfOverallSkill + LifeSpanModifier * ZedLifeSpanPercentOfOverallSkill;
    MyKFGRI.OverallRankAndSkillModifierTracker[ArrayCount(MyKFGRI.OverallRankAndSkillModifierTracker) -1] = OverallRankAndSkillModifier;

    if (bLogGameConductor) LogInternal("PerkRankModifier = "$PerkRankModifier$" SkillModifier = "$SkillModifier$" LifeSpanModifier = "$LifeSpanModifier$" OverallRankAndSkillModifier= "$OverallRankAndSkillModifier$" GetParZedLifeSpan() = "$GetParZedLifeSpan());
}

/** Called when a zed does an attack to give an opportunity to scale their attack cooldowns */
function UpdateOverallAttackCoolDowns(KFAIController KFAIC)
{
    local bool bAllowLowZedIntensity;

    if( GameDifficulty < ArrayCount(AllowLowIntensityZedModeByDifficulty) )
    {
        bAllowLowZedIntensity = (AllowLowIntensityZedModeByDifficulty[GameDifficulty] == 1);
    }
    else
    {
        bAllowLowZedIntensity = (AllowLowIntensityZedModeByDifficulty[ArrayCount(AllowLowIntensityZedModeByDifficulty) - 1] == 1);
    }

    if( !bBypassGameConductor && bAllowLowZedIntensity && !MyKFGRI.IsFinalWave() )
    {
        if( GameConductorStatus == GCS_ForceLull || OverallRankAndSkillModifier == 0 )
        {
            KFAIC.SetOverallCooldownTimer(KFAIC.LowIntensityAttackCooldown);
        }
        else
        {
            KFAIC.SetOverallCooldownTimer(0.0);
        }
    }
}

/** Potentially modify the spawn rate based on various factors */
function EvaluateSpawnRateModification()
{
    local int i;

    CurrentSpawnRateModification = EvalInterpCurveFloat(SpawnRateModificationRangeCurve[GameDifficulty], OverallRankAndSkillModifier);

    if( MyKFGRI.bGameConductorGraphingEnabled )
    {
    	for( i = 0; i < (ArrayCount(MyKFGRI.ZedSpawnRateModifierTracker) - 1); i++ )
    	{
            MyKFGRI.ZedSpawnRateModifierTracker[i] = MyKFGRI.ZedSpawnRateModifierTracker[i+1];
            MyKFGRI.ZedSpawnRateTracker[i] = MyKFGRI.ZedSpawnRateTracker[i+1];
    	}

        MyKFGRI.ZedSpawnRateModifierTracker[ArrayCount(MyKFGRI.ZedSpawnRateModifierTracker) -1] = CurrentSpawnRateModification;
        MyKFGRI.ZedSpawnRateTracker[ArrayCount(MyKFGRI.ZedSpawnRateTracker) -1] = MyKFGRI.CurrentNextSpawnTime;
    }

    if (bLogGameConductor) LogInternal("CurrentSpawnRateModification = "$CurrentSpawnRateModification$" MyKFGRI.ElapsedTime "$MyKFGRI.ElapsedTime);
}

/** Potentially modify the AI movement speed based on various factors */
function EvaluateAIMovementSpeedModification()
{
    local float DifficultySpeedAdjustMod, BaseGroundSpeedMod;
	local KFPawn_Monster KFPM;
    local float UsedMovementSpeedPercentIncrease, UsedMovementSpeedPercentDecrease;
    local float UsedMovementSpeedPercent;
    local int i;

    if( GameDifficulty < ArrayCount(AIMovementSpeedModificationRange) )
    {
        UsedMovementSpeedPercentDecrease = AIMovementSpeedModificationRange[GameDifficulty].X;
        UsedMovementSpeedPercentIncrease = AIMovementSpeedModificationRange[GameDifficulty].Y;
    }
    else
    {
        UsedMovementSpeedPercentDecrease = AIMovementSpeedModificationRange[ArrayCount(AIMovementSpeedModificationRange) - 1].X;
        UsedMovementSpeedPercentIncrease = AIMovementSpeedModificationRange[ArrayCount(AIMovementSpeedModificationRange) - 1].Y;
    }

    // Clamp the values to reasonable settings
    UsedMovementSpeedPercentDecrease = FClamp( UsedMovementSpeedPercentDecrease, 0.0, 0.9 );
    UsedMovementSpeedPercentIncrease = FClamp( UsedMovementSpeedPercentIncrease, 0.0, 1.0 );

    BaseGroundSpeedMod = DifficultyInfo.GetAIGroundSpeedMod();

    if( OverallRankAndSkillModifier < 0.5 )
    {
        UsedMovementSpeedPercent = UsedMovementSpeedPercentDecrease;
    }
    else if( OverallRankAndSkillModifier > 0.5 )
    {
        UsedMovementSpeedPercent = UsedMovementSpeedPercentIncrease;
    }
    else
    {
        UsedMovementSpeedPercent = 0;
    }

    if( UsedMovementSpeedPercent > 0 )
    {
        if(  GameDifficulty <= 0 ) // Normal
        {
            DifficultySpeedAdjustMod = (DifficultyInfo.Hard.MovementSpeedMod - DifficultyInfo.Normal.MovementSpeedMod) * UsedMovementSpeedPercent;
        }
        else if(  GameDifficulty <= 1 ) // Hard
        {
            DifficultySpeedAdjustMod = (DifficultyInfo.Suicidal.MovementSpeedMod - DifficultyInfo.Hard.MovementSpeedMod) * UsedMovementSpeedPercent;
        }
        else  // Suicidal and HOE
        {
            DifficultySpeedAdjustMod = (DifficultyInfo.HellOnEarth.MovementSpeedMod - DifficultyInfo.Suicidal.MovementSpeedMod) * UsedMovementSpeedPercent;
        }

        if( OverallRankAndSkillModifier < 0.5 )
        {
            CurrentAIMovementSpeedMod = BaseGroundSpeedMod - (DifficultySpeedAdjustMod * (0.5 - OverallRankAndSkillModifier) * 2.0);
        }
        else if( OverallRankAndSkillModifier > 0.5 )
        {
            CurrentAIMovementSpeedMod = BaseGroundSpeedMod + (DifficultySpeedAdjustMod * (OverallRankAndSkillModifier - 0.5) * 2.0);
        }
        else
        {
            CurrentAIMovementSpeedMod = BaseGroundSpeedMod;
        }
    }
    else
    {
        CurrentAIMovementSpeedMod = BaseGroundSpeedMod;
    }

    if( MyKFGRI.bGameConductorGraphingEnabled )
    {
    	for( i = 0; i < (ArrayCount(MyKFGRI.ZedMovementSpeedModifierTracker) - 1); i++ )
    	{
            MyKFGRI.ZedMovementSpeedModifierTracker[i] = MyKFGRI.ZedMovementSpeedModifierTracker[i+1];
    	}

        MyKFGRI.ZedMovementSpeedModifierTracker[ArrayCount(MyKFGRI.ZedMovementSpeedModifierTracker) -1] = CurrentAIMovementSpeedMod/BaseGroundSpeedMod;
    }

    // Adjust the speed of the currently living pawns
	foreach WorldInfo.AllPawns( class'KFPawn_Monster', KFPM )
	{
        if( KFPM.Health > 0 )
        {
            KFPM.AdjustMovementSpeed(CurrentAIMovementSpeedMod);
        }
	}

    if (bLogGameConductor) LogInternal("CurrentAIMovementSpeedMod = "$CurrentAIMovementSpeedMod$" DifficultyInfo.GetAIGroundSpeedMod() = "$DifficultyInfo.GetAIGroundSpeedMod());
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
   PlayersLowHealthThreshold=0.500000
   ParShotAccuracy=48.000000
   ParHeadshotAccuracy=10.000000
   HighlySkilledAccuracyMod=1.250000
   HighlySkilledAccuracyModMax=1.500000
   LessSkilledAccuracyMod=0.750000
   LessSkilledAccuracyModMin=0.500000
   ShootingAccuracySkillWeight=0.250000
   HeadShootingAccuracySkillWeight=0.750000
   ParZedLifeSpan(0)=35.000000
   ParZedLifeSpan(1)=32.000000
   ParZedLifeSpan(2)=28.000000
   ParZedLifeSpan(3)=22.000000
   ParZedLifeSpanSolo(0)=23.000000
   ParZedLifeSpanSolo(1)=23.000000
   ParZedLifeSpanSolo(2)=22.000000
   ParZedLifeSpanSolo(3)=17.000000
   ZedLifeSpanHighlySkilledThreshold=0.750000
   ZedLifeSpanHighlySkilledThresholdMin=0.500000
   ZedLifeSpanLessSkilledThreshold=1.250000
   ZedLifeSpanLessSkilledThresholdMax=1.500000
   PerkRankPercentOfOverallSkill=0.250000
   AccuracyPercentOfOverallSkill=0.250000
   ZedLifeSpanPercentOfOverallSkill=0.500000
   PlayerDeathForceLullLength=15.000000
   TargetPerkRankRange(0)=(X=0.000000,Y=7.000000)
   TargetPerkRankRange(1)=(X=0.000000,Y=12.000000)
   TargetPerkRankRange(2)=(X=12.000000,Y=25.000000)
   TargetPerkRankRange(3)=(X=24.999001,Y=25.000000)
   SpawnRateModificationRangeCurve(0)=(Points=((OutVal=1.250000),(InVal=0.500000,OutVal=1.000000),(InVal=1.000000,OutVal=0.750000)))
   SpawnRateModificationRangeCurve(1)=(Points=((OutVal=1.250000),(InVal=0.500000,OutVal=1.000000),(InVal=1.000000,OutVal=0.750000)))
   SpawnRateModificationRangeCurve(2)=(Points=((OutVal=1.250000),(InVal=0.500000,OutVal=1.000000),(InVal=1.000000,OutVal=0.500000)))
   SpawnRateModificationRangeCurve(3)=(Points=((OutVal=1.000000),(InVal=0.500000,OutVal=1.000000),(InVal=1.000000,OutVal=0.750000)))
   CurrentSpawnRateModification=1.000000
   AIMovementSpeedModificationRange(0)=(X=0.500000,Y=0.500000)
   AIMovementSpeedModificationRange(1)=(X=0.500000,Y=0.500000)
   AIMovementSpeedModificationRange(2)=(X=0.500000,Y=0.650000)
   AIMovementSpeedModificationRange(3)=(X=0.000000,Y=0.500000)
   CurrentAIMovementSpeedMod=1.000000
   CurrentVersusZedHealthMod=1.000000
   CurrentVersusZedDamageMod=1.000000
   AllowLowIntensityZedModeByDifficulty(0)=1
   AllowLowIntensityZedModeByDifficulty(1)=1
   AllowLowIntensityZedModeByDifficulty(2)=1
   Name="Default__KFGameConductor"
   ObjectArchetype=Object'Core.Default__Object'
}
