/*******************************************************************************
 * KFAISpawnManager_Versus generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFAISpawnManager_Versus extends KFAISpawnManager within KFGameInfo_VersusSurvival
    config(Game);

var protected array< class<KFPawn_Monster> > ReservedPlayerZeds;
var const array<float> ReservedPlayerZedChances;
var const int ReservedZedQueueLimit;
var protected bool bBossSpawned;
var protected float BossSpawnPlayerInterval;
var protected float FinalSurvivorBossSpawnPlayerInterval;
var protected int LargestSquadSize;

function int GetAIAliveCount()
{
    return super.GetAIAliveCount() + ReservedPlayerZeds.Length;
}

function SetupNextWave(byte NextWaveIndex)
{
    local int I, J, SquadZedCount;
    local array<KFAISpawnSquad> SquadList;

    super.SetupNextWave(NextWaveIndex);
    LargestSquadSize = 0;
    Waves[NextWaveIndex].GetNewSquadList(SquadList);
    I = 0;
    J0x5D:

    if(I < AvailableSquads.Length)
    {
        J = 0;
        J0x80:

        if(J < AvailableSquads[I].MonsterList.Length)
        {
            SquadZedCount += AvailableSquads[I].MonsterList[J].Num;
            ++ J;
            goto J0x80;
        }
        if(SquadZedCount > LargestSquadSize)
        {
            LargestSquadSize = SquadZedCount;
        }
        ++ I;
        goto J0x5D;
    }
}

function AssignZedsToPlayers(out array< class<KFPawn_Monster> > NewZeds)
{
    local KFPlayerControllerVersus KFPCV;

    if(!IsPlayerZedSpawnAllowed())
    {
        return;
    }
    foreach Outer.WorldInfo.AllControllers(Class'KFPlayerControllerVersus', KFPCV)
    {
        if((((KFPCV.GetTeamNum() == 255) && (KFPCV.Pawn == none) || !KFPCV.Pawn.IsAliveAndWell()) && KFPCV.CanRestartPlayer()) && KFPCV.PlayerZedSpawnInfo.PendingZedPawnClass == none)
        {
            if(ReservedPlayerZeds.Length > 0)
            {
                GiveAvailableZedClass(KFPCV, ReservedPlayerZeds,, true);
                if(KFPCV.PlayerZedSpawnInfo.PendingZedPawnClass != none)
                {
                    continue;                    
                }
            }
            if(NewZeds.Length == 0)
            {
                continue;                
            }
            GiveAvailableZedClass(KFPCV, NewZeds);
        }        
    }    
    ReserveStrongZedsForPlayers(NewZeds);
}

function GiveAvailableZedClass(KFPlayerControllerVersus KFPCV, out array< class<KFPawn_Monster> > AvailableZeds, optional bool bSecondPass, optional bool bReservedCheck)
{
    local int I, J, ZedIndex;
    local array<int> PassedOnZeds;
    local array< class<KFPawn_Monster> > PossibleZeds;

    if(KFPCV.HasSpawnedZeds.Length >= (Outer.PlayerZedClasses.Length - 3))
    {
        KFPCV.HasSpawnedZeds.Length = 0;
    }
    I = 0;
    J0x75:

    if(I < AvailableZeds.Length)
    {
        J = 0;
        J0x98:

        if(J < Outer.PlayerZedClasses.Length)
        {
            if(ClassIsChildOf(Outer.PlayerZedClasses[J], AvailableZeds[I]))
            {
                if((J < KFPCV.HasSpawnedZeds.Length) && KFPCV.HasSpawnedZeds[J])
                {
                    PassedOnZeds[PassedOnZeds.Length] = J;
                    goto J0x1BA;
                }
                PossibleZeds[PossibleZeds.Length] = AvailableZeds[I];
                goto J0x1BA;
            }
            ++ J;
            goto J0x98;
        }
        J0x1BA:

        ++ I;
        goto J0x75;
    }
    if(PossibleZeds.Length == 0)
    {
        if(!bReservedCheck)
        {
            if(!bSecondPass && PassedOnZeds.Length > 1)
            {
                KFPCV.HasSpawnedZeds.Remove(PassedOnZeds[Rand(PassedOnZeds.Length)], 1;
                GiveAvailableZedClass(KFPCV, AvailableZeds, true);
                return;
            }
            FindTakeoverZed(KFPCV);
        }
        return;
    }
    ZedIndex = Rand(PossibleZeds.Length);
    I = 0;
    J0x295:

    if(I < Outer.PlayerZedClasses.Length)
    {
        if(ClassIsChildOf(Outer.PlayerZedClasses[I], PossibleZeds[ZedIndex]))
        {
            KFPCV.PlayerZedSpawnInfo.PendingZedPawnClass = Outer.PlayerZedClasses[I];
            AvailableZeds.Remove(AvailableZeds.Find(PossibleZeds[ZedIndex], 1;
            KFPCV.HasSpawnedZeds[I] = true;
            if(!bReservedCheck)
            {
                ++ Outer.NumAISpawnsQueued;
            }
            return;
        }
        ++ I;
        goto J0x295;
    }
}

function ReserveStrongZedsForPlayers(out array< class<KFPawn_Monster> > LeftoverZeds)
{
    local int I;
    local class<KFPawn_Monster> LeftoverZedClass;
    local float RandChance;

    I = 0;
    J0x0B:

    if(I < LeftoverZeds.Length)
    {
        LeftoverZedClass = LeftoverZeds[I];
        RandChance = FRand();
        if(((RandChance <= ReservedPlayerZedChances[7]) && ClassIsChildOf(Outer.PlayerZedClasses[7], LeftoverZedClass)) || (RandChance <= ReservedPlayerZedChances[6]) && ClassIsChildOf(Outer.PlayerZedClasses[6], LeftoverZedClass))
        {
            LeftoverZeds.Remove(I, 1;
            ReservedPlayerZeds.Insert(0, 1;
            ReservedPlayerZeds[0] = LeftoverZedClass;
            ++ Outer.NumAISpawnsQueued;
            -- I;            
        }
        else
        {
            if((ReservedPlayerZeds.Length >= ReservedZedQueueLimit) || Outer.IsTimerActive('Timer_CheckForZedTakeovers'))
            {                
            }
            else
            {
                if(((((RandChance <= ReservedPlayerZedChances[10]) && ClassIsChildOf(Outer.PlayerZedClasses[10], LeftoverZedClass)) || (RandChance <= ReservedPlayerZedChances[9]) && ClassIsChildOf(Outer.PlayerZedClasses[9], LeftoverZedClass)) || (RandChance <= ReservedPlayerZedChances[8]) && ClassIsChildOf(Outer.PlayerZedClasses[8], LeftoverZedClass)) || (RandChance <= ReservedPlayerZedChances[3]) && ClassIsChildOf(Outer.PlayerZedClasses[3], LeftoverZedClass))
                {
                    LeftoverZeds.Remove(I, 1;
                    ReservedPlayerZeds[ReservedPlayerZeds.Length] = LeftoverZedClass;
                    ++ Outer.NumAISpawnsQueued;
                    -- I;
                }
            }
        }
        ++ I;
        goto J0x0B;
    }
}

function Vector GetSpawnLocation(class<KFPawn_Monster> MonsterPawnClass, KFSpawnVolume SpawnVolume)
{
    SpawnVolume.SetLastSpawnTime(Outer.WorldInfo.TimeSeconds);
    return SpawnVolume.FindSpawnLocation(MonsterPawnClass);
}

protected function RespawnZedHumanPlayers(KFSpawnVolume SpawnVolume)
{
    local KFPlayerController KFPC;
    local KFPawn_Human KFPH;
    local float TempDistSQ, BestPlayerDistSQ;
    local Vector SpawnLocation;
    local array<KFPlayerController> ZedPlayers;
    local Vector NearestPlayerLocation;
    local int NumSpawned;
    local array< class<KFPawn_Monster> > MonsterPawnClasses;
    local int I;

    if(Outer.MyKFGRI.bMatchIsOver || Outer.MyKFGRI.bTraderIsOpen)
    {
        return;
    }
    if((Outer.MyKFGRI.WaveNum == Outer.MyKFGRI.WaveMax) && !bBossSpawned)
    {
        if(Outer.IsTimerActive('Timer_CheckForZedTakeovers', self))
        {
            Outer.ClearTimer('Timer_CheckForZedTakeovers', self);
        }
        ReservedPlayerZeds.Length = 0;
        foreach Outer.WorldInfo.AllControllers(Class'KFPlayerController', KFPC)
        {
            KFPC.PlayerZedSpawnInfo.PendingZedPawnClass = none;
            KFPC.PlayerZedSpawnInfo.PendingZedSpawnLocation = vect(0, 0, 0);
            if(KFPC.CanRestartPlayer() && KFPC.GetTeamNum() == 255)
            {
                ZedPlayers[ZedPlayers.Length] = KFPC;
            }            
        }        
        KFPC = ZedPlayers[Rand(ZedPlayers.Length)];
        if(KFPC != none)
        {
            KFPC.PlayerZedSpawnInfo.PendingZedPawnClass = Outer.PlayerBossClassList[Rand(Outer.PlayerBossClassList.Length)];
            MonsterPawnClasses[0] = KFPC.PlayerZedSpawnInfo.PendingZedPawnClass;
            if((SpawnVolume != none) && SpawnVolume.bNoPlayers)
            {
                SetDesiredSquadTypeForZedList(MonsterPawnClasses);
                SpawnVolume = GetBestSpawnVolume(MonsterPawnClasses,, KFPC);
            }
            if(KFPC.Pawn != none)
            {
                KFPC.Pawn.Destroy();
            }
            Outer.RestartPlayer(KFPC);
            if(KFPC.Pawn != none)
            {
                bBossSpawned = true;
                SpawnLocation = GetSpawnLocation(class<KFPawn_Monster>(KFPC.Pawn.Class), SpawnVolume);
                KFPC.SetLocation(SpawnLocation);
                KFPC.Pawn.SetLocation(SpawnLocation);
                KFPC.InitGameplayPostProcessFX();
                KFPC.PlayerZedSpawnInfo.PendingZedPawnClass = none;
                KFPC.PlayerZedSpawnInfo.PendingZedSpawnLocation = vect(0, 0, 0);
                ++ Outer.NumAISpawnsQueued;
                Outer.RefreshMonsterAliveCount();                
            }
            else
            {
                RespawnZedHumanPlayers(none);
                return;
            }
        }
        Outer.SetTimer(BossSpawnPlayerInterval, false, 'Timer_SpawnBossPlayerZeds', self);
        return;
    }
    foreach Outer.WorldInfo.AllControllers(Class'KFPlayerController', KFPC)
    {
        if((KFPC.Pawn != none) && KFPC.Pawn.IsAliveAndWell())
        {
            continue;            
        }
        if(((KFPC.PlayerZedSpawnInfo.PendingZedPawnClass != none) && KFPC.CanRestartPlayer()) && KFPC.GetTeamNum() == 255)
        {
            ZedPlayers[ZedPlayers.Length] = KFPC;
            MonsterPawnClasses[MonsterPawnClasses.Length] = KFPC.PlayerZedSpawnInfo.PendingZedPawnClass;
        }        
    }    
    if(ZedPlayers.Length == 0)
    {
        CheckForTakeoverTimer();
        return;
    }
    SetDesiredSquadTypeForZedList(MonsterPawnClasses);
    SpawnVolume = GetBestSpawnVolume(MonsterPawnClasses,, ZedPlayers[0]);
    foreach Outer.WorldInfo.AllPawns(Class'KFPawn_Human', KFPH)
    {
        if(KFPH.IsAliveAndWell())
        {
            NearestPlayerLocation = KFPH.Location;
            TempDistSQ = VSizeSq(SpawnVolume.Location - KFPH.Location);
            if((BestPlayerDistSQ == float(0)) || TempDistSQ < BestPlayerDistSQ)
            {
                BestPlayerDistSQ = TempDistSQ;
                NearestPlayerLocation = KFPH.Location;
            }
        }        
    }    
    I = 0;
    J0x972:

    if(I < ZedPlayers.Length)
    {
        if(Outer.MyKFGRI.bMatchIsOver || Outer.MyKFGRI.bTraderIsOpen)
        {
            return;
        }
        if((NumSpawned % 3) == 0)
        {
            SetDesiredSquadTypeForZedList(MonsterPawnClasses);
            SpawnVolume = GetBestSpawnVolume(MonsterPawnClasses,, ZedPlayers[I]);
            foreach Outer.WorldInfo.AllPawns(Class'KFPawn_Human', KFPH)
            {
                if(KFPH.IsAliveAndWell())
                {
                    NearestPlayerLocation = KFPH.Location;
                    TempDistSQ = VSizeSq(SpawnVolume.Location - KFPH.Location);
                    if((BestPlayerDistSQ == float(0)) || TempDistSQ < BestPlayerDistSQ)
                    {
                        BestPlayerDistSQ = TempDistSQ;
                        NearestPlayerLocation = KFPH.Location;
                    }
                }                
            }            
        }
        if(RestartPlayerZed(ZedPlayers[I], SpawnVolume, NearestPlayerLocation))
        {
            ++ NumSpawned;
        }
        ZedPlayers.Remove(I, 1;
        MonsterPawnClasses.Remove(I, 1;
        -- I;
        ++ I;
        goto J0x972;
    }
    CheckForTakeoverTimer();
}

function CheckForTakeoverTimer()
{
    if(!IsPlayerZedSpawnAllowed())
    {
        if(Outer.IsTimerActive('Timer_CheckForZedTakeovers', self))
        {
            Outer.ClearTimer('Timer_CheckForZedTakeovers', self);
        }
        return;
    }
    Outer.RefreshMonsterAliveCount();
    if((WaveTotalAI - Outer.NumAISpawnsQueued) <= (LargestSquadSize + 2))
    {
        if(!Outer.IsTimerActive('Timer_CheckForZedTakeovers', self))
        {
            Outer.SetTimer(1, true, 'Timer_CheckForZedTakeovers', self);
        }
    }
}

function Timer_CheckForZedTakeovers()
{
    local KFPlayerControllerVersus KFPCV;
    local bool bNeedRespawn;
    local array<KFPlayerControllerVersus> ZedPlayers;
    local int I, LivingPlayerCount, DesiredTakeovers;

    if(!IsPlayerZedSpawnAllowed())
    {
        Outer.ClearTimer('Timer_CheckForZedTakeovers', self);
        return;
    }
    SpawnRemainingReservedZeds();
    DesiredTakeovers = 0;
    bNeedRespawn = false;
    LivingPlayerCount = Outer.GetLivingPlayerCount();
    if(LivingPlayerCount < 3)
    {
        DesiredTakeovers = ((LivingPlayerCount == 2) ? 4 : 3);
        foreach Outer.WorldInfo.AllControllers(Class'KFPlayerControllerVersus', KFPCV)
        {
            if(KFPCV.GetTeamNum() == 255)
            {
                if((KFPCV.Pawn != none) && KFPCV.Pawn.IsAliveAndWell())
                {
                    -- DesiredTakeovers;
                    if(DesiredTakeovers == 0)
                    {                        
                        return;
                    }
                    continue;
                }
                if(KFPCV.CanRestartPlayer())
                {
                    if(KFPCV.PlayerZedSpawnInfo.PendingZedPawnClass != none)
                    {
                        bNeedRespawn = true;
                        continue;                        
                    }
                    if(ReservedPlayerZeds.Length > 0)
                    {
                        GiveAvailableZedClass(KFPCV, ReservedPlayerZeds,, true);
                    }
                    if(KFPCV.PlayerZedSpawnInfo.PendingZedPawnClass == none)
                    {
                        ZedPlayers[ZedPlayers.Length] = KFPCV;
                        continue;
                    }
                    bNeedRespawn = true;
                }
            }            
        }                
    }
    else
    {
        foreach Outer.WorldInfo.AllControllers(Class'KFPlayerControllerVersus', KFPCV)
        {
            if((KFPCV.GetTeamNum() != 255) || !KFPCV.CanRestartPlayer())
            {
                continue;                
            }
            if(KFPCV.PlayerZedSpawnInfo.PendingZedPawnClass != none)
            {
                bNeedRespawn = true;
                continue;                
            }
            if((KFPCV.Pawn == none) || !KFPCV.Pawn.IsAliveAndWell())
            {
                if(ReservedPlayerZeds.Length > 0)
                {
                    GiveAvailableZedClass(KFPCV, ReservedPlayerZeds,, true);
                }
                if(KFPCV.PlayerZedSpawnInfo.PendingZedPawnClass == none)
                {
                    ZedPlayers[ZedPlayers.Length] = KFPCV;
                    continue;
                }
                bNeedRespawn = true;
            }            
        }        
    }
    if((ZedPlayers.Length == 0) && !bNeedRespawn)
    {
        return;
    }
    if(ZedPlayers.Length > 0)
    {
        if(DesiredTakeovers > 0)
        {
            J0x4BE:

            if(ZedPlayers.Length > DesiredTakeovers)
            {
                ZedPlayers.Remove(Rand(ZedPlayers.Length), 1;
                goto J0x4BE;
            }
        }
        I = 0;
        J0x4FC:

        if(I < ZedPlayers.Length)
        {
            KFPCV = ZedPlayers[I];
            FindTakeoverZed(KFPCV);
            if(KFPCV.PlayerZedSpawnInfo.PendingZedPawnClass != none)
            {
                bNeedRespawn = true;
            }
            ++ I;
            goto J0x4FC;
        }
    }
    if(bNeedRespawn)
    {
        RespawnZedHumanPlayers(none);
    }
}

function SpawnRemainingReservedZeds(optional bool bSpawnAllReservedZeds)
{
    local int I, NumZedsSpawned;
    local array< class<KFPawn_Monster> > TempSquad;

    if(!IsPlayerZedSpawnAllowed() || ReservedPlayerZeds.Length == 0)
    {
        ReservedPlayerZeds.Length = 0;
        return;
    }
    Outer.RefreshMonsterAliveCount();
    if((Outer.AIAliveCount + 1) > Outer.MyKFGRI.AIRemaining)
    {
        ReservedPlayerZeds.Length = 0;
        return;
    }
    if(ReservedPlayerZeds.Length > 0)
    {
        I = 0;
        J0xD1:

        if((I < ReservedPlayerZeds.Length) && bSpawnAllReservedZeds || NumZedsSpawned < 2)
        {
            if((Outer.AIAliveCount + (NumZedsSpawned + 1)) > Outer.MyKFGRI.AIRemaining)
            {
                ReservedPlayerZeds.Length = 0;
                goto J0x258;
            }
            if(!ClassIsChildOf(Outer.PlayerZedClasses[6], ReservedPlayerZeds[I]) && !ClassIsChildOf(Outer.PlayerZedClasses[7], ReservedPlayerZeds[I]))
            {
                TempSquad[TempSquad.Length] = ReservedPlayerZeds[I];
                ReservedPlayerZeds.Remove(I, 1;
                ++ NumZedsSpawned;
                -- I;
            }
            ++ I;
            goto J0xD1;
        }
        J0x258:

        if(TempSquad.Length > 0)
        {
            SpawnSquad(TempSquad, true);
        }
    }
}

function FindTakeoverZed(KFPlayerControllerVersus KFPCV)
{
    local KFPawn_Monster KFPM;
    local Controller C;
    local bool bNextZed;
    local class<KFPawn_Monster> AliveClass;
    local int I;

    if(!IsPlayerZedSpawnAllowed())
    {
        return;
    }
    foreach Outer.WorldInfo.AllPawns(Class'KFPawn_Monster', KFPM)
    {
        if(((KFPM.bVersusZed || KFPM.IsHeadless()) || !KFPM.IsAliveAndWell()) || KFPM.IsDoingSpecialMove())
        {
            continue;            
        }
        bNextZed = false;
        foreach Outer.WorldInfo.AllControllers(Class'Controller', C)
        {
            if(((!C.bIsPlayer || C.GetTeamNum() == 255) || C.Pawn == none) || !C.Pawn.IsAliveAndWell())
            {
                continue;                
            }
            if(VSizeSq(C.Pawn.Location - KFPM.Location) < 640000)
            {
                bNextZed = true;
                break;
            }            
        }        
        if(bNextZed)
        {
            continue;            
        }
        AliveClass = KFPM.Class;
        I = 0;
        J0x2AF:

        if(I < Outer.PlayerZedClasses.Length)
        {
            if(ClassIsChildOf(Outer.PlayerZedClasses[I], AliveClass))
            {
                KFPM.TakeRadiusDamage(none, 100000, 1000, Class'KFDT_Explosive_PlayerZedTakeover', 1, KFPM.Location, true, none);
                if(((((KFPM == none) || KFPM.Health <= 0) || KFPM.bPlayedDeath) || KFPM.bPendingDelete) || KFPM.bDeleteMe)
                {
                    KFPCV.PlayerZedSpawnInfo.PendingZedPawnClass = Outer.PlayerZedClasses[I];
                    KFPCV.PlayerZedSpawnInfo.PendingZedSpawnLocation = KFPM.Location;
                    KFPCV.HasSpawnedZeds[I] = true;
                    Outer.MyKFGRI.AIRemaining += 1;
                }                
                return;
            }
            ++ I;
            goto J0x2AF;
        }        
    }    
}

function Timer_SpawnBossPlayerZeds()
{
    local KFPlayerController KFPC, BestPlayer;
    local int LivingPlayerCount;
    local float LongestSpawnTime, TimeSinceSpawn, RandomFloat;
    local bool bNeedRespawn;

    if(Outer.MyKFGRI.bMatchIsOver)
    {
        Outer.ClearTimer('Timer_SpawnBossPlayerZeds', self);
        return;
    }
    LivingPlayerCount = Outer.GetLivingPlayerCount();
    if((LivingPlayerCount == 1) && Outer.GetMonsterAliveCount() > 1)
    {
        return;
    }
    BestPlayer = none;
    bNeedRespawn = false;
    foreach Outer.WorldInfo.AllControllers(Class'KFPlayerController', KFPC)
    {
        if((KFPC.GetTeamNum() != 255) || !KFPC.CanRestartPlayer())
        {
            continue;            
        }
        KFPC.PlayerZedSpawnInfo.PendingZedPawnClass = none;
        if((KFPC.Pawn == none) || !KFPC.Pawn.IsAliveAndWell())
        {
            if(LivingPlayerCount == 1)
            {
                TimeSinceSpawn = Outer.WorldInfo.TimeSeconds - KFPC.PlayerZedSpawnInfo.LastSpawnedTime;
                if((LongestSpawnTime == float(0)) || TimeSinceSpawn > LongestSpawnTime)
                {
                    LongestSpawnTime = TimeSinceSpawn;
                    BestPlayer = KFPC;
                    bNeedRespawn = true;
                }
                continue;
            }
            RandomFloat = FRand();
            if(RandomFloat < 0.33)
            {
                KFPC.PlayerZedSpawnInfo.PendingZedPawnClass = Outer.PlayerZedClasses[3];                
            }
            else
            {
                if(RandomFloat < 0.66)
                {
                    KFPC.PlayerZedSpawnInfo.PendingZedPawnClass = Outer.PlayerZedClasses[1];                    
                }
                else
                {
                    KFPC.PlayerZedSpawnInfo.PendingZedPawnClass = Outer.PlayerZedClasses[4];
                }
            }
            bNeedRespawn = true;
        }        
    }    
    if(BestPlayer != none)
    {
        if(FRand() < 0.5)
        {
            BestPlayer.PlayerZedSpawnInfo.PendingZedPawnClass = Outer.PlayerZedClasses[1];            
        }
        else
        {
            BestPlayer.PlayerZedSpawnInfo.PendingZedPawnClass = Outer.PlayerZedClasses[4];
        }
    }
    if(bNeedRespawn)
    {
        RespawnZedHumanPlayers(none);
    }
    if(LivingPlayerCount == 1)
    {
        Outer.SetTimer(FinalSurvivorBossSpawnPlayerInterval, false, 'Timer_SpawnBossPlayerZeds', self);        
    }
    else
    {
        Outer.SetTimer(BossSpawnPlayerInterval, false, 'Timer_SpawnBossPlayerZeds', self);
    }
}

function RecyclePendingZedPawnClass(KFPlayerController KFPC)
{
    ReservedPlayerZeds[ReservedPlayerZeds.Length - 1] = KFPC.PlayerZedSpawnInfo.PendingZedPawnClass;
}

function bool RestartPlayerZed(KFPlayerController KFPC, KFSpawnVolume SpawnVolume, Vector LookAtLocation)
{
    local Vector SpawnLocation;
    local Rotator SpawnRotation;

    if(Outer.MyKFGRI.bTraderIsOpen || Outer.MyKFGRI.bMatchIsOver)
    {
        return false;
    }
    Outer.RestartPlayer(KFPC);
    if(KFPC.Pawn != none)
    {
        SpawnLocation = ((!IsZero(KFPC.PlayerZedSpawnInfo.PendingZedSpawnLocation)) ? KFPC.PlayerZedSpawnInfo.PendingZedSpawnLocation : GetSpawnLocation(class<KFPawn_Monster>(KFPC.Pawn.Class), SpawnVolume));
        KFPC.SetLocation(SpawnLocation);
        KFPC.Pawn.SetLocation(SpawnLocation);
        SpawnRotation = ((!IsZero(LookAtLocation)) ? rotator(LookAtLocation - SpawnLocation) : RotRand(false));
        SpawnRotation.Roll = 0;
        KFPC.SetRotation(SpawnRotation);
        SpawnRotation.Pitch = 0;
        KFPC.Pawn.SetRotation(SpawnRotation);
        KFPC.ServerCamera('ThirdPerson');
        KFPC.InitGameplayPostProcessFX();
        KFPC.ClientSetCameraFade(true, MakeColor(255, 255, 255, 255), vect2d(1, 0), 0.6, true);
        KFPC.PlayerZedSpawnInfo.PendingZedPawnClass = none;
        KFPC.PlayerZedSpawnInfo.PendingZedSpawnLocation = vect(0, 0, 0);
        KFPC.PlayerZedSpawnInfo.LastSpawnedTime = Outer.WorldInfo.TimeSeconds;
        return true;
    }
    return false;
}

protected function bool IsPlayerZedSpawnAllowed()
{
    return (!Outer.MyKFGRI.bTraderIsOpen && !Outer.MyKFGRI.bMatchIsOver) && Outer.MyKFGRI.WaveNum < Outer.MyKFGRI.WaveMax;
}

protected function bool CanSpawnPlayerBoss()
{
    local KFPlayerController KFPC;

    if(bBossSpawned)
    {
        return true;
    }
    foreach Outer.WorldInfo.AllControllers(Class'KFPlayerController', KFPC)
    {
        if(((KFPC.GetTeamNum() == 255) && KFPC.CanRestartPlayer()) && (KFPC.Pawn == none) || !KFPC.Pawn.IsAliveAndWell())
        {            
            return true;
        }        
    }    
    return false;
}

defaultproperties
{
    ReservedPlayerZedChances(0)=0
    ReservedPlayerZedChances(1)=0
    ReservedPlayerZedChances(2)=0
    ReservedPlayerZedChances(3)=0.5
    ReservedPlayerZedChances(4)=0
    ReservedPlayerZedChances(5)=0
    ReservedPlayerZedChances(6)=1
    ReservedPlayerZedChances(7)=1
    ReservedPlayerZedChances(8)=0.6
    ReservedPlayerZedChances(9)=0.5
    ReservedPlayerZedChances(10)=1
    ReservedZedQueueLimit=5
    BossSpawnPlayerInterval=40
    FinalSurvivorBossSpawnPlayerInterval=20
    Waves=/* Array type was not detected. */
    SoloWaveSpawnRateModifier[0]=RateModifier=/* Array type was not detected. */,
/* Exception thrown while deserializing SoloWaveSpawnRateModifier
System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UDefaultProperty.DeserializeTagUE3()
   at UELib.Core.UDefaultProperty.Deserialize()
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    SoloWaveSpawnRateModifier[1]=RateModifier=/* Array type was not detected. */,
/* Exception thrown while deserializing SoloWaveSpawnRateModifier
System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UDefaultProperty.DeserializeTagUE3()
   at UELib.Core.UDefaultProperty.Deserialize()
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    SoloWaveSpawnRateModifier[2]=RateModifier=/* Array type was not detected. */,
/* Exception thrown while deserializing SoloWaveSpawnRateModifier
System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UDefaultProperty.DeserializeTagUE3()
   at UELib.Core.UDefaultProperty.Deserialize()
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    EarlyWaveSpawnRateModifier=1.33333
    EarlyWaveIndex=2
    bRecycleSpecialSquad=true
    RecycleSpecialSquad=/* Array type was not detected. */
    MaxSpecialSquadRecycles=1
}