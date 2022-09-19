/*******************************************************************************
 * KFGameInfo_Endless generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGameInfo_Endless extends KFGameInfo_Survival
    config(Game)
    hidecategories(Navigation,Movement,Collision);

var bool bIsInHoePlus;
var bool bUseSpecialWave;
var KFGameDifficulty_Endless EndlessDifficulty;
var int CurrentFrameBooms;
var array<KFGame.KFAISpawnManager.EAIType> SpecialWaveTypes;
var KFGame.KFAISpawnManager.EAIType SpecialWaveType;
var const int SpecialWaveStart;
var const int OutbreakWaveStart;

event InitGame(string Options, out string ErrorMessage)
{
    super(KFGameInfo).InitGame(Options, ErrorMessage);
    GameLength = 2;
    ResetDifficulty();
}

event PostBeginPlay()
{
    super.PostBeginPlay();
    OutbreakEvent.CacheGRI();
    OutbreakEvent.CacheWorldInfo();
}

function InitSpawnManager()
{
    SpawnManager = new (self) SpawnManagerClasses[0];
    SpawnManager.Initialize();
    WaveMax = 255;
    MyKFGRI.WaveMax = WaveMax;
}

function ResetDifficulty()
{
    if(EndlessDifficulty == none)
    {
        EndlessDifficulty = KFGameDifficulty_Endless(DifficultyInfo);
    }
    if(EndlessDifficulty != none)
    {
        EndlessDifficulty.SetDifficultyScaling(GameDifficulty);
        EndlessDifficulty.CurrentDifficultyScaling.CurrentDifficultyIndex = 0;
        EndlessDifficulty.SetDifficultySettings(0);
    }
}

static function bool GetShouldShowLength()
{
    return false;
}

function WaveStarted()
{
    super.WaveStarted();
    if((bForceSpecialWave && !bUseSpecialWave) || bForceOutbreakWave && KFGameReplicationInfo_Endless(GameReplicationInfo).CurrentWeeklyMode == -1)
    {
        TrySetNextWaveSpecial();
    }
    if(KFGameReplicationInfo_Endless(GameReplicationInfo).CurrentWeeklyMode != -1)
    {
        LogInternal("Starting Outbreak" @ string(KFGameReplicationInfo_Endless(GameReplicationInfo).CurrentWeeklyMode));
        StartOutbreakRound(KFGameReplicationInfo_Endless(GameReplicationInfo).CurrentWeeklyMode);        
    }
    else
    {
        if(bUseSpecialWave)
        {
            LogInternal("Starting special wave" @ string(SpecialWaveType));
        }
    }
    SetTimer(1, false, 'WaveStarted', KFGameReplicationInfo_Endless(GameReplicationInfo));
}

function byte GetWaveStartMessage()
{
    local int tempInt;

    if(MyKFGRI.IsSpecialWave(tempInt))
    {
        return 18;        
    }
    else
    {
        if(MyKFGRI.IsWeeklyWave(tempInt))
        {
            return 17;
        }
    }
    return super.GetWaveStartMessage();
}

function PlayWaveStartDialog();

function bool TrySetNextWaveSpecial()
{
    local float OutbreakPct, SpecialWavePct;
    local int OutbreakEventIdx;

    if(MyKFGRI.IsBossWave() || MyKFGRI.IsBossWaveNext())
    {
        return false;
    }
    OutbreakPct = EndlessDifficulty.GetOutbreakPctChance();
    SpecialWavePct = EndlessDifficulty.GetSpeicalWavePctChance();
    if(bForceOutbreakWave || ((WaveNum >= OutbreakWaveStart) && OutbreakPct > 0) && FRand() < OutbreakPct)
    {
        if(DebugForcedOutbreakIdx == -1)
        {
            OutbreakEventIdx = Rand(OutbreakEvent.SetEvents.Length);            
        }
        else
        {
            LogInternal("Forcing Outbreak" @ string(DebugForcedOutbreakIdx));
            OutbreakEventIdx = DebugForcedOutbreakIdx;
        }
        KFGameReplicationInfo_Endless(GameReplicationInfo).CurrentWeeklyMode = OutbreakEventIdx;
        bForceOutbreakWave = false;
        DebugForcedOutbreakIdx = -1;
        return true;        
    }
    else
    {
        if(bForceSpecialWave || ((WaveNum >= SpecialWaveStart) && SpecialWavePct > 0) && FRand() < SpecialWavePct)
        {
            bUseSpecialWave = true;
            if(DebugForceSpecialWaveZedType == -1)
            {
                SpecialWaveType = EndlessDifficulty.GetSpecialWaveType();                
            }
            else
            {
                LogInternal("Forcing Special Wave Type" @ string(byte(DebugForceSpecialWaveZedType)));
                SpecialWaveType = byte(DebugForceSpecialWaveZedType);
            }
            KFGameReplicationInfo_Endless(GameReplicationInfo).CurrentSpecialMode = SpecialWaveType;
            bForceSpecialWave = false;
            DebugForceSpecialWaveZedType = -1;
            return true;
        }
    }
    bForceOutbreakWave = false;
    bForceSpecialWave = false;
    DebugForcedOutbreakIdx = -1;
    DebugForceSpecialWaveZedType = -1;
    return false;
}

function WaveEnded(KFGameInfo_Survival.EWaveEndCondition WinCondition)
{
    if((!bWaveStarted && !MyKFGRI.bTraderIsOpen) && WinCondition != 1)
    {
        return;
    }
    WaveMax = byte(WaveNum + 2);
    MyKFGRI.WaveMax = WaveMax;
    if(KFGameReplicationInfo_Endless(GameReplicationInfo).CurrentWeeklyMode != -1)
    {
        EndOutbreakRound();
    }
    bUseSpecialWave = false;
    KFGameReplicationInfo_Endless(GameReplicationInfo).CurrentWeeklyMode = -1;
    KFGameReplicationInfo_Endless(GameReplicationInfo).CurrentSpecialMode = -1;
    HellOnEarthPlusRoundIncrement();
    super.WaveEnded(WinCondition);
    TrySetNextWaveSpecial();
}

function HellOnEarthPlusRoundIncrement()
{
    if(bIsInHoePlus)
    {
        EndlessDifficulty.IncreaseZedUpgradePct();
        EndlessDifficulty.IncreaseZedFullUpgradePct();
    }
}

function BossDied(Controller Killer, optional bool bCheckWaveEnded)
{
    local KFPawn_Monster AIP;
    local KFPlayerController KFPC;

    bCheckWaveEnded = true;
    super.BossDied(Killer, bCheckWaveEnded);
    KFPC = KFPlayerController(Killer);
    if((KFPC != none) && KFPC.MatchStats != none)
    {
        KFPC.MatchStats.bKilledBoss = true;
    }
    foreach WorldInfo.AllPawns(Class'KFPawn_Monster', AIP)
    {
        if(AIP.Health > 0)
        {
            AIP.Died(none, none, AIP.Location);
        }        
    }    
    if(KFAISpawnManager_Endless(SpawnManager) != none)
    {
        KFAISpawnManager_Endless(SpawnManager).OnBossDied();
    }
    IncrementDifficulty();
    SetBossIndex();
    if(bCheckWaveEnded)
    {
        CheckWaveEnd(true);
    }
}

function SetBossIndex()
{
    local int OldBossIndex;
    local BossSpawnReplacement Replacement;
    local int ReplaceIdx;
    local bool bShouldCacheBoss;

    OldBossIndex = BossIndex;
    BossIndex = Rand(default.AIBossClassList.Length);
    bShouldCacheBoss = OldBossIndex != BossIndex;
    if(OutbreakEvent.ActiveEvent.BossSpawnReplacementList.Length > 0)
    {
        foreach OutbreakEvent.ActiveEvent.BossSpawnReplacementList(Replacement,)
        {
            if(Replacement.SpawnEntry == BossIndex)
            {
                ReplaceIdx = AIBossClassList.Find(Replacement.NewClass;
                if(ReplaceIdx != -1)
                {
                    bShouldCacheBoss = true;
                    BossIndex = ReplaceIdx;
                    goto J0x154;
                }
            }            
        }
        J0x154:
        
    }
    if(bShouldCacheBoss)
    {
        MyKFGRI.CacheSelectedBoss(BossIndex);
    }
}

function IncrementDifficulty()
{
    if(bIsInHoePlus)
    {
        EndlessDifficulty.IncrementHoePlus();
        LogInternal("Incrementing Hell on Earth Plus.");        
    }
    else
    {
        if(EndlessDifficulty.ShouldStartHoePlus())
        {
            StartHoePlus();
            LogInternal("Starting Hell on Earth Plus.");            
        }
        else
        {
            GameDifficultyModifier = float(Clamp(int(GameDifficultyModifier + float(1)), MinGameDifficulty, MaxGameDifficulty));
            MyKFGRI.SetModifiedGameDifficulty(byte(GameDifficultyModifier));
            LogInternal("Increasing Difficulty to" @ string(GameDifficulty));
        }
        EndlessDifficulty.IncrementDifficulty();
    }
    if(KFAISpawnManager_Endless(SpawnManager) != none)
    {
        KFAISpawnManager_Endless(SpawnManager).OnDifficultyUpdated();
    }
    TimeBetweenWaves = int(GetTraderTime());
    UpdateGameSettings();
}

function class<KFPawn_Monster> GetAISpawnType(KFGame.KFAISpawnManager.EAIType AIType)
{
    local KFGame.KFAISpawnManager.EAIType OldAIType;
    local string OldAITypeStr, NewAITypeStr;
    local class<KFPawn_Monster> OverrideType;

    if(bUseSpecialWave)
    {
        return super.GetAISpawnType(SpecialWaveType);
    }
    if(ShouldFullyUpgradeAIType())
    {
        OldAIType = AIType;
        AIType = GetFullyUpgradedAIType(AIType);
        OldAITypeStr = SpawnManager.ZedTypeToString(OldAIType);
        NewAITypeStr = SpawnManager.ZedTypeToString(AIType);
        if(SpawnManager.bLogAISpawning)
        {
            LogInternal((("Upgrade" @ OldAITypeStr) @ "to") @ NewAITypeStr);
        }        
    }
    else
    {
        if(ShouldUpgradeAIType())
        {
            OldAIType = AIType;
            AIType = GetUpgradedAIType(AIType);
            OldAITypeStr = SpawnManager.ZedTypeToString(OldAIType);
            NewAITypeStr = SpawnManager.ZedTypeToString(AIType);
            if(SpawnManager.bLogAISpawning)
            {
                LogInternal((("Upgrade" @ OldAITypeStr) @ "to") @ NewAITypeStr);
            }
        }
    }
    if((KFGameReplicationInfo_Endless(GameReplicationInfo).CurrentWeeklyMode != -1) && !MyKFGRI.IsBossWave() || OutbreakEvent.ActiveEvent.bAllowSpawnReplacementDuringBossWave)
    {
        OverrideType = OutbreakEvent.GetAISpawnOverrirde(AIType);
        if(SpawnManager.bLogAISpawning)
        {
            LogInternal("KFGameInfo_Endless.GetAISpawnType - Force AI Type during Outbreak Event:" @ string(OverrideType));
        }
        return OverrideType;
    }
    return super.GetAISpawnType(AIType);
}

function bool ShouldUpgradeAIType()
{
    local float DieRoll;
    local bool bShouldUpgrade;
    local float UpgradeChance;

    bShouldUpgrade = false;
    if(bIsInHoePlus)
    {
        DieRoll = FRand();
        UpgradeChance = EndlessDifficulty.GetZedUpgradePctChance();
        bShouldUpgrade = DieRoll < UpgradeChance;
        if(SpawnManager.bLogAISpawning)
        {
            LogInternal("Should Upgrade AI Type:" @ string(bShouldUpgrade));
        }
        if(SpawnManager.bLogAISpawning)
        {
            LogInternal((((("bIsInHoePlus:" @ string(bIsInHoePlus)) @ "Upgrade Chance:") @ string(DieRoll)) @ "Zed Upgrade Chance:") @ string(UpgradeChance));
        }
    }
    return bShouldUpgrade;
}

function bool ShouldFullyUpgradeAIType()
{
    local float DieRoll;
    local bool bShouldUpgrade;
    local float UpgradeChance;

    if(bIsInHoePlus)
    {
        DieRoll = FRand();
        UpgradeChance = EndlessDifficulty.GetZedFullUpgradePctChance();
        bShouldUpgrade = bIsInHoePlus && DieRoll < UpgradeChance;
        if(SpawnManager.bLogAISpawning)
        {
            LogInternal("Should Full Upgrade AI Type:" @ string(bShouldUpgrade));
        }
        if(SpawnManager.bLogAISpawning)
        {
            LogInternal((((("bIsInHoePlus:" @ string(bIsInHoePlus)) @ "Upgrade Chance:") @ string(DieRoll)) @ "Zed Upgrade Chance:") @ string(UpgradeChance));
        }
    }
    return bShouldUpgrade;
}

function KFGame.KFAISpawnManager.EAIType GetUpgradedAIType(KFGame.KFAISpawnManager.EAIType AIType)
{
    switch(AIType)
    {
        case 0:
            return 2;
        case 1:
            return 5;
        case 2:
            return 4;
        case 3:
            return 1;
        case 4:
            return 9;
        case 5:
            return 10;
        case 9:
            return 8;
        case 10:
            return 11;
        case 11:
            return 6;
        case 8:
            return 7;
        case 6:
        case 7:
        default:
            return AIType;
            break;
    }
}

function KFGame.KFAISpawnManager.EAIType GetFullyUpgradedAIType(KFGame.KFAISpawnManager.EAIType AIType)
{
    switch(AIType)
    {
        case 1:
        case 3:
        case 5:
        case 10:
        case 11:
        case 6:
            return 6;
        case 0:
        case 2:
        case 4:
        case 9:
        case 8:
        case 7:
            return 7;
        default:
            return AIType;
            break;
    }
}

function StartHoePlus()
{
    bIsInHoePlus = true;
    EndlessDifficulty.SetZedUpgradeToBase();
    EndlessDifficulty.SetZedFullUpgradeToBase();
}

function float GetGameInfoSpawnRateMod()
{
    local float AdjustedSpawnRateMod;

    AdjustedSpawnRateMod = super.GetGameInfoSpawnRateMod();
    if((EndlessDifficulty != none) && bUseSpecialWave)
    {
        AdjustedSpawnRateMod *= EndlessDifficulty.GetSpecialWaveSpawnRateMod(SpecialWaveType);
    }
    return AdjustedSpawnRateMod;
}

function RestartPlayer(Controller NewPlayer)
{
    local KFPawn_Human KFPH;

    super.RestartPlayer(NewPlayer);
    KFPH = KFPawn_Human(NewPlayer.Pawn);
    OutbreakEvent.AdjustRestartedPlayer(KFPH);
}

function ReduceDamage(out int Damage, Pawn injured, Controller InstigatedBy, Vector HitLocation, out Vector Momentum, class<DamageType> DamageType, Actor DamageCauser, TraceHitInfo HitInfo)
{
    local StatAdjustments ToAdjust;
    local array<StatAdjustments> ZedsToAdjust;
    local KFPawn InstigatorPawn;

    super.ReduceDamage(Damage, injured, InstigatedBy, HitLocation, Momentum, DamageType, DamageCauser, HitInfo);
    if(InstigatedBy != none)
    {
        InstigatorPawn = KFPawn(InstigatedBy.Pawn);
    }
    ZedsToAdjust = EndlessDifficulty.GetZedsToAdjust();
    foreach ZedsToAdjust(ToAdjust,)
    {
        if(ClassIsChildOf(injured.Class, ToAdjust.ClassToAdjust))
        {
            Damage *= ToAdjust.DamageTakenScale;
        }
        if((InstigatorPawn != none) && ClassIsChildOf(InstigatorPawn.Class, ToAdjust.ClassToAdjust))
        {
            Damage *= ToAdjust.DamageDealtScale;
        }        
    }    
}

function StartOutbreakRound(int OutbreakIdx)
{
    OutbreakEvent.SetActiveEvent(OutbreakIdx);
    OutbreakEvent.UpdateGRI();
    OutbreakEvent.SetWorldInfoOverrides();
    if((OutbreakEvent.ActiveEvent.GlobalDamageTickRate > 0) && OutbreakEvent.ActiveEvent.GlobalDamageTickAmount > 0)
    {
        SetTimer(OutbreakEvent.ActiveEvent.GlobalDamageTickRate, true, 'ApplyGlobalDamage', OutbreakEvent);
    }
}

function EndOutbreakRound()
{
    local KFPawn KFP;

    OutbreakEvent.ClearActiveEvent();
    foreach WorldInfo.AllPawns(Class'KFPawn', KFP)
    {
        KFP.IntendedBodyScale = 1;        
    }    
    if(IsTimerActive('ApplyGlobalDamage', OutbreakEvent))
    {
        ClearTimer('ApplyGlobalDamage', OutbreakEvent);
    }
}

function Tick(float DeltaTime)
{
    CurrentFrameBooms = 0;
    super(KFGameInfo).Tick(DeltaTime);
}

function DoDeathExplosion(Pawn DeadPawn, KFGameExplosion ExplosionTemplate, class<KFPawn> ExplosionIgnoreClass)
{
    local KFExplosionActorReplicated ExploActor;

    if(CurrentFrameBooms < OutbreakEvent.ActiveEvent.MaxBoomsPerFrame)
    {
        ExploActor = Spawn(Class'KFExplosionActorReplicated', DeadPawn,, DeadPawn.Location);
        if(ExploActor != none)
        {
            ExploActor.InstigatorController = DeadPawn.Controller;
            ExploActor.Instigator = DeadPawn;
            ExploActor.Attachee = DeadPawn;
            ExplosionTemplate.ActorClassToIgnoreForDamage = ExplosionIgnoreClass;
            ExploActor.Explode(ExplosionTemplate, vect(0, 0, 1));
            ++ CurrentFrameBooms;
        }
    }
}

function bool ShouldOverrideDoshOnKill(class<KFPawn_Monster> KilledPawn, out float DoshGiven)
{
    local StatAdjustments ToAdjust;
    local array<StatAdjustments> ZedsToAdjust;

    ZedsToAdjust = EndlessDifficulty.GetZedsToAdjust();
    foreach ZedsToAdjust(ToAdjust,)
    {
        if((ToAdjust.ClassToAdjust == KilledPawn) && ToAdjust.DoshGiven != -1)
        {
            DoshGiven = float(ToAdjust.DoshGiven);            
            return true;
        }        
    }    
    return false;
}

exec function SetWave(byte NewWaveNum)
{
    local int CurrRound;

    if(!AllowWaveCheats())
    {
        return;
    }
    GotoState('DebugSuspendWave');
    WaveNum = NewWaveNum - 1;
    MyKFGRI.WaveNum = byte(WaveNum);
    bIsInHoePlus = false;
    ResetDifficulty();
    SpawnManager.GetWaveSettings(SpawnManager.WaveSettings);
    UpdateGameSettings();
    CurrRound = 0;
    J0xCC:

    if(CurrRound < WaveNum)
    {
        if((CurrRound > 0) && (CurrRound % 5) == 0)
        {
            IncrementDifficulty();
        }
        HellOnEarthPlusRoundIncrement();
        ++ CurrRound;
        goto J0xCC;
    }
    ResetAllPickups();
    GotoState('PlayingWave');
}

function int CalculateMinimumRespawnDosh(float UsedMaxRespawnDosh)
{
    return Round(UsedMaxRespawnDosh * float(Min(1, int(float(WaveNum) / 10))));
}

function float GetTotalWaveCountScale()
{
    local float WaveScale;

    if(bForceSpecialWave && !bUseSpecialWave)
    {
        TrySetNextWaveSpecial();
    }
    WaveScale = super.GetTotalWaveCountScale();
    if(bUseSpecialWave)
    {
        WaveScale *= EndlessDifficulty.GetSpecialWaveScale(SpecialWaveType);
    }
    return WaveScale;
}

static function bool HasCustomTraderVoiceGroup()
{
    return true;
}

function SetMonsterDefaults(KFPawn_Monster P)
{
    local KFAIController KFAIC;

    if(bUseSpecialWave && EndlessDifficulty.ShouldSpawnEnraged(SpecialWaveType))
    {
        KFAIC = KFAIController(P.Controller);
        if(KFAIC != none)
        {
            KFAIC.SetSprintingDisabled(false);
            KFAIC.SetCanSprint(true);
            KFAIC.SetCanSprintWhenDamaged(true);
        }
        if(P != none)
        {
            P.SetEnraged(true);
            P.SetSprinting(true);
        }
    }
    super(KFGameInfo).SetMonsterDefaults(P);
}

function UnregisterPlayer(PlayerController PC)
{
    super(KFGameInfo).UnregisterPlayer(PC);
    if(((GetNumPlayers()) == 0) && MyKFGRI.bIsEndlessPaused)
    {
        ResumeEndlessGame();
    }
}

defaultproperties
{
    SpecialWaveTypes(0)=13
    SpecialWaveTypes(1)=2
    SpecialWaveTypes(2)=0
    SpecialWaveTypes(3)=0
    SpecialWaveTypes(4)=0
    SpecialWaveTypes(5)=0
    SpecialWaveTypes(6)=0
    SpecialWaveTypes(7)=0
    SpecialWaveTypes(8)=26
    SpecialWaveTypes(9)=2
    SpecialWaveTypes(10)=0
    SpecialWaveStart=6
    OutbreakWaveStart=6
    bSplitBossDoshReward=false
    bIsEndlessGame=true
    DifficultyInfoClass=Class'KFGameDifficulty_Endless'
    DifficultyInfoConsoleClass=Class'KFGameDifficulty_Endless_Console'
    SpawnManagerClasses=/* Array type was not detected. */
    TraderVoiceGroupClass=Class'KFTraderVoiceGroup_Patriarch'
    OutbreakEventClass=Class'KFOutbreakEvent_Endless'
    GameName="Endless"
    GameReplicationInfoClass=Class'KFGameReplicationInfo_Endless'
}