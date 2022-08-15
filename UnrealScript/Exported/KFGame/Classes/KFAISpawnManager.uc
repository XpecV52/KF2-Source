//=============================================================================
// KFAISpawnManager
//=============================================================================
// The KFAISpawnManager is created from the KFGameInfo to manage the wave
// based Zed spawning.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================

class KFAISpawnManager extends Object
	within KFGameInfo
	dependson(KFSpawnVolume)
	config(Game);







	







	 



		
		
	







 
















 
































































































































































































































#linenumber 70;

#linenumber 17;

/** The spawn group setup of a wave */
var array<KFAISpawnSquad>				AvailableSquads;

/** All the waves*/
var	array<KFAIWaveInfo>					Waves;

/** Controls the frequency of the AI spawning sine wave. Used to increase/decrease speed and intensity of AI spawning */
var float								SineWaveFreq;
/** WorldTime at wave start */
var float								WaveStartTime;
/** Total time that combat waves have been active */
var float								TotalWavesActiveTime;
/** The time the next AI group is spaning */
var float								TimeUntilNextSpawn;
/** Total num AI spawned in this wave */
var	int									WaveTotalAI;
/** Maximum number of AI that can be active at one time */
var const byte							MaxMonsters;
/** Maximum number of AI that can be active at one time in solo */
var() byte							    MaxMonstersSolo[4];

/** Used for arrays to modify spawn rate */
struct SpawnRateModifier
{
    var() array<float> RateModifier;
};

/** How much to modify the spawn rate for solo play by difficulty */
var() SpawnRateModifier 				SoloWaveSpawnRateModifier[4];
/** How much to modify the spawn rate for early waves. Generally used to make early waves more intense */
var() float 						    EarlyWaveSpawnRateModifier[4];
/** Waves below this index will be considered "early waves" waves after this index will be considered "later waves" */
var	int									EarlyWaveIndex;
/** The number of zeds we will spawn in a whole wave is so short, the special squad may not spawn. So force it if we need to */
var bool                                bForceRequiredSquad;
/** Recycle the special squad every other time through the squad list */
var bool                                bRecycleSpecialSquad;
/** Recycle the special squad every other time through the squad list */
var int                                 NumSpawnListCycles;
/** List of available AI spawn volumes */
var array<KFSpawnVolume>				SpawnVolumes;

var ESquadType							DesiredSquadType;

/** If set, can be used to spawn in place of the KF1 style volume spawns */
var	KFSpawner							ActiveSpawner;

/** Amount of extra zeds added to the pool when zeds are short during an objective */
var const int							ObjExtraAI;

/** IDs into the AIClassList array */
enum EAIType
{
	AT_Clot,
	AT_SlasherClot,
	AT_AlphaClot,
	AT_Crawler,
	AT_GoreFast,
	AT_Stalker,
	AT_Scrake,
	AT_FleshPound,
	AT_Bloat,
	AT_Siren,
	AT_Husk,
	AT_BossRandom,
};

/** The list of zeds the spawn manager currently has queued up to spawn*/
var array< class<KFPawn_Monster> >  LeftoverSpawnSquad;

/** The boss minion spawn squad we're currently spawning */
var array<KFAISpawnSquad>           BossMinionsSpawnSquads;
/** Boss minions are currently being summoned */
var bool bSummoningBossMinions;
/** Maximum number of boss minions to have active at one time for this current spawning set */
var int MaxBossMinions;

/** List of currently connected players. Stored here to save time going through all controllers */
var array <Controller>	RecentSpawnSelectedHumanControllerList;






/************************************************************************************
 * Debugging
 ***********************************************************************************/
var config bool bLogAISpawning;
var config bool bLogWaveSpawnTiming;
var config bool bLogRateVolume;

static function string ZedTypeToString(EAIType AiTypeToConvert)
{






























	return "";
}

/** Let's get this party started (Called on match start) */
function Initialize()
{
	if (bLogAISpawning) LogInternal("KFAISpawnManager.Initialize()");

	//LoadAIClasses();
	RegisterSpawnVolumes();
}

/** Adds all available spawn volumes to the list */
function RegisterSpawnVolumes()
{
	local KFSpawnVolume MySpawnVolume;

    SpawnVolumes.Remove(0, SpawnVolumes.Length);

	foreach AllActors(class'KFSpawnVolume', MySpawnVolume)
	{
		// bDisabled flag used for debugging to isolate specific volumes
		if( !MySpawnVolume.bDisabled )
		{
			SpawnVolumes.AddItem(MySpawnVolume);
		}
	}

	if (bLogAISpawning) LogInternal("KFAISpawnManager.RegisterSpawnVolumes() Added" @ SpawnVolumes.Length @ "Volumes");
}

/** Next wave's basic setup */
function SetupNextWave(byte NextWaveIndex)
{
	local KFGameReplicationInfo KFGRI;

	if( NextWaveIndex < Waves.Length )
	{
        // Recycle special squads on higher difficulties
        if( GameDifficulty == 2 || GameDifficulty >= 3) // Suicidal or Hell on Earth
        {
            bRecycleSpecialSquad=true;
            //`log("Recycling the special squads!!!");
        }

		// Clear out any leftover spawn squads from last wave
        LeftoverSpawnSquad.Length = 0;

        // Initialize the spawn list cycles
        NumSpawnListCycles=1;

        // Scale the number of zeds if the wave can be recycled
        if( Waves[NextWaveIndex].bRecycleWave )
        {
        	WaveTotalAI =	Waves[NextWaveIndex].MaxAI *
							DifficultyInfo.GetPlayerNumMaxAIModifier( GetNumPlayers() ) *
							DifficultyInfo.GetDifficultyMaxAIModifier();
        }
        else
        {
         	WaveTotalAI =	Waves[NextWaveIndex].MaxAI;
		}

        GetAvailableSquads(NextWaveIndex, true);

		WaveStartTime = WorldInfo.TimeSeconds;
		TimeUntilNextSpawn = 5.f;

        // Reset the total waves active time on first wave
		if( NextWaveIndex == 0 )
		{
            TotalWavesActiveTime = 0;
        }

    	KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
    	if( KFGRI != none && KFGRI.bDebugSpawnManager )
    	{
    		KFGRI.CurrentSineMod = GetSineMod();
    		KFGRI.CurrentNextSpawnTime = TimeUntilNextSpawn;
    		KFGRI.CurrentSineWavFreq = GetSineWaveFreq();
    		KFGRI.CurrentNextSpawnTimeMod = GetNextSpawnTimeMod();
    		KFGRI.CurrentTotalWavesActiveTime = TotalWavesActiveTime;
    		KFGRI.CurrentMaxMonsters = GetMaxMonsters();
    		KFGRI.CurrentTimeTilNextSpawn = TimeUntilNextSpawn;
    	}
	}

	if (bLogAISpawning || bLogWaveSpawnTiming) LogInternal("KFAISpawnManager.SetupNextWave() NextWave:" @ NextWaveIndex @ "WaveTotalAI:" @ WaveTotalAI);
}

function GetAvailableSquads(byte MyWaveIndex, optional bool bNeedsSpecialSquad=false)
{
	local int i, j, TotalZedsInSquads;

    if( Waves[MyWaveIndex] != none )
	{
		NumSpawnListCycles++;

        Waves[MyWaveIndex].GetNewSquadList(AvailableSquads);

		if (bLogAISpawning) LogInternal("KFAISpawnManager NEW SQUAD LIST for Wave:" @ MyWaveIndex);
		if( bNeedsSpecialSquad )
		{
		 	Waves[MyWaveIndex].GetSpecialSquad(AvailableSquads);
		 	if (bLogAISpawning) LogInternal("KFAISpawnManager SPECIAL SQUAD for Wave:" @ MyWaveIndex);

            for( i = 0; i < AvailableSquads.Length; i++ )
        	{
        		for( j = 0; j < AvailableSquads[i].MonsterList.Length; j++ )
        		{
                    TotalZedsInSquads += AvailableSquads[i].MonsterList[j].Num;
        		}
        	}

            //`log("WaveTotalAI :"$WaveTotalAI$" TotalZedsInSquads = "$TotalZedsInSquads);
    	 	if( WaveTotalAI < TotalZedsInSquads )
    	 	{
                bForceRequiredSquad = true;
            }
		}
	}
}

/** When we recycle a squad/have a leftover squad, make sure it knows what size
*   Volume it can spawn in. If for instance a larger zed has been removed from
*   the list, now the rest of the zeds may be able to spawn elsewhere. That or
*   the DesiredSquadType might have been initialized for a different size of
*   Zed groups, and be completely invalid and unset for this leftover group
*/
function SetDesiredSquadTypeForZedList( array< class<KFPawn_Monster> >  NewSquad )
{
	local int i;
	local ESquadType LargestMonsterSquadType;

	// Start with the smallest size, and the crank it up if the squad is larger
	LargestMonsterSquadType = EST_Crawler;

	for ( i = 0; i < NewSquad.Length; i++ )
	{
    	if (bLogAISpawning) LogInternal(GetFuncName()$" LeftOverSquad "$NewSquad[i]$" MinSquadType:"$ GetEnum(enum'ESquadType',NewSquad[i].default.MinSpawnSquadSizeType));
        if( NewSquad[i].default.MinSpawnSquadSizeType < LargestMonsterSquadType )
        {
            LargestMonsterSquadType = NewSquad[i].default.MinSpawnSquadSizeType;
        }
	}

	DesiredSquadType = LargestMonsterSquadType;

    if (bLogAISpawning) LogInternal(GetFuncName()$" adjusted largest squad for squad leftover squad to "$GetEnum(enum'ESquadType',DesiredSquadType));
}


/** generate a list of classes to spawn for a given squad */
function GetSpawnListFromSquad(byte SquadIdx, out array< KFAISpawnSquad > SquadsList, out array< class<KFPawn_Monster> >  AISpawnList)
{
	local KFAISpawnSquad Squad;
	local EAIType AIType;
	local int i, j;
	local ESquadType LargestMonsterSquadType;

	Squad = SquadsList[SquadIdx];

	// Start with the smallest size, and the crank it up if the squad is larger
	LargestMonsterSquadType = EST_Crawler;

	for ( i = 0; i < Squad.MonsterList.Length; i++ )
	{
		for ( j = 0; j < Squad.MonsterList[i].Num; j++ )
		{
			if( Squad.MonsterList[i].CustomClass != None )
			{
				AISpawnList.AddItem(Squad.MonsterList[i].CustomClass);
			}
			else
			{
				AIType = Squad.MonsterList[i].Type;
				if( AIType == AT_BossRandom )
				{







					AISpawnList.AddItem(AIBossClassList[Rand(AIBossClassList.Length)]);
				}
				else
				{
					AISpawnList.AddItem(AIClassList[AIType]);
				}
			}

			if( AISpawnList[AISpawnList.Length - 1].default.MinSpawnSquadSizeType < LargestMonsterSquadType )
            {
                LargestMonsterSquadType = AISpawnList[AISpawnList.Length - 1].default.MinSpawnSquadSizeType;
            }
		}
	}
	if( AISpawnList.Length > 0 )
	{
		DesiredSquadType = Squad.MinVolumeType;

		if( LargestMonsterSquadType < DesiredSquadType )
        {
            DesiredSquadType = LargestMonsterSquadType;
            //`log("adjusted largest squad for squad "$Squad$" to "$GetEnum(enum'ESquadType',DesiredSquadType));
        }
	}
}

/** Returns a random AIGroup from the "waiting" list */
function array< class<KFPawn_Monster> > GetNextSpawnList()
{
	local array< class<KFPawn_Monster> >  NewSquad, RequiredSquad;
	local int RandNum, AINeeded;

    // Use the LeftoverSpawnSquad if it exists
    if( LeftoverSpawnSquad.Length > 0 )
    {
        if( bLogAISpawning )
        {
            LogMonsterList(LeftoverSpawnSquad, "Leftover LeftoverSpawnSquad");
        }
        NewSquad = LeftoverSpawnSquad;

        // Make sure we properly initialize the DesiredSquadType for the leftover squads, otherwise they will just use whatever size data was left in the system
        SetDesiredSquadTypeForZedList( NewSquad );
    }
    // Otherwise grab a new squad
    else
    {
    	if( !IsAISquadAvailable() )
    	{
    		if( !bSummoningBossMinions )
    		{
                // WaveNum Displays 1 - Length, Squads are ordered 0 - (Length - 1)
                if( bRecycleSpecialSquad && NumSpawnListCycles %2 == 1 )
                {
                    //`log("Recycling special squad!!! NumSpawnListCycles: "$NumSpawnListCycles);
                    GetAvailableSquads(MyKFGRI.WaveNum - 1, true);
                }
                else
                {
                    //`log("Not recycling special squad!!! NumSpawnListCycles: "$NumSpawnListCycles);
                    GetAvailableSquads(MyKFGRI.WaveNum - 1);
                }
            }
            else
            {
                // Replace the regular squads with boss minions
                AvailableSquads = BossMinionsSpawnSquads;
            }
    	}

    	// select a random squad from the list
    	RandNum = Rand(AvailableSquads.Length);

    	// If we're forcing the required squad, and it already got picked, clear the flag
    	if( bForceRequiredSquad && RandNum == (AvailableSquads.Length - 1) )
    	{
           //`log("We spawned the required squad!");
    	   bForceRequiredSquad=false;
    	}

        if( bLogAISpawning )
        {
            LogAvailableSquads();
        }

    	if (bLogAISpawning) LogInternal("KFAISpawnManager.GetNextAIGroup() Wave:"@MyKFGRI.WaveNum@"Squad:"@AvailableSquads[RandNum]@"Index:"@RandNum);

    	// generate list of classes to spawn
    	GetSpawnListFromSquad(RandNum, AvailableSquads, NewSquad);

    	// Grab the required squad (special squad) which will be the last squad in the array,
    	// if we're about to run out of zeds we can spawn, and the special squad hasn't spawned yet
    	if( bForceRequiredSquad )
    	{
        	// generate list of classes to spawn
        	GetSpawnListFromSquad((AvailableSquads.Length - 1), AvailableSquads, RequiredSquad);

            if( (NumAISpawnsQueued + NewSquad.Length + RequiredSquad.Length) > WaveTotalAI )
            {
                NewSquad = RequiredSquad;
                RandNum = (AvailableSquads.Length - 1);
                //LogMonsterList(NewSquad, "RequiredSquad");
                //`log("Spawning required squad NumAISpawnsQueued: "$NumAISpawnsQueued$" NewSquad.Length: "$NewSquad.Length$" RequiredSquad.Length: "$RequiredSquad.Length$" WaveTotalAI: "$WaveTotalAI);
                bForceRequiredSquad=false;
            }
    	}

    	// remove selected squad from the list of available squads
    	AvailableSquads.Remove(RandNum, 1);

        if( bLogAISpawning )
        {
            LogAvailableSquads();
        }
	}

	// Clamp list by NumAINeeded()
	AINeeded = GetNumAINeeded();
	if( AINeeded < NewSquad.Length )
	{
		LeftoverSpawnSquad = NewSquad;
		// Clear out the monsters we're about to spawn from the leftover list
        LeftoverSpawnSquad.Remove(0,AINeeded);

        // Cut off the leftovers from the new monster list
        NewSquad.Length = AINeeded;
	}
	else
	{
        // If we're spawning all the monsters in the list, there are no leftovers
        LeftoverSpawnSquad.Length = 0;
	}

    if( bLogAISpawning )
    {
    	LogMonsterList(NewSquad, "NewSquad");
    	LogMonsterList(LeftoverSpawnSquad, "LeftoverSpawnSquad");
    }

	return NewSquad;
}

/** Print out a list of monsters */
function LogMonsterList(array< class<KFPawn_Monster> >  MonsterList, String ListName)
{
    local int i;

	LogInternal("Monster List "$ListName$" Length = "$MonsterList.Length);
    for( i = 0; i < MonsterList.Length; i++ )
	{
        LogInternal("MonsterList "$ListName$" element "$i$" is "$MonsterList[i]);
	}
}

/** Print out the available squad list */
function LogAvailableSquads()
{
    local int i, j;

	LogInternal("Current Loaded Wave Setup");
    for( i = 0; i < AvailableSquads.Length; i++ )
	{
		for( j = 0; j < AvailableSquads[i].MonsterList.Length; j++ )
		{
            LogInternal("AvailableSquads "$i$" MonsterList "$j$" is "$GetEnum(enum'EAIType',SpawnManager.AvailableSquads[i].MonsterList[j].Type)$" Num: "$SpawnManager.AvailableSquads[i].MonsterList[j].Num$" SquadName: "$AvailableSquads[i]);
		}
	}
}

/** Another spawn group avaiblale */
function bool IsAISquadAvailable()
{
	if (bLogAISpawning) LogInternal("KFAISpawnManager.IsAISquadAvailable()" @ string(AvailableSquads.Length > 0));
	return ( AvailableSquads.Length > 0 );
}

/** Any AI left for this wave */
function bool IsFinishedSpawning()
{
    if( ActiveSpawner != none && ActiveSpawner.bIsSpawning && ActiveSpawner.PendingSpawns.Length > 0 )
    {
        if (bLogAISpawning) LogInternal("KFAISpawnManager.IsFinishedSpawning() ActiveSpawner Still Spawning " @ string(ActiveSpawner != none && ActiveSpawner.bIsSpawning && ActiveSpawner.PendingSpawns.Length > 0));
        return false;
    }

    // Keep spawning the boss minions until we tell it to stop!
    if( bSummoningBossMinions )
    {
        return false;
    }

	if( NumAISpawnsQueued >= WaveTotalAI )
	{
		if( MyKFGRI.CurrentObjective != none && MyKFGRI.CurrentObjective.InfiniteZedsEnabled() )
		{
			WaveTotalAI += ObjExtraAI;
			MyKFGRI.WaveTotalAICount = WaveTotalAI;
			MyKFGRI.AIRemaining += ObjExtraAI;

			return false;
		}

		if (bLogAISpawning) LogInternal("KFAISpawnManager.IsFinishedSpawning()" @ string(NumAISpawnsQueued >= WaveTotalAI));
		return true;
	}

	return false;
}

/**
* Returns the next AI spawn time
*/
function float CalcNextGroupSpawnTime()
{
	local float NextSpawnDelay, SineMod;
	local KFMapInfo KFMI;
	local KFGameReplicationInfo KFGRI;

	// Any leftover zeds from a group that didn't spawn, spawn them right away!
    if( LeftoverSpawnSquad.Length > 0 )
	{
        return 0;
	}
	else
	{
    	KFMI = KFMapInfo(WorldInfo.GetMapInfo());
    	SineMod = GetSineMod();

    	NextSpawnDelay = KFMI != none ? KFMI.WaveSpawnPeriod : class'KFMapInfo'.default.WaveSpawnPeriod;
    	NextSpawnDelay *= GetNextSpawnTimeMod();
    	NextSpawnDelay += SineMod * (NextSpawnDelay * 2);

    	KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
    	if( KFGRI != none && KFGRI.bDebugSpawnManager )
    	{
    		KFGRI.CurrentSineMod = SineMod;
    		KFGRI.CurrentNextSpawnTime = NextSpawnDelay;
    		KFGRI.CurrentSineWavFreq = GetSineWaveFreq();
    		KFGRI.CurrentNextSpawnTimeMod = GetNextSpawnTimeMod();
    	}
	}

	if (bLogAISpawning || bLogWaveSpawnTiming) LogInternal(GetFuncName()$" NextSpawnTime:" @ WorldInfo.TimeSeconds + NextSpawnDelay @"NextSpawnDelay:"@NextSpawnDelay$" SineMod: "$SineMod$" WaveSpawnPeriod: "$(KFMI != none ? KFMI.WaveSpawnPeriod : class'KFMapInfo'.default.WaveSpawnPeriod)$" GetNextSpawnTimeMod(): "$GetNextSpawnTimeMod());

	return NextSpawnDelay;
}

/**
* Returns a modifer based on wave and player number
* to adjust the next spawn time
*/
function float GetNextSpawnTimeMod()
{
	local byte NumLivingPlayers;
	local float SpawnTimeMod;
	local float UsedEarlyWaveRateMod;
	local float UsedSoloWaveRateMod;

	NumLivingPlayers = GetLivingPlayerCount();
	SpawnTimeMod = 1.0;
	UsedSoloWaveRateMod = 1.0;

    // Scale solo spawning rate by wave and difficulty
    if( bOnePlayerAtStart )
    {
    	if( GameDifficulty < ArrayCount(SoloWaveSpawnRateModifier) )
    	{
            if( MyKFGRI.WaveNum <= SoloWaveSpawnRateModifier[GameDifficulty].RateModifier.Length )
            {
                UsedSoloWaveRateMod = SoloWaveSpawnRateModifier[GameDifficulty].RateModifier[MyKFGRI.WaveNum - 1];
            }
            else
            {
                UsedSoloWaveRateMod = SoloWaveSpawnRateModifier[GameDifficulty].RateModifier[SoloWaveSpawnRateModifier[GameDifficulty].RateModifier.Length -1];
            }
    	}
    	else
    	{

            if( MyKFGRI.WaveNum <= SoloWaveSpawnRateModifier[GameDifficulty].RateModifier.Length )
            {
                UsedSoloWaveRateMod = SoloWaveSpawnRateModifier[ArrayCount(SoloWaveSpawnRateModifier) - 1].RateModifier[MyKFGRI.WaveNum - 1];
            }
            else
            {
                UsedSoloWaveRateMod = SoloWaveSpawnRateModifier[ArrayCount(SoloWaveSpawnRateModifier) - 1].RateModifier[SoloWaveSpawnRateModifier[GameDifficulty].RateModifier.Length -1];
            }
    	}
    }

	if ( MyKFGRI.WaveNum < EarlyWaveIndex )
	{
		if ( NumLivingPlayers == 4 )
		{
		    SpawnTimeMod = 0.85;
		}
		else if ( NumLivingPlayers == 5 )
		{
		    SpawnTimeMod = 0.65;
		}
		else if ( NumLivingPlayers >= 6 )
		{
		    SpawnTimeMod = 0.3;
		}

        // Scale the spawning rate of early waves (generally to make them more intense)
    	if( GameDifficulty < ArrayCount(EarlyWaveSpawnRateModifier) )
    	{
    	   UsedEarlyWaveRateMod = EarlyWaveSpawnRateModifier[GameDifficulty];
    	}
    	else
    	{
    	   UsedEarlyWaveRateMod = EarlyWaveSpawnRateModifier[ArrayCount(EarlyWaveSpawnRateModifier) - 1];
    	}

        SpawnTimeMod *= UsedEarlyWaveRateMod;
        SpawnTimeMod *= UsedSoloWaveRateMod;

        return SpawnTimeMod;
	}
	// Give a slightly bigger breather in the later waves
	else
	{
		if ( NumLivingPlayers <= 3 )
		{
		    if( bOnePlayerAtStart )
		    {
                return 1.1 * UsedSoloWaveRateMod;
		    }
		    else
		    {
                return 1.1;
            }
		}
		else if ( NumLivingPlayers == 4 )
		{
		    return 1.0;
		}
		else if ( NumLivingPlayers == 5 )
		{
		    return 0.75;
		}
		else if ( NumLivingPlayers >= 6 )
		{
		    return 0.6;
		}
	}

	SpawnTimeMod *= UsedSoloWaveRateMod;

	return SpawnTimeMod;
}

/** Modify the next spawn time based on a sine wave value */
function float GetSineMod()
{
	return 1.0 - Abs(sin( TotalWavesActiveTime * GetSineWaveFreq() ));
}

/** Returns the current spawn intensity */
function float GetSineWaveFreq()
{
	return SineWaveFreq;
}

/** Objectives can change the spawn intensity */
function SetSineWaveFreq(float NewFreq)
{
	SineWaveFreq = NewFreq;
}

/** special spawning for boss summon ability */
function SummonBossMinions( array<KFAISpawnSquad> NewMinionSquad, int NewMaxBossMinions )
{
	local int NumLivePlayers;

    // Clear out the previous boss minion spawning before adding new minions
    if( bSummoningBossMinions )
    {
        StopSummoningBossMinions();
    }

    bSummoningBossMinions=true;

    // Store the squad that were spawning with the boss
    BossMinionsSpawnSquads = NewMinionSquad;
    AvailableSquads = BossMinionsSpawnSquads;

    // Calculate how many minions to spawn basedoff the base
	MaxBossMinions = NewMaxBossMinions;
    NumLivePlayers = GetLivingPlayerCount();

    // Scale boss minions numbers by player count
    if( NumLivePlayers >= 6 )
    {
        MaxBossMinions *= 2;
    }
    else if( NumLivePlayers > 3 )
    {
        MaxBossMinions *= 1.875;
    }
    else if( NumLivePlayers > 1 )
    {
        MaxBossMinions *= 1.5;
    }

    // Don't let us get more Boss minions than we allow total monsters
    MaxBossMinions = Min(MaxBossMinions, GetMaxMonsters());

    if (bLogAISpawning) LogInternal(self@GetFuncName()$" MaxBossMinions:"$MaxBossMinions);
}

/** Stop spawning boss minions */
function StopSummoningBossMinions()
{
    bSummoningBossMinions=false;
    // Clear out the boss minions we added to the AvailableSquads
    AvailableSquads.Length=0;
}

/** Find best spawn location and spawn a squad there */
function int SpawnSquad( array< class<KFPawn_Monster> > AIToSpawn )
{
	local KFSpawnVolume KFSV;
	local int SpawnerAmount, VolumeAmount, FinalAmount, i;






	// first check scripted spawners
	if( ActiveSpawner != None && ActiveSpawner.CanSpawnHere(DesiredSquadType) )
	{
		SpawnerAmount = ActiveSpawner.SpawnSquad(AIToSpawn);

		if (bLogAISpawning) LogInternal("KFAISpawnManager.SpawnAI() Using Spawner AIs spawned:" @ SpawnerAmount @ "in Spawner:" @ ActiveSpawner);
	}
	// otherwise use default spawn volume selection
	if( AIToSpawn.Length > 0 )
	{
		KFSV = GetBestSpawnVolume(AIToSpawn);

		if( KFSV != None )
		{




            KFSV.VolumeChosenCount++;

            if( bLogAISpawning )
            {
    			LogMonsterList(AIToSpawn, "SpawnSquad Pre Spawning");
            }

			VolumeAmount = KFSV.SpawnWave(AIToSpawn, true);
		    if (bLogAISpawning) LogInternal("KFAISpawnManager.SpawnAI() AIs spawned:" @ VolumeAmount @ "in Volume:" @ KFSV);

            if( bLogAISpawning )
            {
                LogMonsterList(AIToSpawn, "SpawnSquad Post Spawning");
            }









		}

		if( VolumeAmount == 0 )
		{
		  // `warn(self@GetFuncName()$" No spawn volume with a positive rating, no AI will spawn!!!");
		}
	}

	FinalAmount = VolumeAmount + SpawnerAmount;
	RefreshMonsterAliveCount();

	if( AIToSpawn.Length > 0 )
	{
        //`warn(self@GetFuncName()$" Didn't spawn the whole list of AI!!!");













        if( bLogAISpawning )
        {
            LogMonsterList(AIToSpawn, "SpawnSquad Incomplete Spawn Remaining");
            LogMonsterList(LeftoverSpawnSquad, "Failed Spawn Before Adding To Leftovers");
        }
    	// Add any failed spawns back into the LeftoverSpawnSquad to rapidly spawn somewhere else
        for ( i = 0; i < AIToSpawn.Length; i++ )
    	{
            LeftoverSpawnSquad[LeftoverSpawnSquad.Length] = AIToSpawn[i];
    	}

        if( bLogAISpawning )
        {
    	   LogMonsterList(LeftoverSpawnSquad, "Failed Spawn After Adding To Leftovers");
    	}
	}

    /* __TW_ANALYTICS_ */
	if( bEnableGameAnalytics )
    	RecordSpawnInformation( KFSV, FinalAmount );

    return FinalAmount;
}

/**
 * Records AI debugging and tuning info for spawning
 */
/* __TW_ANALYTICS_ */
function RecordSpawnInformation( KFSpawnVolume BestSpawnVolume, int ZedsSpawned )
{
 	local KFPlayerController KFPC;
 	local vector ViewLoc;
 	local rotator ViewRot;

	foreach WorldInfo.AllControllers(class'KFPlayerController', KFPC)
	{
		if( KFPC.Pawn == none || !KFPC.Pawn.IsAliveAndWell() )
		{
			continue;
		}

        ViewLoc = KFPC.Pawn.GetPawnViewLocation();
        ViewRot = KFPC.Pawn.GetViewRotation();

    	if(WorldInfo.Game != None && KFGameInfo(WorldInfo.Game).GameplayEventsWriter != None && KFGameInfo(WorldInfo.Game).GameplayEventsWriter.IsSessionInProgress()){KFGameInfo(WorldInfo.Game).GameplayEventsWriter.LogPlayersAtSpawn(KFPC,ViewLoc,ViewRot);};
	}
	if(WorldInfo.Game != None && KFGameInfo(WorldInfo.Game).GameplayEventsWriter != None && KFGameInfo(WorldInfo.Game).GameplayEventsWriter.IsSessionInProgress()){KFGameInfo(WorldInfo.Game).GameplayEventsWriter.LogBestSpawnVolume(BestSpawnVolume, MyKFGRI.WaveNum, ZedsSpawned);};
}

/** "Timer" */
function Update()
{
	if( IsWaveActive() )
	{
   		TotalWavesActiveTime += 1.0;
		TimeUntilNextSpawn -= 1.f;

        if( ShouldAddAI() )
        {
			NumAISpawnsQueued += SpawnSquad(GetNextSpawnList());
            TimeUntilNextSpawn = CalcNextGroupSpawnTime();
        }
	}
}

/** Should we? */
function bool ShouldAddAI()
{
	//`log("KFAISpawnManager.ShouldAddAI()" @ string( (TimeUntilNextSpawn <= 0s && IsAIAvailable()) && (GetMaxMonsters() > AIAliveCount) ), bLogAISpawning);

	// If it is time to spawn the next squad, or there are any leftovers from the last batch spawn them
	if( (LeftoverSpawnSquad.Length > 0 || TimeUntilNextSpawn <= 0) && !IsFinishedSpawning() )
	{
        return GetNumAINeeded() > 0;
	}

	return false;
}

function int GetMaxMonsters()
{
    local int UsedMaxMonsters;

    if( WorldInfo.NetMode == NM_StandAlone && GetLivingPlayerCount() == 1 )
    {
    	if( GameDifficulty < ArrayCount(MaxMonstersSolo) )
    	{
    	   UsedMaxMonsters = MaxMonstersSolo[GameDifficulty];
    	}
    	else
    	{
    	   UsedMaxMonsters = MaxMonstersSolo[ArrayCount(MaxMonstersSolo) - 1];
    	}
    }
    else
    {
        UsedMaxMonsters = MaxMonsters;
    }

    return UsedMaxMonsters;
}

/** Max currently wanted AI num */
function int GetNumAINeeded()
{
	local int AINeeded;
	local int UsedMaxMonsters;

	if( !bSummoningBossMinions )
	{
	   UsedMaxMonsters =  GetMaxMonsters();
	}
	else
	{
	   UsedMaxMonsters = MaxBossMinions + 1; // Add 1 to include the Boss himself
	}

    if( ActiveSpawner != none && ActiveSpawner.bIsSpawning && ActiveSpawner.PendingSpawns.Length > 0 )
    {
        // Don't add extra AI if we've queued up AI to spawn at a spawner
        AINeeded = (UsedMaxMonsters - ActiveSpawner.PendingSpawns.Length) - AIAliveCount;
        if (bLogAISpawning) LogInternal("KFAISpawnManager.GetNumAINeeded() ActiveSpawner.PendingSpawns.Length:"@ActiveSpawner.PendingSpawns.Length);
    }
    else
    {
        AINeeded = UsedMaxMonsters - AIAliveCount;
    }

    if( !bSummoningBossMinions )
    {
    	if( AINeeded > WaveTotalAI )
    	{
    		AINeeded = WaveTotalAI;
    	}

    	if( AINeeded > WaveTotalAI - NumAISpawnsQueued )
    	{
    		AINeeded = WaveTotalAI - NumAISpawnsQueued;
    	}
	}

    if (bLogAISpawning) LogInternal("KFAISpawnManager.GetNumAINeeded() WaveTotalAI:"@WaveTotalAI@"AIAliveCount:"@AIAliveCount@"NumAISpawnsQueued:"@NumAISpawnsQueued@"AINeeded:"@AINeeded);

	return AINeeded;
}

/** Initialize the list of Human team Controllers to use for spawn selection*/
function InitControllerList()
{
    local int i;
    local Controller C;

	// Validate the existing list
    for( i = RecentSpawnSelectedHumanControllerList.Length - 1; i >= 0; i-- )
    {
        // Must not be null, have a pawn, be alive, and be on the right team
        if( RecentSpawnSelectedHumanControllerList[i] == none || RecentSpawnSelectedHumanControllerList[i].Pawn == none
            || !RecentSpawnSelectedHumanControllerList[i].Pawn.IsAliveAndWell()
            || RecentSpawnSelectedHumanControllerList[i].GetTeamNum() != 0 )
        {

            if( RecentSpawnSelectedHumanControllerList[i] != none && RecentSpawnSelectedHumanControllerList[i].PlayerReplicationInfo != none )
            {
                if (bLogAISpawning) LogInternal(GetFuncName()$" Removing "$RecentSpawnSelectedHumanControllerList[i].PlayerReplicationInfo.PlayerName$" From HumanPRIList");
            }
            else
            {
                if (bLogAISpawning) LogInternal(GetFuncName()$" Removing empty Controller From HumanPRIList");
            }

            RecentSpawnSelectedHumanControllerList.Remove( i, 1 );
        }
    }

    if( MyKFGRI != none )
    {
        if( RecentSpawnSelectedHumanControllerList.Length == 0 )
        {
        	for ( i = 0; i < MyKFGRI.PriArray.Length; i++ )
        	{
        		C = Controller(MyKFGRI.PriArray[i].Owner);

                // If not a valid controller, on to the next one
                if( C == none || C.Pawn == none || !C.Pawn.IsAliveAndWell() || C.GetTeamNum() != 0 )
                {
                    continue;
                }

                RecentSpawnSelectedHumanControllerList[RecentSpawnSelectedHumanControllerList.Length] = C;
                if (bLogAISpawning) LogInternal(GetFuncName()$" Adding "$RecentSpawnSelectedHumanControllerList[RecentSpawnSelectedHumanControllerList.Length - 1].PlayerReplicationInfo.PlayerName$" to RecentSpawnSelectedHumanControllerList");
            }
        }
    }
}

function KFSpawnVolume GetBestSpawnVolume( array< class<KFPawn_Monster> > AIToSpawn, optional Controller OverrideController, optional bool bTeleporting, optional float MinDistSquared )
{
	local int VolumeIndex, BestIndex, ControllerIndex;
	local float BestRating, CurrentRating;
	local Controller RateController;

    if( OverrideController != none )
    {
        RateController = OverrideController;
    }
    else
    {
        // Get the Controller list ready for spawn selection
        InitControllerList();

        if( RecentSpawnSelectedHumanControllerList.Length > 0 )
        {
            // Randomly grab a Human PRI from the list to use for rating zed spawning
            ControllerIndex = Rand(RecentSpawnSelectedHumanControllerList.Length);
            RateController = RecentSpawnSelectedHumanControllerList[ControllerIndex];
            RecentSpawnSelectedHumanControllerList.Remove( ControllerIndex, 1 );
            if (bLogAISpawning) LogInternal(GetFuncName()$" Rating with Controller "$RateController.PlayerReplicationInfo.PlayerName$" From RecentSpawnSelectedHumanControllerList");
        }
    }

    // If there were no controllers to rate against, return none
    if( RateController == none )
    {
        if (bLogAISpawning) WarnInternal(GetFuncName()$" no controllers to rate spawning with!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        return none;
    }

	BestRating = 0.f;
	BestIndex = -1;

	for ( VolumeIndex = 0; VolumeIndex < SpawnVolumes.Length; VolumeIndex++ )
	{
		CurrentRating = SpawnVolumes[VolumeIndex].RateVolume( DesiredSquadType, RateController, BestRating, bTeleporting, MinDistSquared );
		if( CurrentRating > BestRating )
		{
			BestRating = CurrentRating;
			BestIndex = VolumeIndex;
		}
	}

	if( BestIndex < 0 )
	{
	   //`warn(GetFuncName()$" No spawn volume with a positive rating!!!");
       return none;
	}

	if (bLogAISpawning) LogInternal(self@GetFuncName()@"returning chosen spawn volume"@SpawnVolumes[BestIndex]@"with a rating of"@BestRating);

	if( SpawnVolumes[BestIndex] != none && SpawnVolumes[BestIndex].bDebugRatingChecks )
	{
	   LogInternal(self@GetFuncName()@"returning chosen spawn volume"@SpawnVolumes[BestIndex]@"with a rating of"@BestRating);
       DrawDebugLine(SpawnVolumes[BestIndex].Location,GetALocalPlayerController().ViewTarget.Location,0,255,0,TRUE);
	}

	return SpawnVolumes[BestIndex];
}

function UpdateSpawnCurveIntensity(float NewSineFreq)
{
	if( NewSineFreq != 0 )
	{
		SetSineWaveFreq(NewSineFreq);
	}
}

function ResetSpawnCurveIntensity()
{
	SetSineWaveFreq(default.SineWaveFreq);
}

defaultproperties
{
   SineWaveFreq=0.040000
   MaxMonsters=32
   MaxMonstersSolo(0)=16
   MaxMonstersSolo(1)=24
   MaxMonstersSolo(2)=24
   MaxMonstersSolo(3)=24
   SoloWaveSpawnRateModifier(0)=(RateModifier=(1.000000,1.000000,1.000000,1.000000))
   SoloWaveSpawnRateModifier(1)=(RateModifier=(1.000000,1.000000,1.000000,1.000000))
   SoloWaveSpawnRateModifier(2)=(RateModifier=(1.000000,1.000000,1.000000,1.000000))
   SoloWaveSpawnRateModifier(3)=(RateModifier=(1.000000,1.000000,1.000000,1.000000))
   EarlyWaveSpawnRateModifier(0)=1.000000
   EarlyWaveSpawnRateModifier(1)=0.800000
   EarlyWaveSpawnRateModifier(2)=0.800000
   EarlyWaveSpawnRateModifier(3)=0.700000
   EarlyWaveIndex=7
   ObjExtraAI=16
   Name="Default__KFAISpawnManager"
   ObjectArchetype=Object'Core.Default__Object'
}
