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
    return GRI.bMatchHasBegun && !GRI.bTraderIsOpen;
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
    WaveMax = byte(SpawnManager.WaveSettings.Waves.Length);
    MyKFGRI.WaveMax = WaveMax;
}

function StartMatch()
{
    WaveNum = 0;
    super.StartMatch();
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

function bool IsPlayerReady(KFPlayerReplicationInfo PRI)
{
    local KFPlayerController KFPC;

    if(Class'KFGameEngine'.static.CheckSkipLobby() || Class'Engine'.static.IsEditor())
    {
        return true;
    }
    if(super.IsPlayerReady(PRI))
    {
        KFPC = KFPlayerController(PRI.Owner);
        if(((WorldInfo.NetMode == NM_Standalone) && KFPC != none) && (KFPC.CurrentPerk == none) || !KFPC.CurrentPerk.bInitialized)
        {
            if(WorldInfo.IsConsoleDedicatedServer() || WorldInfo.IsConsoleBuild())
            {
                WarnInternal("TODO: Need perk support for console");
                return true;                
            }
            else
            {
                LogInternal(("ERROR: Failed to load perk for:" @ string(KFPC)) @ string(KFPC.CurrentPerk));
                return false;
            }
        }
        return true;
    }
    return false;
}

function bool PlayerCanRestart(PlayerController aPlayer)
{
    return !IsWaveActive() && MyKFGRI.bMatchHasBegun;
}

function RestartPlayer(Controller NewPlayer)
{
    local KFPlayerController KFPC;
    local KFPlayerReplicationInfo KFPRI;
    local bool bWasWaitingForClientPerkData;

    KFPC = KFPlayerController(NewPlayer);
    KFPRI = KFPlayerReplicationInfo(NewPlayer.PlayerReplicationInfo);
    if((KFPC != none) && KFPRI != none)
    {
        if(IsPlayerReady(KFPRI))
        {
            bWasWaitingForClientPerkData = KFPC.bWaitingForClientPerkData;
            if((MyKFGRI.bMatchHasBegun && KFPRI.NumTimesReconnected > 1) && (WorldInfo.TimeSeconds - KFPRI.LastQuitTime) < float(ReconnectRespawnTime))
            {
                KFPC.StartSpectate();
                KFPC.SetTimer(float(ReconnectRespawnTime) - (WorldInfo.TimeSeconds - KFPRI.LastQuitTime), false, 'SpawnReconnectedPlayer');                
            }
            else
            {
                if((IsWaveActive()) && !bWasWaitingForClientPerkData)
                {
                    KFPC.StartSpectate();                    
                }
                else
                {
                    super.RestartPlayer(NewPlayer);
                    if(bWasWaitingForClientPerkData)
                    {
                        return;
                    }
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
            if((WorldInfo.GRI != none) && WorldInfo.GRI.GameClass.static.AllowAnalyticsLogging())
            {
                WorldInfo.TWLogEvent("player_respawn", KFPRI, "#" $ string(MyKFGRI.WaveNum), "#" $ string(KFPRI.Score));
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

function BossDied(Controller Killer, optional bool bCheckWaveEnded)
{
    local KFPawn_Monster AIP;
    local KFGameReplicationInfo KFGRI;
    local KFPlayerController KFPC;

    bCheckWaveEnded = true;
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
    if(bCheckWaveEnded)
    {
        CheckWaveEnd(true);
    }
}

function UpdateGameSettings()
{
    local name SessionName;
    local KFOnlineGameSettings KFGameSettings;
    local int NumHumanPlayers, I;
    local KFGameEngine KFEngine;

    if((WorldInfo.NetMode == NM_DedicatedServer) || WorldInfo.NetMode == NM_ListenServer)
    {
        if(NotEqual_InterfaceInterface(GameInterface, (none)))
        {
            KFEngine = KFGameEngine(Class'Engine'.static.GetEngine());
            SessionName = PlayerReplicationInfoClass.default.SessionName;
            if((PlayfabInter != none) && PlayfabInter.GetGameSettings() != none)
            {
                KFGameSettings = KFOnlineGameSettings(PlayfabInter.GetGameSettings());
                KFGameSettings.bAvailableForTakeover = KFEngine.bAvailableForTakeover;                
            }
            else
            {
                KFGameSettings = KFOnlineGameSettings(GameInterface.GetGameSettings(SessionName));
            }
            if(KFGameSettings != none)
            {
                KFGameSettings.Mode = GetGameModeNum();
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
                KFGameSettings.NumPublicConnections = MaxPlayersAllowed;
                KFGameSettings.bRequiresPassword = RequiresPassword();
                KFGameSettings.bCustom = bIsCustomGame;
                KFGameSettings.bUsesStats = !IsUnrankedGame();
                KFGameSettings.NumSpectators = NumSpectators;
                if(MyKFGRI != none)
                {
                    MyKFGRI.bCustom = bIsCustomGame;
                }
                if(WorldInfo.IsConsoleDedicatedServer())
                {
                    KFGameSettings.MapName = WorldInfo.GetMapName(true);
                    if(GameReplicationInfo != none)
                    {
                        I = 0;
                        J0x4A3:

                        if(I < GameReplicationInfo.PRIArray.Length)
                        {
                            if(!GameReplicationInfo.PRIArray[I].bBot)
                            {
                                ++ NumHumanPlayers;
                            }
                            ++ I;
                            goto J0x4A3;
                        }
                    }
                    KFGameSettings.NumOpenPublicConnections = KFGameSettings.NumPublicConnections - NumHumanPlayers;
                }
                if((PlayfabInter != none) && PlayfabInter.IsRegisteredWithPlayfab())
                {
                    PlayfabInter.ServerUpdateOnlineGame();                    
                }
                else
                {
                    GameInterface.UpdateOnlineGame(SessionName, KFGameSettings, true);
                }
            }
        }
    }
}

function bool CanSpectate(PlayerController Viewer, PlayerReplicationInfo ViewTarget)
{
    return super.CanSpectate(Viewer, ViewTarget) && (Viewer.PlayerReplicationInfo.bOnlySpectator || Viewer.GetTeamNum() == ViewTarget.GetTeamNum()) || MyKFGRI.bTraderIsOpen;
}

event Timer()
{
    super(GameInfo).Timer();
    if(SpawnManager != none)
    {
        SpawnManager.Update();
    }
    if(GameConductor != none)
    {
        GameConductor.TimerUpdate();
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
    local KFTeamInfo_Human T;

    foreach WorldInfo.AllControllers(Class'KFPlayerController', KFPC)
    {
        if((KFPC.Pawn != none) && KFPC.Pawn.IsAliveAndWell())
        {
            ++ PlayerCount;
            if(((T == none) && KFPC.PlayerReplicationInfo != none) && KFPC.PlayerReplicationInfo.Team != none)
            {
                T = KFTeamInfo_Human(KFPC.PlayerReplicationInfo.Team);
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
            T.AddScore(-PlayerCut);
            if(bLogScoring)
            {
                LogInternal(((("Player" @ KFPC.PlayerReplicationInfo.PlayerName) @ "got") @ string(PlayerCut)) @ "for surviving the wave");
            }
        }        
    }    
    T.AddScore(0, true);
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
        WaveNum = SpawnManager.WaveSettings.Waves.Length;
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
    if((WorldInfo.NetMode != NM_DedicatedServer) && Role == ROLE_Authority)
    {
        MyKFGRI.UpdateHUDWaveCount();
    }
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

function ResetAllPickups()
{
    if(WaveNum == WaveMax)
    {
        NumAmmoPickups = byte(Max(AmmoPickups.Length - 1, 0));
    }
    super.ResetAllPickups();
}

function ResetPickups(array<KFPickupFactory> PickupList, int NumPickups)
{
    NumPickups *= (float(WaveNum) / float(WaveMax));
    if(((NumPickups == 0) && PickupList.Length > 0) && (WaveNum > 1) || KFPickupFactory_Ammo(PickupList[0]) != none)
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
    local array<int> OutputLinksToActivate;
    local KFSeqEvent_WaveStart WaveStartEvt;
    local Sequence GameSeq;
    local int I;
    local KFPlayerController KFPC;

    if((WorldInfo.GRI != none) && WorldInfo.GRI.GameClass.static.AllowAnalyticsLogging())
    {
        WorldInfo.TWLogEvent("wave_start", none, "#" $ string(WaveNum), "#" $ string(GetLivingPlayerCount()));
    }
    GameConductor.ResetWaveStats();
    foreach WorldInfo.AllControllers(Class'KFPlayerController', KFPC)
    {
        if(!KFPC.bDemoOwner)
        {
            if((WorldInfo.GRI != none) && WorldInfo.GRI.GameClass.static.AllowAnalyticsLogging())
            {
                WorldInfo.TWLogEvent("pc_wave_start", KFPC.PlayerReplicationInfo, "#" $ string(WaveNum), string(KFPC.GetPerk().Class.Name), string(KFPC.GetPerk().GetLevel()), "#" $ string(KFPC.PlayerReplicationInfo.Score), ((KFPC.Pawn != none) ? KFInventoryManager(KFPC.Pawn.InvManager).DumpInventory() : ""), KFPC.GetPerk().DumpPerkLoadout(), string(KFPC.PlayerReplicationInfo.GetTeamNum()));
            }
        }        
    }    
    GameSeq = WorldInfo.GetGameSequence();
    if(GameSeq != none)
    {
        GameSeq.FindSeqObjectsByClass(Class'KFSeqEvent_WaveStart', true, AllWaveStartEvents);
        I = 0;
        J0x425:

        if(I < AllWaveStartEvents.Length)
        {
            WaveStartEvt = KFSeqEvent_WaveStart(AllWaveStartEvents[I]);
            if(WaveStartEvt != none)
            {
                WaveStartEvt.Reset();
                WaveStartEvt.SetWaveNum(WaveNum, WaveMax);
                if((WaveNum == WaveMax) && WaveStartEvt.OutputLinks.Length > 1)
                {
                    OutputLinksToActivate.AddItem(1;                    
                }
                else
                {
                    OutputLinksToActivate.AddItem(0;
                }
                WaveStartEvt.CheckActivate(self, self,, OutputLinksToActivate);
            }
            ++ I;
            goto J0x425;
        }
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
    MyKFGRI.NotifyWaveEnded();
    if(((Role == ROLE_Authority) && KFGameInfo(WorldInfo.Game) != none) && KFGameInfo(WorldInfo.Game).DialogManager != none)
    {
        KFGameInfo(WorldInfo.Game).DialogManager.SetTraderTime(!MyKFGRI.IsFinalWave());
    }
    if((WorldInfo.GRI != none) && WorldInfo.GRI.GameClass.static.AllowAnalyticsLogging())
    {
        WorldInfo.TWLogEvent("wave_end", none, "#" $ string(WaveNum), string(GetEnum(Enum'EWaveEndCondition', WinCondition)), "#" $ string(GameConductor.CurrentWaveZedVisibleAverageLifeSpan));
    }
    if((WinCondition == 1) && !Class'WorldInfo'.static.IsPlayInEditor())
    {
        EndOfMatch(false);        
    }
    else
    {
        if(WinCondition == 0)
        {
            RewardSurvivingPlayers();
            UpdateWaveEndDialogInfo();
            if(WaveNum < WaveMax)
            {
                GotoState('TraderOpen', 'Begin');                
            }
            else
            {
                EndOfMatch(true);
            }
        }
    }
    SetTimer(WorldInfo.DeltaSeconds, false, 'Timer_FinalizeEndOfWaveStats');
}

function Timer_FinalizeEndOfWaveStats()
{
    local bool bOpeningTrader;
    local KFPlayerController KFPC;

    bOpeningTrader = (MyKFGRI.bTraderIsOpen && !IsInState('MatchEnded')) && !IsInState('RoundEnded ');
    foreach WorldInfo.AllControllers(Class'KFPlayerController', KFPC)
    {
        LogWaveEndAnalyticsFor(KFPC);
        KFPC.SubmitPostWaveStats(bOpeningTrader);        
    }    
}

function LogWaveEndAnalyticsFor(KFPlayerController KFPC)
{
    local int I;
    local array<WeaponDamage> Weapons;

    if(KFPC.bDemoOwner)
    {
        return;
    }
    if((WorldInfo.GRI != none) && WorldInfo.GRI.GameClass.static.AllowAnalyticsLogging())
    {
        WorldInfo.TWLogEvent("pc_wave_stats", KFPC.PlayerReplicationInfo, "#" $ string(WaveNum), "#" $ string(KFPC.MatchStats.GetHealGivenInWave()), "#" $ string(KFPC.MatchStats.GetHeadShotsInWave()), "#" $ string(KFPC.MatchStats.GetDoshEarnedInWave()), "#" $ string(KFPC.MatchStats.GetDamageTakenInWave()), "#" $ string(KFPC.MatchStats.GetDamageDealtInWave()), "#" $ string(KFPC.ShotsFired), "#" $ string(KFPC.ShotsHit), "#" $ string(KFPC.ShotsHitHeadshot));
    }
    if((WorldInfo.GRI != none) && WorldInfo.GRI.GameClass.static.AllowAnalyticsLogging())
    {
        WorldInfo.TWLogEvent("pc_wave_end", KFPC.PlayerReplicationInfo, "#" $ string(WaveNum), string(KFPC.GetPerk().Class.Name), "#" $ string(KFPC.GetPerk().GetLevel()), "#" $ string(KFPC.PlayerReplicationInfo.Score), "#" $ string(KFPC.PlayerReplicationInfo.Kills), (((KFPC.Pawn != none) && KFPC.Pawn.InvManager != none) ? KFInventoryManager(KFPC.Pawn.InvManager).DumpInventory() : ""));
    }
    KFPC.MatchStats.GetTopWeapons(3, Weapons);
    I = 0;
    J0x551:

    if(I < Weapons.Length)
    {
        if((WorldInfo.GRI != none) && WorldInfo.GRI.GameClass.static.AllowAnalyticsLogging())
        {
            WorldInfo.TWLogEvent("pc_weapon_stats", KFPC.PlayerReplicationInfo, "#" $ string(WaveNum), string(Weapons[I].WeaponDef.Name), "#" $ string(Weapons[I].DamageAmount), "#" $ string(Weapons[I].HeadShots), "#" $ string(Weapons[I].LargeZedKills));
        }
        ++ I;
        goto J0x551;
    }
}

function CloseTraderTimer();

function DoTraderTimeCleanup();

function NotifyTraderOpened()
{
    local array<SequenceObject> AllTraderOpenedEvents;
    local array<int> OutputLinksToActivate;
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
                TraderOpenedEvt.SetWaveNum(WaveNum, WaveMax);
                if((WaveNum == (WaveMax - 1)) && TraderOpenedEvt.OutputLinks.Length > 1)
                {
                    OutputLinksToActivate.AddItem(1;                    
                }
                else
                {
                    OutputLinksToActivate.AddItem(0;
                }
                TraderOpenedEvt.CheckActivate(self, self,, OutputLinksToActivate);
            }
            ++ I;
            goto J0x75;
        }
    }
}

function EndOfMatch(bool bVictory)
{
    local KFPlayerController KFPC;

    if((WorldInfo.GRI != none) && WorldInfo.GRI.GameClass.static.AllowAnalyticsLogging())
    {
        WorldInfo.TWLogEvent("match_end", none, "#" $ string(WaveNum), "#" $ ((bVictory) ? "1" : "0"), "#" $ string(GameConductor.ZedVisibleAverageLifespan));
    }
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
    WorldInfo.TWRefreshTweakParams();
    WorldInfo.TWPushLogs();
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
        if(WorldInfo.NetMode == NM_Standalone)
        {
            return KFGRI.VoteCollector.MapList[NextMapIndex];            
        }
        else
        {
            return GameMapCycles[ActiveMapCycle].Maps[NextMapIndex];
        }
    }
    return super.GetNextMap();
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

    MyKFGRI.bWaitingForAAR = false;
    bEnableDeadToVOIP = true;
    KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
    if(KFGRI != none)
    {
        KFGRI.OnOpenAfterActionReport(GetEndOfMatchTime());
    }
    Class'EphemeralMatchStats'.static.SendMapOptionsAndOpenAARMenu();
    UpdateCurrentMapVoteTime(byte(GetEndOfMatchTime()), true);
}

function float GetEndOfMatchTime()
{
    return MapVoteDuration;
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
        SetTimer(float(NewTime), false, 'TryRestartGame');
        WorldInfo.GRI.RemainingMinute = NewTime;
        WorldInfo.GRI.RemainingTime = NewTime;
    }
    if((NewTime <= 0) || WorldInfo.GRI.RemainingTime <= 0)
    {
        TryRestartGame();
    }
}

function TryRestartGame()
{
    RestartGame();
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
                KFPC.GetPerk().OnWaveEnded();
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

    function DoTraderTimeCleanup()
    {
        local KFProj_BloatPukeMine PukeMine;

        MyKFGRI.FadeOutLingeringExplosions();
        foreach DynamicActors(Class'KFProj_BloatPukeMine', PukeMine)
        {
            PukeMine.FadeOut();            
        }        
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
        if((((KilledPawn.Controller != none) && KilledPawn.Controller.bIsPlayer) && (Killer == none) || KilledPawn.GetTeamNum() != Killer.GetTeamNum()) && DamageType != Class'DmgType_Suicided')
        {
            if(((Killer == none) || Killer.Pawn == none) || !Killer.Pawn.IsAliveAndWell())
            {
                return true;
            }
        }
        return global.PreventDeath(KilledPawn, Killer, DamageType, HitLocation);
    }
Begin:

    Sleep(0.1);
    DoTraderTimeCleanup();
    stop;        
}

state MatchEnded
{
    function BeginState(name PreviousStateName)
    {
        local int I;

        MyKFGRI.bMatchHasBegun = false;
        MyKFGRI.bMatchIsOver = true;
        MyKFGRI.bWaitingForAAR = true;
        if(AllowBalanceLogging())
        {
            LogPlayersKillCount();
        }
        if((PlayfabInter != none) && PlayfabInter.IsRegisteredWithPlayfab())
        {
            I = 0;
            J0xB8:

            if(I < GameReplicationInfo.PRIArray.Length)
            {
                if(GameReplicationInfo.PRIArray[I].PlayfabPlayerId != "")
                {
                    AddGameplayTimeForPlayer(KFPlayerReplicationInfo(GameReplicationInfo.PRIArray[I]), int(KFGameReplicationInfo(GameReplicationInfo).GetHeartbeatAccumulatorAmount()), true);
                }
                ++ I;
                goto J0xB8;
            }
        }
        SetTimer(1, false, 'ProcessAwards');
        SetTimer(AARDisplayDelay, false, 'ShowPostGameMenu');
    }

    event Timer()
    {
        global.Timer();
        if(NumPlayers == 0)
        {
            RestartGame();
        }
    }
    stop;    
}

state DebugSuspendWave
{
    ignores CheckWaveEnd;

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
    ObjectiveCheckIntervall=30
    MinAIAlivePercReqForObjStart=0.3
    bCanPerkAlwaysChange=false
    bEnableGameAnalytics=true
    DifficultyInfoClass=Class'KFGameDifficulty_Survival'
    DifficultyInfoConsoleClass=Class'KFGameDifficulty_Survival_Console'
    MaxRespawnDosh=/* Array type was not detected. */
    MaxGameDifficulty=3
    SpawnManagerClasses=/* Array type was not detected. */
    AIClassList=/* Array type was not detected. */
    AIBossClassList=/* Array type was not detected. */
    GameplayEventsWriterClass=Class'KFGame.KFGameplayEventsWriter'
    TraderVoiceGroupClass=Class'KFTraderVoiceGroup_Default'
    MaxPlayers=6
    GameName="Survival"
}