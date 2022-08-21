//=============================================================================
// KFGameInfo_Survival
//=============================================================================
// Classic Killing Floor wave based game type
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Christian "schneidzekk" Schneider
//=============================================================================
class KFGameInfo_Survival extends KFGameInfo;







	







	 



		
		
	



 


 
































































































































































































































#linenumber 52;

#linenumber 12;





































	














#linenumber 13;

enum EWaveEndCondition
{
	WEC_WaveWon,
	WEC_TeamWipedOut,
	WEC_GameWon
};

/************************************************************************************
 * Game Config
 ***********************************************************************************/
/** Trader */
var int									TimeBetweenWaves;

var const float							EndCinematicDelay;		// time between the game ending, and the final camera change activating

/************************************************************************************
 * AAR
 ***********************************************************************************/
var const float							AARDisplayDelay;

var Array<AARAWard> TeamAwardList;

/************************************************************************************
 * Waves
 ***********************************************************************************/
var	byte								WaveMax;	// The "end" wave
var	int									WaveNum;	// The wave we are currently in

/************************************************************************************
 * Objectives
 ***********************************************************************************/
var	int									PlayedObjectives;
var float								ObjectiveCheckIntervall;
var	bool								bObjectivePlayed;
const									ObjectiveChance = 0.5f;
var float 								MinAIAlivePercReqForObjStart;
var bool								bLogCheckObjective;

/** Whether this game mode should play music from the get-go (lobby) */
static function bool ShouldPlayMusicAtStart()
{
	return true;
}

/** Whether an action or ambient track should be played */
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

	TimeBetweenWaves = DifficultyInfo.GetTraderTimeByDifficulty();
}

/** Set up the spawning */
function InitSpawnManager()
{
	SpawnManager = new(self) SpawnManagerClasses[GameLength];
	SpawnManager.Initialize();
	WaveMax = SpawnManager.Waves.Length;
	MyKFGRI.WaveMax = WaveMax;
}

/* StartMatch()
Start the game - inform all actors that the match is starting, and spawn player pawns
*/
function StartMatch()
{
	WaveNum = 0;

	super.StartMatch();

	if( class'KFGameEngine'.static.CheckNoAutoStart() || class'KFGameEngine'.static.IsEditor() )
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
	if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlayWaveStartDialog( WaveNum == WaveMax );
}

/** Custom logic to determine what the game's current intensity is */
function byte GetGameIntensityForMusic()
{
	switch( GameLength )
	{
	case GL_Short:
		if( WaveNum <= 0 )
			return 1;
		else if( WaveNum <= 1 )
			return 4;
		else if( WaveNum <= 2 )
			return 7;
		else
			return 10;
	case GL_Normal:
		if( WaveNum <= 1 )
			return 1;
		else if( WaveNum <= 3 )
			return 4;
		else if( WaveNum <= 5 )
			return 7;
		else
			return 10;
	case GL_Long:
		if( WaveNum <= 2 )
			return 1;
		else if( WaveNum <= 5 )
			return 4;
		else if( WaveNum <= 8 )
			return 7;
		else
			return 10;
	};

	return 255;
}

function bool IsPlayerReady( KFPlayerReplicationInfo PRI )
{
	local KFPlayerController KFPC;

	// Spawn our player even if we don't have a perk while using the editor or skip lobby
	if (class'KFGameEngine'.static.CheckSkipLobby() || class'Engine'.static.IsEditor())
 	{
 		return true;
 	}

	if( super.IsPlayerReady(PRI) )
	{
		KFPC = KFPlayerController(PRI.Owner);
		if ( WorldInfo.NetMode == NM_StandAlone && KFPC != None && (KFPC.CurrentPerk == None || !KFPC.CurrentPerk.bInitialized) )
		{
			// HSL - BWJ - 3-16-16 - console doesn't read stats yet, so no perk support. Adding this hack in for now so we can spawn in
			if( WorldInfo.IsConsoleDedicatedServer() || WorldInfo.IsConsoleBuild() )
			{
				WarnInternal("TODO: Need perk support for console");
				return true;
			}
			else
			{
				LogInternal("ERROR: Failed to load perk for:"@KFPC@KFPC.CurrentPerk);
				//ForceKickPlayer(KFPC, "Failed to find perk");
				return false; // critical error
			}
		}

		return true;
	}

	return false;
}

function bool PlayerCanRestart( PlayerController aPlayer )
{
	return (!IsWaveActive() && MyKFGRI.bMatchHasBegun);
}

function RestartPlayer(Controller NewPlayer)
{
	local KFPlayerController KFPC;
	local KFPlayerReplicationInfo KFPRI;
	local bool bWasWaitingForClientPerkData;

	KFPC = KFPlayerController(NewPlayer);
	KFPRI = KFPlayerReplicationInfo(NewPlayer.PlayerReplicationInfo);

	if( KFPC != None && KFPRI != None )
	{
		if( IsPlayerReady( KFPRI ) )
		{
			bWasWaitingForClientPerkData = KFPC.bWaitingForClientPerkData;

			/** If we have rejoined the match more than once, delay our respawn by some amount of time */
			if( MyKFGRI.bMatchHasBegun && KFPRI.NumTimesReconnected > 1 && (WorldInfo.TimeSeconds - KFPRI.LastQuitTime) < ReconnectRespawnTime )
			{
				KFPC.StartSpectate();
				KFPC.SetTimer(ReconnectRespawnTime - (WorldInfo.TimeSeconds - KFPRI.LastQuitTime), false, nameof(KFPC.SpawnReconnectedPlayer));
			}
			//If a wave is active, we spectate until the end of the wave
			else if( IsWaveActive() && !bWasWaitingForClientPerkData )
			{
				KFPC.StartSpectate();
			}
			else
			{
				Super.RestartPlayer(NewPlayer);

				// Already gone through one RestartPlayer() cycle, don't process again
				if( bWasWaitingForClientPerkData )
				{
					return;
				}

				if( KFPRI.Deaths == 0 )
				{
					if( WaveNum < 1 )
					{
						KFPRI.Score = DifficultyInfo.GetAdjustedStartingCash();
					}
					else
					{
						KFPRI.Score = GetAdjustedDeathPenalty( KFPRI, true );
					}
					if (bLogScoring) LogInternal("SCORING: Player" @ KFPRI.PlayerName @ "received" @ KFPRI.Score @ "starting cash");
				}
			}

			if(class'KFGameInfo'.static.AllowBalanceLogging()) WorldInfo.LogGameBalance(GBE_Respawn$","$KFPRI.PlayerName$","$"$"$KFPRI.Score);

			if(WorldInfo.GRI.GameClass.static.AllowAnalyticsLogging()) WorldInfo.TWLogEvent ("player_respawn",
						   KFPRI,
						   "#"$MyKFGRI.WaveNum,
						   "#"$KFPRI.Score );
		}
	}
}

function Killed(Controller Killer, Controller KilledPlayer, Pawn KilledPawn, class<DamageType> damageType)
{
	super.Killed(Killer, KilledPlayer, KilledPawn, damageType);

	// if not boss wave, play progress update trader dialog
	if( !MyKFGRI.IsFinalWave() && KilledPawn.IsA('KFPawn_Monster') )
    {
    	// no KFTraderDialogManager object on dedicated server, so use static function
    	class'KFTraderDialogManager'.static.PlayGlobalWaveProgressDialog( MyKFGRI.AIRemaining, MyKFGRI.WaveTotalAICount, WorldInfo );
	}

	CheckWaveEnd();
}

/*	Use reduce damage for friendly fire, etc. */
function ReduceDamage(out int Damage, Pawn Injured, Controller InstigatedBy, vector HitLocation, out vector Momentum, class<DamageType> DamageType, Actor DamageCauser)
{
	if( Injured.Controller != none && Injured.Controller.bIsPlayer && !MyKFGRI.bMatchHasBegun )
	{
		Damage = 0;
		Momentum = vect(0,0,0);
	}

	Super.ReduceDamage(Damage, Injured, InstigatedBy, HitLocation, Momentum, DamageType, DamageCauser);
}

function BossDied(controller Killer)
{
	local KFPawn_Monster AIP;
	local KFGameReplicationInfo KFGRI;
	local KFPlayerController KFPC;

	KFPC = KFPlayerController(Killer);

	if(KFPC!= none && KFPC.MatchStats != none ){KFPC.MatchStats.bKilledBoss = true;};

	KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
	if( KFGRI != none && !KFGRI.IsFinalWave() )
	{
		return;
	}

 	// Extended zed time for an extra dramatic event
 	DramaticEvent( 1, 6.f );

	// Kill all zeds active zeds when the game ends
	foreach WorldInfo.AllPawns(class'KFPawn_Monster', AIP)
	{
		if( AIP.Health > 0 )
		{
			AIP.Died(none , none, AIP.Location);
		}
	}

 	CheckWaveEnd( true );
}

function UpdateGameSettings()
{
	local name SessionName;
	local KFOnlineGameSettings KFGameSettings;
	local int NumHumanPlayers, i;

	if (WorldInfo.NetMode == NM_DedicatedServer || WorldInfo.NetMode == NM_ListenServer)
	{
		if (GameInterface != None)
		{
			SessionName = PlayerReplicationInfoClass.default.SessionName;
			KFGameSettings = KFOnlineGameSettings(GameInterface.GetGameSettings(SessionName));
			//Ensure bug-for-bug compatibility with KF1

			if (KFGameSettings != None)
			{
				KFGameSettings.Mode = GetGameModeNum();
				KFGameSettings.Difficulty = GameDifficulty;
				//Ensure bug-for-bug compatibility with KF1
				if (WaveNum == 0)
				{
					KFGameSettings.bInProgress = false;
					KFGameSettings.CurrentWave = 1;
				}
				else
				{
					KFGameSettings.bInProgress = true;
					KFGameSettings.CurrentWave = WaveNum;
				}
				//Also from KF1
				KFGameSettings.NumWaves = WaveMax - 1;
				KFGameSettings.OwningPlayerName = class'GameReplicationInfo'.default.ServerName;

				KFGameSettings.NumPublicConnections = MaxPlayersAllowed;
				KFGameSettings.bRequiresPassword = RequiresPassword();
				KFGameSettings.bCustom = bIsCustomGame;
				KFGameSettings.bUsesStats = !bIsUnrankedGame;
				KFGameSettings.NumSpectators = NumSpectators;
				if(MyKFGRI != none)
				{
					MyKFGRI.bCustom = bIsCustomGame;
				}

				// Set the map name
				if( WorldInfo.IsConsoleDedicatedServer() )
				{
					KFGameSettings.MapName = WorldInfo.GetMapName(true);
					if( GameReplicationInfo != none )
					{
						for( i = 0; i < GameReplicationInfo.PRIArray.Length; i++ )
						{
							if( !GameReplicationInfo.PRIArray[i].bBot )
							{
								NumHumanPlayers++;
							}
						}
					}

					KFGameSettings.NumOpenPublicConnections = KFGameSettings.NumPublicConnections - NumHumanPlayers;
				}

				//Trigger re-broadcast of game settings
				GameInterface.UpdateOnlineGame(SessionName, KFGameSettings, true);
			}
		}
	}
}

function int GetGameModeNum()
{
	return class'KFGameInfo'.static.GetGameModeNumFromClass( PathName(default.class) );
}

function int GetNumHumanTeamPlayers()
{
	local PlayerController P;
	local int TotalPlayers, ZedTeamPlayers, HumanTeamPlayers;

	// We call PreClientTravel directly on any local PlayerPawns (ie listen server)
	foreach WorldInfo.AllControllers(class'PlayerController', P)
	{
        //`log(GetFuncName()@P$" team = "$P.PlayerReplicationInfo.Team$" team index = "$P.PlayerReplicationInfo.Team.TeamIndex$" P.GetTeamNum() = "$P.GetTeamNum()$" P.bIsPlayer = "$P.bIsPlayer);
        if( P.bIsPlayer && P.GetTeamNum() == 255 )
        {
            ZedTeamPlayers++;
        }
	}

    TotalPlayers = GetNumPlayers();
    HumanTeamPlayers = TotalPlayers - ZedTeamPlayers;
    //`log(GetFuncName()$" TotalPlayers: "$TotalPlayers$" ZedTeamPlayers: "$ZedTeamPlayers$" HumanTeamPlayers: "$HumanTeamPlayers);
    return HumanTeamPlayers;
}

/**
 * Return whether Viewer is allowed to spectate from ViewTarget's PoV.
 *   Used to prevent players from spectating zeds when the DummyPRI is active.
 *
 */
function bool CanSpectate( PlayerController Viewer, PlayerReplicationInfo ViewTarget )
{
    // Normal PRI's should be replicatable, DummyPRI is not, indicating a zed
    return ( super.CanSpectate(Viewer, ViewTarget)
    		&& (Viewer.PlayerReplicationInfo.bOnlySpectator || Viewer.GetTeamNum() == ViewTarget.GetTeamNum() || MyKFGRI.bTraderIsOpen) );
}


/************************************************************************************
 * Timers
 ***********************************************************************************/

/** Default timer, called from native */
event Timer()
{
	super.Timer();

	if( SpawnManager != none )
	{
		SpawnManager.Update();
	}

	if( GameConductor != none )
	{
		GameConductor.TimerUpdate();
	}
}

/**
 * @brief Checks if we are playing coop online with other people
 *
 * @return true if hosting and more than 1 player
 */
function byte IsMultiplayerGame()
{
	return (WorldInfo.NetMode != NM_Standalone && GetNumPlayers()  > 1) ? 1 : 0;
}

function UpdateWaveEndDialogInfo()
{
	local int PlayersAlive, PlayersTotal, MostZedsKilled, MostDoshEarned, BestTeammateScore;
	local KFPlayerController KFPC, KilledMostZeds, EarnedMostDosh, BestTeammate;

	foreach WorldInfo.AllControllers(class'KFPlayerController', KFPC)
	{
		if( KFPC.bDemoOwner )
		{
			// don't count demorecspectator
			continue;
		}

		PlayersTotal++;

		if( KFPC.Pawn != none && KFPC.Pawn.IsAliveAndWell() )
		{
    	 	PlayersAlive++;
		}

		if( KFPC.MatchStats.ZedsKilledLastWave > MostZedsKilled )
		{
			KilledMostZeds = KFPC;
			MostZedsKilled = KFPC.MatchStats.ZedsKilledLastWave;
		}

		if( KFPC.MatchStats.GetDoshEarnedInWave() > MostDoshEarned )
		{
			EarnedMostDosh = KFPC;
			MostDoshEarned = KFPC.MatchStats.GetDoshEarnedInWave();
		}

		if( KFPC.MatchStats.ZedsKilledLastWave + KFPC.MatchStats.GetDoshEarnedInWave() > BestTeammateScore )
		{
			BestTeammate = KFPC;
			BestTeammateScore = KFPC.MatchStats.ZedsKilledLastWave + KFPC.MatchStats.GetDoshEarnedInWave();
		}
	}

	if( PlayersTotal > 1 )
	{
		foreach WorldInfo.AllControllers(class'KFPlayerController', KFPC)
		{
			if( KFPC.Pawn != none && KFPC.Pawn.IsAliveAndWell() )
			{
				if( PlayersAlive == PlayersTotal )
				{
					// no teammates died
					KFPC.PWRI.bAllSurvivedLastWave = true;
				}
				else if( PlayersAlive == 1 )
				{
					// only survivor
					KFPC.PWRI.bOneSurvivedLastWave = true;
				}
				else if( PlayersTotal - PlayersAlive > 1 )
				{
					// more than one teammate died
					KFPC.PWRI.bSomeSurvivedLastWave = true;
				}
			}
		}
	}

	if( KilledMostZeds != none )
	{
		KilledMostZeds.PWRI.bKilledMostZeds = true;
	}

	if( EarnedMostDosh != none )
	{
		EarnedMostDosh.PWRI.bEarnedMostDosh = true;
	}

	if( BestTeammate != none )
	{
		BestTeammate.PWRI.bBestTeammate = true;
	}
}

/************************************************************************************
 * Do$h
 ***********************************************************************************/

/* Add up the team's earned money and give it to the surviving players */
function RewardSurvivingPlayers()
{
	local int PlayerCut;
	local int PlayerCount;
	local KFPlayerController KFPC;
	Local KFTeamInfo_Human T;

	foreach WorldInfo.AllControllers(class'KFPlayerController', KFPC)
	{
		if( KFPC.Pawn != none && KFPC.Pawn.IsAliveAndWell() )
		{
    	 	PlayerCount++;

    	 	// Find the player's team
            if( T == none && KFPC.PlayerReplicationInfo != none && KFPC.PlayerReplicationInfo.Team != none )
    	 	{
                T = KFTeamInfo_Human(KFPC.PlayerReplicationInfo.Team);
            }
		}
	}

    // No dosh to distribute if there is no team or score
    if( T == none || T.Score <= 0 )
    {
        return;
    }

 	PlayerCut = Round(T.Score / PlayerCount);

   if (bLogScoring) LogInternal("SCORING: Team dosh earned this round:" @ T.Score);
   if (bLogScoring) LogInternal("SCORING: Number of surviving players:" @ PlayerCount);
   if (bLogScoring) LogInternal("SCORING: Dosh/survivng player:" @ PlayerCut);

	foreach WorldInfo.AllControllers(class'KFPlayerController', KFPC)
	{
		if( KFPC.Pawn != none && KFPC.Pawn.IsAliveAndWell() )
		{
			KFPlayerReplicationInfo(KFPC.PlayerReplicationInfo).AddDosh(PlayerCut, true);
			T.AddScore( -PlayerCut );

			if (bLogScoring) LogInternal("Player" @ KFPC.PlayerReplicationInfo.PlayerName @ "got" @ PlayerCut @ "for surviving the wave");
		}
	}

	// Reset team score afte the wave ends
	T.AddScore( 0, true );
}

/**
 * @brief Calculates the dosh penalty or minimum dosh spawning amount
 *
 * @param KilledPlayerPRI The killed player's PRI
 * @param bLateJoiner If true, give late joiners money without penalty
 * @return Rounded amount of dosh
 */
function int GetAdjustedDeathPenalty( KFPlayerReplicationInfo KilledPlayerPRI, optional bool bLateJoiner=false )
{
	local float MinimumRespawnDosh, PlayerRespawnDosh;
	local float UsedMaxRespawnDosh;

	//pointless to give respawn money in the last wave
	if( WaveNum >= WaveMax )
	{
		return 0;
	}

	if( GameDifficulty < MaxRespawnDosh.Length )
	{
	   UsedMaxRespawnDosh = MaxRespawnDosh[GameDifficulty];
	}
	else
	{
	   UsedMaxRespawnDosh = MaxRespawnDosh[MaxRespawnDosh.Length - 1];
	}

	MinimumRespawnDosh = Round( UsedMaxRespawnDosh * (float(WaveNum) / float(WaveMax - 1)) );

	if( bLateJoiner )
	{
		return MinimumRespawnDosh;
	}

	if (bLogScoring) LogInternal("SCORING: Player" @ KilledPlayerPRI.PlayerName @ "predicted minimum respawn dosh:" @ MinimumRespawnDosh);
	PlayerRespawnDosh = KilledPlayerPRI.Score - (KilledPlayerPRI.Score * DeathPenaltyModifiers[GameDifficulty]);
	if (bLogScoring) LogInternal("SCORING: Player" @ KilledPlayerPRI.PlayerName @ "current respawn dosh:" @ PlayerRespawnDosh);

	if( MinimumRespawnDosh > PlayerRespawnDosh )
	{
		if (bLogScoring) LogInternal("SCORING: Player" @ KilledPlayerPRI.PlayerName @ "MinimumRespawnDosh > PlayerRespawnDosh, returning MinimumRespawnDosh - KilledPlayerPRI.Score =" @ MinimumRespawnDosh - KilledPlayerPRI.Score);
		return MinimumRespawnDosh - KilledPlayerPRI.Score;
	}

	if (bLogScoring) LogInternal("SCORING: Player" @ KilledPlayerPRI.PlayerName @ "PlayerRespawnDosh > MinimumRespawnDosh, returning KilledPlayerPRI.Score * DeathPenaltyModifiers[GameDifficulty] =" @ -Round( KilledPlayerPRI.Score * DeathPenaltyModifiers[GameDifficulty] ));
	return -Round( KilledPlayerPRI.Score * DeathPenaltyModifiers[GameDifficulty] );
}

/************************************************************************************
 * Wave Mode Cheats
 ***********************************************************************************/
function bool AllowWaveCheats()
{



	return false;

}

exec function ToggleSpawning( optional string ZedTypeString )
{
	if( AllowWaveCheats() && GameReplicationInfo.bMatchHasBegun )
	{
		if( ZedTypeString != "" )
		{
             //OverrideZedSpawnList( ZedTypeString );
		}

		if( GetStateName() == 'DebugSuspendWave' )
		{
			GotoState('PlayingWave');
		}
		else
		{
			GotoState('DebugSuspendWave');
		}
	}
}

exec function EndCurrentWave ( )
{
	if( AllowWaveCheats() )
	{
		DebugKillZeds();
		WaveEnded(WEC_WaveWon);
	}
}

exec function SetWave( byte NewWaveNum )
{
	if( AllowWaveCheats() )
	{
		if( NewWaveNum <= WaveMax )
		{
			WaveNum = NewWaveNum - 1;

			// stop, then restart
			GotoState('DebugSuspendWave');
			GotoState('PlayingWave');
		}
		else
		{
			LogInternal("SetWave: new wave num must be <= "$WaveMax);
		}
	}
}

exec function WinMatch()
{
	if( AllowWaveCheats() )
	{
		WaveNum = SpawnManager.Waves.Length;
		WaveEnded(WEC_WaveWon);
	}
}

/*********************************************************************************************
 * state PlayingWave
 *********************************************************************************************/

/** Returns true if wave gameplay is active */
function bool IsWaveActive();

State PlayingWave
{
	function BeginState( Name PreviousStateName )
	{
		MyKFGRI.SetWaveActive(TRUE, GetGameIntensityForMusic());
		StartWave();

		if ( AllowBalanceLogging() )
		{
			LogPlayersDosh(GBE_WaveStart);
		}
	}

	function bool IsWaveActive()
	{
		return true;
	}
}

/** Starts a new Wave */
function StartWave()
{
	//closes trader on server
	MyKFGRI.CloseTrader();

    SpawnManager.SetupNextWave(WaveNum);

	WaveNum++;
	MyKFGRI.WaveNum = WaveNum;
	NumAISpawnsQueued = 0;
	AIAliveCount = 0;

	if( WorldInfo.NetMode != NM_DedicatedServer && Role == ROLE_Authority )
	{
		MyKFGRI.UpdateHUDWaveCount();
	}

	WaveStarted();

	MyKFGRI.AIRemaining = SpawnManager.WaveTotalAI;
	MyKFGRI.WaveTotalAICount = SpawnManager.WaveTotalAI;

	BroadcastLocalizedMessage(class'KFLocalMessage_Priority', GMT_WaveStart);

    SetupNextTrader();

	ResetAllPickups();

	if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.SetTraderTime( false );

	// first spawn and music are delayed 5 seconds (KFAISpawnManager.TimeUntilNextSpawn == 5 initially), so line up dialog with them;
	// fixes problem of clients not being ready to receive dialog at the instant the match starts;
	SetTimer( 5.f, false, nameof(PlayWaveStartDialog) );
}

/** Overridden to scale the number of active pickups by wave */
function ResetPickups( array<KFPickupFactory> PickupList, int NumPickups )
{
	NumPickups *= (float(WaveNum) / float(WaveMax));

	// make sure to have at least 1 ammo pickup in the level
	if( NumPickups == 0 && PickupList.Length > 0 && KFPickupFactory_Ammo(PickupList[0]) != none )
	{
		NumPickups = 1;
	}

	super.ResetPickups( PickupList, NumPickups );
}

/** Sets NextTrader and re-inits trader list if necessary */
function SetupNextTrader()
{
	local byte NextTraderIndex;

	if( TraderList.Length > 0 )
	{
		NextTraderIndex = DetermineNextTraderIndex();
		if( NextTraderIndex >= 0 && NextTraderIndex < TraderList.Length )
		{
			MyKFGRI.NextTrader = TraderList[ NextTraderIndex ];
			TraderList.Remove( NextTraderIndex, 1 );
		}
	}

	if( TraderList.Length <= 0 )
	{
	 	InitTraderList();
	}
}

/** Picks next trader index and allows for mutator hook */
function byte DetermineNextTraderIndex()
{
	local byte NextTraderIndex;

	NextTraderIndex = Rand( TraderList.Length );


	if( BaseMutator != none )
	{
		BaseMutator.ModifyNextTraderIndex( NextTraderIndex );
	}


	return NextTraderIndex;
}

function WaveStarted()
{
	local array<SequenceObject> AllWaveStartEvents;
	local KFSeqEvent_WaveStart WaveStartEvt;
	local Sequence GameSeq;
	local int i;
	local KFPlayerController KFPC;

	if(WorldInfo.GRI.GameClass.static.AllowAnalyticsLogging()) WorldInfo.TWLogEvent ("wave_start",
				   None,
				   "#"$WaveNum,
				   "#"$GetLivingPlayerCount());

    GameConductor.ResetWaveStats();

	ForEach WorldInfo.AllControllers(class'KFPlayerController', KFPC)
	{
		if( !KFPC.bDemoOwner )
		{
			if(WorldInfo.GRI.GameClass.static.AllowAnalyticsLogging()) WorldInfo.TWLogEvent ("pc_wave_start",
						   KFPC.PlayerReplicationInfo,
						   "#"$WaveNum,
						   KFPC.GetPerk().Class.Name,
						   KFPC.GetPerk().GetLevel(),
						   "#"$KFPC.PlayerReplicationInfo.Score,
						   KFPC.Pawn != none ? KFInventoryManager(KFPC.Pawn.InvManager).DumpInventory() : "",
						   KFPC.GetPerk().DumpPerkLoadout(),
						   KFPC.PlayerReplicationInfo.GetTeamNum()
						  );
		}

		;
	}


	// Get the gameplay sequence.
	GameSeq = WorldInfo.GetGameSequence();

	if( GameSeq != none )
	{
		GameSeq.FindSeqObjectsByClass(class'KFSeqEvent_WaveStart', TRUE, AllWaveStartEvents);

		for( i = 0; i < AllWaveStartEvents.Length; i++ )
		{
			WaveStartEvt = KFSeqEvent_WaveStart(AllWaveStartEvents[i]);

			if( WaveStartEvt != None  )
			{
				WaveStartEvt.Reset();
				WaveStartEvt.CheckActivate(self, self);
			}
		}
	}

	//So the server browser can have our new wave information
	UpdateGameSettings();
}

/** Do something when there are no AIs left */
function CheckWaveEnd( optional bool bForceWaveEnd = false )
{
    if( !MyKFGRI.bMatchHasBegun )
    {
    	return;
    }

    if (SpawnManager.bLogAISpawning) LogInternal("KFGameInfo.CheckWaveEnd() AIAliveCount:" @ AIAliveCount);

    if( GetLivingPlayerCount() <= 0 )
	{
		WaveEnded(WEC_TeamWipedOut);
	}
	else if( (AIAliveCount <= 0 && IsWaveActive() && SpawnManager.IsFinishedSpawning()) || bForceWaveEnd )
	{
		WaveEnded(WEC_WaveWon);
	}
}

/** The wave ended */
function WaveEnded(EWaveEndCondition WinCondition)
{
	local KFPlayerController KFPC;
	local bool bOpeningTrader;

	MyKFGRI.NotifyWaveEnded();
	if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.SetTraderTime( !MyKFGRI.IsFinalWave() );

    if(WorldInfo.GRI.GameClass.static.AllowAnalyticsLogging()) WorldInfo.TWLogEvent ("wave_end", None, "#"$WaveNum, GetEnum(enum'EWaveEndCondition',WinCondition), "#"$GameConductor.CurrentWaveZedVisibleAverageLifeSpan);

	// IsPlayInEditor check was added to fix a scaleform crash that would call an actionscript function
	// as scaleform was being destroyed. This issue only occurs when playing in the editor
	if( WinCondition == WEC_TeamWipedOut && !class'WorldInfo'.static.IsPlayInEditor())
	{
		EndOfMatch(false);
	}
	else if( WinCondition == WEC_WaveWon )
	{
		RewardSurvivingPlayers();
		UpdateWaveEndDialogInfo();

		if( WaveNum < WaveMax )
		{
			GotoState('TraderOpen');
			bOpeningTrader = true;
		}
		else
		{
			EndOfMatch(true);
		}
	}

	ForEach WorldInfo.AllControllers(class'KFPlayerController', KFPC)
	{
		// save online stats
		KFPC.ClientWriteAndFlushStats();

		// submit online player analytics
		LogWaveEndAnalyticsFor(KFPC);

		// submit aar/dialog stats
		KFPC.SubmitPostWaveStats(bOpeningTrader);

		;
	}
}

/** Game Analytics */
function LogWaveEndAnalyticsFor(KFPlayerController KFPC)
{
	local int i;
	local array<WeaponDamage> Weapons;

	if( KFPC.bDemoOwner )
	{
		return;
	}

	if(WorldInfo.GRI.GameClass.static.AllowAnalyticsLogging()) WorldInfo.TWLogEvent ("pc_wave_stats",
				   KFPC.PlayerReplicationInfo,
				   "#"$WaveNum,
				   "#"$KFPC.MatchStats.GetHealGivenInWave(),
				   "#"$KFPC.MatchStats.GetHeadShotsInWave(),
				   "#"$KFPC.MatchStats.GetDoshEarnedInWave(),
				   "#"$KFPC.MatchStats.GetDamageTakenInWave(),
				   "#"$KFPC.MatchStats.GetDamageDealtInWave(),
				   "#"$KFPC.ShotsFired,
				   "#"$KFPC.ShotsHit,
				   "#"$KFPC.ShotsHitHeadshot );

	if(WorldInfo.GRI.GameClass.static.AllowAnalyticsLogging()) WorldInfo.TWLogEvent ("pc_wave_end",
				   KFPC.PlayerReplicationInfo,
				   "#"$WaveNum,
				   KFPC.GetPerk().Class.Name,
				   "#"$KFPC.GetPerk().GetLevel(),
				   "#"$KFPC.PlayerReplicationInfo.Score,
				   "#"$KFPC.PlayerReplicationInfo.Kills,
				   KFInventoryManager(KFPC.Pawn.InvManager).DumpInventory());

	KFPC.MatchStats.GetTopWeapons( 3, Weapons );

	for ( i = 0; i < Weapons.Length; ++i )
	{
		if(WorldInfo.GRI.GameClass.static.AllowAnalyticsLogging()) WorldInfo.TWLogEvent ("pc_weapon_stats",
					   KFPC.PlayerReplicationInfo,
					   "#"$WaveNum,
					   Weapons[i].WeaponDef.Name,
					   "#"$Weapons[i].DamageAmount,
					   "#"$Weapons[i].HeadShots, 
					   "#"$Weapons[i].LargeZedKills );
	}
}

/*********************************************************************************************
 * state TraderOpen
 *********************************************************************************************/

/** Called when TimeBetweenWaves expires */
function CloseTraderTimer();

State TraderOpen
{
	function BeginState( Name PreviousStateName )
	{
		local KFPlayerController KFPC;

		MyKFGRI.SetWaveActive(FALSE, GetGameIntensityForMusic());

		ForEach WorldInfo.AllControllers(class'KFPlayerController', KFPC)
		{
			if( KFPC.GetPerk() != none )
			{
				KFPC.GetPerk().OnWaveEnded();
			}
			KFPC.ApplyPendingPerks();
		}

		// Restart players
		StartHumans();

		MyKFGRI.OpenTrader(TimeBetweenWaves);
		NotifyTraderOpened();

		BroadcastLocalizedMessage(class'KFLocalMessage_Priority', GMT_WaveEnd);

		if ( AllowBalanceLogging() )
		{
			LogPlayersDosh(GBE_TraderOpen);
		}

		SetTimer(TimeBetweenWaves, false, nameof(CloseTraderTimer));
	}

	/** Called when TimeBetweenWaves expires */
	function CloseTraderTimer()
	{
		GotoState('PlayingWave');
	}

	function EndState( Name NextStateName )
	{
		if ( AllowBalanceLogging() )
		{
			LogPlayersInventory();
		}
	}

	/** Special handling for survival/wave mode.  Reduces health to 1 */
	function bool PreventDeath(Pawn KilledPawn, Controller Killer, class<DamageType> DamageType, vector HitLocation)
	{
		// (player-only) Prevent enemy team kills during trader time to fix players
		// missing the respawn and then dying from certain attacks that can do damage
		// just after the last zed dies (e.g. explosives/husk suicide, damage over time)
		if ( KilledPawn.Controller != None && KilledPawn.Controller.bIsPlayer
			&& Killer != None && KilledPawn.GetTeamNum() != Killer.GetTeamNum()
			// @hack: Somehow we can get a suicide where Killer!=Victim?
			&& DamageType != class'DmgType_Suicided' )
		{
			// sanity check - The killer pawn should be dead or are detached by now
			if ( Killer.Pawn == None || !Killer.Pawn.IsAliveAndWell() )
			{
				return true;
			}
		}

		return Global.PreventDeath(KilledPawn, Killer, DamageType, HitLocation);
	}
}

/** Tell Kismet a trader opened */
function NotifyTraderOpened()
{
	local array<SequenceObject> AllTraderOpenedEvents;
	local KFSeqEvent_TraderOpened TraderOpenedEvt;
	local Sequence GameSeq;
	local int i;

	// Get the gameplay sequence.
	GameSeq = WorldInfo.GetGameSequence();

	if( GameSeq != none )
	{
		GameSeq.FindSeqObjectsByClass(class'KFSeqEvent_TraderOpened', TRUE, AllTraderOpenedEvents);

		for( i = 0; i < AllTraderOpenedEvents.Length; i++ )
		{
			TraderOpenedEvt = KFSeqEvent_TraderOpened(AllTraderOpenedEvents[i]);

			if( TraderOpenedEvt != None  )
			{
				TraderOpenedEvt.Reset();
				TraderOpenedEvt.CheckActivate(self, self);
			}
		}
	}
}

 /*********************************************************************************************
 * state MatchEnded
 *********************************************************************************************/

 State MatchEnded
 {
 	function BeginState( Name PreviousStateName )
	{
		MyKFGRI.bMatchHasBegun = false;
		MyKFGRI.bMatchIsOver = true;

		if ( AllowBalanceLogging() )
		{
			LogPlayersKillCount();
		}

		SetTimer(1, false, nameof(ProcessAwards));
		SetTimer(AARDisplayDelay, false, nameof(ShowPostGameMenu));
	}

	event Timer()
	{
		global.Timer();
		if (NumPlayers == 0)
		{
			RestartGame();
		}
	}
 }

function EndOfMatch(bool bVictory)
{
	local KFPlayerController KFPC;

	if(WorldInfo.GRI.GameClass.static.AllowAnalyticsLogging()) WorldInfo.TWLogEvent ("match_end", None, "#"$WaveNum, "#"$(bVictory ? "1" : "0"), "#"$GameConductor.ZedVisibleAverageLifespan);

	if(bVictory)
	{
		SetTimer(EndCinematicDelay, false, nameof(SetWonGameCamera));

		foreach WorldInfo.AllControllers(class'KFPlayerController', KFPC)
		{
			KFPC.ClientWonGame( WorldInfo.GetMapName( true ), GameDifficulty, GameLength,	IsMultiplayerGame() );
		}

		BroadcastLocalizedMessage(class'KFLocalMessage_Priority', GMT_MatchWon);
	}
	else
	{
		BroadcastLocalizedMessage(class'KFLocalMessage_Priority', GMT_MatchLost);
		SetZedsToVictoryState();
	}


	WorldInfo.TWRefreshTweakParams();
	WorldInfo.TWPushLogs();

	GotoState('MatchEnded');
}

//Get Top voted map
function string GetNextMap()
{
	local KFGameReplicationInfo KFGRI;
	local int NextMapIndex;

	KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
	if( KFGRI != none )
	{
		NextMapIndex = KFGRI.VoteCollector.GetNextMap();
	}

	if( NextMapIndex != INDEX_NONE )
	{
		return GameMapCycles[ActiveMapCycle].Maps[NextMapIndex];
	}

	return super.GetNextMap();
}

function SetWonGameCamera()
{
	local KFPlayerController KFPC;

	foreach WorldInfo.AllControllers( class'KFPlayerController', KFPC )
	{
		KFPC.ServerCamera( 'ThirdPerson' );
	}
}

function SetZedsToVictoryState()
{
	local KFAIController KFAIC;

	foreach WorldInfo.AllControllers( class'KFAIController', KFAIC )
	{
		// Have the zeds enter their victory state
		KFAIC.EnterZedVictoryState();
	}
}

function ShowPostGameMenu()
{
	local KFGameReplicationInfo KFGRI;

	bEnableDeadToVOIP=true; //Being dead at this point is irrelevant.  Allow players to talk about AAR -ZG
	KFGRI = KFGameReplicationInfo(WorldInfo.GRI);

	if(KFGRI != none)
	{
		KFGRI.OnOpenAfterActionReport( GetEndOfMatchTime() );
	}

	class'EphemeralMatchStats'.Static.SendMapOptionsAndOpenAARMenu();

	UpdateCurrentMapVoteTime( GetEndOfMatchTime(), true);
}

function float GetEndOfMatchTime()
{
	return MapVoteDuration;
}

function ProcessAwards()
{
	class'EphemeralMatchStats'.Static.ProcessPostGameStats();
}

function UpdateCurrentMapVoteTime(byte NewTime, optional bool bStartTime)
{
	if(WorldInfo.GRI.RemainingTime > NewTime || bStartTime)
	{
		ClearTimer(nameof(RestartGame));
		SetTimer(NewTime, false, nameof(TryRestartGame));
		WorldInfo.GRI.RemainingMinute = NewTime;
		WorldInfo.GRI.RemainingTime  = NewTime;
	}

	//in the case that the server has a 0 for the time we still want to be able to trigger a server travel.
	if(NewTime <= 0 || WorldInfo.GRI.RemainingTime <= 0)
	{
		TryRestartGame();
	}
}

function TryRestartGame()
{
	RestartGame();
}

 /*********************************************************************************************
 * state DebugSuspendWave
 *********************************************************************************************/

 state DebugSuspendWave
 {
 	ignores CheckWaveEnd;

 	function BeginState( Name PreviousStateName )
 	{
 		local PlayerController PC;

 		DebugKillZeds();

 		foreach WorldInfo.AllControllers(class'PlayerController', PC)
		{
 			PC.ClientMessage("Survival: Spawn suspended");
 		}
	}

	function EndState( Name NextStateName )
	{
		local PlayerController PC;

		foreach WorldInfo.AllControllers(class'PlayerController', PC)
		{
 			PC.ClientMessage("Survival: Spawn resumed");
		}
	}
}

/**
 * Invoke the CheatManager function.  For some reason calling
 * ConsoleCommand directly on the GI does not follow through, so
 * as a workaround just find a PC and assume they have cheats on
 */
function DebugKillZeds()
{
	local PlayerController PC;

	if( AllowWaveCheats() )
	{
		foreach WorldInfo.AllControllers(class'PlayerController', PC)
		{
			PC.ConsoleCommand("KillZeds");
			return;
		}
	}
}

defaultproperties
{
   TimeBetweenWaves=60
   EndCinematicDelay=4.000000
   AARDisplayDelay=15.000000
   ObjectiveCheckIntervall=30.000000
   MinAIAlivePercReqForObjStart=0.300000
   bCanPerkAlwaysChange=False
   bEnableGameAnalytics=True
   MaxRespawnDosh(0)=1750.000000
   MaxRespawnDosh(1)=1550.000000
   MaxRespawnDosh(2)=1550.000000
   MaxRespawnDosh(3)=1000.000000
   MaxGameDifficulty=3
   SpawnManagerClasses(0)=Class'KFGame.KFAISpawnManager_Short'
   SpawnManagerClasses(1)=Class'KFGame.KFAISpawnManager_Normal'
   SpawnManagerClasses(2)=Class'KFGame.KFAISpawnManager_Long'
   AIClassList(0)=Class'kfgamecontent.KFPawn_ZedClot_Cyst'
   AIClassList(1)=Class'kfgamecontent.KFPawn_ZedClot_Slasher'
   AIClassList(2)=Class'kfgamecontent.KFPawn_ZedClot_Alpha'
   AIClassList(3)=Class'kfgamecontent.KFPawn_ZedCrawler'
   AIClassList(4)=Class'kfgamecontent.KFPawn_ZedGorefast'
   AIClassList(5)=Class'kfgamecontent.KFPawn_ZedStalker'
   AIClassList(6)=Class'kfgamecontent.KFPawn_ZedScrake'
   AIClassList(7)=Class'kfgamecontent.KFPawn_ZedFleshpound'
   AIClassList(8)=Class'kfgamecontent.KFPawn_ZedBloat'
   AIClassList(9)=Class'kfgamecontent.KFPawn_ZedSiren'
   AIClassList(10)=Class'kfgamecontent.KFPawn_ZedHusk'
   AIBossClassList(0)=Class'kfgamecontent.KFPawn_ZedHans'
   AIBossClassList(1)=Class'kfgamecontent.KFPawn_ZedPatriarch'
   GameplayEventsWriterClass=Class'KFGame.KFGameplayEventsWriter'
   TraderVoiceGroupClass=Class'kfgamecontent.KFTraderVoiceGroup_Default'
   MaxPlayers=6
   GameName="Survival"
   Name="Default__KFGameInfo_Survival"
   ObjectArchetype=KFGameInfo'KFGame.Default__KFGameInfo'
}
