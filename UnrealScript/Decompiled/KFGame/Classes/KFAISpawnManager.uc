/*******************************************************************************
 * KFAISpawnManager generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFAISpawnManager extends Object within KFGameInfo
    config(Game);

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
    AT_MAX
};

struct SpawnRateModifier
{
    /** Used for arrays to modify spawn rate */
    var() array<float> RateModifier;

    structdefaultproperties
    {
        RateModifier=none
    }
};

var array<KFAISpawnSquad> AvailableSquads;
var array<KFAIWaveInfo> Waves;
var float SineWaveFreq;
var float WaveStartTime;
var float TotalWavesActiveTime;
var float TimeUntilNextSpawn;
var int WaveTotalAI;
var const byte MaxMonsters;
/** Maximum number of AI that can be active at one time in solo, by difficulty */
var() byte MaxMonstersSolo[4];
var KFSpawnVolume.ESquadType DesiredSquadType;
/** How much to modify the spawn rate for solo play by difficulty */
var() SpawnRateModifier SoloWaveSpawnRateModifier[4];
/** How much to modify the spawn rate for early waves. Generally used to make early waves more intense */
var() float EarlyWaveSpawnRateModifier[4];
var int EarlyWaveIndex;
/** The base SpawnTimeMod to use in early waves based on the number of players playing */
var() float EarlyWavesSpawnTimeModByPlayers[6];
/** The base SpawnTimeMod to use in late waves based on the number of players playing */
var() float LateWavesSpawnTimeModByPlayers[6];
var bool bForceRequiredSquad;
var bool bRecycleSpecialSquad;
var bool bSummoningBossMinions;
var config bool bLogAISpawning;
var config bool bLogWaveSpawnTiming;
var config bool bLogRateVolume;
/** Whether to recycle the special squad every other time through the squad list, by difficulty */
var() array<bool> RecycleSpecialSquad;
var int MaxSpecialSquadRecycles;
var int NumSpecialSquadRecycles;
var int NumSpawnListCycles;
var array<KFSpawnVolume> SpawnVolumes;
var KFSpawnVolume LastAISpawnVolume;
var KFSpawner ActiveSpawner;
var const int ObjExtraAI;
var array< class<KFPawn_Monster> > LeftoverSpawnSquad;
var array<KFAISpawnSquad> BossMinionsSpawnSquads;
var int MaxBossMinions;
/** How much to scale the number of boss minions based on the number of players playing */
var() float MaxBossMinionScaleByPlayers[6];
var array<Controller> RecentSpawnSelectedHumanControllerList;

static function string ZedTypeToString(KFAISpawnManager.EAIType AiTypeToConvert)
{
    return "";
}

function Initialize()
{
    if(bLogAISpawning)
    {
        LogInternal("KFAISpawnManager.Initialize()");
    }
    RegisterSpawnVolumes();
}

function RegisterSpawnVolumes()
{
    local KFSpawnVolume MySpawnVolume;

    SpawnVolumes.Remove(0, SpawnVolumes.Length;
    foreach Outer.AllActors(Class'KFSpawnVolume', MySpawnVolume)
    {
        if(!MySpawnVolume.bDisabled)
        {
            SpawnVolumes.AddItem(MySpawnVolume;
        }        
    }    
    if(bLogAISpawning)
    {
        LogInternal(("KFAISpawnManager.RegisterSpawnVolumes() Added" @ string(SpawnVolumes.Length)) @ "Volumes");
    }
}

function SetupNextWave(byte NextWaveIndex)
{
    local KFGameReplicationInfo KFGRI;

    if(NextWaveIndex < Waves.Length)
    {
        if(Outer.GameDifficulty < float(RecycleSpecialSquad.Length))
        {
            bRecycleSpecialSquad = RecycleSpecialSquad[int(Outer.GameDifficulty)];            
        }
        else
        {
            bRecycleSpecialSquad = RecycleSpecialSquad[RecycleSpecialSquad.Length - 1];
        }
        LeftoverSpawnSquad.Length = 0;
        NumSpawnListCycles = 1;
        NumSpecialSquadRecycles = 0;
        if(Waves[NextWaveIndex].bRecycleWave)
        {
            WaveTotalAI = int((float(Waves[NextWaveIndex].MaxAI) * Outer.DifficultyInfo.GetPlayerNumMaxAIModifier(byte(Outer.GetNumHumanTeamPlayers()))) * Outer.DifficultyInfo.GetDifficultyMaxAIModifier());            
        }
        else
        {
            WaveTotalAI = Waves[NextWaveIndex].MaxAI;
        }
        GetAvailableSquads(NextWaveIndex, true);
        WaveStartTime = Outer.WorldInfo.TimeSeconds;
        TimeUntilNextSpawn = 5;
        if(NextWaveIndex == 0)
        {
            TotalWavesActiveTime = 0;
        }
        KFGRI = KFGameReplicationInfo(Outer.WorldInfo.GRI);
        if((KFGRI != none) && KFGRI.bDebugSpawnManager || KFGRI.bGameConductorGraphingEnabled)
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
    LastAISpawnVolume = none;
    if(bLogAISpawning || bLogWaveSpawnTiming)
    {
        LogInternal((("KFAISpawnManager.SetupNextWave() NextWave:" @ string(NextWaveIndex)) @ "WaveTotalAI:") @ string(WaveTotalAI));
    }
}

function GetAvailableSquads(byte MyWaveIndex, optional bool bNeedsSpecialSquad)
{
    local int I, J, TotalZedsInSquads;

    bNeedsSpecialSquad = false;
    if(Waves[MyWaveIndex] != none)
    {
        ++ NumSpawnListCycles;
        Waves[MyWaveIndex].GetNewSquadList(AvailableSquads);
        if(bLogAISpawning)
        {
            LogInternal("KFAISpawnManager NEW SQUAD LIST for Wave:" @ string(MyWaveIndex));
        }
        if(bNeedsSpecialSquad)
        {
            Waves[MyWaveIndex].GetSpecialSquad(AvailableSquads);
            if(bLogAISpawning)
            {
                LogInternal("KFAISpawnManager SPECIAL SQUAD for Wave:" @ string(MyWaveIndex));
            }
            I = 0;
            J0x13A:

            if(I < AvailableSquads.Length)
            {
                J = 0;
                J0x15D:

                if(J < AvailableSquads[I].MonsterList.Length)
                {
                    TotalZedsInSquads += AvailableSquads[I].MonsterList[J].Num;
                    ++ J;
                    goto J0x15D;
                }
                ++ I;
                goto J0x13A;
            }
            if(WaveTotalAI < TotalZedsInSquads)
            {
                bForceRequiredSquad = true;
            }
        }
    }
}

function SpawnRemainingReservedZeds(optional bool bSpawnAllReservedZeds);

function KFSpawnVolume.ESquadType GetDesiredSquadTypeForZedList(array< class<KFPawn_Monster> > NewSquad)
{
    local int I;
    local KFSpawnVolume.ESquadType LargestMonsterSquadType;

    LargestMonsterSquadType = 4;
    I = 0;
    J0x17:

    if(I < NewSquad.Length)
    {
        if(bLogAISpawning)
        {
            LogInternal((((string(GetFuncName()) $ " LeftOverSquad ") $ string(NewSquad[I])) $ " MinSquadType:") $ string(GetEnum(Enum'ESquadType', NewSquad[I].default.MinSpawnSquadSizeType)));
        }
        if(NewSquad[I].default.MinSpawnSquadSizeType < LargestMonsterSquadType)
        {
            LargestMonsterSquadType = NewSquad[I].default.MinSpawnSquadSizeType;
        }
        ++ I;
        goto J0x17;
    }
    return LargestMonsterSquadType;
}

function SetDesiredSquadTypeForZedList(array< class<KFPawn_Monster> > NewSquad)
{
    DesiredSquadType = GetDesiredSquadTypeForZedList(NewSquad);
    if(bLogAISpawning)
    {
        LogInternal((string(GetFuncName()) $ " adjusted largest squad for squad leftover squad to ") $ string(GetEnum(Enum'ESquadType', DesiredSquadType)));
    }
}

function GetSpawnListFromSquad(byte SquadIdx, out array<KFAISpawnSquad> SquadsList, out array< class<KFPawn_Monster> > AISpawnList)
{
    local KFAISpawnSquad Squad;
    local KFAISpawnManager.EAIType AIType;
    local int I, J, RandNum;
    local KFSpawnVolume.ESquadType LargestMonsterSquadType;
    local array< class<KFPawn_Monster> > TempSpawnList;

    Squad = SquadsList[SquadIdx];
    LargestMonsterSquadType = 4;
    I = 0;
    J0x36:

    if(I < Squad.MonsterList.Length)
    {
        J = 0;
        J0x6E:

        if(J < Squad.MonsterList[I].Num)
        {
            if(Squad.MonsterList[I].CustomClass != none)
            {
                TempSpawnList.AddItem(Squad.MonsterList[I].CustomClass;                
            }
            else
            {
                AIType = Squad.MonsterList[I].Type;
                if(AIType == 11)
                {
                    TempSpawnList.AddItem(Outer.AIBossClassList[Rand(Outer.AIBossClassList.Length)];                    
                }
                else
                {
                    TempSpawnList.AddItem(Outer.AIClassList[AIType];
                }
            }
            if(TempSpawnList[TempSpawnList.Length - 1].default.MinSpawnSquadSizeType < LargestMonsterSquadType)
            {
                LargestMonsterSquadType = TempSpawnList[TempSpawnList.Length - 1].default.MinSpawnSquadSizeType;
            }
            ++ J;
            goto J0x6E;
        }
        ++ I;
        goto J0x36;
    }
    if(TempSpawnList.Length > 0)
    {
        J0x2C5:

        if(TempSpawnList.Length > 0)
        {
            RandNum = Rand(TempSpawnList.Length);
            AISpawnList.AddItem(TempSpawnList[RandNum];
            TempSpawnList.Remove(RandNum, 1;
            goto J0x2C5;
        }
        DesiredSquadType = Squad.MinVolumeType;
        if(LargestMonsterSquadType < DesiredSquadType)
        {
            DesiredSquadType = LargestMonsterSquadType;
        }
    }
}

function array< class<KFPawn_Monster> > GetNextSpawnList()
{
    local array< class<KFPawn_Monster> > NewSquad, RequiredSquad;
    local int RandNum, AINeeded;

    if(LeftoverSpawnSquad.Length > 0)
    {
        if(bLogAISpawning)
        {
            LogMonsterList(LeftoverSpawnSquad, "Leftover LeftoverSpawnSquad");
        }
        NewSquad = LeftoverSpawnSquad;
        SetDesiredSquadTypeForZedList(NewSquad);        
    }
    else
    {
        if(!IsAISquadAvailable())
        {
            if(!bSummoningBossMinions)
            {
                if((bRecycleSpecialSquad && (NumSpawnListCycles % 2) == 1) && (MaxSpecialSquadRecycles == -1) || NumSpecialSquadRecycles < MaxSpecialSquadRecycles)
                {
                    GetAvailableSquads(byte(Outer.MyKFGRI.WaveNum - 1), true);
                    ++ NumSpecialSquadRecycles;                    
                }
                else
                {
                    GetAvailableSquads(byte(Outer.MyKFGRI.WaveNum - 1));
                }                
            }
            else
            {
                AvailableSquads = BossMinionsSpawnSquads;
            }
        }
        RandNum = Rand(AvailableSquads.Length);
        if(bForceRequiredSquad && RandNum == (AvailableSquads.Length - 1))
        {
            bForceRequiredSquad = false;
        }
        if(bLogAISpawning)
        {
            LogAvailableSquads();
        }
        if(bLogAISpawning)
        {
            LogInternal((((("KFAISpawnManager.GetNextAIGroup() Wave:" @ string(Outer.MyKFGRI.WaveNum)) @ "Squad:") @ string(AvailableSquads[RandNum])) @ "Index:") @ string(RandNum));
        }
        GetSpawnListFromSquad(byte(RandNum), AvailableSquads, NewSquad);
        if(bForceRequiredSquad)
        {
            GetSpawnListFromSquad(byte(AvailableSquads.Length - 1), AvailableSquads, RequiredSquad);
            if(((Outer.NumAISpawnsQueued + NewSquad.Length) + RequiredSquad.Length) > WaveTotalAI)
            {
                NewSquad = RequiredSquad;
                RandNum = AvailableSquads.Length - 1;
                bForceRequiredSquad = false;
            }
        }
        AvailableSquads.Remove(RandNum, 1;
        if(bLogAISpawning)
        {
            LogAvailableSquads();
        }
    }
    AINeeded = GetNumAINeeded();
    if(AINeeded < NewSquad.Length)
    {
        LeftoverSpawnSquad = NewSquad;
        LeftoverSpawnSquad.Remove(0, AINeeded;
        NewSquad.Length = AINeeded;        
    }
    else
    {
        LeftoverSpawnSquad.Length = 0;
    }
    if(bLogAISpawning)
    {
        LogMonsterList(NewSquad, "NewSquad");
        LogMonsterList(LeftoverSpawnSquad, "LeftoverSpawnSquad");
    }
    return NewSquad;
}

function LogMonsterList(array< class<KFPawn_Monster> > MonsterList, string ListName)
{
    local int I;

    LogInternal((("Monster List " $ ListName) $ " Length = ") $ string(MonsterList.Length));
    I = 0;
    J0x44:

    if(I < MonsterList.Length)
    {
        LogInternal((((("MonsterList " $ ListName) $ " element ") $ string(I)) $ " is ") $ string(MonsterList[I]));
        ++ I;
        goto J0x44;
    }
}

function LogAvailableSquads()
{
    local int I, J;

    LogInternal("Current Loaded Wave Setup");
    I = 0;
    J0x29:

    if(I < AvailableSquads.Length)
    {
        J = 0;
        J0x4C:

        if(J < AvailableSquads[I].MonsterList.Length)
        {
            LogInternal((((((((("AvailableSquads " $ string(I)) $ " MonsterList ") $ string(J)) $ " is ") $ string(GetEnum(Enum'EAIType', Outer.SpawnManager.AvailableSquads[I].MonsterList[J].Type))) $ " Num: ") $ string(Outer.SpawnManager.AvailableSquads[I].MonsterList[J].Num)) $ " SquadName: ") $ string(AvailableSquads[I]));
            ++ J;
            goto J0x4C;
        }
        ++ I;
        goto J0x29;
    }
}

function bool IsAISquadAvailable()
{
    if(bLogAISpawning)
    {
        LogInternal("KFAISpawnManager.IsAISquadAvailable()" @ string(AvailableSquads.Length > 0));
    }
    return AvailableSquads.Length > 0;
}

function bool IsFinishedSpawning()
{
    if(((ActiveSpawner != none) && ActiveSpawner.bIsSpawning) && ActiveSpawner.PendingSpawns.Length > 0)
    {
        if(bLogAISpawning)
        {
            LogInternal("KFAISpawnManager.IsFinishedSpawning() ActiveSpawner Still Spawning " @ string(((ActiveSpawner != none) && ActiveSpawner.bIsSpawning) && ActiveSpawner.PendingSpawns.Length > 0));
        }
        return false;
    }
    if(bSummoningBossMinions)
    {
        return false;
    }
    if(Outer.NumAISpawnsQueued >= WaveTotalAI)
    {
        if((Outer.MyKFGRI.CurrentObjective != none) && Outer.MyKFGRI.CurrentObjective.InfiniteZedsEnabled())
        {
            WaveTotalAI += ObjExtraAI;
            Outer.MyKFGRI.WaveTotalAICount = WaveTotalAI;
            Outer.MyKFGRI.AIRemaining += ObjExtraAI;
            return false;
        }
        if(bLogAISpawning)
        {
            LogInternal("KFAISpawnManager.IsFinishedSpawning()" @ string(Outer.NumAISpawnsQueued >= WaveTotalAI));
        }
        return true;
    }
    return false;
}

function float CalcNextGroupSpawnTime()
{
    local float NextSpawnDelay, SineMod;
    local KFMapInfo KFMI;
    local KFGameReplicationInfo KFGRI;

    if(LeftoverSpawnSquad.Length > 0)
    {
        return 0;        
    }
    else
    {
        KFMI = KFMapInfo(Outer.WorldInfo.GetMapInfo());
        SineMod = GetSineMod();
        NextSpawnDelay = ((KFMI != none) ? KFMI.WaveSpawnPeriod : Class'KFMapInfo'.default.WaveSpawnPeriod);
        NextSpawnDelay *= (GetNextSpawnTimeMod());
        NextSpawnDelay += (SineMod * (NextSpawnDelay * float(2)));
        KFGRI = KFGameReplicationInfo(Outer.WorldInfo.GRI);
        if((KFGRI != none) && KFGRI.bDebugSpawnManager || KFGRI.bGameConductorGraphingEnabled)
        {
            KFGRI.CurrentSineMod = SineMod;
            KFGRI.CurrentNextSpawnTime = NextSpawnDelay;
            KFGRI.CurrentSineWavFreq = GetSineWaveFreq();
            KFGRI.CurrentNextSpawnTimeMod = GetNextSpawnTimeMod();
        }
    }
    if(bLogAISpawning || bLogWaveSpawnTiming)
    {
        LogInternal((((((((((string(GetFuncName()) $ " NextSpawnTime:") @ string(Outer.WorldInfo.TimeSeconds + NextSpawnDelay)) @ "NextSpawnDelay:") @ string(NextSpawnDelay)) $ " SineMod: ") $ string(SineMod)) $ " WaveSpawnPeriod: ") $ string(((KFMI != none) ? KFMI.WaveSpawnPeriod : Class'KFMapInfo'.default.WaveSpawnPeriod))) $ " GetNextSpawnTimeMod(): ") $ string(GetNextSpawnTimeMod()));
    }
    return NextSpawnDelay;
}

function float GetNextSpawnTimeMod()
{
    local byte NumLivingPlayers;
    local float SpawnTimeMod, UsedEarlyWaveRateMod, UsedSoloWaveRateMod;

    NumLivingPlayers = byte(Outer.GetLivingPlayerCount());
    SpawnTimeMod = 1;
    UsedSoloWaveRateMod = 1;
    if(Outer.bOnePlayerAtStart && NumLivingPlayers <= 1)
    {
        if(Outer.GameDifficulty < float(4))
        {
            if(Outer.MyKFGRI.WaveNum <= SoloWaveSpawnRateModifier[int(Outer.GameDifficulty)].RateModifier.Length)
            {
                UsedSoloWaveRateMod = SoloWaveSpawnRateModifier[int(Outer.GameDifficulty)].RateModifier[Outer.MyKFGRI.WaveNum - 1];                
            }
            else
            {
                UsedSoloWaveRateMod = SoloWaveSpawnRateModifier[int(Outer.GameDifficulty)].RateModifier[SoloWaveSpawnRateModifier[int(Outer.GameDifficulty)].RateModifier.Length - 1];
            }            
        }
        else
        {
            if(Outer.MyKFGRI.WaveNum <= SoloWaveSpawnRateModifier[int(Outer.GameDifficulty)].RateModifier.Length)
            {
                UsedSoloWaveRateMod = SoloWaveSpawnRateModifier[4 - 1].RateModifier[Outer.MyKFGRI.WaveNum - 1];                
            }
            else
            {
                UsedSoloWaveRateMod = SoloWaveSpawnRateModifier[4 - 1].RateModifier[SoloWaveSpawnRateModifier[int(Outer.GameDifficulty)].RateModifier.Length - 1];
            }
        }
    }
    if(Outer.MyKFGRI.WaveNum < EarlyWaveIndex)
    {
        if(NumLivingPlayers <= 6)
        {
            if(NumLivingPlayers == 0)
            {
                SpawnTimeMod = EarlyWavesSpawnTimeModByPlayers[NumLivingPlayers];                
            }
            else
            {
                SpawnTimeMod = EarlyWavesSpawnTimeModByPlayers[NumLivingPlayers - 1];
            }            
        }
        else
        {
            SpawnTimeMod = EarlyWavesSpawnTimeModByPlayers[6 - 1];
        }
        if(bLogAISpawning)
        {
            LogInternal((((("Early Waves SpawnTimeMod = " $ string(SpawnTimeMod)) $ " NumLivingPlayers = ") $ string(NumLivingPlayers)) $ " UsedSoloWaveRateMod = ") $ string(UsedSoloWaveRateMod));
        }
        if(Outer.GameDifficulty < float(4))
        {
            UsedEarlyWaveRateMod = EarlyWaveSpawnRateModifier[int(Outer.GameDifficulty)];            
        }
        else
        {
            UsedEarlyWaveRateMod = EarlyWaveSpawnRateModifier[4 - 1];
        }
        SpawnTimeMod *= UsedEarlyWaveRateMod;
        SpawnTimeMod *= UsedSoloWaveRateMod;
        if(bLogAISpawning)
        {
            LogInternal("Early waves final SpawnTimeMod = " $ string(SpawnTimeMod));
        }        
    }
    else
    {
        if(NumLivingPlayers <= 6)
        {
            if(NumLivingPlayers == 0)
            {
                SpawnTimeMod = LateWavesSpawnTimeModByPlayers[NumLivingPlayers];                
            }
            else
            {
                SpawnTimeMod = LateWavesSpawnTimeModByPlayers[NumLivingPlayers - 1];
            }            
        }
        else
        {
            SpawnTimeMod = LateWavesSpawnTimeModByPlayers[6 - 1];
        }
        if(bLogAISpawning)
        {
            LogInternal((((("Late waves SpawnTimeMod = " $ string(SpawnTimeMod)) $ " NumLivingPlayers = ") $ string(NumLivingPlayers)) $ " UsedSoloWaveRateMod = ") $ string(UsedSoloWaveRateMod));
        }
        SpawnTimeMod *= UsedSoloWaveRateMod;
        if(bLogAISpawning)
        {
            LogInternal("Late waves final  SpawnTimeMod = " $ string(SpawnTimeMod));
        }
    }
    return SpawnTimeMod * Outer.GameConductor.CurrentSpawnRateModification;
}

function float GetSineMod()
{
    return 1 - Abs(Sin(TotalWavesActiveTime * (GetSineWaveFreq())));
}

function float GetSineWaveFreq()
{
    return SineWaveFreq;
}

function SetSineWaveFreq(float NewFreq)
{
    SineWaveFreq = NewFreq;
}

function SummonBossMinions(array<KFAISpawnSquad> NewMinionSquad, int NewMaxBossMinions)
{
    local int NumLivePlayers;
    local float UsedMaxBossMinionsScale;

    if(bSummoningBossMinions)
    {
        StopSummoningBossMinions();
    }
    bSummoningBossMinions = true;
    BossMinionsSpawnSquads = NewMinionSquad;
    AvailableSquads = BossMinionsSpawnSquads;
    MaxBossMinions = NewMaxBossMinions;
    NumLivePlayers = Outer.GetLivingPlayerCount();
    if(NumLivePlayers <= 6)
    {
        if(NumLivePlayers == 0)
        {
            UsedMaxBossMinionsScale = MaxBossMinionScaleByPlayers[NumLivePlayers];            
        }
        else
        {
            UsedMaxBossMinionsScale = MaxBossMinionScaleByPlayers[NumLivePlayers - 1];
        }        
    }
    else
    {
        UsedMaxBossMinionsScale = MaxBossMinionScaleByPlayers[6 - 1];
    }
    MaxBossMinions *= UsedMaxBossMinionsScale;
    MaxBossMinions = Min(MaxBossMinions, GetMaxMonsters());
    if(bLogAISpawning)
    {
        LogInternal(((string(self) @ string(GetFuncName())) $ " MaxBossMinions:") $ string(MaxBossMinions));
    }
}

function StopSummoningBossMinions()
{
    bSummoningBossMinions = false;
    AvailableSquads.Length = 0;
}

function int SpawnSquad(array< class<KFPawn_Monster> > AIToSpawn, optional bool bSkipHumanZedSpawning)
{
    local KFSpawnVolume KFSV;
    local int SpawnerAmount, VolumeAmount, FinalAmount, I;
    local bool bCanSpawnPlayerBoss;

    bSkipHumanZedSpawning = false;
    if(!Outer.IsWaveActive())
    {
        return 0;
    }
    if((ActiveSpawner != none) && ActiveSpawner.CanSpawnHere(DesiredSquadType))
    {
        SpawnerAmount = ActiveSpawner.SpawnSquad(AIToSpawn);
        if(bLogAISpawning)
        {
            LogInternal((("KFAISpawnManager.SpawnAI() Using Spawner AIs spawned:" @ string(SpawnerAmount)) @ "in Spawner:") @ string(ActiveSpawner));
        }
    }
    if(AIToSpawn.Length > 0)
    {
        KFSV = GetBestSpawnVolume(AIToSpawn);
        if(KFSV != none)
        {
            ++ KFSV.VolumeChosenCount;
            if(bLogAISpawning)
            {
                LogMonsterList(AIToSpawn, "SpawnSquad Pre Spawning");
            }
            bCanSpawnPlayerBoss = ((Outer.bIsVersusGame && Outer.MyKFGRI.WaveNum == Outer.MyKFGRI.WaveMax) ? CanSpawnPlayerBoss() : false);
            if((!Outer.bIsVersusGame || Outer.MyKFGRI.WaveNum < Outer.MyKFGRI.WaveMax) || !bCanSpawnPlayerBoss)
            {
                VolumeAmount = KFSV.SpawnWave(AIToSpawn, true);
                LastAISpawnVolume = KFSV;
            }
            if((Outer.bIsVersusGame && !bSkipHumanZedSpawning) && Outer.MyKFGRI.WaveNum == Outer.MyKFGRI.WaveMax)
            {
                AIToSpawn.Length = 0;
            }
            if(bLogAISpawning)
            {
                LogInternal((("KFAISpawnManager.SpawnAI() AIs spawned:" @ string(VolumeAmount)) @ "in Volume:") @ string(KFSV));
            }
            if(bLogAISpawning)
            {
                LogMonsterList(AIToSpawn, "SpawnSquad Post Spawning");
            }
        }
        if(VolumeAmount == 0)
        {
        }
    }
    FinalAmount = VolumeAmount + SpawnerAmount;
    Outer.RefreshMonsterAliveCount();
    if(AIToSpawn.Length > 0)
    {
        if(bLogAISpawning)
        {
            LogMonsterList(AIToSpawn, "SpawnSquad Incomplete Spawn Remaining");
            LogMonsterList(LeftoverSpawnSquad, "Failed Spawn Before Adding To Leftovers");
        }
        I = 0;
        J0x56F:

        if(I < AIToSpawn.Length)
        {
            LeftoverSpawnSquad[LeftoverSpawnSquad.Length] = AIToSpawn[I];
            ++ I;
            goto J0x56F;
        }
        if(bLogAISpawning)
        {
            LogMonsterList(LeftoverSpawnSquad, "Failed Spawn After Adding To Leftovers");
        }
    }
    if(Outer.bEnableGameAnalytics)
    {
        RecordSpawnInformation(KFSV, FinalAmount);
    }
    return FinalAmount;
}

function RecordSpawnInformation(KFSpawnVolume BestSpawnVolume, int ZedsSpawned)
{
    local KFPlayerController KFPC;
    local Vector ViewLoc;
    local Rotator ViewRot;

    foreach Outer.WorldInfo.AllControllers(Class'KFPlayerController', KFPC)
    {
        if((KFPC.Pawn == none) || !KFPC.Pawn.IsAliveAndWell())
        {
            continue;            
        }
        ViewLoc = KFPC.Pawn.GetPawnViewLocation();
        ViewRot = KFPC.Pawn.GetViewRotation();
        if(((Outer.WorldInfo.Game != none) && KFGameInfo(Outer.WorldInfo.Game).GameplayEventsWriter != none) && KFGameInfo(Outer.WorldInfo.Game).GameplayEventsWriter.IsSessionInProgress())
        {
            KFGameInfo(Outer.WorldInfo.Game).GameplayEventsWriter.LogPlayersAtSpawn(KFPC, ViewLoc, ViewRot);
        }        
    }    
    if(((Outer.WorldInfo.Game != none) && KFGameInfo(Outer.WorldInfo.Game).GameplayEventsWriter != none) && KFGameInfo(Outer.WorldInfo.Game).GameplayEventsWriter.IsSessionInProgress())
    {
        KFGameInfo(Outer.WorldInfo.Game).GameplayEventsWriter.LogBestSpawnVolume(BestSpawnVolume, Outer.MyKFGRI.WaveNum, ZedsSpawned);
    }
}

function Update()
{
    if(Outer.IsWaveActive())
    {
        TotalWavesActiveTime += 1;
        TimeUntilNextSpawn -= 1;
        if(ShouldAddAI())
        {
            Outer.NumAISpawnsQueued += (SpawnSquad(GetNextSpawnList()));
            TimeUntilNextSpawn = CalcNextGroupSpawnTime();
        }
    }
}

function bool ShouldAddAI()
{
    if(((LeftoverSpawnSquad.Length > 0) || TimeUntilNextSpawn <= float(0)) && !IsFinishedSpawning())
    {
        return (GetNumAINeeded()) > 0;
    }
    return false;
}

function int GetMaxMonsters()
{
    local int UsedMaxMonsters;

    if((Outer.WorldInfo.NetMode == NM_Standalone) && Outer.GetLivingPlayerCount() == 1)
    {
        if(Outer.GameDifficulty < float(4))
        {
            UsedMaxMonsters = MaxMonstersSolo[int(Outer.GameDifficulty)];            
        }
        else
        {
            UsedMaxMonsters = MaxMonstersSolo[4 - 1];
        }        
    }
    else
    {
        UsedMaxMonsters = MaxMonsters;
    }
    return UsedMaxMonsters;
}

function int GetNumAINeeded()
{
    local int AINeeded, UsedMaxMonsters;

    if(!bSummoningBossMinions)
    {
        UsedMaxMonsters = GetMaxMonsters();        
    }
    else
    {
        UsedMaxMonsters = MaxBossMinions + 1;
    }
    if(((ActiveSpawner != none) && ActiveSpawner.bIsSpawning) && ActiveSpawner.PendingSpawns.Length > 0)
    {
        AINeeded = (UsedMaxMonsters - ActiveSpawner.PendingSpawns.Length) - Outer.AIAliveCount;
        if(bLogAISpawning)
        {
            LogInternal("KFAISpawnManager.GetNumAINeeded() ActiveSpawner.PendingSpawns.Length:" @ string(ActiveSpawner.PendingSpawns.Length));
        }        
    }
    else
    {
        AINeeded = UsedMaxMonsters - (GetAIAliveCount());
    }
    if(!bSummoningBossMinions)
    {
        if(AINeeded > WaveTotalAI)
        {
            AINeeded = WaveTotalAI;
        }
        if(AINeeded > (WaveTotalAI - Outer.NumAISpawnsQueued))
        {
            AINeeded = WaveTotalAI - Outer.NumAISpawnsQueued;
        }
    }
    if(bLogAISpawning)
    {
        LogInternal((((((("KFAISpawnManager.GetNumAINeeded() WaveTotalAI:" @ string(WaveTotalAI)) @ "AIAliveCount:") @ string(Outer.AIAliveCount)) @ "NumAISpawnsQueued:") @ string(Outer.NumAISpawnsQueued)) @ "AINeeded:") @ string(AINeeded));
    }
    return AINeeded;
}

function int GetAIAliveCount()
{
    return Outer.AIAliveCount;
}

function InitControllerList()
{
    local int I;
    local Controller C;

    I = RecentSpawnSelectedHumanControllerList.Length - 1;
    J0x17:

    if(I >= 0)
    {
        if((((RecentSpawnSelectedHumanControllerList[I] == none) || RecentSpawnSelectedHumanControllerList[I].Pawn == none) || !RecentSpawnSelectedHumanControllerList[I].Pawn.IsAliveAndWell()) || RecentSpawnSelectedHumanControllerList[I].GetTeamNum() != 0)
        {
            if((RecentSpawnSelectedHumanControllerList[I] != none) && RecentSpawnSelectedHumanControllerList[I].PlayerReplicationInfo != none)
            {
                if(bLogAISpawning)
                {
                    LogInternal(((string(GetFuncName()) $ " Removing ") $ RecentSpawnSelectedHumanControllerList[I].PlayerReplicationInfo.PlayerName) $ " From HumanPRIList");
                }                
            }
            else
            {
                if(bLogAISpawning)
                {
                    LogInternal(string(GetFuncName()) $ " Removing empty Controller From HumanPRIList");
                }
            }
            RecentSpawnSelectedHumanControllerList.Remove(I, 1;
        }
        -- I;
        goto J0x17;
    }
    if(Outer.MyKFGRI != none)
    {
        if(RecentSpawnSelectedHumanControllerList.Length == 0)
        {
            I = 0;
            J0x263:

            if(I < Outer.MyKFGRI.PRIArray.Length)
            {
                C = Controller(Outer.MyKFGRI.PRIArray[I].Owner);
                if((((C == none) || C.Pawn == none) || !C.Pawn.IsAliveAndWell()) || C.GetTeamNum() != 0)
                {                    
                }
                else
                {
                    RecentSpawnSelectedHumanControllerList[RecentSpawnSelectedHumanControllerList.Length] = C;
                    if(bLogAISpawning)
                    {
                        LogInternal(((string(GetFuncName()) $ " Adding ") $ RecentSpawnSelectedHumanControllerList[RecentSpawnSelectedHumanControllerList.Length - 1].PlayerReplicationInfo.PlayerName) $ " to RecentSpawnSelectedHumanControllerList");
                    }
                }
                ++ I;
                goto J0x263;
            }
        }
    }
}

function KFSpawnVolume GetBestSpawnVolume(optional array< class<KFPawn_Monster> > AIToSpawn, optional Controller OverrideController, optional Controller OtherController, optional bool bTeleporting, optional float MinDistSquared)
{
    local int VolumeIndex, BestIndex, ControllerIndex;
    local float BestRating, CurrentRating;
    local Controller RateController;

    if(OverrideController != none)
    {
        RateController = OverrideController;        
    }
    else
    {
        InitControllerList();
        if(RecentSpawnSelectedHumanControllerList.Length > 0)
        {
            ControllerIndex = Rand(RecentSpawnSelectedHumanControllerList.Length);
            RateController = RecentSpawnSelectedHumanControllerList[ControllerIndex];
            RecentSpawnSelectedHumanControllerList.Remove(ControllerIndex, 1;
            if(bLogAISpawning)
            {
                LogInternal(((string(GetFuncName()) $ " Rating with Controller ") $ RateController.PlayerReplicationInfo.PlayerName) $ " From RecentSpawnSelectedHumanControllerList");
            }
        }
    }
    if(RateController == none)
    {
        if(bLogAISpawning)
        {
            WarnInternal(string(GetFuncName()) $ " no controllers to rate spawning with!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        }
        return none;
    }
    BestRating = 0;
    BestIndex = -1;
    VolumeIndex = 0;
    J0x1C5:

    if(VolumeIndex < SpawnVolumes.Length)
    {
        CurrentRating = SpawnVolumes[VolumeIndex].RateVolume(DesiredSquadType, RateController, OtherController, BestRating, bTeleporting, MinDistSquared);
        if(CurrentRating > BestRating)
        {
            BestRating = CurrentRating;
            BestIndex = VolumeIndex;
        }
        ++ VolumeIndex;
        goto J0x1C5;
    }
    if(BestIndex < 0)
    {
        return none;
    }
    if(bLogAISpawning)
    {
        LogInternal(((((string(self) @ string(GetFuncName())) @ "returning chosen spawn volume") @ string(SpawnVolumes[BestIndex])) @ "with a rating of") @ string(BestRating));
    }
    if((SpawnVolumes[BestIndex] != none) && SpawnVolumes[BestIndex].bDebugRatingChecks)
    {
        LogInternal(((((string(self) @ string(GetFuncName())) @ "returning chosen spawn volume") @ string(SpawnVolumes[BestIndex])) @ "with a rating of") @ string(BestRating));
        Outer.DrawDebugLine(SpawnVolumes[BestIndex].Location, Outer.GetALocalPlayerController().ViewTarget.Location, 0, 255, 0, true);
    }
    return SpawnVolumes[BestIndex];
}

function UpdateSpawnCurveIntensity(float NewSineFreq)
{
    if(NewSineFreq != float(0))
    {
        SetSineWaveFreq(NewSineFreq);
    }
}

function ResetSpawnCurveIntensity()
{
    SetSineWaveFreq(default.SineWaveFreq);
}

protected function bool CanSpawnPlayerBoss();

function ResetSpawnManager();

defaultproperties
{
    SineWaveFreq=0.04
    MaxMonsters=32
    MaxMonstersSolo[0]=16
    MaxMonstersSolo[1]=24
    MaxMonstersSolo[2]=24
    MaxMonstersSolo[3]=24
    SoloWaveSpawnRateModifier[0]=(RateModifier=(1,1,1,1))
    SoloWaveSpawnRateModifier[1]=(RateModifier=(1,1,1,1))
    SoloWaveSpawnRateModifier[2]=(RateModifier=(1,1,1,1))
    SoloWaveSpawnRateModifier[3]=(RateModifier=(1,1,1,1))
    EarlyWaveSpawnRateModifier[0]=1
    EarlyWaveSpawnRateModifier[1]=0.8
    EarlyWaveSpawnRateModifier[2]=0.8
    EarlyWaveSpawnRateModifier[3]=0.7
    EarlyWaveIndex=7
    EarlyWavesSpawnTimeModByPlayers[0]=1
    EarlyWavesSpawnTimeModByPlayers[1]=1
    EarlyWavesSpawnTimeModByPlayers[2]=1
    EarlyWavesSpawnTimeModByPlayers[3]=0.85
    EarlyWavesSpawnTimeModByPlayers[4]=0.65
    EarlyWavesSpawnTimeModByPlayers[5]=0.3
    LateWavesSpawnTimeModByPlayers[0]=1.1
    LateWavesSpawnTimeModByPlayers[1]=1.1
    LateWavesSpawnTimeModByPlayers[2]=1.1
    LateWavesSpawnTimeModByPlayers[3]=1
    LateWavesSpawnTimeModByPlayers[4]=0.75
    LateWavesSpawnTimeModByPlayers[5]=0.6
    RecycleSpecialSquad(0)=
/* Exception thrown while deserializing RecycleSpecialSquad
System.InvalidOperationException: Nullable object must have a value.
   at System.ThrowHelper.ThrowInvalidOperationException(ExceptionResource resource)
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    RecycleSpecialSquad(1)=
/* Exception thrown while deserializing RecycleSpecialSquad
System.InvalidOperationException: Nullable object must have a value.
   at System.ThrowHelper.ThrowInvalidOperationException(ExceptionResource resource)
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    RecycleSpecialSquad(2)=
/* Exception thrown while deserializing RecycleSpecialSquad
System.InvalidOperationException: Nullable object must have a value.
   at System.ThrowHelper.ThrowInvalidOperationException(ExceptionResource resource)
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    RecycleSpecialSquad(3)=
/* Exception thrown while deserializing RecycleSpecialSquad
System.InvalidOperationException: Nullable object must have a value.
   at System.ThrowHelper.ThrowInvalidOperationException(ExceptionResource resource)
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    MaxSpecialSquadRecycles=-1
    ObjExtraAI=16
    MaxBossMinionScaleByPlayers[0]=1
    MaxBossMinionScaleByPlayers[1]=1.5
    MaxBossMinionScaleByPlayers[2]=1.5
    MaxBossMinionScaleByPlayers[3]=1.875
    MaxBossMinionScaleByPlayers[4]=1.875
    MaxBossMinionScaleByPlayers[5]=2
}