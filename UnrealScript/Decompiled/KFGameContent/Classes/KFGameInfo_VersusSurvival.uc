/*******************************************************************************
 * KFGameInfo_VersusSurvival generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGameInfo_VersusSurvival extends KFGameInfo_Survival
    config(Game)
    hidecategories(Navigation,Movement,Collision);

const MAX_ACTIVE_PUKE_MINES = 30;

var protected const float ANTI_GRIEF_DELAY;
var protected const float ANTI_GRIEF_INTERVAL;
var protected const float ANTI_GRIEF_DAMAGE_PERCENTAGE;
var protected const array< class<KFPawn_Monster> > PlayerZedClasses;
var protected const array< class<KFPawn_MonsterBoss> > PlayerBossClassList;
var KFGameReplicationInfoVersus MyKFGRIV;
var class<KFDamageType> AntiGriefDamageTypeClass;
var config bool bTeamBalanceEnabled;
var config float ScoreRadius;
var int TimeUntilNextRound;
var float RoundEndCinematicDelay;
var float PostRoundWaitTime;
var protected int WaveBonus;
var protected int BossDamageDone;
var protected int BossSurvivorDamageTaken;
var protected float PercentOfZedsKilledBeforeWipe;

event PreBeginPlay()
{
    super.PreBeginPlay();
    CreateTeam(1);
}

function InitGRIVariables()
{
    super(KFGameInfo).InitGRIVariables();
    MyKFGRIV = KFGameReplicationInfoVersus(MyKFGRI);
    MyKFGRIV.bTeamBalanceEnabled = bTeamBalanceEnabled;
}

function bool IsPlayerReady(KFPlayerReplicationInfo PRI)
{
    if(Class'KFGameEngine'.static.CheckSkipLobby() || Class'Engine'.static.IsEditor())
    {
        return true;
    }
    return super(KFGameInfo).IsPlayerReady(PRI);
}

function StartMatch()
{
    local KFPlayerController KFPC;
    local array<KFPlayerController> PlayerControllers;

    foreach WorldInfo.AllControllers(Class'KFPlayerController', KFPC)
    {
        PlayerControllers[PlayerControllers.Length] = KFPC;
        if(((KFPC.GetTeamNum() == 255) && KFPC.CanRestartPlayer()) && (KFPC.Pawn == none) || KFPawn_Customization(KFPC.Pawn) != none)
        {
            if(KFPC.Pawn != none)
            {
                KFPC.Pawn.Destroy();
            }
            KFPC.StartSpectate();
        }        
    }    
    if(PlayerControllers.Length == 1)
    {
        SetTeam(PlayerControllers[0], Teams[0]);
    }
    MyKFGRIV.bRoundIsOver = false;
    MyKFGRIV.bNetDirty = true;
    MyKFGRIV.bForceNetUpdate = true;
    super.StartMatch();
}

function bool ShouldStartMatch()
{
    return (WorldInfo.NetMode == NM_Standalone) || (Teams[0].Size > 0) && Teams[1].Size > 0;
}

function BalanceTeams()
{
    local int Delta, AutoBalanceRemaining, I;
    local TeamInfo TI;
    local array<PlayerReplicationInfo> AutoBalanceList;
    local PlayerReplicationInfo PRI;

    Delta = Teams[1].Size - Teams[0].Size;
    if(Delta == 0)
    {
        return;
    }
    TI = ((Delta > 0) ? Teams[1] : Teams[0]);
    I = 0;
    J0x99:

    if(I < MyKFGRIV.PRIArray.Length)
    {
        PRI = MyKFGRIV.PRIArray[I];
        if(PRI.Team == TI)
        {
            AutoBalanceList.AddItem(PRI;
        }
        ++ I;
        goto J0x99;
    }
    AutoBalanceRemaining = Min(int(Abs(float(Delta))), MyKFGRIV.TeamBalanceDelta);
    J0x183:

    if((AutoBalanceRemaining > 0) || TI.Size > (MaxPlayersAllowed / 2))
    {
        I = Rand(AutoBalanceList.Length);
        SwapTeamFor(AutoBalanceList[I]);
        AutoBalanceList.Remove(I, 1;
        -- AutoBalanceRemaining;
        goto J0x183;
    }
}

function SwapTeamFor(PlayerReplicationInfo PRI)
{
    local KFPlayerControllerVersus KFPCV;

    KFPCV = KFPlayerControllerVersus(PRI.Owner);
    if(KFPCV != none)
    {
        KFPCV.NotifyOfAutoBalance();
        SetTeam(KFPCV, ((PRI.GetTeamNum() == 255) ? Teams[0] : Teams[1]));
    }
}

function CreateTeam(int TeamIndex)
{
    switch(TeamIndex)
    {
        case 0:
            Teams[TeamIndex] = Spawn(Class'KFTeamInfo_Human');
            GameReplicationInfo.SetTeam(TeamIndex, Teams[TeamIndex]);
            break;
        case 1:
            Teams[TeamIndex] = Spawn(Class'KFTeamInfo_Zeds');
            GameReplicationInfo.SetTeam(TeamIndex, Teams[TeamIndex]);
            break;
        default:
            break;
    }
}

function byte PickTeam(byte Current, Controller C)
{
    if((Teams[1].Size < Teams[0].Size) || ((Teams[0].Size > 0) && Teams[1].Size == Teams[0].Size) && FRand() < 0.5)
    {
        return 1;        
    }
    else
    {
        return 0;
    }
}

function bool ChangeTeam(Controller Other, int N, bool bNewTeam)
{
    if(((Other.PlayerReplicationInfo == none) || Other.PlayerReplicationInfo.bBot) || (!Other.PlayerReplicationInfo.bOnlySpectator && 2 > N) && Other.PlayerReplicationInfo.Team != Teams[N])
    {
        SetTeam(Other, Teams[N]);
        return true;
    }
    return false;
}

function SetTeam(Controller Other, KFTeamInfo_Human NewTeam)
{
    local KFPlayerControllerVersus KFPCV;
    local TeamInfo OldTeam;

    if((((Other == none) || Other.PlayerReplicationInfo == none) || Other.PlayerReplicationInfo.bBot) || Other.PlayerReplicationInfo.bOnlySpectator)
    {
        super(KFGameInfo).SetTeam(Other, NewTeam);
        return;
    }
    OldTeam = Other.PlayerReplicationInfo.Team;
    super(KFGameInfo).SetTeam(Other, NewTeam);
    if((OldTeam != none) && NewTeam != OldTeam)
    {
        KFPCV = KFPlayerControllerVersus(Other);
        KFPCV.ServerNotifyTeamChanged();
        if(!IsPlayerReady(KFPlayerReplicationInfo(Other.PlayerReplicationInfo)))
        {
            OnWaitingPlayerTeamSwapped(Other);            
        }
        else
        {
            if((((OldTeam != none) && OldTeam.TeamIndex == 255) && KFPCV != none) && KFPCV.PlayerZedSpawnInfo.PendingZedPawnClass != none)
            {
                if(SpawnManager != none)
                {
                    KFAISpawnManager_Versus(SpawnManager).RecyclePendingZedPawnClass(KFPCV);
                }
            }
        }
    }
}

event PostLogin(PlayerController NewPlayer)
{
    super(KFGameInfo).PostLogin(NewPlayer);
    if(!NewPlayer.CanRestartPlayer())
    {
        OnWaitingPlayerTeamSwapped(NewPlayer);
    }
}

function OnWaitingPlayerTeamSwapped(Controller C)
{
    local KFPlayerControllerVersus KFPCV;
    local NavigationPoint Start;

    KFPCV = KFPlayerControllerVersus(C);
    if(KFPCV != none)
    {
        if(KFPCV.GetTeamNum() == 255)
        {
            if((KFPCV.Pawn != none) && KFPawn_Customization(KFPCV.Pawn) != none)
            {
                KFPawn_Customization(KFPCV.Pawn).SetServerHidden(true);
            }
            KFPCV.SetCameraMode('PlayerZedWaiting');            
        }
        else
        {
            if(KFPCV.Pawn != none)
            {
                KFPawn_Customization(KFPCV.Pawn).SetServerHidden(false);
                if(!KFPawn_Customization(KFPCV.Pawn).MoveToCustomizationPoint())
                {
                    Start = KFPCV.GetBestCustomizationStart(self);
                    if(Start != none)
                    {
                        KFPawn_Customization(KFPCV.Pawn).SetUpdatedMovementData(Start.Location, Start.Rotation);
                    }
                }
                KFPCV.SetViewTarget(KFPCV.Pawn);
                KFPCV.SetCameraMode('Customization');
            }
        }
        KFPCV.ServerNotifyTeamChanged();
    }
}

function Logout(Controller Exiting)
{
    local KFPlayerControllerVersus KFPCV;

    if(Exiting != none)
    {
        KFPCV = KFPlayerControllerVersus(Exiting);
        if(((KFPCV != none) && KFPCV.GetTeamNum() == 255) && KFPCV.PlayerZedSpawnInfo.PendingZedPawnClass != none)
        {
            if(SpawnManager != none)
            {
                KFAISpawnManager_Versus(SpawnManager).RecyclePendingZedPawnClass(KFPCV);
            }
        }
    }
    super(KFGameInfo).Logout(Exiting);
}

function RestartPlayer(Controller NewPlayer)
{
    local int PlayerTeamIndex;
    local KFPawn_Monster MonsterPawn;
    local KFPlayerController KFPC;

    if((NewPlayer.PlayerReplicationInfo == none) || NewPlayer.PlayerReplicationInfo.bOnlySpectator)
    {
        return;
    }
    PlayerTeamIndex = NewPlayer.GetTeamNum();
    KFPC = KFPlayerController(NewPlayer);
    if((KFPC != none) && MyKFGRI.bMatchIsOver || (PlayerTeamIndex == 255) && MyKFGRI.bTraderIsOpen || KFPC.PlayerZedSpawnInfo.PendingZedPawnClass == none)
    {
        if(IsPlayerReady(KFPlayerReplicationInfo(KFPC.PlayerReplicationInfo)))
        {
            KFPC.StartSpectate();
        }
        return;
    }
    if((NewPlayer.Pawn != none) && KFPawn_Customization(NewPlayer.Pawn) != none)
    {
        NewPlayer.Pawn.Destroy();
    }
    if(PlayerTeamIndex != 255)
    {
        super.RestartPlayer(NewPlayer);        
    }
    else
    {
        if((NewPlayer.Pawn == none) && PlayerTeamIndex == 255)
        {
            super(GameInfo).RestartPlayer(NewPlayer);
        }
    }
    MonsterPawn = KFPawn_Monster(NewPlayer.Pawn);
    if((MonsterPawn != none) && MonsterPawn.IsHumanControlled())
    {
        MonsterPawn.UpdateLastTimeDamageHappened();
    }
}

function int GetAIControlledMonsterAliveCount()
{
    local AIController AIP;
    local int UsedLivingAIMonsterCount;

    foreach WorldInfo.AllControllers(Class'AIController', AIP)
    {
        if(((AIP != none) && AIP.Pawn != none) && AIP.Pawn.IsAliveAndWell())
        {
            if(KFPawn_Monster(AIP.Pawn) != none)
            {
                ++ UsedLivingAIMonsterCount;
            }
        }        
    }    
    return UsedLivingAIMonsterCount;
}

function class<Pawn> GetDefaultPlayerClass(Controller C)
{
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(C);
    if(KFPC.GetTeamNum() == 255)
    {
        if(KFPC.PlayerZedSpawnInfo.PendingZedPawnClass != none)
        {
            return KFPC.PlayerZedSpawnInfo.PendingZedPawnClass;
        }
        return none;
    }
    return super(GameInfo).GetDefaultPlayerClass(C);
}

function int GetLivingPlayerCount()
{
    local Controller P;
    local int UsedLivingHumanPlayersCount;

    foreach WorldInfo.AllControllers(Class'Controller', P)
    {
        if(((P != none) && P.Pawn != none) && P.Pawn.IsAliveAndWell())
        {
            if(P.GetTeamNum() != 255)
            {
                ++ UsedLivingHumanPlayersCount;
            }
        }        
    }    
    return UsedLivingHumanPlayersCount;
}

function ReduceDamage(out int Damage, Pawn injured, Controller InstigatedBy, Vector HitLocation, out Vector Momentum, class<DamageType> DamageType, Actor DamageCauser)
{
    local KFPawn InstigatorPawn, InjuredPawn;

    if(InstigatedBy != none)
    {
        InstigatorPawn = KFPawn(InstigatedBy.Pawn);
        InjuredPawn = KFPawn(injured);
        if(DamageType != AntiGriefDamageTypeClass)
        {
            if(((InstigatorPawn != none) && InjuredPawn != none) && InstigatorPawn.GetTeamNum() != InjuredPawn.GetTeamNum())
            {
                InstigatorPawn.UpdateLastTimeDamageHappened();
                InjuredPawn.UpdateLastTimeDamageHappened();
            }
        }
    }
    if((((InstigatedBy.GetTeamNum() == 255) && injured.GetTeamNum() == 255) && InstigatedBy.bIsPlayer) && !injured.IsHumanControlled())
    {
        Momentum = vect(0, 0, 0);
        Damage = 0;        
    }
    else
    {
        super.ReduceDamage(Damage, injured, InstigatedBy, HitLocation, Momentum, DamageType, DamageCauser);
    }
}

function ScoreDamage(int DamageAmount, int HealthBeforeDamage, Controller InstigatedBy, Pawn DamagedPawn, class<DamageType> DamageType)
{
    local KFPawn_MonsterBoss BossPawn;

    if((((InstigatedBy == none) || !InstigatedBy.bIsPlayer) || InstigatedBy.PlayerReplicationInfo == none) || InstigatedBy.GetTeamNum() == DamagedPawn.GetTeamNum())
    {
        return;
    }
    DamageAmount = Min(DamageAmount, HealthBeforeDamage);
    KFPlayerReplicationInfo(InstigatedBy.PlayerReplicationInfo).DamageDealtOnTeam += DamageAmount;
    if(InstigatedBy.PlayerReplicationInfo.GetTeamNum() == 255)
    {
        BossPawn = KFPawn_MonsterBoss(InstigatedBy.Pawn);
        if(BossPawn != none)
        {
            if(DamagedPawn.IsA('KFPawn_Human'))
            {
                BossSurvivorDamageTaken += DamageAmount;
            }
        }        
    }
    else
    {
        BossPawn = KFPawn_MonsterBoss(DamagedPawn);
        if(BossPawn != none)
        {
            BossDamageDone += DamageAmount;
        }
    }
}

function ScoreKill(Controller Killer, Controller Other)
{
    local KFPawn KFP;
    local KFPlayerReplicationInfo DamagerKFPRI;
    local int I;

    if(Other.GetTeamNum() == 0)
    {
        KFP = KFPawn(Other.Pawn);
        I = 0;
        J0x66:

        if(I < KFP.DamageHistory.Length)
        {
            if((((KFP.DamageHistory[I].DamagerController != none) && KFP.DamageHistory[I].DamagerController.bIsPlayer) && KFP.DamageHistory[I].DamagerPRI != none) && KFP.DamageHistory[I].DamagerPRI.GetTeamNum() == 255)
            {
                if(Killer.PlayerReplicationInfo != KFP.DamageHistory[I].DamagerPRI)
                {
                    DamagerKFPRI = KFPlayerReplicationInfo(KFP.DamageHistory[I].DamagerPRI);
                    if(DamagerKFPRI != none)
                    {
                        ++ DamagerKFPRI.Assists;
                    }
                }
            }
            ++ I;
            goto J0x66;
        }        
    }
    else
    {
        if((MyKFGRIV.WaveNum == MyKFGRIV.WaveMax) && KFPawn_MonsterBoss(Other.Pawn) != none)
        {
            BossDamageDone = POINTS_FOR_BOSS_KILL;
        }
    }
    super(KFGameInfo).ScoreKill(Killer, Other);
}

function EndOfMatch(bool bVictory)
{
    local KFPlayerController KFPC;
    local int TempScore;
    local KFPlayerReplicationInfoVersus KFPRIV;

    if(WorldInfo.GRI.GameClass.static.AllowAnalyticsLogging())
    {
        WorldInfo.TWLogEvent("match_end", none, "#" $ string(WaveNum), "#" $ ((bVictory) ? "1" : "0"), "#" $ string(GameConductor.ZedVisibleAverageLifespan));
    }
    if(bVictory)
    {
        SetTimer(EndCinematicDelay, false, 'SetWonGameCamera');
        BroadcastLocalizedMessage(Class'KFLocalMessage_Priority', 13);        
    }
    else
    {
        BroadcastLocalizedMessage(Class'KFLocalMessage_Priority', 12);
        SetZedsToVictoryState();
    }
    foreach WorldInfo.AllControllers(Class'KFPlayerController', KFPC)
    {
        if(bVictory)
        {
            KFPC.ClientWonGame(WorldInfo.GetMapName(true), byte(GameDifficulty), byte(GameLength), IsMultiplayerGame());
        }
        KFPRIV = KFPlayerReplicationInfoVersus(KFPC.PlayerReplicationInfo);
        if(KFPRIV != none)
        {
            KFPRIV.RecordEndGameInfo();
        }        
    }    
    WorldInfo.TWRefreshTweakParams();
    WorldInfo.TWPushLogs();
    WaveBonus = Max(MyKFGRI.WaveNum - 1, 0) * POINTS_FOR_WAVE_COMPLETION;
    if(bVictory)
    {
        CheckRoundEndAchievements(0);
        TempScore += POINTS_FOR_BOSS_KILL;
        TempScore -= BossSurvivorDamageTaken;        
    }
    else
    {
        CheckRoundEndAchievements(255);
        WaveBonus += int(float(POINTS_FOR_WAVE_COMPLETION) * PercentOfZedsKilledBeforeWipe);
    }
    TempScore += WaveBonus;
    TempScore -= (POINTS_PENALTY_FOR_DEATH * HumanDeaths);
    Teams[0].AddRoundScore(TempScore, true);
    if(MyKFGRIV.CurrentRound == 0)
    {
        UpdateFirstRoundTeamScore();        
    }
    else
    {
        UpdateSecondRoundTeamScore();
    }
    GotoState('RoundEnded', 'Begin');
}

function Killed(Controller Killer, Controller KilledPlayer, Pawn KilledPawn, class<DamageType> DamageType)
{
    super.Killed(Killer, KilledPlayer, KilledPawn, DamageType);
    if(((IsWaveActive()) && (GetAIControlledMonsterAliveCount()) <= 0) && SpawnManager.IsFinishedSpawning())
    {
        CheckPawnsForGriefing(true);
    }
}

function WaveEnded(KFGameInfo_Survival.EWaveEndCondition WinCondition)
{
    local KFPlayerReplicationInfoVersus KFPRIV;
    local int WaveKills, I, J;

    MyKFGRIV.SetPlayerZedSpawnTime(255, false);
    ClearTimer('CheckPawnsForGriefing');
    if((WinCondition == 1) && SpawnManager != none)
    {
        PercentOfZedsKilledBeforeWipe = float(MyKFGRI.AIRemaining) / float(SpawnManager.WaveTotalAI);
    }
    I = 0;
    J0xB2:

    if(I < WorldInfo.GRI.PRIArray.Length)
    {
        if(WorldInfo.GRI.PRIArray[I].Kills == 0)
        {            
        }
        else
        {
            KFPRIV = KFPlayerReplicationInfoVersus(WorldInfo.GRI.PRIArray[I]);
            if(((KFPRIV != none) && !KFPRIV.bBot) && KFPRIV.GetTeamNum() == 255)
            {
                WaveKills = KFPRIV.Kills;
                J = 0;
                J0x233:

                if(J < KFPRIV.WaveKills.Length)
                {
                    WaveKills -= KFPRIV.WaveKills[J];
                    ++ J;
                    goto J0x233;
                }
                KFPRIV.WaveKills[MyKFGRI.WaveNum] = WaveKills;
            }
        }
        ++ I;
        goto J0xB2;
    }
    super.WaveEnded(WinCondition);
}

function BossDied(Controller Killer, optional bool bCheckWaveEnded)
{
    bCheckWaveEnded = true;
    super.BossDied(Killer, false);
}

protected function CheckPawnsForGriefing(optional bool bInitial)
{
    local Pawn TestPawn;
    local KFPawn_Monster MonsterTestPawn;

    bInitial = false;
    foreach WorldInfo.AllPawns(Class'Pawn', TestPawn)
    {
        if(((TestPawn.IsAliveAndWell() && TestPawn.Controller != none) && TestPawn.Controller.bIsPlayer) && TestPawn.GetTeamNum() == 255)
        {
            MonsterTestPawn = KFPawn_Monster(TestPawn);
            if(MonsterTestPawn != none)
            {
                if(bInitial)
                {
                    MonsterTestPawn.LastTimeDamageHappened = WorldInfo.TimeSeconds;
                    continue;
                }
                if(((WorldInfo.TimeSeconds - MonsterTestPawn.LastTimeDamageHappened) >= ANTI_GRIEF_DELAY) && MonsterTestPawn.LastTimeDamageHappened != float(0))
                {
                    MonsterTestPawn.MotivatePlayerToAttack(ANTI_GRIEF_DAMAGE_PERCENTAGE, AntiGriefDamageTypeClass);
                }
            }
        }        
    }    
    if(IsWaveActive())
    {
        SetTimer(ANTI_GRIEF_INTERVAL, false, 'CheckPawnsForGriefing');
    }
}

function ResetPickups(array<KFPickupFactory> PickupList, int NumPickups)
{
    local byte I;

    I = 0;
    J0x0C:

    if(I < PickupList.Length)
    {
        PickupList[I].Reset();
        ++ I;
        goto J0x0C;
    }
}

function OpenPostRoundMenu()
{
    local KFPlayerController KFPC;

    foreach WorldInfo.AllControllers(Class'KFPlayerController', KFPC)
    {
        if(IsPlayerReady(KFPlayerReplicationInfo(KFPC.PlayerReplicationInfo)))
        {
            KFPC.ClientOpenRoundSummary();
        }        
    }    
}

function UpdateFirstRoundTeamScore()
{
    Teams[1].TeamScoreDataPacket.RoundScore = Teams[0].TeamScoreDataPacket.RoundScore;
    Teams[1].TeamScoreDataPacket.WaveBonus = WaveBonus;
    Teams[1].TeamScoreDataPacket.Deaths = HumanDeaths;
    if(MyKFGRI.WaveNum == MyKFGRI.WaveMax)
    {
        Teams[1].TeamScoreDataPacket.BossDamageDone = BossDamageDone;
        Teams[1].TeamScoreDataPacket.BossDamageTaken = BossSurvivorDamageTaken;        
    }
    else
    {
        Teams[1].TeamScoreDataPacket.BossDamageDone = 0;
        Teams[1].TeamScoreDataPacket.BossDamageTaken = 0;
    }
    Teams[0].TeamScoreDataPacket.RoundScore = 0;
    Teams[0].TeamScoreDataPacket.WaveBonus = -1;
    Teams[0].TeamScoreDataPacket.Deaths = 0;
    Teams[0].TeamScoreDataPacket.BossDamageDone = 0;
    Teams[0].TeamScoreDataPacket.BossDamageTaken = 0;
    Teams[0].bForceNetUpdate = true;
    Teams[0].bNetDirty = true;
    Teams[1].bForceNetUpdate = true;
    Teams[1].bNetDirty = true;
}

function UpdateSecondRoundTeamScore()
{
    Teams[0].TeamScoreDataPacket.WaveBonus = WaveBonus;
    Teams[0].TeamScoreDataPacket.Deaths = HumanDeaths;
    if(MyKFGRI.WaveNum == MyKFGRI.WaveMax)
    {
        Teams[0].TeamScoreDataPacket.BossDamageDone = BossDamageDone;
        Teams[0].TeamScoreDataPacket.BossDamageTaken = BossSurvivorDamageTaken;        
    }
    else
    {
        Teams[0].TeamScoreDataPacket.BossDamageDone = 0;
        Teams[0].TeamScoreDataPacket.BossDamageTaken = 0;
    }
    Teams[0].bNetDirty = true;
    Teams[0].bForceNetUpdate = true;
    Teams[1].bNetDirty = true;
    Teams[1].bForceNetUpdate = true;
}

function Reset()
{
    local KFPlayerControllerVersus KFPCV;

    super(GameInfo).Reset();
    foreach WorldInfo.AllControllers(Class'KFPlayerControllerVersus', KFPCV)
    {
        if(KFPCV.CanRestartPlayer())
        {
            SetTeam(KFPCV, ((KFPCV.PlayerReplicationInfo.Team == Teams[0]) ? Teams[1] : Teams[0]));
            KFPCV.ServerNotifyTeamChanged();
            if(!KFPCV.IsInState('Spectating'))
            {
                KFPCV.StartSpectate();
            }
        }        
    }    
    if(SpawnManager != none)
    {
        SpawnManager.ResetSpawnManager();
    }
    WaveBonus = -1;
    HumanDeaths = 0;
    BossDamageDone = 0;
    BossSurvivorDamageTaken = 0;
    PercentOfZedsKilledBeforeWipe = 0;
    Class'KFGameplayPoolManager'.static.GetPoolManager().Reset();
}

protected function ClosePostRoundMenu(optional bool bMatchOver)
{
    local KFPlayerControllerVersus KFPCV;

    bMatchOver = false;
    foreach WorldInfo.AllControllers(Class'KFPlayerControllerVersus', KFPCV)
    {
        KFPCV.ClientShowPostGameMenu(false);        
    }    
    if(!bMatchOver)
    {
        SetTimer(0.1, false, 'Timer_AnnounceNextRound');
    }
}

protected function Timer_AnnounceNextRound()
{
    BroadcastLocalizedMessage(Class'KFLocalMessage_Priority', 15);
}

protected function CheckTeamNumbers()
{
    local KFPlayerControllerVersus KFPCV;
    local int HumanPlayers, ZedPlayers;

    if((NumPlayers < 2) || MyKFGRIV.CurrentRound > 1)
    {
        GotoState('MatchEnded');
        return;
    }
    foreach WorldInfo.AllControllers(Class'KFPlayerControllerVersus', KFPCV)
    {
        if(!KFPCV.CanRestartPlayer())
        {
            continue;            
        }
        if(KFPCV.GetTeamNum() == 255)
        {
            ++ ZedPlayers;
            continue;
        }
        ++ HumanPlayers;        
    }    
    if((HumanPlayers == 0) && ZedPlayers > 1)
    {
        SwitchOnePlayerToTeam(0);        
    }
    else
    {
        if((ZedPlayers == 0) && HumanPlayers > 1)
        {
            SwitchOnePlayerToTeam(255);
        }
    }
}

protected function BeginNextRound()
{
    ResetLevel();
    MyKFGRIV.bStopCountDown = true;
    MyKFGRIV.SetPlayerZedSpawnTime(byte(PostRoundWaitTime), false);
    ClosePostRoundMenu();
}

function StartSpawning()
{
    MyKFGRIV.bRoundIsOver = false;
    MyKFGRIV.bNetDirty = true;
    MyKFGRIV.bForceNetUpdate = true;
    GotoState('None');
    StartMatch();
}

protected function SwitchOnePlayerToTeam(byte TeamNum)
{
    local KFPlayerControllerVersus KFPCV;

    foreach WorldInfo.AllControllers(Class'KFPlayerControllerVersus', KFPCV)
    {
        if(KFPCV.CanRestartPlayer() && KFPCV.GetTeamNum() != TeamNum)
        {
            SetTeam(KFPCV, ((TeamNum == 0) ? Teams[0] : Teams[1]));
            break;
        }        
    }    
}

protected function CheckRoundEndAchievements(byte WinningTeam)
{
    local KFPlayerControllerVersus KFPCV;

    foreach WorldInfo.AllControllers(Class'KFPlayerControllerVersus', KFPCV)
    {
        KFPCV.ClientRoundEnded(WinningTeam);        
    }    
}

function TryRestartGame()
{
    if(IsInState('RoundEnded'))
    {
        BeginNextRound();        
    }
    else
    {
        super.TryRestartGame();
    }
}

function ShowPostGameMenu()
{
    ClosePostRoundMenu(true);
    super.ShowPostGameMenu();
}

function float GetEndOfMatchTime()
{
    if(IsInState('RoundEnded'))
    {
        return float(TimeUntilNextRound);
    }
    return super.GetEndOfMatchTime();
}

state RoundEnded
{
    event BeginState(name PrevStateName)
    {
        MyKFGRIV.bRoundIsOver = true;
        MyKFGRIV.CurrentRound += 1;
        MyKFGRIV.SetPlayerZedSpawnTime(255, false);
    }

    function bool MatchIsInProgress()
    {
        return false;
    }
ForceEnded:

    Sleep(1);
    BeginNextRound();
    goto 'End';
Begin:


    Sleep(RoundEndCinematicDelay);
    OpenPostRoundMenu();
    Sleep(GetEndOfMatchTime());
    if(MyKFGRIV.CurrentRound > 1)
    {
        GotoState('MatchEnded');
        Sleep(0);
    }
    CheckTeamNumbers();
    BeginNextRound();
    Sleep(PostRoundWaitTime);
End:


    StartSpawning();
    stop;                
}

defaultproperties
{
    ANTI_GRIEF_DELAY=30
    ANTI_GRIEF_INTERVAL=2
    ANTI_GRIEF_DAMAGE_PERCENTAGE=10
    PlayerZedClasses(0)=none
    PlayerZedClasses(1)=class'KFPawn_ZedClot_Slasher_Versus'
    PlayerZedClasses(2)=class'KFPawn_ZedClot_Alpha_Versus'
    PlayerZedClasses(3)=class'KFPawn_ZedCrawler_Versus'
    PlayerZedClasses(4)=class'KFPawn_ZedGorefast_Versus'
    PlayerZedClasses(5)=class'KFPawn_ZedStalker_Versus'
    PlayerZedClasses(6)=class'KFPawn_ZedScrake_Versus'
    PlayerZedClasses(7)=class'KFPawn_ZedFleshPound_Versus'
    PlayerZedClasses(8)=class'KFPawn_ZedBloat_Versus'
    PlayerZedClasses(9)=class'KFPawn_ZedSiren_Versus'
    PlayerZedClasses(10)=class'KFPawn_ZedHusk_Versus'
    PlayerBossClassList(0)=class'KFPawn_ZedPatriarch_Versus'
    AntiGriefDamageTypeClass=Class'KFGame.KFDT_NoGoVolume'
    bTeamBalanceEnabled=true
    ScoreRadius=1000
    TimeUntilNextRound=12
    RoundEndCinematicDelay=4
    PostRoundWaitTime=15
    bIsVersusGame=true
    KFGFxManagerClass=Class'KFGame.KFGFxMoviePlayer_Manager_Versus'
    MinNetPlayers=2
    DifficultyTemplate=KFDifficultyInfo'GP_Difficulty_ARCH.Difficulty_Versus'
    MaxGameDifficulty=0
    SpawnManagerClasses=/* Array type was not detected. */
    GameConductorClass=Class'KFGameConductorVersus'
    InValidMaps=/* Array type was not detected. */
    DefaultPawnClass=Class'KFPawn_Human_Versus'
    HUDType=Class'KFGFXHudWrapper_Versus'
    MaxPlayers=12
    MaxPlayersAllowed=12
    GameName="VS Survival"
    PlayerControllerClass=Class'KFPlayerControllerVersus'
    PlayerReplicationInfoClass=Class'KFGame.KFPlayerReplicationInfoVersus'
    GameReplicationInfoClass=Class'KFGameReplicationInfoVersus'
    OnlineGameSettingsClass=Class'KFGame.KFOnlineGameSettingsVersus'
}