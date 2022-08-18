//=============================================================================
// KFAISpawnManager_Versus
//=============================================================================
// The KFAISpawnManager for Versus Survival mode
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Matt "Squirrlz" Farber
//=============================================================================
class KFAISpawnManager_Versus extends KFAISpawnManager
    within KFGameInfo_VersusSurvival;

/** Array of zeds reserved for players to spawn as */
var protected array<class<KFPawn_Monster> > ReservedPlayerZeds;

/** Chance of reserving each particular zed type */
var const array<float> ReservedPlayerZedChances;

/** The reserved zed queue limit */
var const int ReservedZedQueueLimit;

/** TRUE when boss has been spawned in Versus */
var protected bool bBossSpawned;

/** How long to wait between spawn cycles during the boss round */
var protected float BossSpawnPlayerInterval;

/** The interval between spawn attempts when we're down to only one survivor */
var protected float FinalSurvivorBossSpawnPlayerInterval;

/** The largest squad size in this wave */
var protected int LargestSquadSize;

/** We need to add our reserved zeds to the alive count */
function int GetAIAliveCount()
{
    return super.GetAIAliveCount() + ReservedPlayerZeds.Length;
}

/** Next wave's basic setup */
function SetupNextWave(byte NextWaveIndex)
{
    local int i, j, SquadZedCount;
    local array<KFAISpawnSquad> SquadList;

    super.SetupNextWave( NextWaveIndex );

    // Get the maximum squad size count
    LargestSquadSize = 0;
    Waves[NextWaveIndex].GetNewSquadList( SquadList );
    for( i = 0; i < AvailableSquads.Length; i++ )
    {
        for( j = 0; j < AvailableSquads[i].MonsterList.Length; j++ )
        {
            SquadZedCount += AvailableSquads[i].MonsterList[j].Num;
        }

        if( SquadZedCount > LargestSquadSize )
        {
            LargestSquadSize = SquadZedCount;
        }
    }
}

/** Assign and reserve zed squad members for human players if this is a versus game */
function AssignZedsToPlayers( out array<class<KFPawn_Monster> > NewZeds )
{
    local KFPlayerControllerVersus KFPCV;

    // Don't allow if this is not a normal wave
    if( !IsPlayerZedSpawnAllowed() )
    {
        return;
    }

    // First, give players that are waiting an immediate spawn
    foreach WorldInfo.AllControllers( class'KFPlayerControllerVersus', KFPCV )
    {
        if( KFPCV.GetTeamNum() == 255
            && (KFPCV.Pawn == none || !KFPCV.Pawn.IsAliveAndWell())
            && KFPCV.CanRestartPlayer()
            && KFPCV.PlayerZedSpawnInfo.PendingZedPawnClass == none )
        {
            if( ReservedPlayerZeds.Length > 0 )
            {
                GiveAvailableZedClass( KFPCV, ReservedPlayerZeds,, true );
                if( KFPCV.PlayerZedSpawnInfo.PendingZedPawnClass != none )
                {
                    continue;
                }
            }

            if( NewZeds.Length == 0 )
            {
                continue;
            }

            GiveAvailableZedClass( KFPCV, NewZeds );
        }
    }

    // Now reserve any remaining strong zeds for players
    ReserveStrongZedsForPlayers( NewZeds );
}

/** Gives a dead player a zed class to spawn with */
function GiveAvailableZedClass( KFPlayerControllerVersus KFPCV, out array<class<KFPawn_Monster> > AvailableZeds, optional bool bSecondPass, optional bool bReservedCheck )
{
    local int i, j;
    local int ZedIndex;
    local array<int> PassedOnZeds;
    local array<class<KFPawn_Monster> > PossibleZeds;

    // Clear our spawned zeds array if we've spawned as most of the zed types already
    if( KFPCV.HasSpawnedZeds.Length >= PlayerZedClasses.Length - 3 )
    {
        KFPCV.HasSpawnedZeds.Length = 0;
    }

    // Iterate through all available zeds and populate array with classes we haven't spawned as yet
    for( i = 0; i < AvailableZeds.Length; ++i )
    {
        for( j = 0; j < PlayerZedClasses.Length; ++j )
        {
            // Check our spawnzed zeds array to see if we've spawned as this class yet
            if( ClassIsChildOf(PlayerZedClasses[j], AvailableZeds[i]) )
            {
                if( j < KFPCV.HasSpawnedZeds.Length && KFPCV.HasSpawnedZeds[j] )
                {
                    PassedOnZeds[PassedOnZeds.Length] = j;
                    break;
                }

                PossibleZeds[PossibleZeds.Length] = AvailableZeds[i];
                break;
            }
        }
    }

    // Determine if we should check the list again or take over a zed instead
    if( PossibleZeds.Length == 0 )
    {
        // If this isn't a reserved zed check, either process second pass or find a takeover zed
        if( !bReservedCheck )
        {
            // See if we need to trim our spawned types array and start fresh
            if( !bSecondPass && PassedOnZeds.Length > 1 )
            {
                // Remove one of the zed types we passed on
                KFPCV.HasSpawnedZeds.Remove( PassedOnZeds[Rand(PassedOnZeds.Length)], 1 );

                // Do our second pass, with trimming
                GiveAvailableZedClass( KFPCV, AvailableZeds, true );
                return;
            }

            // Try to take over an existing zed if we have no available squad slots
            FindTakeoverZed( KFPCV );
        }

        return;
    }

    // Pick a zed at random
    ZedIndex = Rand( PossibleZeds.Length );
    for( i = 0; i < PlayerZedClasses.Length; ++i )
    {
        if( ClassIsChildOf(PlayerZedClasses[i], PossibleZeds[ZedIndex]) )
        {
            KFPCV.PlayerZedSpawnInfo.PendingZedPawnClass = PlayerZedClasses[i];
            AvailableZeds.Remove( AvailableZeds.Find(PossibleZeds[ZedIndex]), 1 );
            KFPCV.HasSpawnedZeds[i] = true;

            // Only increment this if we are not taking a reserved zed
            // NOTE: The queue counter is already incremented when a reserved zed is taken out of the squad
            if( !bReservedCheck )
            {
                ++NumAISpawnsQueued;
            }
            return;
        }
    }
}

/** Reserves strong zeds for players */
function ReserveStrongZedsForPlayers( out array<class<KFPawn_Monster> > LeftoverZeds )
{
    local int i;
    local class<KFPawn_Monster> LeftoverZedClass;
    local float RandChance;

    for( i = 0; i < LeftoverZeds.Length; ++i )
    {
        LeftoverZedClass = LeftoverZeds[i];
        RandChance = fRand();

        // Always reserve Scrake or Fleshpound, and always at the front of the queue
        if( (RandChance <= ReservedPlayerZedChances[AT_Fleshpound] && ClassIsChildOf(PlayerZedClasses[AT_Fleshpound], LeftoverZedClass))
            || (RandChance <= ReservedPlayerZedChances[AT_Scrake] && ClassIsChildOf(PlayerZedClasses[AT_Scrake], LeftoverZedClass)) )
        {
            LeftoverZeds.Remove( i, 1 );
            ReservedPlayerZeds.Insert( 0, 1 );
            ReservedPlayerZeds[0] = LeftoverZedClass; 
            ++NumAISpawnsQueued;
            --i;
            continue;
        }

        // Don't add lesser zeds if the queue is full, but continue to search for FP, Scrake
        if( ReservedPlayerZeds.Length >= ReservedZedQueueLimit || IsTimerActive(nameOf(Timer_CheckForZedTakeovers)) )
        {
            continue;
        }

        // Husk, Siren, Bloat, Crawler
        if( (RandChance <= ReservedPlayerZedChances[AT_Husk] && ClassIsChildOf(PlayerZedClasses[AT_Husk], LeftoverZedClass))
            || (RandChance <= ReservedPlayerZedChances[AT_Siren] && ClassIsChildOf(PlayerZedClasses[AT_Siren], LeftoverZedClass))
            || (RandChance <= ReservedPlayerZedChances[AT_Bloat] && ClassIsChildOf(PlayerZedClasses[AT_Bloat], LeftoverZedClass))
            || (RandChance <= ReservedPlayerZedChances[AT_Crawler] && ClassIsChildOf(PlayerZedClasses[AT_Crawler], LeftoverZedClass)) )
        {
            LeftoverZeds.Remove( i, 1 );
            ReservedPlayerZeds[ReservedPlayerZeds.Length] = LeftoverZedClass;
            ++NumAISpawnsQueued;
            --i;
        }
    }
}

/** Pings the spawn volume to get the best location to spawn a player zed */
function vector GetSpawnLocation( class<KFPawn_Monster> MonsterPawnClass, KFSpawnVolume SpawnVolume )
{
    SpawnVolume.SetLastSpawnTime( WorldInfo.TimeSeconds );
    return SpawnVolume.FindSpawnLocation( MonsterPawnClass );
}

/** Attempt to respawn all player zeds */
protected function RespawnZedHumanPlayers( KFSpawnVolume SpawnVolume )
{
    local KFPlayerController KFPC;
    local KFPawn_Human KFPH;
    local float TempDistSQ, BestPlayerDistSQ;
    local vector SpawnLocation;
    local array<KFPlayerController> ZedPlayers;
    local vector NearestPlayerLocation;
    local int NumSpawned;
    local array<class<KFPawn_Monster> > MonsterPawnClasses;
    local int i;

    // If match is over or trader is open, do nothing
    if( MyKFGRI.bMatchIsOver || MyKFGRI.bTraderIsOpen )
    {
        return;
    }

    // Spawn a boss pawn
    if( MyKFGRI.WaveNum == MyKFGRI.WaveMax && !bBossSpawned )
    {
        // Make sure the zed takeover timer isn't running
        if( IsTimerActive(nameOf(Timer_CheckForZedTakeovers), self) )
        {
            ClearTimer( nameOf(Timer_CheckForZedTakeovers), self );
        }

        // Clear reserved list
        ReservedPlayerZeds.Length = 0;

        // Count how many player zeds we have
        foreach WorldInfo.AllControllers( class'KFPlayerController', KFPC )
        {
            // Clear out any pending zed spawn info
            KFPC.PlayerZedSpawnInfo.PendingZedPawnClass = none;
            KFPC.PlayerZedSpawnInfo.PendingZedSpawnLocation = vect(0,0,0);

            if( KFPC.CanRestartPlayer() && KFPC.GetTeamNum() == 255 )
            {
                ZedPlayers[ZedPlayers.Length] = KFPC;
            }
        }

        KFPC = ZedPlayers[Rand(ZedPlayers.Length)];

        if( KFPC != none )
        {
            // Set our boss pawn class
            KFPC.PlayerZedSpawnInfo.PendingZedPawnClass = PlayerBossClassList[Rand(PlayerBossClassList.Length)];
            MonsterPawnClasses[0] = KFPC.PlayerZedSpawnInfo.PendingZedPawnClass;

            // Make sure we get a valid spawn volume to start
            if( SpawnVolume != none && SpawnVolume.bNoPlayers )
            {
                SetDesiredSquadTypeForZedList( MonsterPawnClasses );
                SpawnVolume = GetBestSpawnVolume( MonsterPawnClasses,, KFPC );
            }

            // Make sure we kill the previous pawn
            if( KFPC.Pawn != none )
            {
                KFPC.Pawn.Destroy();
            }

            RestartPlayer( KFPC );
            if( KFPC.Pawn != none )
            {
                bBossSpawned = true;
                SpawnLocation = GetSpawnLocation( class<KFPawn_Monster>(KFPC.Pawn.Class), SpawnVolume );
                KFPC.SetLocation( SpawnLocation );
                KFPC.Pawn.SetLocation( SpawnLocation );
                KFPC.InitGameplayPostProcessFX();
                KFPC.PlayerZedSpawnInfo.PendingZedPawnClass = none;
                KFPC.PlayerZedSpawnInfo.PendingZedSpawnLocation = vect(0,0,0);
                ++NumAISpawnsQueued;

                RefreshMonsterAliveCount();
            }
            else
            {
                // Try to find a different player
                RespawnZedHumanPlayers( none );
                return;
            }
        }

        // Set the player zed spawn timer
        SetTimer( BossSpawnPlayerInterval, false, nameOf(Timer_SpawnBossPlayerZeds), self );
        return;
    }

    // Collect squads
    foreach WorldInfo.AllControllers( class'KFPlayerController', KFPC )
    {
        if( KFPC.Pawn != none && KFPC.Pawn.IsAliveAndWell() )
        {
            continue;
        }

        if( KFPC.PlayerZedSpawnInfo.PendingZedPawnClass != none && KFPC.CanRestartPlayer() && KFPC.GetTeamNum() == 255 )
        {
            ZedPlayers[ZedPlayers.Length] = KFPC;
            MonsterPawnClasses[MonsterPawnClasses.Length] = KFPC.PlayerZedSpawnInfo.PendingZedPawnClass;
        }
    }

    // Early out if we have no players to spawn
    if( ZedPlayers.Length == 0 )
    {
        CheckForTakeoverTimer();
        return;
    }

    // Get a spawn volume
    SetDesiredSquadTypeForZedList( MonsterPawnClasses );
    SpawnVolume = GetBestSpawnVolume( MonsterPawnClasses,, ZedPlayers[0] );

    // Get a nearby player, we'll rotate our new player zeds to point towards its location
    foreach WorldInfo.AllPawns( class'KFPawn_Human', KFPH )
    {
        if( KFPH.IsAliveAndWell() )
        {
            NearestPlayerLocation = KFPH.Location;
            TempDistSQ = VSizeSQ( SpawnVolume.Location - KFPH.Location );
            if( BestPlayerDistSQ == 0 || TempDistSQ < BestPlayerDistSQ )
            {
                BestPlayerDistSQ = TempDistSQ;
                NearestPlayerLocation = KFPH.Location;
            }
        }
    }

    // Respawn the dead player zeds
    for( i = 0; i < ZedPlayers.Length; ++i )
    {
        if( MyKFGRI.bMatchIsOver || MyKFGRI.bTraderIsOpen )
        {
            return;
        }

        // Only allow 3 spawns per volume
        if( NumSpawned % 3 == 0 )
        {
            SetDesiredSquadTypeForZedList( MonsterPawnClasses );
            SpawnVolume = GetBestSpawnVolume( MonsterPawnClasses,, ZedPlayers[i] );

            // Get a nearby player, we'll rotate our new player zeds to point towards its location
            foreach WorldInfo.AllPawns( class'KFPawn_Human', KFPH )
            {
                if( KFPH.IsAliveAndWell() )
                {
                    NearestPlayerLocation = KFPH.Location;
                    TempDistSQ = VSizeSQ( SpawnVolume.Location - KFPH.Location );
                    if( BestPlayerDistSQ == 0 || TempDistSQ < BestPlayerDistSQ )
                    {
                        BestPlayerDistSQ = TempDistSQ;
                        NearestPlayerLocation = KFPH.Location;
                    }
                }
            }
        }

        // Spawn player
        if( RestartPlayerZed(ZedPlayers[i], SpawnVolume, NearestPlayerLocation) )
        {
            // Count the number of spawns, if we have more than 2 then choose a new spawn volume
            ++NumSpawned;
        }

        // Clear these zeds out of the array in case we need to get another spawn volume
        ZedPlayers.Remove( i, 1 );
        MonsterPawnClasses.Remove( i, 1 );
        --i;
    }

    // Check if our takeover timer should be started
    CheckForTakeoverTimer();
}

/** Checks the wave status to see if we can start our zed takeover timer */
function CheckForTakeoverTimer()
{
    // Don't allow if this is not a normal wave
    if( !IsPlayerZedSpawnAllowed() )
    {
        if( IsTimerActive(nameOf(Timer_CheckForZedTakeovers), self) )
        {
            ClearTimer( nameOf(Timer_CheckForZedTakeovers), self );
        }
        return;
    }

    // Always refresh the alive count when checking if this timer should activate
    RefreshMonsterAliveCount();

    // Set a timer to take over zeds right before the last squad
    if( WaveTotalAI - NumAISpawnsQueued <= LargestSquadSize+2 )
    {
        if( !IsTimerActive(nameOf(Timer_CheckForZedTakeovers), self) )
        {
            SetTimer( 1.f, true, nameOf(Timer_CheckForZedTakeovers), self );
        }
    }
}

/** Searches for AI zeds to take over */
function Timer_CheckForZedTakeovers()
{
    local KFPlayerControllerVersus KFPCV;
    local bool bNeedRespawn;
    local array<KFPlayerControllerVersus> ZedPlayers;
    local int i, LivingPlayerCount, DesiredTakeovers;

    // Don't allow if this is not a normal wave
    if( !IsPlayerZedSpawnAllowed() )
    {
        ClearTimer( nameOf(Timer_CheckForZedTakeovers), self );
        return;
    }

    // Make sure we're putting in our remaining reserved zeds
    SpawnRemainingReservedZeds();

    // Set to zero
    DesiredTakeovers = 0;
    bNeedRespawn = false;

    // If the survivors are down to 1 person, don't allow more than 3 player zeds at once
    LivingPlayerCount = GetLivingPlayerCount();
    if( LivingPlayerCount < 3 )
    {
        DesiredTakeovers = LivingPlayerCount == 2 ? 4 : 3;
        foreach WorldInfo.AllControllers( class'KFPlayerControllerVersus', KFPCV )
        {
            if( KFPCV.GetTeamNum() == 255 )
            {
                if( KFPCV.Pawn != none && KFPCV.Pawn.IsAliveAndWell()  )
                {
                    --DesiredTakeovers;

                    // Early out if we have no available spawns left
                    if( DesiredTakeovers == 0 )
                    {
                        return;
                    }
                }
                else if( KFPCV.CanRestartPlayer() )
                {
                    if( KFPCV.PlayerZedSpawnInfo.PendingZedPawnClass != none )
                    {
                        // We had a pending zed class already, so we'll need at least one respawn
                        bNeedRespawn = true;
                        continue;
                    }

                    // Make sure we clear out our reserved zeds first
                    if( ReservedPlayerZeds.Length > 0 )
                    {
                        GiveAvailableZedClass( KFPCV, ReservedPlayerZeds,, true );
                    }

                    if( KFPCV.PlayerZedSpawnInfo.PendingZedPawnClass == none )
                    {
                        ZedPlayers[ZedPlayers.Length] = KFPCV;
                    }
                    else
                    {
                        // We had a pending zed class already, so we'll need at least one respawn
                        bNeedRespawn = true;
                    }
                }
            }
        }
    }
    else
    {
        // Collect our pending zed players
        foreach WorldInfo.AllControllers( class'KFPlayerControllerVersus', KFPCV )
        {
            if( KFPCV.GetTeamNum() != 255 || !KFPCV.CanRestartPlayer() )
            {
                continue;
            }

            if( KFPCV.PlayerZedSpawnInfo.PendingZedPawnClass != none )
            {
                // We had a pending zed class already, so we'll need at least one respawn
                bNeedRespawn = true;
                continue;
            }

            if( KFPCV.Pawn == none || !KFPCV.Pawn.IsAliveAndWell() )
            {
                // Make sure we clear out our reserved zeds first
                if( ReservedPlayerZeds.Length > 0 )
                {
                    GiveAvailableZedClass( KFPCV, ReservedPlayerZeds,, true );
                }

                if( KFPCV.PlayerZedSpawnInfo.PendingZedPawnClass == none )
                {
                    ZedPlayers[ZedPlayers.Length] = KFPCV;
                }
                else
                {
                    // We had a pending zed class already, so we'll need at least one respawn
                    bNeedRespawn = true;
                }
            }
        }
    }

    // Early out if we have no players waiting for spawn
    if( ZedPlayers.Length == 0 && !bNeedRespawn )
    {
        return;
    }

    // Only attempt takeovers if we have players waiting for a spawn
    if( ZedPlayers.Length > 0 )
    {
        // Remove enough pending zed players to fit within our available spawn slots
        if( DesiredTakeovers > 0 )
        {
            while( ZedPlayers.Length > DesiredTakeovers )
            {
                ZedPlayers.Remove( Rand(ZedPlayers.Length), 1 );
            }
        }

        // Attempt to find zeds for takeover
        for( i = 0; i < ZedPlayers.Length; ++i )
        {
            KFPCV = ZedPlayers[i];
            FindTakeoverZed( KFPCV );
            if( KFPCV.PlayerZedSpawnInfo.PendingZedPawnClass != none )
            {
                bNeedRespawn = true;
            }
        }
    }

    // Respawn all pending controllers
    if( bNeedRespawn )
    {
        RespawnZedHumanPlayers( none );
    }
}

/** Spawns in our remaining reserved zeds */
function SpawnRemainingReservedZeds( optional bool bSpawnAllReservedZeds )
{
    local int i, NumZedsSpawned;
    local array<class<KFPawn_Monster> > TempSquad;

    // Early out if this is not a normal wave or there are no reserved zeds remaining
    if( !IsPlayerZedSpawnAllowed() || ReservedPlayerZeds.Length == 0 )
    {
        // Make sure this stays clear
        ReservedPlayerZeds.Length = 0;
        return;
    }

    // Refresh our alive count
    RefreshMonsterAliveCount();

    // Don't spawn in any of our leftover reserved zeds if it would exceed the zed counter
    if( AIAliveCount + 1 > MyKFGRI.AIRemaining )
    {
        ReservedPlayerZeds.Length = 0;
        return;
    }

    // If we still have any reserved zeds (that aren't Scrake or Fleshpound), start clearing them and
    // spawn them as AI zeds
    if( ReservedPlayerZeds.Length > 0 )
    {
        for( i = 0; i < ReservedPlayerZeds.Length && (bSpawnAllReservedZeds || NumZedsSpawned < 2); ++i )
        {
            if( AIAliveCount + (NumZedsSpawned+1) > MyKFGRI.AIRemaining )
            {
                ReservedPlayerZeds.Length = 0;
                break;
            }

            if( !ClassIsChildOf(PlayerZedClasses[AT_Scrake], ReservedPlayerZeds[i])
                && !ClassIsChildOf(PlayerZedClasses[AT_Fleshpound], ReservedPlayerZeds[i]) )
            {
                TempSquad[TempSquad.Length] = ReservedPlayerZeds[i];
                ReservedPlayerZeds.Remove( i, 1 );
                ++NumZedsSpawned;
                --i;
            }
        }

        // No need to modify NumAISpawnsQueued as these zeds were already queued
        if( TempSquad.Length > 0 )
        {
            SpawnSquad( TempSquad, true );
        }
    }    
}

/** Finds an AI zed to take over */
function FindTakeoverZed( KFPlayerControllerVersus KFPCV )
{
    local KFPawn_Monster KFPM;
    local Controller C;
    local bool bNextZed;
    local class<KFPawn_Monster> AliveClass;
    local int i;

    // Don't allow if this is not a normal wave
    if( !IsPlayerZedSpawnAllowed() )
    {
        return;
    }

    foreach WorldInfo.AllPawns( class'KFPawn_Monster', KFPM )
    {
        // Only try to take over zeds that are still valid for play
        if( KFPM.bVersusZed || KFPM.IsHeadless() || !KFPM.IsAliveAndWell() || KFPM.IsDoingSpecialMove() )
        {
            continue;
        }

        // Only choose zeds that are not relatively close to players
        bNextZed = false;
        foreach WorldInfo.AllControllers( class'Controller', C )
        {
            if( !C.bIsPlayer || C.GetTeamNum() == 255 || C.Pawn == none || !C.Pawn.IsAliveAndWell() )
            {
                continue;
            }

            // Dist >= 8 meters
            if( VSizeSQ(C.Pawn.Location - KFPM.Location) < 640000.f )
            {
                bNextZed = true;
                break;
            }
        }

        // Skip if this zed was too close to a player
        if( bNextZed )
        {
            continue;
        }

        // Cache off class
        AliveClass = KFPM.class;

        for( i = 0; i < PlayerZedClasses.Length; ++i )
        {
            if( ClassIsChildOf(PlayerZedClasses[i], AliveClass) )
            {
                // Deal explosive damage, make them burst apart
                KFPM.TakeRadiusDamage( none, 100000, 1000, class'KFDT_Explosive_PlayerZedTakeover', 1, KFPM.Location, true, none );

                // Make sure this AI died
                if( KFPM == none || KFPM.Health <= 0 || KFPM.bPlayedDeath || KFPM.bPendingDelete || KFPM.bDeleteMe )
                {
                    KFPCV.PlayerZedSpawnInfo.PendingZedPawnClass = PlayerZedClasses[i];
                    KFPCV.PlayerZedSpawnInfo.PendingZedSpawnLocation = KFPM.Location;
                    KFPCV.HasSpawnedZeds[i] = true;

                    // Need to increment AI remaining, because killing the AI subtracted a zed
                    MyKFGRI.AIRemaining += 1;                    
                }
                return;
            }
        }
    }
}

/** Spawn players into low-level zeds every set number of seconds */
function Timer_SpawnBossPlayerZeds()
{
    local KFPlayerController KFPC;
    local KFPlayerController BestPlayer;
    local int LivingPlayerCount;
    local float LongestSpawnTime, TimeSinceSpawn;
    local float RandomFloat;
    local bool bNeedRespawn;

    if( MyKFGRI.bMatchIsOver )
    {
        ClearTimer( nameOf(Timer_SpawnBossPlayerZeds), self );
        return;
    }

    LivingPlayerCount = GetLivingPlayerCount();

    // If there is already at least one player zed minion with 1 survivor left, early out
    if( LivingPlayerCount == 1 && GetMonsterAliveCount() > 1 )
    {
        return;
    }

    // Respawn the dead player zeds
    BestPlayer = none;
    bNeedRespawn = false;
    foreach WorldInfo.AllControllers( class'KFPlayerController', KFPC )
    {
        if( KFPC.GetTeamNum() != 255 || !KFPC.CanRestartPlayer() )
        {
            continue;
        }

        // Clear any pending zed class here
        KFPC.PlayerZedSpawnInfo.PendingZedPawnClass = none;

        if( KFPC.Pawn == none || !KFPC.Pawn.IsAliveAndWell() )
        {
            // If we're down to just one survivor, only spawn in one player zed each boss spawn interval
            if( LivingPlayerCount == 1 )
            {
                // Pick the player that hasn't spawned in the longest time
                TimeSinceSpawn = `TimeSince(KFPC.PlayerZedSpawnInfo.LastSpawnedTime);
                if( LongestSpawnTime == 0 || TimeSinceSpawn > LongestSpawnTime )
                {
                    LongestSpawnTime = TimeSinceSpawn;
                    BestPlayer = KFPC;
                    bNeedRespawn = true;
                }
            }
            else
            {
                RandomFloat = fRand();
                if( RandomFloat < 0.33f )
                {
                    KFPC.PlayerZedSpawnInfo.PendingZedPawnClass = PlayerZedClasses[AT_Crawler];
                }
                else if( RandomFloat < 0.66f )
                {
                    KFPC.PlayerZedSpawnInfo.PendingZedPawnClass = PlayerZedClasses[AT_SlasherClot];
                }
                else
                {
                    KFPC.PlayerZedSpawnInfo.PendingZedPawnClass = PlayerZedClasses[AT_GoreFast];
                }
                bNeedRespawn = true;
            }
        }
    }

    // Give our chosen player (if any) a zed class
    if( BestPlayer != none )
    {
        if( fRand() < 0.5f )
        {
            BestPlayer.PlayerZedSpawnInfo.PendingZedPawnClass = PlayerZedClasses[AT_SlasherClot];
        }
        else
        {
            BestPlayer.PlayerZedSpawnInfo.PendingZedPawnClass = PlayerZedClasses[AT_GoreFast];
        }
    }

    // Respawn all of our player zeds
    if( bNeedRespawn )
    {
        RespawnZedHumanPlayers( none );
    }

    // Use our adjusted spawn time when only one survivor remains
    if( LivingPlayerCount == 1 )
    {
        SetTimer( FinalSurvivorBossSpawnPlayerInterval, false, nameOf(Timer_SpawnBossPlayerZeds), self );
    }
    else
    {
        SetTimer( BossSpawnPlayerInterval, false, nameOf(Timer_SpawnBossPlayerZeds), self );
    }
}

/** Recycles a player's pending zed pawn class back into the spawn rotation */
function RecyclePendingZedPawnClass( KFPlayerController KFPC )
{
    ReservedPlayerZeds[ReservedPlayerZeds.Length-1] = KFPC.PlayerZedSpawnInfo.PendingZedPawnClass;
}

/** Spawns a player zed */
function bool RestartPlayerZed( KFPlayerController KFPC, KFSpawnVolume SpawnVolume, vector LookAtLocation )
{
    local vector SpawnLocation;
    local rotator SpawnRotation;

    // No spawning if the trader is open or the match is over
    if( MyKFGRI.bTraderIsOpen || MyKFGRI.bMatchIsOver )
    {
        return false;
    }

    RestartPlayer( KFPC );
    if( KFPC.Pawn != none )
    {
        // Set spawn location
        SpawnLocation = ( !IsZero(KFPC.PlayerZedSpawnInfo.PendingZedSpawnLocation) )
            ? KFPC.PlayerZedSpawnInfo.PendingZedSpawnLocation
            : GetSpawnLocation( class<KFPawn_Monster>(KFPC.Pawn.Class), SpawnVolume );
        KFPC.SetLocation( SpawnLocation );
        KFPC.Pawn.SetLocation( SpawnLocation );

        // Set spawn rotation
        SpawnRotation = ( !IsZero(LookAtLocation) )
            ? rotator( LookAtLocation - SpawnLocation )
            : RotRand( false );
        SpawnRotation.Roll = 0;
        KFPC.SetRotation( SpawnRotation );
        SpawnRotation.Pitch = 0;
        KFPC.Pawn.SetRotation( SpawnRotation );

        // Init
        KFPC.ServerCamera( 'ThirdPerson' );
        KFPC.InitGameplayPostProcessFX();

        // Start fading in the camera
        KFPC.ClientSetCameraFade( true, MakeColor(255,255,255,255), vect2d(1.f, 0.f), 0.6f, true );

        // Clear pending spawn values
        KFPC.PlayerZedSpawnInfo.PendingZedPawnClass = none;
        KFPC.PlayerZedSpawnInfo.PendingZedSpawnLocation = vect(0,0,0);

        // Set our last spawned time
        KFPC.PlayerZedSpawnInfo.LastSpawnedTime = WorldInfo.TimeSeconds;

        return true;
    }

    return false;
}

/** General function to indicate whether normal wave player zed spawning is allowed */
protected function bool IsPlayerZedSpawnAllowed()
{
    return !MyKFGRI.bTraderIsOpen && !MyKFGRI.bMatchIsOver && MyKFGRI.WaveNum < MyKFGRI.WaveMax;
}

/** Determines whether we have any zed players that can play as the boss */
protected function bool CanSpawnPlayerBoss()
{
    local KFPlayerController KFPC;

    // If we've already spawned in the boss, we already know that a boss player can spawn
    if( bBossSpawned )
    {
        return true;
    }

    foreach WorldInfo.AllControllers( class'KFPlayerController', KFPC )
    {
        if( KFPC.GetTeamNum() == 255 && KFPC.CanRestartPlayer()
            && (KFPC.Pawn == none || !KFPC.Pawn.IsAliveAndWell()) )
        {
            return true;
        }
    }

    return false;
}

DefaultProperties
{
    BossSpawnPlayerInterval=40.f
    FinalSurvivorBossSpawnPlayerInterval=20.f
    EarlyWaveIndex=2
    MaxSpecialSquadRecycles=1
    // Slow down the early wave spawning in versus
    EarlyWaveSpawnRateModifier(0)=1.33333 // Normal

    RecycleSpecialSquad.Empty
    RecycleSpecialSquad(0)=true
    bRecycleSpecialSquad=true

    Waves(0)=KFAIWaveInfo'GP_Spawning_ARCH.Versus.ZED_Wave1'
    Waves(1)=KFAIWaveInfo'GP_Spawning_ARCH.Versus.ZED_Wave2'
    Waves(2)=KFAIWaveInfo'GP_Spawning_ARCH.Versus.ZED_Wave3'
    Waves(3)=KFAIWaveInfo'GP_Spawning_ARCH.Versus.ZED_Wave4'
    Waves(4)=KFAIWaveInfo'GP_Spawning_ARCH.Versus.ZED_Boss'

    // Normal
    SoloWaveSpawnRateModifier(0)={(RateModifier[0]=1.5,     // Wave 1
                                     RateModifier[1]=1.5,     // Wave 2
                                     RateModifier[2]=1.5,     // Wave 3
                                     RateModifier[3]=1.5)}    // Wave 4

    // Hard
    SoloWaveSpawnRateModifier(1)={(RateModifier[0]=1.5,     // Wave 1
                                     RateModifier[1]=1.5,     // Wave 2
                                     RateModifier[2]=1.5,     // Wave 3
                                     RateModifier[3]=1.5)}    // Wave 4

    // Suicidal
    SoloWaveSpawnRateModifier(2)={(RateModifier[0]=1.5,     // Wave 1
                                     RateModifier[1]=1.5,     // Wave 2
                                     RateModifier[2]=1.5,     // Wave 3
                                     RateModifier[3]=1.5)}    // Wave 4

    // Hell On Earth
    SoloWaveSpawnRateModifier(3)={(RateModifier[0]=1.0,     // Wave 1
                                     RateModifier[1]=1.0,     // Wave 2
                                     RateModifier[2]=1.0,     // Wave 3
                                     RateModifier[3]=1.0)}    // Wave 4

    // Reserved queue
    ReservedZedQueueLimit=5

    // Chances to reserve a zed of a specific class
    ReservedPlayerZedChances(AT_Crawler)=0.5f
    ReservedPlayerZedChances(AT_Bloat)=0.6f
    ReservedPlayerZedChances(AT_Siren)=0.5f
    ReservedPlayerZedChances(AT_Husk)=1.f
    ReservedPlayerZedChances(AT_Scrake)=1.f
    ReservedPlayerZedChances(AT_Fleshpound)=1.f
}