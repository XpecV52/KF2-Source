//=============================================================================
// KFGameInfo_VersusSurvival
//=============================================================================
// The game mode class for players vs zeds survival game type
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================

class KFGameInfo_VersusSurvival extends KFGameInfo_Survival;

var config bool bTeamBalanceEnabled;

/** The maximum global number of puke mines that can be active in play */
const MaxActivePukeMines = 30;

/** Array of all active puke mines */
var transient array<KFProj_BloatPukeMine> ActivePukeMines;

/** Radius around a damaged zed to award score to player zeds */
var config float ScoreRadius;

/** Zed pawn classes used by players */
var protected const array<class<KFPawn_Monster> > PlayerZedClasses;
var protected const array<class<KFPawn_MonsterBoss> > PlayerBossClassList;

const ANTI_GRIEF_DELAY = 30.f;
const ANTI_GRIEF_INTERVAL = 2.f;
const ANTI_GRIEF_DAMAGE_PERCENTAGE = 10.f;

var class<KFDamageType> AntiGriefDamageTypeClass;

event PreBeginPlay()
{
	super.PreBeginPlay();

	// Create the zed team
	CreateTeam(1);
}

function InitGRIVariables()
{
    super.InitGRIVariables();

    KFGameReplicationInfoVersus(MyKFGRI).bTeamBalanceEnabled = bTeamBalanceEnabled;
}

function bool IsPlayerReady( KFPlayerReplicationInfo PRI )
{
    // Spawn our player even if we don't have a perk while using the editor or skip lobby
    if (class'KFGameEngine'.static.CheckSkipLobby() || class'Engine'.static.IsEditor())
    {
        return true;
    }

    return super(KFGameInfo).IsPlayerReady(PRI);
}

function StartMatch()
{
	local KFPlayerController KFPC;
	local array<KFPlayerController> PlayerControllers;

	// Get a list of players
	foreach WorldInfo.AllControllers(class'KFPlayerController', KFPC)
	{
		PlayerControllers[PlayerControllers.Length] = KFPC;
        if( KFPC.GetTeamNum() == 255 && (KFPC.Pawn == none || KFPawn_Customization(KFPC.Pawn) != none) )
        {
            if( KFPC.Pawn != none )
            {
                KFPC.Pawn.Destroy();
            }

            KFPC.StartSpectate();
        }
	}

    // If there's only one player, we must spawn them in as human
    if( PlayerControllers.Length == 1 )
    {
        SetTeam( PlayerControllers[0], Teams[0] );
    }

	super.StartMatch();
}

function BalanceTeams()
{
    local int Delta, AutoBalanceRemaining, i;
    local TeamInfo TI;
    local Array<PlayerReplicationInfo> AutoBalanceList;
    local KFGameReplicationInfoVersus KFGRIV;
    local PlayerReplicationInfo PRI;

    KFGRIV = KFGameReplicationInfoVersus(MyKFGRI);

    Delta = Teams[1].Size - Teams[0].Size;
    if ( Delta == 0 )
        return;

    TI = (Delta > 0) ? Teams[1] : Teams[0];
    for (i = 0; i < KFGRIV.PRIArray.Length; i++)
    {
        PRI = KFGRIV.PRIArray[i];
        if ( PRI.Team == TI )
        {
            AutoBalanceList.AddItem(PRI);
        }
    }

    AutoBalanceRemaining = Min(abs(Delta), KFGRIV.TeamBalanceDelta);
    while (AutoBalanceRemaining > 0 || TI.Size > (MaxPlayersAllowed / 2) )
    {
        i = Rand(AutoBalanceList.Length);
        SwapTeamFor(AutoBalanceList[i]);
        AutoBalanceList.Remove(i, 1);
        AutoBalanceRemaining--;
    }
}

function SwapTeamFor( PlayerReplicationInfo PRI )
{
    local KFPlayerControllerVersus KFPC;

    KFPC = KFPlayerControllerVersus(PRI.Owner);
    if( KFPC != none )
    {
       KFPC.NotifyOfAutoBalance();
       SetTeam( KFPC,  PRI.GetTeamNum() == 255 ? Teams[0] : Teams[1] );
    }
}

/* create a player team, and fill from the team roster
*/
function CreateTeam(int TeamIndex)
{
    switch (TeamIndex)
    {
        case 0:
            Teams[TeamIndex] = spawn(class'KFGame.KFTeamInfo_Human');
            GameReplicationInfo.SetTeam(TeamIndex, Teams[TeamIndex]);
            break;

        case 1:
            Teams[TeamIndex] = spawn(class'KFGameContent.KFTeamInfo_Zeds');
            GameReplicationInfo.SetTeam(TeamIndex, Teams[TeamIndex]);
            break;
    }
}

/** Called by Gameinfo::Login(), initial team pick */
function byte PickTeam(byte Current, Controller C)
{
    // Make sure teams are balanced
    if( Teams[1].Size < Teams[0].Size || (Teams[0].Size > 0 && Teams[1].Size == Teams[0].Size && fRand() < 0.5f) )
	{
		// Zed team
        return 1;
	}
	else
	{
	    // Human team
        return 0;
	}
}

/** Return whether a team change is allowed. */
function bool ChangeTeam(Controller Other, int N, bool bNewTeam)
{
    if( PlayerController(Other) == none
        || (Other.PlayerReplicationInfo != none
        && !Other.PlayerReplicationInfo.bOnlySpectator
        && ArrayCount(Teams) > N
        && Other.PlayerReplicationInfo.Team != Teams[N]) )
    {
        SetTeam( Other, Teams[N] );
        return true;
    }

    return false;
}

/** SetTeam()
* Change Other's team to NewTeam.
* @param Other:  the controller which wants to change teams
* @param NewTeam:  the desired team.
* @param bNewTeam:  if true, broadcast team change notification
*/
function SetTeam(Controller Other, KFTeamInfo_Human NewTeam)
{
    local KFPlayerControllerVersus KFPC;
    local TeamInfo OldTeam;
    local NavigationPoint Start;

    if( Other == none || Other.PlayerReplicationInfo == none )
    {
        super.SetTeam( Other, NewTeam );
        return;
    }

    OldTeam = Other.PlayerReplicationInfo.Team;

    super.SetTeam( Other, NewTeam );

    if( NewTeam != OldTeam )
    {
        if( Other.PlayerReplicationInfo.bWaitingPlayer )
        {
            KFPC = KFPlayerControllerVersus( Other );
            if( KFPC != none )
            {
                if( NewTeam.TeamIndex == 255 )
                {
                    if( KFPC.Pawn != none && KFPawn_Customization(KFPC.Pawn) != none )
                    {
                        // Hide customization pawn
                        KFPawn_Customization(KFPC.Pawn).SetServerHidden( true );
                    }

                    KFPC.SetCameraMode( 'PlayerZedWaiting' );
                }
                else if( KFPC.Pawn != none )
                {
                    // Unhide/relocate customization pawn
                    KFPawn_Customization(KFPC.Pawn).SetServerHidden( false );

                    if( !KFPawn_Customization(KFPC.Pawn).MoveToCustomizationPoint() )
                    {
                        Start = KFPC.GetBestCustomizationStart( self );
                        if( Start != none )
                        {
                            KFPawn_Customization(KFPC.Pawn).SetUpdatedMovementData( Start.Location, Start.Rotation );
                        }
                    }

                    // Restore view target and camera mode
                    KFPC.SetViewTarget( KFPC.Pawn );
                    KFPC.SetCameraMode( 'Customization' );
                }

                KFPC.ServerNotifyTeamChanged();
            }
        }
        else if( OldTeam.TeamIndex == 255 && KFPC.PlayerZedSpawnInfo.PendingZedPawnClass != none )
        {
            // If this player switched teams, we need to recycle their zed pawn class back into rotation
            if( SpawnManager != none )
            {
                KFAISpawnManager_Versus(SpawnManager).RecyclePendingZedPawnClass( KFPC );
            }
        }
    }
}

/** Need to recycle any exiting players' pending zed pawn classes back into the spawn rotation */
function Logout( Controller Exiting )
{
    local KFPlayerController KFPC;

    if( Exiting != none )
    {
        KFPC = KFPlayerController( Exiting );
        if( KFPC != none && KFPC.GetTeamNum() == 255 && KFPC.PlayerZedSpawnInfo.PendingZedPawnClass != none )
        {
            if( SpawnManager != none )
            {
                KFAISpawnManager_Versus(SpawnManager).RecyclePendingZedPawnClass( KFPC );
            }
        }
    }

    super.Logout( Exiting );
}

function RestartPlayer(Controller NewPlayer)
{
    local int PlayerTeamIndex;
    local KFPawn_Monster MonsterPawn;
    local KFPlayerController KFPC;

    // Check bOnlySpectator.  Can be called sometimes without calling CanRestartPlayer()?!?
    if(NewPlayer.PlayerReplicationInfo == none || NewPlayer.PlayerReplicationInfo.bOnlySpectator)
    {
        return;
    }

    PlayerTeamIndex = NewPlayer.GetTeamNum();
    KFPC = KFPlayerController( NewPlayer );
    if( KFPC != none && (MyKFGRI.bMatchIsOver || (PlayerTeamIndex == 255 && (MyKFGRI.bTraderIsOpen || KFPC.PlayerZedSpawnInfo.PendingZedPawnClass == none))) )
    {
        KFPC.StartSpectate();
        return;
    }

    if( NewPlayer.Pawn != none && KFPawn_Customization(NewPlayer.Pawn) != none )
    {
        // If we have a customization pawn, destroy it before spawning a new pawn with super.RestartPlayer
        NewPlayer.Pawn.Destroy();
    }

    // Restart human
    if( PlayerTeamIndex != 255 )
    {
        super.RestartPlayer( NewPlayer );
    }
    else if( NewPlayer.Pawn == none && PlayerTeamIndex == 255 )
    {
        super(GameInfo).RestartPlayer( NewPlayer );
    }

    MonsterPawn = KFPawn_Monster(NewPlayer.Pawn);
    if( MonsterPawn != none && MonsterPawn.IsHumanControlled() )
    {
        MonsterPawn.UpdateLastTimeDamageHappened();
    }
}

function int GetAIControlledMonsterAliveCount()
{
	local AIController AIP;
	local int UsedLivingAIMonsterCount;

	foreach WorldInfo.AllControllers(class'AIController', AIP)
	{
		if( AIP != none && AIP.Pawn != none && AIP.Pawn.IsAliveAndWell() )
		{
            if( KFPawn_Monster(AIP.Pawn) != none )
            {
                UsedLivingAIMonsterCount++;
            }
		}
	}

	return UsedLivingAIMonsterCount;
}

/**
 * Returns the default pawn class for the specified controller,
 *
 * @param	C - controller to figure out pawn class for
 *
 * @return	default pawn class
 */
function class<Pawn> GetDefaultPlayerClass( Controller C )
{
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(C);

	if( KFPC.GetTeamNum() == 255 )
	{
        if( KFPC.PlayerZedSpawnInfo.PendingZedPawnClass != none )
        {
            return KFPC.PlayerZedSpawnInfo.PendingZedPawnClass;
        }

        return none;
    }

	// default to the game specified pawn class
	return super.GetDefaultPlayerClass( C );
}

// Overridden because the native implementation will count human controlled zeds
function int GetLivingPlayerCount()
{
	local Controller P;
	local int UsedLivingHumanPlayersCount;

`if(`notdefined(ShippingPC))
	if ( ForcedNumLivingPlayers != 0 )
	{
		return ForcedNumLivingPlayers;
	}
`endif

	foreach WorldInfo.AllControllers(class'Controller', P)
	{
		if( P != none && P.Pawn != none && P.Pawn.IsAliveAndWell() )
		{
            if( P.GetTeamNum() != 255 )
            {
                //`log(P$" TeamIndex = "$P.PlayerReplicationInfo.Team.TeamIndex);
                UsedLivingHumanPlayersCount++;
            }
		}
	}

	//`log(GetFuncName()$" Player alive count: "$UsedLivingHumanPlayersCount);

	return UsedLivingHumanPlayersCount;
}

/*  Use reduce damage for friendly fire, etc. */
function ReduceDamage( out int Damage, Pawn Injured, Controller InstigatedBy, vector HitLocation, out vector Momentum, class<DamageType> DamageType, Actor DamageCauser )
{
    local KFPawn InstigatorPawn, InjuredPawn;

    InstigatorPawn = KFPawn(InstigatedBy.Pawn);
    InjuredPawn = KFPawn(Injured);

    if( DamageType != AntiGriefDamageTypeClass )
    {
        if( InstigatorPawn != none && InjuredPawn != none && 
            InstigatorPawn.GetTeamNum() != InjuredPawn.GetTeamNum() )
        {
            InstigatorPawn.UpdateLastTimeDamageHappened();
            InjuredPawn.UpdateLastTimeDamageHappened();
        }
    }

    if( InstigatedBy != none && Injured != none && Injured.Controller != InstigatedBy && Injured.GetTeamNum() == InstigatedBy.GetTeamNum() )
    {
        Damage = 0;
        Momentum = vect(0,0,0);
    }
    else
    {
        super.ReduceDamage( Damage, Injured, InstigatedBy, HitLocation, Momentum, DamageType, DamageCauser );
    }
}

// Versus TODO: this was some unfinished code for awarding score to player zeds if
// they are near other zeds that damage a player
function ScoreDamage(int DamageAmount, Controller Damager, Controller Damagee, Pawn DamagedPawn)
{
    local KFPlayerControllerVersus KFPCV;
    local float ScoreRadiusSQ;

    ScoreRadiusSQ = Square( ScoreRadius );

    foreach WorldInfo.AllControllers( class'KFPlayerControllerVersus', KFPCV )
    {
        if( KFPCV.Pawn != none
            && KFPCV.GetTeamNum() == 255
            && KFPCV.Pawn.IsAliveAndWell()
            && VSizeSQ( KFPCV.Pawn.Location - DamagedPawn.Location ) <= ScoreRadiusSQ )
        {
            if( DamagedPawn.FastTrace(KFPCV.Pawn.Location, DamagedPawn.Location) )
            {
                KFPCV.AwardZedDamage( DamageAmount, Damager == KFPCV );
            }
        }
    }
}

//override from survival to send correct message
function EndOfMatch(bool bVictory)
{
    local KFPlayerController KFPC;

    `AnalyticsLog(("match_end", None, "#"$WaveNum, "#"$(bVictory ? "1" : "0"), "#"$GameConductor.ZedVisibleAverageLifespan));

    if(bVictory)
    {
        SetTimer(EndCinematicDelay, false, nameof(SetWonGameCamera));

        foreach WorldInfo.AllControllers(class'KFPlayerController', KFPC)
        {
            KFPC.ClientWonGame( WorldInfo.GetMapName( true ), GameDifficulty, GameLength,   IsMultiplayerGame() );
        }

        BroadcastLocalizedMessage(class'KFLocalMessage_Priority', GMT_HumansWin);
    }
    else
    {
        BroadcastLocalizedMessage(class'KFLocalMessage_Priority', GMT_ZedsWin);
        SetZedsToVictoryState();
    }

	WorldInfo.TWRefreshTweakParams();
    WorldInfo.TWPushLogs();

    GotoState('MatchEnded');
}

function Killed( Controller Killer, Controller KilledPlayer, Pawn KilledPawn, class<DamageType> damageType )
{
    super.Killed( Killer, KilledPlayer, KilledPawn, damageType );

    if( IsWaveActive() && GetAIControlledMonsterAliveCount() <= 0 && SpawnManager.IsFinishedSpawning() )
    {
        CheckPawnsForGriefing( true );
    }
}

function WaveEnded( EWaveEndCondition WinCondition )
{
    ClearTimer( nameOf(CheckPawnsForGriefing) );

    super.WaveEnded( WinCondition );
}

/**
 * @brief Checks if a player zed has dealt or received damage
 *
 * @param bool bInitial Set's the LastTimeDamageHappened to the current time to
 *             give the players some time to get to the humans
 */
protected function CheckPawnsForGriefing( optional bool bInitial=false )
{
    local Pawn TestPawn;
    local KFPawn_Monster MonsterTestPawn;

    foreach WorldInfo.AllPawns( class'Pawn', TestPawn )
    {
        if( TestPawn.IsAliveAndWell() && TestPawn.Controller != none &&
            TestPawn.Controller.bIsPlayer && TestPawn.GetTeamNum() == 255 )
        {
            MonsterTestPawn = KFPawn_Monster(TestPawn);
            if( MonsterTestPawn != none )
            {
                if( bInitial )
                {
                    MonsterTestPawn.LastTimeDamageHappened = WorldInfo.TimeSeconds;
                }
                 else if( WorldInfo.TimeSeconds - MonsterTestPawn.LastTimeDamageHappened >= ANTI_GRIEF_DELAY &&
                          MonsterTestPawn.LastTimeDamageHappened != 0 )
                {
                    MonsterTestPawn.MotivatePlayerToAttack( ANTI_GRIEF_DAMAGE_PERCENTAGE, AntiGriefDamageTypeClass );
                }
            }
        }
    }

    if( IsWaveActive() )
    {
        SetTimer( ANTI_GRIEF_INTERVAL, false, nameOf(CheckPawnsForGriefing) );
    }
}

/** Reset ALL pickups each wave (ignoring NumPickups) */
function ResetPickups( array<KFPickupFactory> PickupList, int NumPickups )
{
    local byte i;

    for ( i = 0; i < PickupList.Length; i++ )
    {
        PickupList[i].Reset();
    }
}

DefaultProperties
{
    bIsVersusGame=true

	OnlineGameSettingsClass=class'KFGame.KFOnlineGameSettingsVersus'
	HUDType=class'KFGameContent.KFGFXHudWrapper_Versus'
    KFGFxManagerClass=class'KFGame.KFGFxMoviePlayer_Manager_Versus'
	PlayerControllerClass=class'KFGameContent.KFPlayerControllerVersus'
    PlayerReplicationInfoClass=class'KFGame.KFPlayerReplicationInfoVersus'
	GameReplicationInfoClass=class'KFGameContent.KFGameReplicationInfoVersus'
	MaxPlayersAllowed=`KF_MAX_PLAYERS_VERSUS
	DefaultPawnClass=class'KFGameContent.KFPawn_Human_Versus'
	GameConductorClass=class'KFGameContent.KFGameConductorVersus'

    MaxGameDifficulty=0
    DifficultyTemplate=KFDifficultyInfo'GP_Difficulty_ARCH.Difficulty_Versus'

    PlayerZedClasses(AT_AlphaClot)=class'KFGameContent.KFPawn_ZedClot_Alpha_Versus'
    PlayerZedClasses(AT_SlasherClot)=class'KFGameContent.KFPawn_ZedClot_Slasher_Versus'
    PlayerZedClasses(AT_Crawler)=class'KFGameContent.KFPawn_ZedCrawler_Versus'
    PlayerZedClasses(AT_GoreFast)=class'KFGameContent.KFPawn_ZedGorefast_Versus'
    PlayerZedClasses(AT_Stalker)=class'KFGameContent.KFPawn_ZedStalker_Versus'
    PlayerZedClasses(AT_Scrake)=class'KFGameContent.KFPawn_ZedScrake_Versus'
    PlayerZedClasses(AT_FleshPound)=class'KFGameContent.KFPawn_ZedFleshpound_Versus'
    PlayerZedClasses(AT_Bloat)=class'KFGameContent.KFPawn_ZedBloat_Versus'
    PlayerZedClasses(AT_Siren)=class'KFGameContent.KFPawn_ZedSiren_Versus'
    PlayerZedClasses(AT_Husk)=class'KFGameContent.KFPawn_ZedHusk_Versus'

    PlayerBossClassList.Add(class'KFGameContent.KFPawn_ZedPatriarch_Versus')

    SpawnManagerClasses.Empty
	SpawnManagerClasses(0)=class'KFAISpawnManager_Versus'

    AntiGriefDamageTypeClass=class'KFDT_NoGoVolume'
}