/*******************************************************************************
 * KFGameInfo_Survival generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGameInfo_Survival extends KFGameInfo
    config(Game)
    hidecategories(Navigation,Movement,Collision);

const ObjectiveChance = 0.5f;

enum EWaveEndCondition
{
    WEC_WaveWon,
    WEC_TeamWipedOut,
    WEC_GameWon,
    WEC_MAX
};

var int TimeBetweenWaves;
var const float EndCinematicDelay;
var const float AARDisplayDelay;
var array<AARAward> TeamAwardList;
var byte WaveMax;
var int WaveNum;
var array< class<KFAISpawnManager> > SpawnManagerClasses;
var int PlayedObjectives;
var float ObjectiveCheckIntervall;
var bool bObjectivePlayed;
var bool bLogCheckObjective;
var float MinAIAlivePercReqForObjStart;

static function bool ShouldPlayMusicAtStart()
{
    return true;
}

static function bool ShouldPlayActionMusicTrack(KFGameReplicationInfo GRI)
{
    return (GRI.WaveNum > 0) && !GRI.bTraderIsOpen;
}

event PreBeginPlay()
{
    super.PreBeginPlay();
    InitSpawnManager();
    UpdateGameSettings();
}

event PostBeginPlay()
{
    super.PostBeginPlay();
    TimeBetweenWaves = int(DifficultyInfo.GetTraderTimeByDifficulty());
}

function InitSpawnManager()
{
    SpawnManager = new (self) SpawnManagerClasses[GameLength];
    SpawnManager.Initialize();
    WaveMax = byte(SpawnManager.Waves.Length);
    MyKFGRI.WaveMax = WaveMax;
}

function StartMatch()
{
    super.StartMatch();
    WaveNum = 0;
    if(Class'KFGameEngine'.static.CheckNoAutoStart() || Class'KFGameEngine'.static.IsEditor())
    {
        GotoState('DebugSuspendWave');        
    }
    else
    {
        GotoState('PlayingWave');
    }
}

function PlayWaveStartDialog()
{
    if(((Role == ROLE_Authority) && KFGameInfo(WorldInfo.Game) != none) && KFGameInfo(WorldInfo.Game).DialogManager != none)
    {
        KFGameInfo(WorldInfo.Game).DialogManager.PlayWaveStartDialog(WaveNum == WaveMax);
    }
}

function byte GetGameIntensityForMusic()
{
    switch(GameLength)
    {
        case 0:
            if(WaveNum <= 0)
            {
                return 1;                
            }
            else
            {
                if(WaveNum <= 1)
                {
                    return 4;                    
                }
                else
                {
                    if(WaveNum <= 2)
                    {
                        return 7;                        
                    }
                    else
                    {
                        return 10;
                    }
                }
            }
        case 1:
            if(WaveNum <= 1)
            {
                return 1;                
            }
            else
            {
                if(WaveNum <= 3)
                {
                    return 4;                    
                }
                else
                {
                    if(WaveNum <= 5)
                    {
                        return 7;                        
                    }
                    else
                    {
                        return 10;
                    }
                }
            }
        case 2:
            if(WaveNum <= 2)
            {
                return 1;                
            }
            else
            {
                if(WaveNum <= 5)
                {
                    return 4;                    
                }
                else
                {
                    if(WaveNum <= 8)
                    {
                        return 7;                        
                    }
                    else
                    {
                        return 10;
                    }
                }
            }
        default:
            return 255;
            break;
    }
}

function bool PlayerCanRestart(PlayerController aPlayer)
{
    return !IsWaveActive() && MyKFGRI.bMatchHasBegun;
}

function RestartPlayer(Controller NewPlayer)
{
    local KFPlayerController KFPC;
    local KFPlayerReplicationInfo KFPRI;

    KFPC = KFPlayerController(NewPlayer);
    KFPRI = KFPlayerReplicationInfo(NewPlayer.PlayerReplicationInfo);
    if((KFPC != none) && KFPRI != none)
    {
        if(IsPlayerReady(KFPRI))
        {
            if((MyKFGRI.bMatchHasBegun && KFPRI.NumTimesReconnected > 1) && (WorldInfo.TimeSeconds - KFPRI.LastQuitTime) < float(ReconnectRespawnTime))
            {
                KFPC.StartSpectate();
                KFPC.SetTimer(float(ReconnectRespawnTime) - (WorldInfo.TimeSeconds - KFPRI.LastQuitTime), false, 'SpawnReconnectedPlayer');                
            }
            else
            {
                if(IsWaveActive())
                {
                    KFPC.StartSpectate();                    
                }
                else
                {
                    super.RestartPlayer(NewPlayer);
                    if(KFPRI.Deaths == 0)
                    {
                        if(WaveNum < 1)
                        {
                            KFPRI.Score = float(DifficultyInfo.GetAdjustedStartingCash());                            
                        }
                        else
                        {
                            KFPRI.Score = float(GetAdjustedDeathPenalty(KFPRI, true));
                        }
                        if(bLogScoring)
                        {
                            LogInternal(((("SCORING: Player" @ KFPRI.PlayerName) @ "received") @ string(KFPRI.Score)) @ "starting cash");
                        }
                    }
                }
            }
            if(Class'KFGameInfo'.static.AllowBalanceLogging())
            {
                WorldInfo.LogGameBalance(((((string('Respawn') $ ",") $ KFPRI.PlayerName) $ ",") $ "$") $ string(KFPRI.Score));
            }
        }
    }
}

function Killed(Controller Killer, Controller KilledPlayer, Pawn KilledPawn, class<DamageType> DamageType)
{
    super.Killed(Killer, KilledPlayer, KilledPawn, DamageType);
    if(!MyKFGRI.IsFinalWave() && KilledPawn.IsA('KFPawn_Monster'))
    {
        Class'KFTraderDialogManager'.static.PlayGlobalWaveProgressDialog(MyKFGRI.AIRemaining, MyKFGRI.WaveTotalAICount, WorldInfo);
    }
    CheckWaveEnd();
}

function ReduceDamage(out int Damage, Pawn injured, Controller InstigatedBy, Vector HitLocation, out Vector Momentum, class<DamageType> DamageType, Actor DamageCauser)
{
    if(((injured.Controller != none) && injured.Controller.bIsPlayer) && !MyKFGRI.bMatchHasBegun)
    {
        Damage = 0;
        Momentum = vect(0, 0, 0);
    }
    super.ReduceDamage(Damage, injured, InstigatedBy, HitLocation, Momentum, DamageType, DamageCauser);
}

function BossDied(Controller Killer)
{
    local KFPawn_Monster AIP;
    local KFGameReplicationInfo KFGRI;
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(Killer);
    if((KFPC != none) && KFPC.MatchStats != none)
    {
        KFPC.MatchStats.bKilledBoss = true;
    }
    KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
    if((KFGRI != none) && !KFGRI.IsFinalWave())
    {
        return;
    }
    DramaticEvent(1, 6);
    foreach WorldInfo.AllPawns(Class'KFPawn_Monster', AIP)
    {
        if(AIP.Health > 0)
        {
            AIP.Died(none, none, AIP.Location);
        }        
    }    
    if(((WorldInfo.Game != none) && KFGameInfo(WorldInfo.Game).GameplayEventsWriter != none) && KFGameInfo(WorldInfo.Game).GameplayEventsWriter.IsSessionInProgress())
    {
        KFGameInfo(WorldInfo.Game).GameplayEventsWriter.LogGameIntEvent(1009, 1);
    }
    CheckWaveEnd(true);
}

function UpdateGameSettings()
{
    local name SessionName;
    local KFOnlineGameSettings KFGameSettings;

    if((WorldInfo.NetMode == NM_DedicatedServer) || WorldInfo.NetMode == NM_ListenServer)
    {
        if(NotEqual_InterfaceInterface(GameInterface, (none)))
        {
            SessionName = PlayerReplicationInfoClass.default.SessionName;
            KFGameSettings = KFOnlineGameSettings(GameInterface.GetGameSettings(SessionName));
            if(KFGameSettings != none)
            {
                KFGameSettings.Difficulty = int(GameDifficulty);
                if(WaveNum == 0)
                {
                    KFGameSettings.bInProgress = false;
                    KFGameSettings.CurrentWave = 1;                    
                }
                else
                {
                    KFGameSettings.bInProgress = true;
                    KFGameSettings.CurrentWave = WaveNum;
                }
                KFGameSettings.NumWaves = WaveMax - 1;
                KFGameSettings.OwningPlayerName = Class'GameReplicationInfo'.default.ServerName;
                KFGameSettings.NumPublicConnections = MaxPlayers;
                KFGameSettings.bRequiresPassword = RequiresPassword();
                KFGameSettings.bCustom = bIsCustomGame;
                KFGameSettings.bUsesStats = !bIsUnrankedGame;
                KFGameSettings.NumSpectators = NumSpectators;
                if(MyKFGRI != none)
                {
                    MyKFGRI.bCustom = bIsCustomGame;
                    MyKFGRI.bRanked = !bIsUnrankedGame;
                }
                GameInterface.UpdateOnlineGame(SessionName, KFGameSettings, true);
            }
        }
    }
}

event Timer()
{
    super(GameInfo).Timer();
    if(SpawnManager != none)
    {
        SpawnManager.Update();
    }
}

function byte IsMultiplayerGame()
{
    return (((WorldInfo.NetMode != NM_Standalone) && (GetNumPlayers()) > 1) ? NM_DedicatedServer : NM_Standalone);
}

function UpdateWaveEndDialogInfo()
{
    local int PlayersAlive, PlayersTotal, MostZedsKilled, MostDoshEarned, BestTeammateScore;

    local KFPlayerController KFPC, KilledMostZeds, EarnedMostDosh, BestTeammate;

    foreach WorldInfo.AllControllers(Class'KFPlayerController', KFPC)
    {
        if(KFPC.bDemoOwner)
        {
            continue;            
        }
        ++ PlayersTotal;
        if((KFPC.Pawn != none) && KFPC.Pawn.IsAliveAndWell())
        {
            ++ PlayersAlive;
        }
        if(KFPC.MatchStats.ZedsKilledLastWave > MostZedsKilled)
        {
            KilledMostZeds = KFPC;
            MostZedsKilled = KFPC.MatchStats.ZedsKilledLastWave;
        }
        if(KFPC.MatchStats.GetDoshEarnedInWave() > MostDoshEarned)
        {
            EarnedMostDosh = KFPC;
            MostDoshEarned = KFPC.MatchStats.GetDoshEarnedInWave();
        }
        if((KFPC.MatchStats.ZedsKilledLastWave + KFPC.MatchStats.GetDoshEarnedInWave()) > BestTeammateScore)
        {
            BestTeammate = KFPC;
            BestTeammateScore = KFPC.MatchStats.ZedsKilledLastWave + KFPC.MatchStats.GetDoshEarnedInWave();
        }        
    }    
    if(PlayersTotal > 1)
    {
        foreach WorldInfo.AllControllers(Class'KFPlayerController', KFPC)
        {
            if((KFPC.Pawn != none) && KFPC.Pawn.IsAliveAndWell())
            {
                if(PlayersAlive == PlayersTotal)
                {
                    KFPC.PWRI.bAllSurvivedLastWave = true;
                    continue;
                }
                if(PlayersAlive == 1)
                {
                    KFPC.PWRI.bOneSurvivedLastWave = true;
                    continue;
                }
                if((PlayersTotal - PlayersAlive) > 1)
                {
                    KFPC.PWRI.bSomeSurvivedLastWave = true;
                }
            }            
        }        
    }
    if(KilledMostZeds != none)
    {
        KilledMostZeds.PWRI.bKilledMostZeds = true;
    }
    if(EarnedMostDosh != none)
    {
        EarnedMostDosh.PWRI.bEarnedMostDosh = true;
    }
    if(BestTeammate != none)
    {
        BestTeammate.PWRI.bBestTeammate = true;
    }
}

function RewardSurvivingPlayers()
{
    local int PlayerCut, PlayerCount;
    local KFPlayerController KFPC;
    local TeamInfo T;

    foreach WorldInfo.AllControllers(Class'KFPlayerController', KFPC)
    {
        if((KFPC.Pawn != none) && KFPC.Pawn.IsAliveAndWell())
        {
            ++ PlayerCount;
            if(((T == none) && KFPC.PlayerReplicationInfo != none) && KFPC.PlayerReplicationInfo.Team != none)
            {
                T = KFPC.PlayerReplicationInfo.Team;
            }
        }        
    }    
    if((T == none) || T.Score <= float(0))
    {
        return;
    }
    PlayerCut = Round(T.Score / float(PlayerCount));
    if(bLogScoring)
    {
        LogInternal("SCORING: Team dosh earned this round:" @ string(T.Score));
    }
    if(bLogScoring)
    {
        LogInternal("SCORING: Number of surviving players:" @ string(PlayerCount));
    }
    if(bLogScoring)
    {
        LogInternal("SCORING: Dosh/survivng player:" @ string(PlayerCut));
    }
    foreach WorldInfo.AllControllers(Class'KFPlayerController', KFPC)
    {
        if((KFPC.Pawn != none) && KFPC.Pawn.IsAliveAndWell())
        {
            KFPlayerReplicationInfo(KFPC.PlayerReplicationInfo).AddDosh(PlayerCut, true);
            T.Score -= float(PlayerCut);
            if(bLogScoring)
            {
                LogInternal(((("Player" @ KFPC.PlayerReplicationInfo.PlayerName) @ "got") @ string(PlayerCut)) @ "for surviving the wave");
            }
        }        
    }    
    T.Score = 0;
}

function LogPlayerScore()
{
    local PlayerController PC;

    foreach WorldInfo.AllControllers(Class'PlayerController', PC)
    {
        LogInternal((((("[QA]" @ string(GetFuncName())) @ "Player Name:") @ PC.PlayerReplicationInfo.PlayerName) @ "Dosh") @ string(PC.PlayerReplicationInfo.Score));        
    }    
}

function int GetAdjustedDeathPenalty(KFPlayerReplicationInfo KilledPlayerPRI, optional bool bLateJoiner)
{
    local float MinimumRespawnDosh, PlayerRespawnDosh, UsedMaxRespawnDosh;

    bLateJoiner = false;
    if(WaveNum >= WaveMax)
    {
        return 0;
    }
    if(GameDifficulty < float(MaxRespawnDosh.Length))
    {
        UsedMaxRespawnDosh = MaxRespawnDosh[int(GameDifficulty)];        
    }
    else
    {
        UsedMaxRespawnDosh = MaxRespawnDosh[MaxRespawnDosh.Length - 1];
    }
    MinimumRespawnDosh = float(Round(UsedMaxRespawnDosh * (float(WaveNum) / float(WaveMax - 1))));
    if(bLateJoiner)
    {
        return int(MinimumRespawnDosh);
    }
    if(bLogScoring)
    {
        LogInternal((("SCORING: Player" @ KilledPlayerPRI.PlayerName) @ "predicted minimum respawn dosh:") @ string(MinimumRespawnDosh));
    }
    PlayerRespawnDosh = KilledPlayerPRI.Score - (KilledPlayerPRI.Score * DeathPenaltyModifiers[int(GameDifficulty)]);
    if(bLogScoring)
    {
        LogInternal((("SCORING: Player" @ KilledPlayerPRI.PlayerName) @ "current respawn dosh:") @ string(PlayerRespawnDosh));
    }
    if(MinimumRespawnDosh > PlayerRespawnDosh)
    {
        if(bLogScoring)
        {
            LogInternal((("SCORING: Player" @ KilledPlayerPRI.PlayerName) @ "MinimumRespawnDosh > PlayerRespawnDosh, returning MinimumRespawnDosh - KilledPlayerPRI.Score =") @ string(MinimumRespawnDosh - KilledPlayerPRI.Score));
        }
        return int(MinimumRespawnDosh - KilledPlayerPRI.Score);
    }
    if(bLogScoring)
    {
        LogInternal((("SCORING: Player" @ KilledPlayerPRI.PlayerName) @ "PlayerRespawnDosh > MinimumRespawnDosh, returning KilledPlayerPRI.Score * DeathPenaltyModifiers[GameDifficulty] =") @ string(-Round(KilledPlayerPRI.Score * DeathPenaltyModifiers[int(GameDifficulty)])));
    }
    return -Round(KilledPlayerPRI.Score * DeathPenaltyModifiers[int(GameDifficulty)]);
}

function bool AllowWaveCheats()
{
    return false;
}

exec function ToggleSpawning(optional string ZedTypeString)
{
    if((AllowWaveCheats()) && GameReplicationInfo.bMatchHasBegun)
    {
        if(ZedTypeString != "")
        {
        }
        if(GetStateName() == 'DebugSuspendWave')
        {
            GotoState('PlayingWave');            
        }
        else
        {
            GotoState('DebugSuspendWave');
        }
    }
}

exec function EndCurrentWave()
{
    if(AllowWaveCheats())
    {
        DebugKillZeds();
        WaveEnded(0);
    }
}

exec function SetWave(byte NewWaveNum)
{
    if(AllowWaveCheats())
    {
        if(NewWaveNum <= WaveMax)
        {
            WaveNum = NewWaveNum - 1;
            GotoState('DebugSuspendWave');
            GotoState('PlayingWave');            
        }
        else
        {
            LogInternal("SetWave: new wave num must be <= " $ string(WaveMax));
        }
    }
}

exec function WinMatch()
{
    if(AllowWaveCheats())
    {
        WaveNum = SpawnManager.Waves.Length;
        WaveEnded(0);
    }
}

function bool IsWaveActive();

function StartWave()
{
    MyKFGRI.CloseTrader();
    SpawnManager.SetupNextWave(byte(WaveNum));
    ++ WaveNum;
    MyKFGRI.WaveNum = byte(WaveNum);
    NumAISpawnsQueued = 0;
    AIAliveCount = 0;
    WaveStarted();
    MyKFGRI.AIRemaining = SpawnManager.WaveTotalAI;
    MyKFGRI.WaveTotalAICount = SpawnManager.WaveTotalAI;
    BroadcastLocalizedMessage(Class'KFLocalMessage_Priority', 0);
    SetupNextTrader();
    ResetAllPickups();
    if(((Role == ROLE_Authority) && KFGameInfo(WorldInfo.Game) != none) && KFGameInfo(WorldInfo.Game).DialogManager != none)
    {
        KFGameInfo(WorldInfo.Game).DialogManager.SetTraderTime(false);
    }
    SetTimer(5, false, 'PlayWaveStartDialog');
}

function ResetPickups(array<KFPickupFactory> PickupList, int NumPickups)
{
    NumPickups *= (float(WaveNum) / float(WaveMax));
    if(((NumPickups == 0) && PickupList.Length > 0) && KFPickupFactory_Ammo(PickupList[0]) != none)
    {
        NumPickups = 1;
    }
    super.ResetPickups(PickupList, NumPickups);
}

function SetupNextTrader()
{
    local byte NextTraderIndex;

    if(TraderList.Length > 0)
    {
        NextTraderIndex = DetermineNextTraderIndex();
        if((NextTraderIndex >= 0) && NextTraderIndex < TraderList.Length)
        {
            MyKFGRI.NextTrader = TraderList[NextTraderIndex];
            TraderList.Remove(NextTraderIndex, 1;
        }
    }
    if(TraderList.Length <= 0)
    {
        InitTraderList();
    }
}

function byte DetermineNextTraderIndex()
{
    local byte NextTraderIndex;

    NextTraderIndex = byte(Rand(TraderList.Length));
    if(BaseMutator != none)
    {
        BaseMutator.ModifyNextTraderIndex(NextTraderIndex);
    }
    return NextTraderIndex;
}

function WaveStarted()
{
    local array<SequenceObject> AllWaveStartEvents;
    local KFSeqEvent_WaveStart WaveStartEvt;
    local Sequence GameSeq;
    local int I;

    if(((WorldInfo.Game != none) && KFGameInfo(WorldInfo.Game).GameplayEventsWriter != none) && KFGameInfo(WorldInfo.Game).GameplayEventsWriter.IsSessionInProgress())
    {
        KFGameInfo(WorldInfo.Game).GameplayEventsWriter.LogGameIntEvent(1001, WaveNum);
    }
    GameSeq = WorldInfo.GetGameSequence();
    if(GameSeq != none)
    {
        GameSeq.FindSeqObjectsByClass(Class'KFSeqEvent_WaveStart', true, AllWaveStartEvents);
        I = 0;
        J0x194:

        if(I < AllWaveStartEvents.Length)
        {
            WaveStartEvt = KFSeqEvent_WaveStart(AllWaveStartEvents[I]);
            if(WaveStartEvt != none)
            {
                WaveStartEvt.Reset();
                WaveStartEvt.CheckActivate(self, self);
            }
            ++ I;
            goto J0x194;
        }
    }
    if(bLogScoring)
    {
        LogInternal("[QA]" @ string(GetFuncName()));
        LogPlayerScore();
    }
    UpdateGameSettings();
}

function CheckWaveEnd(optional bool bForceWaveEnd)
{
    bForceWaveEnd = false;
    if(!MyKFGRI.bMatchHasBegun)
    {
        return;
    }
    if(SpawnManager.bLogAISpawning)
    {
        LogInternal("KFGameInfo.CheckWaveEnd() AIAliveCount:" @ string(AIAliveCount));
    }
    if((GetLivingPlayerCount()) <= 0)
    {
        WaveEnded(1);        
    }
    else
    {
        if((((AIAliveCount <= 0) && IsWaveActive()) && SpawnManager.IsFinishedSpawning()) || bForceWaveEnd)
        {
            WaveEnded(0);
        }
    }
}

function WaveEnded(KFGameInfo_Survival.EWaveEndCondition WinCondition)
{
    local KFPlayerController KFPC;

    foreach WorldInfo.AllControllers(Class'KFPlayerController', KFPC)
    {
        KFPC.ClientWriteAndFlushStats();        
    }    
    MyKFGRI.NotifyWaveEnded();
    if(((Role == ROLE_Authority) && KFGameInfo(WorldInfo.Game) != none) && KFGameInfo(WorldInfo.Game).DialogManager != none)
    {
        KFGameInfo(WorldInfo.Game).DialogManager.SetTraderTime(!MyKFGRI.IsFinalWave());
    }
    if(((WorldInfo.Game != none) && KFGameInfo(WorldInfo.Game).GameplayEventsWriter != none) && KFGameInfo(WorldInfo.Game).GameplayEventsWriter.IsSessionInProgress())
    {
        KFGameInfo(WorldInfo.Game).GameplayEventsWriter.LogGameIntEvent(1002, WaveNum);
    }
    if((WinCondition == 1) && !Class'WorldInfo'.static.IsPlayInEditor())
    {
        EndOfMatch(false);
    }
    if(WinCondition == 0)
    {
        RewardSurvivingPlayers();
        UpdateWaveEndDialogInfo();
        if(WaveNum < WaveMax)
        {
            GotoState('TraderOpen');            
        }
        else
        {
            EndOfMatch(true);
        }
    }
    if(bLogScoring)
    {
        LogInternal("[QA]" @ string(GetFuncName()));
        LogPlayerScore();
    }
    if(WorldInfo.NetMode != NM_Standalone)
    {
        foreach WorldInfo.AllControllers(Class'KFPlayerController', KFPC)
        {
            if(KFPC.Role == ROLE_Authority)
            {
                KFPC.ReplicatePWRI();
            }
            if((WinCondition == 0) && !MyKFGRI.IsFinalWave())
            {
                if(((WorldInfo.NetMode != NM_DedicatedServer) && KFGameReplicationInfo(WorldInfo.GRI) != none) && KFGameReplicationInfo(WorldInfo.GRI).TraderDialogManager != none)
                {
                    KFGameReplicationInfo(WorldInfo.GRI).TraderDialogManager.PlayBeginTraderTimeDialog(KFPC, WorldInfo);
                }
            }            
        }        
        SetTimer(1, false, 'ResetWaveReplicationInfo');        
    }
    else
    {
        foreach WorldInfo.AllControllers(Class'KFPlayerController', KFPC)
        {
            KFPC.MatchStats.RecordWaveInfo();            
        }        
    }
}

function ResetWaveReplicationInfo()
{
    local KFPlayerController KFPC;

    foreach WorldInfo.AllControllers(Class'KFPlayerController', KFPC)
    {
        if(KFPC.Role == ROLE_Authority)
        {
            KFPC.ResetLastWaveInfo();
        }        
    }    
}

function CloseTraderTimer();

function NotifyTraderOpened()
{
    local array<SequenceObject> AllTraderOpenedEvents;
    local KFSeqEvent_TraderOpened TraderOpenedEvt;
    local Sequence GameSeq;
    local int I;

    GameSeq = WorldInfo.GetGameSequence();
    if(GameSeq != none)
    {
        GameSeq.FindSeqObjectsByClass(Class'KFSeqEvent_TraderOpened', true, AllTraderOpenedEvents);
        I = 0;
        J0x75:

        if(I < AllTraderOpenedEvents.Length)
        {
            TraderOpenedEvt = KFSeqEvent_TraderOpened(AllTraderOpenedEvents[I]);
            if(TraderOpenedEvt != none)
            {
                TraderOpenedEvt.Reset();
                TraderOpenedEvt.CheckActivate(self, self);
            }
            ++ I;
            goto J0x75;
        }
    }
}

function EndOfMatch(bool bVictory)
{
    local KFPlayerController KFPC;

    if(bVictory)
    {
        SetTimer(EndCinematicDelay, false, 'SetWonGameCamera');
        foreach WorldInfo.AllControllers(Class'KFPlayerController', KFPC)
        {
            KFPC.ClientWonGame(WorldInfo.GetMapName(true), byte(GameDifficulty), byte(GameLength), IsMultiplayerGame());            
        }        
        BroadcastLocalizedMessage(Class'KFLocalMessage_Priority', 2);        
    }
    else
    {
        BroadcastLocalizedMessage(Class'KFLocalMessage_Priority', 3);
        SetZedsToVictoryState();
    }
    GotoState('MatchEnded');
}

function string GetNextMap()
{
    local KFGameReplicationInfo KFGRI;
    local int NextMapIndex;

    KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
    if(KFGRI != none)
    {
        NextMapIndex = KFGRI.VoteCollector.GetNextMap();
    }
    if(NextMapIndex != -1)
    {
        return GameMapCycles[ActiveMapCycle].Maps[NextMapIndex];
    }
}

function SetWonGameCamera()
{
    local KFPlayerController KFPC;

    foreach WorldInfo.AllControllers(Class'KFPlayerController', KFPC)
    {
        KFPC.ServerCamera('ThirdPerson');        
    }    
}

function SetZedsToVictoryState()
{
    local KFAIController KFAIC;

    foreach WorldInfo.AllControllers(Class'KFAIController', KFAIC)
    {
        KFAIC.EnterZedVictoryState();        
    }    
}

function ShowPostGameMenu()
{
    local KFGameReplicationInfo KFGRI;

    bEnableDeadToDeadVOIP = true;
    KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
    if(KFGRI != none)
    {
        KFGRI.OnOpenAfterActionReport(MapVoteDuration);
    }
    Class'EphemeralMatchStats'.static.SendMapOptionsAndOpenAARMenu();
    UpdateCurrentMapVoteTime(byte(MapVoteDuration), true);
}

function ProcessAwards()
{
    Class'EphemeralMatchStats'.static.ProcessPostGameStats();
}

function UpdateCurrentMapVoteTime(byte NewTime, optional bool bStartTime)
{
    if((WorldInfo.GRI.RemainingTime > NewTime) || bStartTime)
    {
        ClearTimer('RestartGame');
        SetTimer(float(NewTime), false, 'RestartGame');
        WorldInfo.GRI.RemainingMinute = NewTime;
        WorldInfo.GRI.RemainingTime = NewTime;
    }
    if((NewTime <= 0) || WorldInfo.GRI.RemainingTime <= 0)
    {
        RestartGame();
    }
}

function DebugKillZeds()
{
    local PlayerController PC;

    if(AllowWaveCheats())
    {
        foreach WorldInfo.AllControllers(Class'PlayerController', PC)
        {            
            PC.ConsoleCommand("KillZeds");            
            return;            
        }        
    }
}

state PlayingWave
{
    function BeginState(name PreviousStateName)
    {
        MyKFGRI.SetWaveActive(true, GetGameIntensityForMusic());
        StartWave();
        if(AllowBalanceLogging())
        {
            LogPlayersDosh('WaveStart');
        }
    }

    function bool IsWaveActive()
    {
        return true;
    }
    stop;    
}

state TraderOpen
{
    function BeginState(name PreviousStateName)
    {
        local KFPlayerController KFPC;

        MyKFGRI.SetWaveActive(false, GetGameIntensityForMusic());
        foreach WorldInfo.AllControllers(Class'KFPlayerController', KFPC)
        {
            if(KFPC.GetPerk() != none)
            {
                KFPC.GetPerk().ResetPerk();
            }
            KFPC.ApplyPendingPerks();            
        }        
        StartHumans();
        MyKFGRI.OpenTrader(TimeBetweenWaves);
        NotifyTraderOpened();
        BroadcastLocalizedMessage(Class'KFLocalMessage_Priority', 1);
        if(AllowBalanceLogging())
        {
            LogPlayersDosh('TraderOpen');
        }
        SetTimer(float(TimeBetweenWaves), false, 'CloseTraderTimer');
    }

    function CloseTraderTimer()
    {
        GotoState('PlayingWave');
    }

    function EndState(name NextStateName)
    {
        if(AllowBalanceLogging())
        {
            LogPlayersInventory();
        }
    }

    function bool PreventDeath(Pawn KilledPawn, Controller Killer, class<DamageType> DamageType, Vector HitLocation)
    {
        if((((KilledPawn.Controller != none) && KilledPawn.Controller.bIsPlayer) && Killer != none) && KilledPawn.GetTeamNum() != Killer.GetTeamNum())
        {
            if((Killer.Pawn == none) || !Killer.Pawn.IsAliveAndWell())
            {
                return true;
            }
        }
        return global.PreventDeath(KilledPawn, Killer, DamageType, HitLocation);
    }
    stop;    
}

state MatchEnded
{
    function BeginState(name PreviousStateName)
    {
        MyKFGRI.bMatchHasBegun = false;
        MyKFGRI.bMatchIsOver = true;
        if(AllowBalanceLogging())
        {
            LogPlayersKillCount();
        }
        SetTimer(1, false, 'ProcessAwards');
        SetTimer(AARDisplayDelay, false, 'ShowPostGameMenu');
    }
    stop;    
}

state DebugSuspendWave
{
    function BeginState(name PreviousStateName)
    {
        local PlayerController PC;

        DebugKillZeds();
        foreach WorldInfo.AllControllers(Class'PlayerController', PC)
        {
            PC.ClientMessage("Survival: Spawn suspended");            
        }        
    }

    function EndState(name NextStateName)
    {
        local PlayerController PC;

        foreach WorldInfo.AllControllers(Class'PlayerController', PC)
        {
            PC.ClientMessage("Survival: Spawn resumed");            
        }        
    }
    stop;    
}

defaultproperties
{
    TimeBetweenWaves=60
    EndCinematicDelay=4
    AARDisplayDelay=15
    SpawnManagerClasses(0)=class'KFAISpawnManager_Short'
    SpawnManagerClasses(1)=class'KFAISpawnManager_Normal'
    SpawnManagerClasses(2)=class'KFAISpawnManager_Long'
    SpawnManagerClasses(3)=class'KFAISpawnManager_Normal'
    ObjectiveCheckIntervall=30
    MinAIAlivePercReqForObjStart=0.3
    bCanPerkAlwaysChange=false
    bEnableGameAnalytics=true
    MaxRespawnDosh=/* Array type was not detected. */
    AIClassList=/* Array type was not detected. */
    AIBossClassList=/* Array type was not detected. */
    GameplayEventsWriterClass=Class'KFGame.KFGameplayEventsWriter'
    TraderVoiceGroupClass=Class'KFTraderVoiceGroup_Default'
    GameName="Survival"
}