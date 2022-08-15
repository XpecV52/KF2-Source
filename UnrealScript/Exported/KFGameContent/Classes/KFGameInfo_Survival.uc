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







	







	 



		
		
	







 
















 
































































































































































































































#linenumber 70;

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
 * Spawning
 ***********************************************************************************/
/** Available spawn managers (game length) */
var	array< class<KFAISpawnManager> >   	SpawnManagerClasses;

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
	super.StartMatch();
	WaveNum = 0;

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

function bool PlayerCanRestart( PlayerController aPlayer )
{
	return (!IsWaveActive() && MyKFGRI.bMatchHasBegun);
}

function RestartPlayer(Controller NewPlayer)
{
	local KFPlayerController KFPC;
	local KFPlayerReplicationInfo KFPRI;

	KFPC = KFPlayerController(NewPlayer);
	KFPRI = KFPlayerReplicationInfo(NewPlayer.PlayerReplicationInfo);

	if( KFPC != None && KFPRI != None )
	{
		if( IsPlayerReady( KFPRI ) )
		{
			/** If we have rejoined the match more than once, delay our respawn by some amount of time */
			if( MyKFGRI.bMatchHasBegun && KFPRI.NumTimesReconnected > 1 && (WorldInfo.TimeSeconds - KFPRI.LastQuitTime) < ReconnectRespawnTime )
			{
				KFPC.StartSpectate();
				KFPC.SetTimer(ReconnectRespawnTime - (WorldInfo.TimeSeconds - KFPRI.LastQuitTime), false, nameof(KFPC.SpawnReconnectedPlayer));
			}
			//If a wave is active, we spectate until the end of the wave
			else if( IsWaveActive() )
			{
				KFPC.StartSpectate();
			}
			else
			{
				Super.RestartPlayer(NewPlayer);

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

	if(WorldInfo.Game != None && KFGameInfo(WorldInfo.Game).GameplayEventsWriter != None && KFGameInfo(WorldInfo.Game).GameplayEventsWriter.IsSessionInProgress()){KFGameInfo(WorldInfo.Game).GameplayEventsWriter.LogGameIntEvent(class'KFGameplayEventsWriter'.const.GAMEEVENT_MATCH_WON, 1);};
 	CheckWaveEnd( true );
}

function UpdateGameSettings()
{
	local name SessionName;
	local KFOnlineGameSettings KFGameSettings;
	if (WorldInfo.NetMode == NM_DedicatedServer || WorldInfo.NetMode == NM_ListenServer)
	{
		if (GameInterface != None)
		{
			SessionName = PlayerReplicationInfoClass.default.SessionName;
			KFGameSettings = KFOnlineGameSettings(GameInterface.GetGameSettings(SessionName));
			//Ensure bug-for-bug compatibility with KF1
			if (KFGameSettings != None)
			{
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

				//Trigger re-broadcast of game settings
				GameInterface.UpdateOnlineGame(SessionName, KFGameSettings, true);
			}
		}
	}
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
	Local TeamInfo T;

	foreach WorldInfo.AllControllers(class'KFPlayerController', KFPC)
	{
		if( KFPC.Pawn != none && KFPC.Pawn.IsAliveAndWell() )
		{
    	 	PlayerCount++;

    	 	// Find the player's team
            if( T == none && KFPC.PlayerReplicationInfo != none && KFPC.PlayerReplicationInfo.Team != none )
    	 	{
                T = KFPC.PlayerReplicationInfo.Team;
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
			T.Score -= PlayerCut;

			if (bLogScoring) LogInternal("Player" @ KFPC.PlayerReplicationInfo.PlayerName @ "got" @ PlayerCut @ "for surviving the wave");
		}
	}

	// Reset team score afte the wave ends
	T.Score = 0;
}

/** Log All Players on Server with Their Scoere/Dosh */
function LogPlayerScore()
{
	local PlayerController PC;

	foreach WorldInfo.AllControllers(class'PlayerController', PC)
	{
		LogInternal("[QA]" @ GetFuncName() @ "Player Name:" @ PC.PlayerReplicationInfo.PlayerName @ "Dosh" @ PC.PlayerReplicationInfo.Score);
	}
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

	/* __TW_ANALYTICS_ */
	if(WorldInfo.Game != None && KFGameInfo(WorldInfo.Game).GameplayEventsWriter != None && KFGameInfo(WorldInfo.Game).GameplayEventsWriter.IsSessionInProgress()){KFGameInfo(WorldInfo.Game).GameplayEventsWriter.LogGameIntEvent(class'KFGameplayEventsWriter'.const.GAMEEVENT_WAVE_START,WaveNum);};

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

	if( bLogScoring )
	{
		LogInternal("[QA]" @ GetFuncName());
		LogPlayerScore();
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

	ForEach WorldInfo.AllControllers(class'KFPlayerController', KFPC)
	{
		KFPC.ClientWriteAndFlushStats();
	}
	MyKFGRI.NotifyWaveEnded();

	if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.SetTraderTime( !MyKFGRI.IsFinalWave() );

	/* __TW_ANALYTICS_ */
	if(WorldInfo.Game != None && KFGameInfo(WorldInfo.Game).GameplayEventsWriter != None && KFGameInfo(WorldInfo.Game).GameplayEventsWriter.IsSessionInProgress()){KFGameInfo(WorldInfo.Game).GameplayEventsWriter.LogGameIntEvent(class'KFGameplayEventsWriter'.const.GAMEEVENT_WAVE_END,WaveNum);};

	// IsPlayInEditor check was added to fix a scaleform crash that would call an actionscript function
	// as scaleform was being destroyed. This issue only occurs when playing in the editor
	if( WinCondition == WEC_TeamWipedOut && !class'WorldInfo'.static.IsPlayInEditor())
	{
		EndOfMatch(false);
	}

	if( WinCondition == WEC_WaveWon )
	{
		RewardSurvivingPlayers();
		UpdateWaveEndDialogInfo();

		if( WaveNum < WaveMax )
		{
			GotoState('TraderOpen');
		}
		else
		{
			EndOfMatch(true);
		}
	}

	if( bLogScoring )
	{
		LogInternal("[QA]" @ GetFuncName());
		LogPlayerScore();
	}

	if( WorldInfo.NetMode != NM_Standalone )
	{
		ForEach WorldInfo.AllControllers(class'KFPlayerController', KFPC)
		{
			if( KFPC.Role == ROLE_Authority )
			{
				KFPC.ReplicatePWRI();
			}

			if( WinCondition == WEC_WaveWon && !MyKFGRI.IsFinalWave() )
			{
				if( WorldInfo.NetMode != NM_DedicatedServer && KFGameReplicationInfo(WorldInfo.GRI) != none && KFGameReplicationInfo(WorldInfo.GRI).TraderDialogManager != none) KFGameReplicationInfo(WorldInfo.GRI).TraderDialogManager.PlayBeginTraderTimeDialog( KFPC, WorldInfo );
			}
		}
		SetTimer(1, false, nameof(ResetWaveReplicationInfo));
	}
	else
	{
		ForEach WorldInfo.AllControllers(class'KFPlayerController', KFPC)
		{
			KFPC.MatchStats.RecordWaveInfo();
		}
	}

}

function ResetWaveReplicationInfo()
{
	local KFPlayerController KFPC;

	ForEach WorldInfo.AllControllers(class'KFPlayerController', KFPC)
	{
		if( KFPC.Role == ROLE_Authority )
		{
			KFPC.ResetLastWaveInfo();
		}
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
				KFPC.GetPerk().ResetPerk();
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
		if ( KilledPawn.Controller != None && KilledPawn.Controller.bIsPlayer &&
			Killer != None && KilledPawn.GetTeamNum() != Killer.GetTeamNum() )
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
 }

function EndOfMatch(bool bVictory)
{
	local KFPlayerController KFPC;
	
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
		BroadcastLocalizedMessage(class'KFLocalMessage_Priority',GMT_MatchLost);
		SetZedsToVictoryState();
	}

	GotoState('MatchEnded');
}

//Get Top voted map 
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
	foreach WorldInfo.AllControllers(class'KFPlayerController', KFPC)
	{
		KFPC.ServerCamera( 'ThirdPerson' );
	}
}

function SetZedsToVictoryState()
{
	local KFAIController KFAIC;
	foreach WorldInfo.AllControllers(class'KFAIController', KFAIC)
	{
		// Have the zeds enter their victory state
		KFAIC.EnterZedVictoryState();
	}
}

function ShowPostGameMenu()
{
	local KFGameReplicationInfo KFGRI;

	bEnableDeadToDeadVOIP=true; //Being dead at this point is irrelevant.  Allow players to talk about AAR -ZG
	KFGRI = KFGameReplicationInfo(WorldInfo.GRI);

	if(KFGRI != none)
	{
		KFGRI.OnOpenAfterActionReport(MapVoteDuration);
	}

	class'EphemeralMatchStats'.Static.SendMapOptionsAndOpenAARMenu();
	
	UpdateCurrentMapVoteTime(MapVoteDuration, true);
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
		SetTimer(NewTime, false, nameof(RestartGame));	
		WorldInfo.GRI.RemainingMinute = NewTime;
		WorldInfo.GRI.RemainingTime  = NewTime;
	}
	//in the case that the server has a 0 for the time we still want to be able to trigger a server travel.
	if(NewTime <= 0 || WorldInfo.GRI.RemainingTime <= 0)
	{
		RestartGame();
	}
}

 /*********************************************************************************************
 * state DebugSuspendWave
 *********************************************************************************************/

 state DebugSuspendWave
 {
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
   SpawnManagerClasses(0)=Class'KFGame.KFAISpawnManager_Short'
   SpawnManagerClasses(1)=Class'KFGame.KFAISpawnManager_Normal'
   SpawnManagerClasses(2)=Class'KFGame.KFAISpawnManager_Long'
   SpawnManagerClasses(3)=Class'KFGame.KFAISpawnManager_Normal'
   ObjectiveCheckIntervall=30.000000
   MinAIAlivePercReqForObjStart=0.300000
   bCanPerkAlwaysChange=False
   bEnableGameAnalytics=True
   MaxRespawnDosh(0)=1750.000000
   MaxRespawnDosh(1)=1550.000000
   MaxRespawnDosh(2)=1550.000000
   MaxRespawnDosh(3)=1000.000000
   AIClassList(0)=Class'KFGameContent.KFPawn_ZedClot_Cyst'
   AIClassList(1)=Class'KFGameContent.KFPawn_ZedClot_Slasher'
   AIClassList(2)=Class'KFGameContent.KFPawn_ZedClot_Alpha'
   AIClassList(3)=Class'KFGameContent.KFPawn_ZedCrawler'
   AIClassList(4)=Class'KFGameContent.KFPawn_ZedGorefast'
   AIClassList(5)=Class'KFGameContent.KFPawn_ZedStalker'
   AIClassList(6)=Class'KFGameContent.KFPawn_ZedScrake'
   AIClassList(7)=Class'KFGameContent.KFPawn_ZedFleshpound'
   AIClassList(8)=Class'KFGameContent.KFPawn_ZedBloat'
   AIClassList(9)=Class'KFGameContent.KFPawn_ZedSiren'
   AIClassList(10)=Class'KFGameContent.KFPawn_ZedHusk'
   AIBossClassList(0)=Class'KFGameContent.KFPawn_ZedHans'
   GameplayEventsWriterClass=Class'KFGame.KFGameplayEventsWriter'
   TraderVoiceGroupClass=Class'KFGameContent.KFTraderVoiceGroup_Default'
   GameName="Survival"
   Name="Default__KFGameInfo_Survival"
   ObjectArchetype=KFGameInfo'KFGame.Default__KFGameInfo'
}
