//=============================================================================
// KFGameInfo
//=============================================================================
// Base GameInfo for KFGame
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFGameInfo extends FrameworkGame
	native;








	







	 
		
		
	 






 


 
































































































































































































































#linenumber 52;

#linenumber 14;






































	














#linenumber 16;


/** Scoring */
var const int POINTS_FOR_BOSS_KILL;
var const int POINTS_FOR_WAVE_COMPLETION;
var const int POINTS_PENALTY_FOR_DEATH;

struct native sGameMode
{
	var string FriendlyName;
	var string ClassNameAndPath;
	var bool bSoloPlaySupported;
	var int DifficultyLevels;
	var int Lengths;
	var int LocalizeID; // This corresponds to an element in the localized ModeStrings array in KFCommon_LocalizedStrings
};

var KFGameReplicationInfo   			MyKFGRI;

/************************************************************************************
 * @name		Customization
 ***********************************************************************************/

var class<KFPawn_Customization> CustomizationPawnClass;

/************************************************************************************
 * @name		Team Settings
 ***********************************************************************************/

var	globalconfig	float				FriendlyFireScale;			// scale friendly fire damage by this value
var					KFTeamInfo_Human	Teams[2];

/** True if there was only one active player pawn at last respawn time */
var 	bool 	bOnePlayerAtStart;

/** The number of human deaths this match */
var 	int 	HumanDeaths;

/************************************************************************************
 * @name		User Interface
 ***********************************************************************************/

var class<KFGFxMoviePlayer_Manager>	KFGFxManagerClass;

var	bool							bStartFinalCount;

/************************************************************************************
 * @name		Game Config
 ***********************************************************************************/
var	globalconfig	int				GameLength;					// EGameLength
var	config			int				MinNetPlayers;
var config			bool    		bWaitForNetPlayers;     	// wait until more than MinNetPlayers players have joined before starting match
var	config			int				ReadyUpDelay;
var	config			int				GameStartDelay;				// The default amount of time before the match begins
var config 			int				EndOfGameDelay;				// time between maps
var config 			array<sGameMode>GameModes;					// Gamemode definitions, used by menus/filters
var globalconfig 	bool			bDisableKickVote;			// If set, players will be able to vote to kick a person out(if they get VoteKickPercentage of players to vote to kick the same person)
var	globalconfig	float			KickVotePercentage;			// Percentage of players that must vote to kick a person before they are kicked
var globalconfig 	float 			TimeBetweenFailedVotes;		// How much time must pass after a failed vote before another one can be initiated
var	globalconfig	bool			bDisablePublicTextChat;		// Whether or not this server allows Public Text Chat
var	globalconfig	bool			bDisableVOIP;				// Whether or not this server allows VOIP
var	globalconfig	bool			bPartitionSpectators;		// Whether or not Spectators are limited to only Text and VOIP Chatting with other spectators
var	globalconfig	bool			bDisablePickups;			// Whether or not this server allows pickups
var globalconfig 	bool			bDisableMapVote;			// Turn off map voting
var globalconfig	float			MapVotePercentage;			// Percentage of players that must vote for this map
var globalconfig	float			MapVoteDuration;			// time till the map vote ends

var globalconfig 	string 			ServerMOTD;			// Message of the day to be displayed on the server welcome screen
var globalconfig 	Color      		ServerMOTDColor;        // The color of the server MOTD text (set in the form ServerMOTDColor=(R=0,G=0,B=0)
var globalconfig 	string 			BannerLink;			// The url to the banner to be loaded from the magical internet
var globalconfig 	string 			WebsiteLink;		// The url to the clan website
var globalconfig 	Color     	 	WebLinkColor;           // The color of the web link text (set in the form WebLinkColor=(R=0,G=0,B=0)
var globalconfig 	string 			ClanMotto;			// The server's motto of the day
var globalconfig 	Color      		ClanMottoColor;         // The color of the clan motto text (set in the form ClanMottoColor=(R=0,G=0,B=0)

/** If set, ignore blocking collision of teammates */
var globalconfig 	bool			bDisableTeamCollision;

var globalconfig bool 				bEnableDeadToVOIP;
var globalconfig bool 				bDisablePublicVOIPChannel;

/** The time a server should stay up when empty before it dies if no one joins. Used for console dedicated servers only */
var const config float ServerExpirationForKillWhenEmpty;

/************************************************************************************
 * @name		Game Settings
 ***********************************************************************************/
 /** If true we can change our perks at any point in this game mode */
 var const bool bCanPerkAlwaysChange;

/** The time it takes to respawn when we have reconnected to the same server multiple times */
var const int 	ReconnectRespawnTime;

var private const float XPMultiplier;

/************************************************************************************
 * @name		Game Difficulty
 ***********************************************************************************/

/** Difficulty settings are accessible through the DifficultyInfo */
var KFDifficultyInfo 		DifficultyInfo;
/** Archetype(Template) for editor exposed settings */
var KFDifficultyInfo 		DifficultyTemplate;

/** Trader */
var array<KFTraderTrigger>	TraderList;

/** Pickups */
var	array<KFPickupFactory>	ItemPickups;
var	array<KFPickupFactory>	AmmoPickups;

/** Keep track off all pickup factories so we don't have to use all actors */
var array<KFPickupFactory> 	AllPickupFactories;

/** The max number of pickups we can have on this difficulty mode and map */
var byte					NumWeaponPickups;
var byte					NumAmmoPickups;

/** Dosh Penalty for dying mid wave */
var array<float>			DeathPenaltyModifiers;

/** Dosh Penalty for dying mid wave by difficulty*/
var array<float>			MaxRespawnDosh;
const 						TeamDeathPenaltyPerc	= 0.05f;

/** Maximum value (aka NumDifficulties - 1) for the GameDifficulty */
var int 					MaxGameDifficulty;

/************************************************************************************
 * @name		Game Length
 ***********************************************************************************/

enum EGameLength
{
	GL_Short,
	GL_Normal,
	GL_Long,
};

/** Amount to scale dosh reward based on game length */
var array<float>    GameLengthDoshScale;

/** Available spawn managers (game length) */
var	array< class<KFAISpawnManager> >   	SpawnManagerClasses;

/************************************************************************************
 * @name		Game balance
 ***********************************************************************************/

/** Game conductor which dynamically manages the difficulty and fun of the game */
var KFGameConductor						GameConductor;

/** The class of GameConductor to use for this gametype */
var	class<KFGameConductor>              GameConductorClass;

/************************************************************************************
 * @name		AI
 ***********************************************************************************/
/** Active AI Manager */
var KFAIDirector						AIDirector;
/** Keeps track of healthy AI*/
var int									AIAliveCount;
/** Counter for keeping track of AI spawned */
var	int									NumAISpawnsQueued;

/** Active spawn manager - None if N/A to this game type */
var	KFAISpawnManager					SpawnManager;

/** Content class references loaded by this game type */
var	protected const array< class<KFPawn_Monster> >	AIClassList;
var	protected const array< class<KFPawn_Monster> >	AIBossClassList;

/************************************************************************************
 * @name		ZEDTime - slomo system
 ***********************************************************************************/

/** What percentage of normal game speed to slow down the game during ZedTime */
var()	float   ZedTimeSlomoScale;
/** How long to blend out zed time dilation for */
var()	float	ZedTimeBlendOutTime;

/** Time left in zed time */
var		float	ZedTimeRemaining;
/** True if zed time blend out has already started */
var		bool    bZedTimeBlendingOut;
/** Number of Zed Time extensions used(Chaining effect for killing other Zeds while Zed Time is active) */
var		int     ZedTimeExtensionsUsed;
/** The last time we had a Zed Time event */
var     float   LastZedTimeEvent;

/************************************************************************************
 * @name		Event Tracking (aka Analytics)
 ***********************************************************************************/

var config		 	bool	bEnableGameAnalytics;
var config			bool	bRecordGameStatsFile;

var	class<KFGameplayEventsWriter>	GameplayEventsWriterClass;
var	transient		KFGameplayEventsWriter	GameplayEventsWriter;

/************************************************************************************
 * @name		Map rotation
 ***********************************************************************************/

/** Whether we should use a Map Cycle List or just continuously reload the same map */
var	globalconfig	bool			bUseMapList;
/** Game Map Cycles, there is a map cycle per game mode */
struct native GameMapCycle
{
	var array<string>	Maps;
//	var array<int>		RoundLimits;
};
var globalconfig array<GameMapCycle>	GameMapCycles;
/** The currently active GameMapCycle */
var	globalconfig int					ActiveMapCycle;
/** index of current map in the cycle */
var globalconfig int 					MapCycleIndex;

/** Maps that are valid for this game mode. If the array is empty, all are valid */
var config array<string>                InValidMaps;

/************************************************************************************
 * @name		Dialog
 ***********************************************************************************/
var KFDialogManager 					DialogManager;
var class<KFDialogManager>           	DialogManagerClass;

var class<KFTraderVoiceGroupBase>		TraderVoiceGroupClass;

/************************************************************************************
 * @name		Music
 ***********************************************************************************/
/** Delay between start of "action" phase and action music */
var float 						ActionMusicDelay;

enum EForcedMusicType
{
	EFM_MainMenu,
	EFM_Credits,
	EFM_Boss1,
	EFM_Boss2,
	EFM_Boss3
};

/** Tracks that are not selected randomly but rather "forced" by the server (or standalone client) at specific times */
var array< KFMusicTrackInfo >	ForcedMusicTracks;

/************************************************************************************
 * @name		Debugging
 ***********************************************************************************/
var	config	bool	bLogScoring;
var	config	bool	bLogAIDefaults;
var         bool    bLogReservations;
var			bool	bLogAnalytics;
//var config  bool    bLogGameBalance;
var config 	bool 	bLogAICount;

/** The number of players the game thinks are alive when ForceLivingPlayerCount is called */
var const byte ForcedNumLivingPlayers;

/** Event names for game balance logging */
const GBE_Inventory = 'Inventory';
const GBE_TraderOpen = 'TraderOpen';
const GBE_WaveStart = 'WaveStart';
const GBE_Buy = 'Buy';
const GBE_Sell = 'Sell';
const GBE_Pickup = 'Pickup';
const GBE_Respawn = 'Respawn';
const GBE_Kills = 'Kills';
const GBE_Deaths = 'Deaths';

/************************************************************************************
 * @name		Reservations
 ***********************************************************************************/
 struct PlayerReservation
 {
	var UniqueNetId PlayerId;
	var int Timer;
 };

var transient array<PlayerReservation> PlayerReservations;
var int ReservationTimeout;

/************************************************************************************
 * @name		Server type
 ***********************************************************************************/
 /** Whether the current game is a custom game (as opposed to standard) */
var bool	bIsCustomGame;
/** Whether the current game is unranked (as opposed to, you guessed it, ranked) */
var bool	bIsUnrankedGame;

/** Whether we should check if this server is out of date and shut it down. Set in native PreBeginPlay */
var const bool bEnableServerVersionCheck;
/** Time since we last checked for updates */
var const float LastUpToDateCheckTime;

/** Tickble object to manage UpToDate webapi */
var transient KFSteamWebUpToDateCheck UpToDateChecker;

/** If this is a versus game */
var bool bIsVersusGame;

// NVCHANGE_BEGIN - RLS - Debugging Effects
/************************************************************************************
 * @name		NVIDIA
 ***********************************************************************************/
 /** Debug dramatic kills. */
var bool	bNVAlwaysDramatic;
var bool	bNVBlockDramatic; // rls - has priority
var bool	bNVAlwaysHeadshot;
var bool	bNVDebugDamage;
// NVCHANGE_END - RLS - Debugging Effects

/************************************************************************************
 * @name		Native
 ***********************************************************************************/

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

// Returns num of alive AI
native function int GetMonsterAliveCount();
// Returns num of living human team members
native function int GetLivingPlayerCount();
// Force the game to think we have this many players alive
native function ForceLivingPlayerCount( byte NewPlayerNum );
// Set the num of alive AI (after a spawn ect)
native function RefreshMonsterAliveCount();
// Returns the AIDirector
native function KFAIDirector GetAIDirector();
// Skip a single map that is not allowed in the current server settings.
native function bool IsMapAllowedInCycle(string MapName);
// Returns if the server was just restarted
native function bool MapCycleNeedsInit();
// Sets game to ranked/unranked
native function SetGameUnranked( bool bUnranked );

/************************************************************************************
 * @name		Static functions
 ***********************************************************************************/

/**
  * Allows overriding of which gameinfo class to use.
  * Called on the DefaultGameType from the ini, or the one specified on the command line (?game=xxx)
  */
static event class<GameInfo> SetGameType(string MapName, string Options, string Portal)
{
	local string ThisMapPrefix;
	local int i;
	local class<GameInfo> NewGameType;
	local string GameOption;

	// if we're in the menu level, use the menu gametype
	if ( class'WorldInfo'.static.IsMenuLevel(MapName) )
	{
		return class'KFGameInfo_Entry';
	}

	// allow commandline to override game type setting
	GameOption = ParseOption( Options, "Game");
	if ( GameOption != "" )
	{
		return Default.class;
	}

	// strip the UEDPIE_ from the filename, if it exists (meaning this is a Play in Editor game)
	MapName = StripPlayOnPrefix( MapName );
	ThisMapPrefix = left(MapName, InStr(MapName,"-"));

	// change game type
	for ( i=0; i < Default.DefaultMapPrefixes.Length; i++ )
	{
		if ( Default.DefaultMapPrefixes[i].Prefix ~= ThisMapPrefix )
		{
			NewGameType = class<GameInfo>(DynamicLoadObject(Default.DefaultMapPrefixes[i].GameType,class'Class'));
			if ( NewGameType != None )
			{
				return NewGameType;
			}
		}
	}
	for ( i = 0; i < Default.CustomMapPrefixes.Length; i++ )
	{
		if ( Default.CustomMapPrefixes[i].Prefix ~= ThisMapPrefix )
		{
			NewGameType = class<GameInfo>(DynamicLoadObject(Default.CustomMapPrefixes[i].GameType,class'Class'));
			if ( NewGameType != None )
			{
				return NewGameType;
			}
		}
	}

	return Default.class;
}

/**
 * Strips the "play on X" prefixes added to autosaved maps.
 */
static function string StripPlayOnPrefix( String MapName )
{
	if (Left(MapName, 6) ~= "UEDPIE")
	{
		return Right(MapName, Len(MapName) - 6);
	}
	else if ( Left(MapName, 5) ~= "UEDPC" )
	{
		return Right(MapName, Len(MapName) - 5);
	}
	else if (Left(MapName, 6) ~= "UEDPS3")
	{
		return Right(MapName, Len(MapName) - 6);
	}
	else if (Left(MapName, 6) ~= "UED360")
	{
		return Right(MapName, Len(MapName) - 6);
	}
	else if (Left(MapName, 6) ~= "UEDIOS")
	{
		return Right(MapName, Len(MapName) - 6);
	}

	return MapName;
}

/**
 * DLO (by string) content classes specific to this game type
 * - Use when direct ref loading is not possible (e.g. unused GameInfo is loaded)
 * - Class refs can be cached using the supplied GRI
 */
static function PreloadContentClasses(KFGameReplicationInfo GRI);

/** Various functions used by UI when setting game mode */
static function string GetGameModeFriendlyNameFromNum( int GameModeNum )
{
	return default.GameModes[Max(GameModeNum, 0)].FriendlyName;
}
static function string GetGameModeFriendlyNameFromClass( string GameModeClassString )
{
	return default.GameModes[Max(default.GameModes.Find('ClassNameAndPath', GameModeClassString), 0)].FriendlyName;
}
static function int GetGameModeNumFromClass( string GameModeClassString )
{
	return default.GameModes.Find('ClassNameAndPath', GameModeClassString);
}
static function string GetGameModeClassFromNum( int GameModeNum )
{
	return default.GameModes[Max(GameModeNum, 0)].ClassNameAndPath;
}
static function int GetLocalizeIDFromFriendlyName( string FriendlyNameString )
{
	return default.GameModes[Max( default.GameModes.Find('FriendlyName', FriendlyNameString), 0 )].LocalizeID;
}
static function bool IsGameModeSoloPlayAllowed( int GameModeNum )
{
	return default.GameModes[GameModeNum].bSoloPlaySupported;
}

/**
 * @brief Marks the game as running an out-of-date version of the engine or workshop content. Designed to be callable on default object
 */
native function SetNeedsRestart();

/**
 * @brief Marks the game as needing to reload the map. If no one is playing, will reload the map immediately, otherwise will do nothing because the map
 *        will reload when the player win/lose/all leave
 */
native function SetNeedsReload();

native static function StaticSetNeedsRestart();

/************************************************************************************
 * @name		InitGame
 ***********************************************************************************/

 /* Initialize the game.
 The GameInfo's InitGame() function is called before any other scripts (including
 PreBeginPlay() ), and is used by the GameInfo to initialize parameters and spawn
 its helper classes.
 Warning: this is called before actors' PreBeginPlay.
*/
event InitGame( string Options, out string ErrorMessage )
{
 	Super.InitGame( Options, ErrorMessage );

	GameLength = Clamp(GetIntOption( Options, "GameLength", GameLength ), 0, SpawnManagerClasses.Length - 1);
	GameDifficulty = Clamp(GameDifficulty, 0, MaxGameDifficulty);

	if( OnlineSub != none )
	{
		OnlineSub.GetLobbyInterface().LobbyJoinGame();
	}

	if( Role == ROLE_Authority )
	{
		if( DialogManagerClass != None )
		{
			DialogManager = Spawn(DialogManagerClass);
		}
	}

	if ( MapCycleNeedsInit() )
	{
		MapCycleIndex = INDEX_NONE;
		SaveConfig();
	}

	bIsCustomGame = CheckForCustomSettings();
	GameStartDelay = Clamp( GetIntOption( Options, "GameStartDelay", GameStartDelay ), 0, 60 );
	ReadyUpDelay = Clamp( GetIntOption( Options, "ReadyUpDelay", ReadyUpDelay ), 0, 300 );
	EndOfGameDelay = Clamp( GetIntOption( Options, "EndOfGameDelay", EndOfGameDelay ), 0, 120 );
	FriendlyFireScale = FClamp( GetFloatOption( Options, "FriendlyFireScale", FriendlyFireScale ), 0, 1.f );

	// BWJ - 4-11-16 - Dedicated server builds for console kill themselves after x seconds if empty. Important for playfab
	if( WorldInfo.IsPlayfabServer() )
	{
		SetTimer( ServerExpirationForKillWhenEmpty, true, nameof(CheckPopulation) );
	}
}

/**
 * @brief Get's a floatfrom the config if available (Nobody tried to grab a float option yet? Only int?)
  *
 * @param Options Passed in optiions
 * @param ParseString The variable we are looking for
 * @param CurrentValue the current value
 * @return float value of the option we are looking for
 */
static function float GetFloatOption( string Options, string ParseString, float CurrentValue )
{
	local string InOpt;

	InOpt = ParseOption( Options, ParseString );
	if ( InOpt != "" )
	{
		return float(InOpt);
	}

	return CurrentValue;
}

/**
 * @brief Checks if certain config settings have been changed or modified that make
 * 		  this a custom server
  * @return true if custom
 */
protected native function bool CheckForCustomSettings();

event PreBeginPlay()
{
	WorldInfo.TWApplyTweaks();

	super.PreBeginPlay();

	DifficultyInfo = new(self) class'KFDifficultyInfo'(DifficultyTemplate);
	DifficultyInfo.SetDifficultySettings( GameDifficulty );

	MyKFGRI = KFGameReplicationInfo(GameReplicationInfo);
	InitGRIVariables();

    CreateTeam(0);
    InitGameConductor();
    InitAIDirector();
	InitTraderList();
	ReplicateWelcomeScreen();

	WorldInfo.TWLogsInit();
}

event PostBeginPlay()
{
	InitAllPickups();
	InitGameplayEventWriter();
	super.PostBeginPlay();
}

// Creates the GamePlayEventWriter and begins logging all expected information
function InitGameplayEventWriter()
{
	if( bRecordGameStatsFile && GameplayEventsWriterClass != None )
	{
		LogInternal("Recording game events with"@GameplayEventsWriterClass);
    	GameplayEventsWriter = new(self) GameplayEventsWriterClass;
	}
	else
	{
	  LogInternal("Gameplay events will not be recorded.");
	}
}

function ReplicateWelcomeScreen()
{
	local WorldInfo WI;

	WI = class'WorldInfo'.static.GetWorldInfo();

	if(WI.NetMode != NM_DedicatedServer)
	{
		return;
	}

	if(MyKFGRI != none)
	{
		MyKFGRI.ServerAdInfo.BannerLink = BannerLink;
		MyKFGRI.ServerAdInfo.ServerMOTD = ServerMOTD;
		MyKFGRI.ServerAdInfo.WebsiteLink= WebsiteLink;
	}
}

//
// Accept or reject a player on the server.
// Fails login if you set the Error to a non-empty string.
// NOTE: UniqueId should not be trusted at this stage, it requires authentication
//
// TWI: Overriden from GameInfo.uc so we can use a custom ErrorMessage for bans -MattF
event PreLogin(string Options, string Address, const UniqueNetId UniqueId, bool bSupportsAuth, out string ErrorMessage)
{
	local bool bSpectator;
	local bool bPerfTesting;

	// Check for an arbitrated match in progress and kick if needed
	if (WorldInfo.NetMode != NM_Standalone && bUsingArbitration && bHasArbitratedHandshakeBegun)
	{
		ErrorMessage = PathName(WorldInfo.Game.GameMessageClass) $ ".ArbitrationMessage";
		return;
	}

	// If this player is banned, reject him
	if (AccessControl != none && AccessControl.IsIDBanned(UniqueId))
	{
		LogInternal(Address@"is banned, rejecting...");
		ErrorMessage = "<Strings:KFGame.KFLocalMessage.BannedFromServerString>";
		return;
	}


	bPerfTesting = ( ParseOption( Options, "AutomatedPerfTesting" ) ~= "1" );
	bSpectator = bPerfTesting || ( ParseOption( Options, "SpectatorOnly" ) ~= "1" ) || ( ParseOption( Options, "CauseEvent" ) ~= "FlyThrough" );

	if (AccessControl != None)
	{
		AccessControl.PreLogin(Options, Address, UniqueId, bSupportsAuth, ErrorMessage, bSpectator);
	}
}

event PostLogin( PlayerController NewPlayer )
{
 	local KFPlayerController KFPC;
	local int OldNumSpectators;

	OldNumSpectators = NumSpectators;

 	super.PostLogin( NewPlayer );

	//We need to keep number of spectators as absolutely up-to-date as possible for the server browser
	if (OldNumSpectators != NumSpectators)
	{
		UpdateGameSettings();
	}

 	KFPC = KFPlayerController(NewPlayer);
	if( KFPC != None )
	{
		if( KFPC.PlayerReplicationInfo.bOnlySpectator )
		{
			// if we're initially spectating, initialize front-end but skip lobby menu
			KFPC.ClientSetFrontEnd( KFGFxManagerClass, true );
		}
		else if( KFPC.GetTeamNum() == 255 )
		{
			// if we're initially spectating, initialize front-end but skip lobby menu
		 	if( !class'Engine'.static.IsEditor() && !class'KFGameEngine'.static.CheckSkipLobby() )
		 	{
		 		KFPC.CreateCustomizationPawn();
			}
			if( KFPC.Pawn != none && KFPawn_Customization(KFPC.Pawn) != none )
			{
				KFPawn_Customization(KFPC.Pawn).SetServerHidden( true );
			}
			KFPC.ClientSetFrontEnd( KFGFxManagerClass, false );
			KFPC.SetCameraMode( 'PlayerZedWaiting' );
		}
		else
		{
			KFPC.ClientSetFrontEnd( KFGFxManagerClass, false );

			// Only create customization pawns for a real game
		 	if( !class'Engine'.static.IsEditor() && !class'KFGameEngine'.static.CheckSkipLobby() )
		 	{
		 		KFPC.CreateCustomizationPawn();
			}
		}
	}
}

function Logout( Controller Exiting )
{
	local int OldNumSpectators;

	OldNumSpectators = NumSpectators;

	Super.Logout( Exiting );

	if( OldNumSpectators != NumSpectators )
	{
		UpdateGameSettings();
	}

	if( WorldInfo.IsPlayfabServer() )
	{
		if( PlayerController(Exiting) != none )
		{
			// Check the current population to see if we need to shut down the next frame
			SetTimer( 0.01, false, nameof(CheckPopulation) );

			// Notify playfab that a player has left
			if( Exiting.PlayerReplicationInfo != None && Exiting.PlayerReplicationInfo.PlayfabPlayerId != "" )
			{
				class'GameEngine'.static.GetPlayfabInterface().ServerNotifyPlayerLeft( Exiting.PlayerReplicationInfo.PlayfabPlayerId );
			}
		}
	}
}

/* ProcessServerTravel()
 Optional handling of ServerTravel for network games.
*/
function ProcessServerTravel(string URL, optional bool bAbsolute)
{
	super.ProcessServerTravel( URL, bAbsolute );

	// Set the last travel time in our persistent game data
    class'KFMapTravelData'.static.SetLastTravelTime( WorldInfo.RealTimeSeconds );
    class'KFMapTravelData'.static.SetLastGameMap( WorldInfo.GetMapName(true) );

	//@HSL_BEGIN - JRO - 4/28/2016 - Recreate the session after each match
	LogInternal("SESSIONS - Clearing ConsoleGameSessionGuid for a new map"@URL);
	KFGameEngine(Class'Engine'.static.GetEngine()).ConsoleGameSessionGuid = "";
	//@HSL_END
}

function CheckPopulation()
{
	local bool bNeedsShutdown;
	local int i;

	if( WorldInfo.IsPlayfabServer() )
	{
		bNeedsShutdown = true;

		for( i = 0; i < GameReplicationInfo.PRIArray.Length; i++ )
		{
			if( !GameReplicationInfo.PRIArray[i].bBot )
			{
				bNeedsShutdown = false;
				break;
			}
		}
	}

	if( bNeedsShutdown )
	{
		LogInternal("Server needs shutdown! Exiting now");
		ConsoleCommand("Exit");
	}
}


event InitAIDirector()
{
	AIDirector = new(self) class'KFAIDirector';
	AIDirector.Initialize();
}

/* Initialize the Game Conductor */
function InitGameConductor()
{
	GameConductor = new(self) GameConductorClass;
	GameConductor.Initialize();
}

/* Initialize the GRI varaibles */
function InitGRIVariables()
{
	MyKFGRI.GameDifficulty 	= GameDifficulty;
	MyKFGRI.GameLength 		= GameLength;
	MyKFGRI.bVersusGame = bIsVersusGame;
}

/**
 * AllowCheats - Allow cheating in single player games and coop games.
 */
function bool AllowCheats(PlayerController P)
{



	return false; // see KFPlayerController.EnableCheats

}

/** Adds all available traders to the list */
function InitTraderList()
{
	local KFTraderTrigger MyTrader;

	TraderList.Remove(0, TraderList.Length);
	foreach DynamicActors(class'KFTraderTrigger', MyTrader)
	{
		TraderList.AddItem(MyTrader);
	}
}

/** Sets the number of possible pickups on this difficulty and activates that many around the map */
function InitAllPickups()
{
	if(bDisablePickups)
	{
		NumWeaponPickups = 0;
		NumAmmoPickups = 0;
	}
	else
	{
		NumWeaponPickups = ItemPickups.Length * DifficultyInfo.GetItemPickupModifier();
		NumAmmoPickups = AmmoPickups.Length * DifficultyInfo.GetAmmoPickupModifier();
	}


	if( BaseMutator != none )
	{
		BaseMutator.ModifyPickupFactories();
	}


	ResetAllPickups();
}

/** Called to reset all the types of pickups */
function ResetAllPickups()
{
    local int i;

	AllPickupFactories.Remove( 0, AllPickupFactories.Length );
	// Add all the item pickups
 	for ( i = 0; i < ItemPickups.Length; i++ )
 	{
 	 	AllPickupFactories.AddItem( ItemPickups[i] );
 	}
	// Add all the ammo pickups
 	for ( i = 0; i < AmmoPickups.Length; i++ )
 	{
 	 	AllPickupFactories.AddItem( AmmoPickups[i] );
 	}

	ResetPickups( ItemPickups, NumWeaponPickups );
	ResetPickups( AmmoPickups, NumAmmoPickups );
}

/** Pick random pickup items to enable and put all others to sleep */
function ResetPickups( array<KFPickupFactory> PickupList, int NumPickups )
{
 	local byte i, ChosenIndex;
 	local array<KFPickupFactory>	PossiblePickups;

    PossiblePickups = PickupList;
 	for ( i = 0; i < NumPickups; i++ )
 	{
 		ChosenIndex = Rand( PossiblePickups.Length );
 		PossiblePickups[ChosenIndex].Reset();
        PossiblePickups.Remove( ChosenIndex, 1 );
 	}

	// Put any pickup factories that weren't enabled to sleep
 	for ( i = 0; i < PossiblePickups.Length; i++ )
 	{
 	 	PossiblePickups[i].StartSleeping();
 	}
}

/** Find a new item pickup factory to enable after a certain amount of time */
function EnableNewPickup( array<KFPickupFactory> PickupList, float RespawnDelay, KFPickupFactory LastPickup )
{
	local KFPickupFactory ActiveFactory;

	ActiveFactory = DetermineNextPickup( PickupList, LastPickup );


	if( BaseMutator != none )
	{
		BaseMutator.ModifyActivatedPickupFactory( ActiveFactory, RespawnDelay );
	}


	ActivateNextPickup( ActiveFactory, RespawnDelay );

	LastPickup.StartSleeping();
}

/** Pick a new factory from provided list */
function KFPickupFactory DetermineNextPickup( array<KFPickupFactory> PickupList, KFPickupFactory LastPickup )
{
	local byte i;
	local array<KFPickupFactory> PossibleFactories;

	for ( i = 0; i < PickupList.length; i++ )
	{
	 	if ( PickupList[i] != LastPickup && PickupList[i].IsInState('Sleeping') && !PickupList[i].bToBeActivated )
	 	{
	 		PossibleFactories.AddItem( PickupList[i] );
	 	}
	}

  	if ( PossibleFactories.Length > 0 )
	{
		return PossibleFactories[ Rand( PossibleFactories.Length ) ];
	}
	else
	{
	    return LastPickup;
	}
}

/** Activate selected pickup factory */
function ActivateNextPickup( KFPickupFactory NextFactory, int RespawnDelay )
{
	if( NextFactory != none )
	{
		NextFactory.bToBeActivated = true;
		NextFactory.SetTimer( RespawnDelay, , nameof(NextFactory.Reset) );
	}
}

/************************************************************************************
 * @name		Spawning
 ***********************************************************************************/

/** This is called when the generic customization points have been streamed in */
function CustomizationPointsInitialized()
{
	local KFPlayerController KFPC;
	local KFPawn_Customization KFPCustom;

	foreach LocalPlayerControllers(class'KFPlayerController', KFPC)
	{
		if ( KFPC.Pawn != none )
		{
            KFPCustom = KFPawn_Customization( KFPC.Pawn );
            if ( KFPCustom != none && !KFPCustom.bUsingCustomizationPoint )
            {
		     	KFPCustom.MoveToCustomizationPoint();
	     	}
     	}
	}
}

/** Overridden to set bNoCollisionFail in spawn to true */
function Pawn SpawnDefaultPawnFor(Controller NewPlayer, NavigationPoint StartSpot)
{
	local class<Pawn> DefaultPlayerClass;
	local Rotator StartRotation;
	local Pawn ResultPawn;

	DefaultPlayerClass = GetDefaultPlayerClass(NewPlayer);

	// don't allow pawn to be spawned with any pitch or roll
	StartRotation.Yaw = StartSpot.Rotation.Yaw;

	ResultPawn = Spawn(DefaultPlayerClass,,,StartSpot.Location,StartRotation,,true);
	if ( ResultPawn == None )
	{
		LogInternal("Couldn't spawn player of type "$DefaultPlayerClass$" at "$StartSpot);
	}
	return ResultPawn;
}

/** Exists to create a customization pawn rather than the default pawn */
function KFPawn SpawnCustomizationPawn( NavigationPoint StartSpot )
{
	local Rotator StartRotation;
	local KFPawn ResultPawn;

	// don't allow pawn to be spawned with any pitch or roll
	StartRotation.Yaw = StartSpot.Rotation.Yaw;

	ResultPawn = Spawn(CustomizationPawnClass,,,StartSpot.Location,StartRotation,,true);
	if ( ResultPawn == None )
	{
		LogInternal("Couldn't spawn player of type "$CustomizationPawnClass$" at "$StartSpot);
	}
	return ResultPawn;
}

/** Overwritten to restart the player even if we are using a customization pawn*/
function StartHumans()
{
	local KFPlayerController KFPC;
	local int NumPlayerPawns;

	foreach WorldInfo.AllControllers( class'KFPlayerController', KFPC )
	{
		if( bGameEnded )
		{
			return; // telefrag ended the game with ridiculous frag limit
		}

		if( KFPC.Pawn == None || KFPawn_Customization(KFPC.Pawn) != none )
		{
			if( KFPC.CanRestartPlayer() && KFPC.GetTeamNum() != 255 )
			{
				RestartPlayer( KFPC );
			}
		}

		if( KFPC.Pawn != None || KFPC.bWaitingForClientPerkData )
		{
			NumPlayerPawns++;
		}
	}

	bOnePlayerAtStart = (NumPlayerPawns == 1);
}

function RestartPlayer(Controller NewPlayer)
{
	local KFPlayerController KFPC;
	local KFPerk MyPerk;

	KFPC = KFPlayerController( NewPlayer );

	// Make sure the perk is initialized before spawning in, if not, wait for it -- networked games only
	if( WorldInfo.NetMode != NM_StandAlone )
	{
	    if( KFPC != none && KFPC.GetTeamNum() != 255 )
	    {
	    	MyPerk = KFPC.GetPerk();
	    	if( MyPerk == none || !MyPerk.bInitialized )
	    	{
	    		KFPC.WaitForPerkAndRespawn();
	    		return;
	    	}
	    }
	}

	// If we have a customization pawn, destroy it before spawning a new pawn with super.RestartPlayer
    if( NewPlayer.Pawn != none && KFPawn_Customization(NewPlayer.Pawn) != none )
	{
	 	NewPlayer.Pawn.Destroy();
	}

  	super.RestartPlayer( NewPlayer );

  	if( NewPlayer.Pawn != none )
  	{
		if( KFPC != none )
		{
			// Initialize game play post process effects such as damage, low health, etc.
			KFPC.InitGameplayPostProcessFX();

	        // Start fading in the camera
	        KFPC.ClientSetCameraFade( true, MakeColor(255,255,255,255), vect2d(1.f, 0.f), 0.6f, true );
		}
	}
}

/** Returns a low rating if other players are nearby (spawn will fail) */
function float RatePlayerStart(PlayerStart P, byte Team, Controller Player)
{
	local float Rating;

	Rating = Super.RatePlayerStart(P, Team, Player);
	// rate based on distance from friendlies
	if ( !CheckPointCollision( P, Player ) )
	{
	 	return 0.01;
	}

	return Rating;
}

/** Find a predefined spot for PlayerCustomization */
function KFCustomizationPoint FindCustomizationStart( Controller Player )
{
	local KFCustomizationPoint CP;

	ForEach AllActors( class 'KFCustomizationPoint', CP )
	{
		if ( CheckPointCollision( CP, Player ) )
		{
			return CP;
		}
	}

	return CP;
}

function bool CheckPointCollision( NavigationPoint P, Controller Player )
{
	local KFPlayerController KFPC;
	foreach WorldInfo.AllControllers(class'KFPlayerController', KFPC)
	{
		if ( KFPC != Player && KFPC.Pawn != None && !KFPC.Pawn.bHidden )
		{
			if ( VSizeSq(KFPC.Pawn.Location - P.Location) < Square(2.1 * KFPC.Pawn.GetCollisionRadius()) )
			{
				return false;
			}
		}
	}
	return true;
}

/* @see GameInfo::SetPlayerDefaults */
function SetPlayerDefaults(Pawn PlayerPawn)
{
	local KFPawn KFP;

	KFP = KFPawn(PlayerPawn);
	if ( KFP != none && KFP.GetPerk() != none )
	{
		if ( KFP.GetPerk() != none )
		{
			KFP.GetPerk().SetPlayerDefaults(KFP);
		}

		KFP.bIgnoreTeamCollision = bDisableTeamCollision;
	}

	if ( BaseMutator != None )
	{
		BaseMutator.ModifyPlayer(PlayerPawn);
	}

	PlayerPawn.PhysicsVolume.ModifyPlayer(PlayerPawn);
}

/** Used by wave based game types */
function bool IsWaveActive();

/************************************************************************************
 * @name		Difficulty Scaling
 ***********************************************************************************/

/** Adjusts AI pawn default settings by game difficulty and player count */
function SetMonsterDefaults( KFPawn_Monster P )
{
	local float HealthMod;
	local float HeadHealthMod;
	local float GroundSpeedMod, RandomSpeedMod;
	local float DamageMod;
	local KFCharacterInfo_Monster MonsterInfo;

    MonsterInfo = P.GetCharacterMonsterInfo();

   	DamageMod = 1.0;
    HealthMod = 1.0;
    HeadHealthMod = 1.0;

    if( MonsterInfo != none  )
    {
    	if ( !P.bVersusZed )
    	{
			DifficultyInfo.GetAIHealthModifier(MonsterInfo, GameDifficulty, GetLivingPlayerCount(), HealthMod, HeadHealthMod);
			DamageMod = DifficultyInfo.GetAIDamageModifier(MonsterInfo, GameDifficulty,bOnePlayerAtStart);
    	}
    	else
    	{
    		DifficultyInfo.GetVersusHealthModifier(MonsterInfo, GetLivingPlayerCount(), HealthMod, HeadHealthMod);
    	}
	}

    // Scale health and damage by game conductor values for versus zeds
    if( P.bVersusZed )
    {
        HealthMod *= GameConductor.CurrentVersusZedHealthMod;
        HeadHealthMod *= GameConductor.CurrentVersusZedHealthMod;

    	// scale damage
        P.DifficultyDamageMod = DamageMod * GameConductor.CurrentVersusZedDamageMod;

        RandomSpeedMod = 1.f;
		GroundSpeedMod = 1.f;
    }
    else
    {
    	// scale damage
        P.DifficultyDamageMod = DamageMod;

        RandomSpeedMod = DifficultyInfo.GetAIRandomSpeedMod();
		GroundSpeedMod = GameConductor.CurrentAIMovementSpeedMod * RandomSpeedMod;
    }

    //`log("Start P.GroundSpeed = "$P.GroundSpeed$" GroundSpeedMod = "$GroundSpeedMod$" percent of default = "$(P.default.GroundSpeed * GroundSpeedMod)/P.default.GroundSpeed$" RandomSpeedMod= "$RandomSpeedMod);

	// scale movement speed
	P.GroundSpeed = P.default.GroundSpeed * GroundSpeedMod;
	P.SprintSpeed = P.default.SprintSpeed * GroundSpeedMod;

	// Store the difficulty adjusted ground speed to restore if we change it elsewhere
	P.NormalGroundSpeed = P.GroundSpeed;
	P.NormalSprintSpeed = P.SprintSpeed;
	P.RandomGroundSpeedModifier = RandomSpeedMod;

	//`log(P$" GroundSpeed = "$P.GroundSpeed$" P.NormalGroundSpeed = "$P.NormalGroundSpeed);

	// Scale health by difficulty
	P.Health = P.default.Health * HealthMod;
	if( P.default.HealthMax == 0 )
	{
	   	P.HealthMax = P.default.Health * HealthMod;
	}
	else
	{
	   	P.HealthMax = P.default.HealthMax * HealthMod;
	}

	P.ApplySpecialZoneHealthMod(HeadHealthMod);

	// debug logging
   	if (bLogAIDefaults) LogInternal("==== SetMonsterDefaults for pawn: " @P @"====");
	if (bLogAIDefaults) LogInternal("HealthMod: " @HealthMod @ "Original Health: " @P.default.Health @" Final Health = " @P.Health);
	if (bLogAIDefaults) LogInternal("HeadHealthMod: " @HeadHealthMod @ "Original Head Health: " @P.default.HitZones[HZI_HEAD].GoreHealth @" Final Head Health = " @P.HitZones[HZI_HEAD].GoreHealth);
	if (bLogAIDefaults) LogInternal("GroundSpeedMod: " @GroundSpeedMod @" Final Ground Speed = " @P.GroundSpeed);
	//`log("HiddenSpeedMod: " @HiddenSpeedMod @" Final Hidden Speed = " @P.HiddenGroundSpeed, bLogAIDefaults);
	if (bLogAIDefaults) LogInternal("SprintSpeedMod: " @GroundSpeedMod @" Final Sprint Speed = " @P.SprintSpeed);
	if (bLogAIDefaults) LogInternal("DamageMod: " @DamageMod @" Final Melee Damage = " @P.MeleeAttackHelper.BaseDamage * DamageMod);
	//`log("bCanSprint: " @P.bCanSprint @ " from SprintChance: " @SprintChance, bLogAIDefaults);
}

/************************************************************************************
 * @name		Team
 ***********************************************************************************/

/** SetTeam()
* Change Other's team to NewTeam.
* @param Other:  the controller which wants to change teams
* @param NewTeam:  the desired team.
* @param bNewTeam:  if true, broadcast team change notification
*/
function SetTeam(Controller Other, KFTeamInfo_Human NewTeam)
{
	if( Other.PlayerReplicationInfo == None || Other.PlayerReplicationInfo.bOnlySpectator || NewTeam == Other.PlayerReplicationInfo.Team )
	{
		return;
	}

	// remove the controller from his old team
	if ( Other.PlayerReplicationInfo.Team != None )
	{
		Other.PlayerReplicationInfo.Team.RemoveFromTeam(Other);
		Other.PlayerReplicationInfo.Team = none;
	}

	if ( NewTeam == None || (NewTeam != none && NewTeam.AddToTeam(Other)) )
	{
		if ( (NewTeam!=None) && ((WorldInfo.NetMode != NM_Standalone) || (PlayerController(Other) == None) || (PlayerController(Other).Player != None)) )
			BroadcastLocalizedMessage( GameMessageClass, 3, Other.PlayerReplicationInfo, None, NewTeam );

        GameConductor.HandlePlayerChangedTeam();
	}

    // Force net update for UI snappyness
    Other.PlayerReplicationInfo.bNetDirty = true;
    Other.PlayerReplicationInfo.bForceNetUpdate = true;	
}

/* create a player team, and fill from the team roster
*/
function CreateTeam(int TeamIndex)
{
	Teams[TeamIndex] = spawn(class'KFGame.KFTeamInfo_Human');
	GameReplicationInfo.SetTeam(TeamIndex, Teams[TeamIndex]);
}

/** Called by Gameinfo::Login(), initial team pick */
function byte PickTeam(byte Current, Controller C)
{
	return 0;
}

/** Return whether a team change is allowed. */
function bool ChangeTeam(Controller Other, int N, bool bNewTeam)
{
	// AI
	if( PlayerController(Other) == none )
	{
		SetTeam( Other, Teams[N] );
		return true;
	}

	// Human
    if( Other.PlayerReplicationInfo != none
    	&& !Other.PlayerReplicationInfo.bOnlySpectator
    	&& Other.PlayerReplicationInfo.Team != Teams[0] )
    {
		SetTeam( Other, Teams[0] );
		return true;
	}

	return false;
}

/**
 * Return whether Viewer is allowed to spectate from ViewTarget's PoV.
 *   Used to prevent players from spectating zeds when the DummyPRI is active.
 *
 */
function bool CanSpectate( PlayerController Viewer, PlayerReplicationInfo ViewTarget )
{
	// Normal PRI's should be replicatable, DummyPRI is not, indicating a zed
	return ViewTarget.RemoteRole != ROLE_None;
}

/************************************************************************************
 * @name		Damage
 ***********************************************************************************/

/*	Use reduce damage for friendly fire, etc. */
function ReduceDamage(out int Damage, Pawn Injured, Controller InstigatedBy, vector HitLocation, out vector Momentum, class<DamageType> DamageType, Actor DamageCauser)
{
	local class<KFDamageType> KFDT;

	KFDT = class<KFDamageType>(DamageType);

    // Don't damage the instigator if the flag is set
    if ( KFDT != None && InstigatedBy != None && InstigatedBy == Injured.Controller )
    {
    	if( KFDT.default.bNoInstigatorDamage )
    	{
			Damage = 0;
    	}
    	else if( !KFDT.default.bIgnoreSelfInflictedScale )
    	{
    		Damage *= DifficultyInfo.GetSelfInflictedDamageMod();
    	}

		// No momentum if no damage
		Momentum = vect(0,0,0);
    }

	if ( Damage > 0 && InstigatedBy != None && InstigatedBy != Injured.Controller )
	{
		// Friendly fire is scaled for all humans
		if ( Injured.IsHumanControlled() && Injured.GetTeamNum() == InstigatedBy.GetTeamNum() )
		{
			Damage *= FriendlyFireScale;

			// For now, don't apply momentum transfer to friendly pawns
			Momentum = vect(0,0,0);
		}
	}

	// checks neutral zone and god mode and calls mutator hook
	Super.ReduceDamage(Damage, Injured, InstigatedBy, HitLocation, Momentum, DamageType, DamageCauser);
}

function Killed(Controller Killer, Controller KilledPlayer, Pawn KilledPawn, class<DamageType> DT)
{
	local KFPlayerReplicationInfo KilledPRI;
	local KFPlayerController KFPC;
	local int PlayerScoreDelta, TeamPenalty;
	local KFPerk KFPCP;
	local KFPawn_Monster MonsterPawn;
	local string KillerLabel;
	local KFAIController KFAIC;

	if ( KilledPlayer != None && KilledPlayer.bIsPlayer )
	{
        // Let the game conductor know a human team player died
        if( KilledPlayer.GetTeamNum() == 0 && Killer != none && Killer.GetTeamNum() == 255 )
        {
            GameConductor.NotifyHumanTeamPlayerDeath();
        }

		KilledPRI = KFPlayerReplicationInfo( KilledPlayer.PlayerReplicationInfo );
		if( KilledPRI != none )
		{
			if ( KilledPlayer == Killer )
			{
				KillerLabel = "self";
			}
			else if( Killer != none )
			{
				KFAIC = KFAIController(Killer);
				if ( KFAIC != none )
				{
					KillerLabel = string(KFAIC.MyKFPawn.Class.Name);
				}
				else if( Killer.Pawn != none )
				{
					KillerLabel = string(Killer.Pawn.Class.Name);
				}
				else
				{
				    KillerLabel = string(Killer.Class.Name); // well SOMETHING killed me (vs), no pawn, log the controller
				}
			}
		}

		KFPC = KFPlayerController( KilledPlayer );
		if(WorldInfo.GRI.GameClass.static.AllowAnalyticsLogging()) WorldInfo.TWLogEvent ("player_death",
					   KilledPRI,
					   KillerLabel,
					   DT.Name,
					   "#"$MyKFGRI.WaveNum,
					   KFPC != none ? KFPC.GetPerk().PerkName : "",
					   KFPC != none ? KFPC.GetPerk().GetLevel() : byte(0),
					   (KilledPawn != none && KilledPawn.InvManager != none) ? KFInventoryManager(KilledPawn.InvManager).DumpInventory() : "");
	}


	Super.Killed( Killer, KilledPlayer, KilledPawn, DT );

	/* __TW_ANALYTICS_ */
	if(GameplayEventsWriter != None && GameplayEventsWriter.IsSessionInProgress()){GameplayEventsWriter.LogPlayerKillDeath(class'KFGameplayEventsWriter'.const.GAMEEVENT_PLAYER_KILL,class'KFGameplayEventsWriter'.const.GAMEEVENT_PLAYER_KILL_NORMAL,Killer,DT,KilledPlayer);};

	// Maybe do a DramaticEvent that may trigger Zedtime when someone is killed
	if( Killer != KilledPlayer )
	{
		CheckZedTimeOnKill(Killer, KilledPlayer, KilledPawn, DT);
	}

	// Update pawn counters
    if( KilledPawn != none && KilledPawn.GetTeamNum() == 255 )
    {
    	if( Killer != none )
    	{
			KFPC = KFPlayerController(Killer);
			MonsterPawn = KFPawn_Monster(KilledPawn);
			if( KFPC != none && MonsterPawn != none )
			{
				//Chris: We have to do it earlier here because we need a damage type
				KFPC.AddZedKill( MonsterPawn.class, GameDifficulty, DT );

				KFPCP = KFPC.GetPerk();
				if( KFPCP != none )
				{
					if( KFPCP.CanEarnSmallRadiusKillXP( DT ) )
					{
						CheckForBerserkerSmallRadiusKill( MonsterPawn, KFPC );
					}

					KFPCP.AddVampireHealth( KFPC, DT );
				}
			}
		}

		RefreshMonsterAliveCount();

		if ( SpawnManager != None )
		{
			MyKFGRI.AIRemaining--;

			if (bLogAICount) LogInternal("@@@@ ZED COUNT DEBUG: MyKFGRI.AIRemaining =" @ MyKFGRI.AIRemaining);
			if (bLogAICount) LogInternal("@@@@ ZED COUNT DEBUG: AIAliveCount =" @ AIAliveCount);
		}
	}

	// Dosh penalty on death
	if ( KilledPlayer != None && KilledPlayer.bIsPlayer )
	{
		if( KilledPlayer.PlayerReplicationInfo != none )
		{
			KilledPRI = KFPlayerReplicationInfo(KilledPlayer.PlayerReplicationInfo);
	        if( KilledPRI != none )
			{
	        	PlayerScoreDelta = GetAdjustedDeathPenalty( KilledPRI );
	        	if (bLogScoring) LogInternal("SCORING: Player" @ KilledPRI.PlayerName @ "next starting dosh =" @ PlayerScoreDelta + KilledPRI.Score);
	        	KilledPRI.AddDosh( PlayerScoreDelta );
	        	TeamPenalty = GetAdjustedTeamDeathPenalty( KilledPRI );

	        	if( KilledPRI.Team != none )
	        	{
		        	KFTeamInfo_Human(KilledPRI.Team).AddScore( -TeamPenalty );
		        	if (bLogScoring) LogInternal("SCORING: Team lost" @ TeamPenalty @ "dosh for a player dying");
		        }

	        	KilledPRI.PlayerHealth = 0;
	        	KilledPRI.PlayerHealthPercent = 0;
	        }
	    }
	}
}

function BroadcastDeathMessage(Controller Killer, Controller Other, class<DamageType> damageType)
{
	if ( (Killer == Other) || (Killer == None) )
	{	//suicide
		BroadcastLocalized(self, class'KFLocalMessage_Game', KMT_Suicide, None, Other.PlayerReplicationInfo);
	}
	else
	{
		if(Killer.IsA('KFAIController'))
		{
			BroadcastLocalized(self, class'KFLocalMessage_Game', KMT_Killed, none, Other.PlayerReplicationInfo, Killer.Pawn.Class);
		}
		else
		{
			BroadcastLocalized(self, class'KFLocalMessage_PlayerKills', KMT_PlayerKillPlayer, Killer.PlayerReplicationInfo, Other.PlayerReplicationInfo);
		}
	}
}

/**
 * @brief Calculates the dosh penalty or minimum dosh spawning amount
 *
 * @param KilledPlayerPRI The killed player's PRI
 * @param bLateJoiner If true, give late joiners money without penalty
 * @return Rounded amount of dosh
 */
function int GetAdjustedDeathPenalty( KFPlayerReplicationInfo KilledPlayerPRI, optional bool bLateJoiner=false );

/**
 * @brief Calculates the dosh penalty for the team's jackpot
 *
 * @param KilledPlayerPRI The killed player's PRI
 * @return Rounded amount of dosh to be substracted
 */
function int GetAdjustedTeamDeathPenalty( KFPlayerReplicationInfo KilledPlayerPRI )
{
	return Round( KilledPlayerPRI.Score * GameDifficulty * TeamDeathPenaltyPerc );
}

function BossDied(Controller Killer, optional bool bCheckWaveEnded = true);

/************************************************************************************
 * @name		Scoring/DO$H
 ***********************************************************************************/

static function int GetBossKillScore()
{
	return default.POINTS_FOR_BOSS_KILL;
}

function ScoreDamage( int DamageAmount, int HealthBeforeDamage, Controller InstigatedBy, Pawn DamagedPawn, class<DamageType> damageType )
{
	if( InstigatedBy == none
		|| !InstigatedBy.bIsPlayer
		|| InstigatedBy.PlayerReplicationInfo == none
		|| InstigatedBy.GetTeamNum() == DamagedPawn.GetTeamNum() )
	{
		return;
	}

	DamageAmount = Min( DamageAmount, HealthBeforeDamage );
	KFPlayerReplicationInfo(InstigatedBy.PlayerReplicationInfo).DamageDealtOnTeam += DamageAmount;
}

function ScoreKill(Controller Killer, Controller Other)
{
	if ( Killer != none && Killer.PlayerReplicationInfo != None && Killer != Other )
	{
		Killer.PlayerReplicationInfo.Kills++;
		Killer.bForceNetUpdate = TRUE;

		if ( Other.Pawn.IsA('KFPawn_Monster') )
		{
			ScoreMonsterKill(Killer, Other, KFPawn_Monster(Other.Pawn));
		}
	}

	if( Killer != none && Other != none && Killer == Other && Other.Pawn.IsA('KFPawn_Monster') )
	{
		ScoreMonsterKill(Killer, Other, KFPawn_Monster(Other.Pawn));
	}

	ModifyScoreKill(Killer, Other);

	if ( Killer != None || MaxLives > 0 )
	{
		CheckScore(Killer.PlayerReplicationInfo);
	}
}

/* A Zed got killed, let's distribute its money money money value */
protected function ScoreMonsterKill( Controller Killer, Controller Monster, KFPawn_Monster MonsterPawn )
{
	if( MonsterPawn != none )
	{
		if( MonsterPawn.DamageHistory.Length > 0 )
		{
			DistributeMoneyAndXP( MonsterPawn.class, MonsterPawn.DamageHistory, Killer );

			if( MonsterPawn.IsStalkerClass() &&
			 	MonsterPawn.LastStoredCC != none &&
			 	MonsterPawn.bIsCloakingSpottedByTeam )
			{
				AddPlayerXP(MonsterPawn.LastStoredCC, MonsterPawn.static.GetXPValue(GameDifficulty), class'KFPerk_Commando');
			}
		}
	}

	if( WorldInfo.NetMode == NM_DedicatedServer && Killer.GetTeamNum() == 0 )
	{
		if(KFPlayerController(Killer)!= none && KFPlayerController(Killer).MatchStats != none ){KFPlayerController(Killer).MatchStats.RecordZedKill(MonsterPawn.Class,None);};
	}
}

function CheckForBerserkerSmallRadiusKill(KFPawn_Monster MonsterPawn, KFPlayerController KFPC)
{
	local KFPawn_Human KFPH;

	if( KFPC == none )
	{
		return;
	}

	foreach WorldInfo.Allpawns( class'KFPawn_Human', KFPH)
	{
		if( KFPH != none && KFPH.IsAliveAndWell() && KFPH.Controller != KFPC )
		{
			if( VSizeSq( KFPH.Location - MonsterPawn.Location ) <= class'KFPerk_Berserker'.static.GetSmallRadiusKillDistanceSQ() )
			{
				KFPC.AddSmallRadiusKill( GameDifficulty );
				break;
			}
		}
	}
}

/**
 * @brief Adjusts the dosh you get based on difficulty and player count
 *
 * @param MonsterClass pawn class of thge killed zed
 * @return Adjusted dosh amount
 */
function float GetAdjustedAIDoshValue( class<KFPawn_Monster> MonsterClass )
{
	local float TempValue;

	TempValue = MonsterClass.static.GetDoshValue();
	TempValue *= DifficultyInfo.GetKillCashModifier();
	ModifyAIDoshValueForPlayerCount( TempValue );
	TempValue *= GameLengthDoshScale[GameLength];

	return TempValue;
}

/**
 * @brief Adjust monster's dosh value by player count
 *
 * @param ModifiedValue the amount modified
 */
function ModifyAIDoshValueForPlayerCount( out float ModifiedValue )
{
	local float DoshMod;

	// Scale dosh by the same rate we scale the zed spawning so we end up
	// with the same amount of dosh per player in the world whether it's
	// 1 player or 6;
    DoshMod = GetNumPlayers() /  DifficultyInfo.GetPlayerNumMaxAIModifier(GetNumPlayers());

    //`log("Starting Dosh Bounty: "$ModifiedValue$" DoshMod: "$DoshMod);
	ModifiedValue *= DoshMod;
	//`log("Modified Dosh Bounty: "$ModifiedValue);
}

function int GetNumPlayers()
{







    return Super.GetNumPlayers();
}

function int GetNumHumanTeamPlayers()
{
    local PlayerController P;
    local int TotalPlayers, ZedTeamPlayers, HumanTeamPlayers;

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

/* Who needs some do$h? Give players money after a Zed was killed based on the percentage of damage they dealt*/
protected function DistributeMoneyAndXP(class<KFPawn_Monster> MonsterClass, const out array<DamageInfo> DamageHistory, Controller Killer)
{
	local int i, j, TotalDamage, EarnedDosh;
	local float AdjustedAIValue, ScoreDenominator, XP;
	local KFPlayerController KFPC;
	local KFPlayerReplicationInfo DamagerKFPRI;

	for ( i = 0; i < DamageHistory.Length; i++ )
	{
		TotalDamage += DamageHistory[i].TotalDamage;
	}

	if ( TotalDamage <= 0 )
	{
		WarnInternal("Total damage given to this zed is less or equal zero! This should never happen");
		return;
	}

	// Scale value (via GameInfo) by difficulty and length & player count;
	AdjustedAIValue = GetAdjustedAIDoshValue( MonsterClass );
    ScoreDenominator = AdjustedAIValue / TotalDamage;

	for ( i = 0; i < DamageHistory.Length; i++ )
	{
		if( DamageHistory[i].DamagerController != none
			&& DamageHistory[i].DamagerController.bIsPlayer
			&& DamageHistory[i].DamagerPRI.GetTeamNum() == 0
			&& DamageHistory[i].DamagerPRI != none )
		{
			EarnedDosh = Round( DamageHistory[i].TotalDamage * ScoreDenominator );
			if (bLogScoring) LogInternal("SCORING: Player" @ DamageHistory[i].DamagerPRI.PlayerName @ "received" @ EarnedDosh @ "dosh for killing a" @ MonsterClass);

			DamagerKFPRI = KFPlayerReplicationInfo(DamageHistory[i].DamagerPRI);
			if( DamagerKFPRI != none )
			{
				//Killer cannot receive assists.
				if( Killer.PlayerReplicationInfo != DamagerKFPRI )
				{
					DamagerKFPRI.Assists++;

					if( DamageHistory[i].DamagePerks.Length == 1 )
					{
						DamageHistory[i].DamagePerks[0].static.ModifyAssistDosh( EarnedDosh );
					}
				}

				DamagerKFPRI.AddDosh( EarnedDosh, true );

				if( DamagerKFPRI.Team != none )
				{
					//Dosh
					KFTeamInfo_Human(DamagerKFPRI.Team).AddScore( EarnedDosh );

					if( DamageHistory[i].DamagePerks.Length <= 0 )
					{
						continue;
					}

					// Distribute experience points
					KFPC = KFPlayerController(DamagerKFPRI.Owner);
					if( KFPC != none )
					{
						XP = MonsterClass.static.GetXPValue(GameDifficulty) / DamageHistory[i].DamagePerks.Length;

						for( j = 0; j < DamageHistory[i].DamagePerks.Length; j++ )
						{
							AddPlayerXP(KFPC, FCeil(XP), DamageHistory[i].DamagePerks[j]);
						}
					}
				}
			}
		}
	}
}

/** Grant xp rewards */
native private function AddPlayerXP(KFPlayerController PC, INT XP, class<KFPerk> PerkClass);

/************************************************************************************
 * @name		Zed time
 ***********************************************************************************/

// Called when a dramatic event happens that might cause slomo
// ZedTimeChance - the attempted probability of doing a slomo event
function DramaticEvent(float ZedTimeChance, optional float Duration=3.f)
{
    //local float RandChance;
    local float TimeSinceLastEvent;
    local KFPlayerController KFPC;

// NVCHANGE_BEGIN - RLS - Debugging Effects & Performance
	if (bNVBlockDramatic)
		return;
// NVCHANGE_END - RLS - Debugging Effects & Performance

    TimeSinceLastEvent = (WorldInfo.TimeSeconds - LastZedTimeEvent);


    if( BaseMutator != none )
    {
    	BaseMutator.ModifyZedTime( TimeSinceLastEvent, ZedTimeChance, Duration );
    }


    // Don't go in slomo if we were just IN slomo
    if( TimeSinceLastEvent < 10.0 && ZedTimeChance < 1.0 )
    {
        return;
    }

    // Increase the chance of zed time if it has been a while
    if( TimeSinceLastEvent > 60 )
    {
        ZedTimeChance *= 4.0;
    }
    else if( TimeSinceLastEvent > 30 )
    {
        ZedTimeChance *= 2.0;
    }

    // Cause zed time if we pass the random chance check
    if( FRand() <= ZedTimeChance && Duration > ZedTimeRemaining )
    {
		ZedTimeRemaining = Duration;
        bZedTimeBlendingOut = false;
		LastZedTimeEvent = WorldInfo.TimeSeconds;

        SetZedTimeDilation(ZedTimeSlomoScale);

        foreach WorldInfo.AllControllers(class'KFPlayerController', KFPC)
        {
            if (KFPC != none)
            {
                KFPC.EnterZedTime();
            }
        }
    }
}

function Tick( float DeltaTime )
{
    // Handle interpolating back from zed time
    if( ZedTimeRemaining > 0.f )
    {
		TickZedTime(DeltaTime);
    }
}

/** While zedtime is active, tick duration down */
function TickZedTime( float DeltaTime )
{
	local float TrueTimeFactor;
    local KFPlayerController KFPC;

	// Get real world DeltaTime (undo zed time dilation)
    TrueTimeFactor = 1.0 / (CustomTimeDilation * WorldInfo.TimeDilation);
    ZedTimeRemaining -= DeltaTime * TrueTimeFactor;

    // Reset zed time when this current zed time period ends
    if( ZedTimeRemaining <= 0 )
    {
        bZedTimeBlendingOut = false;
        SetZedTimeDilation(1.0);
        ZedTimeExtensionsUsed = 0;
    }
	// Interpolate back from zed time if its almost done
	else if ( ZedTimeRemaining < ZedTimeBlendOutTime )
	{
        if( !bZedTimeBlendingOut )
        {
            bZedTimeBlendingOut = true;

            foreach WorldInfo.AllControllers(class'KFPlayerController', KFPC)
            {
                if (KFPC != none)
                {
                    KFPC.FadeOutZedTime();
                }
            }
        }

        SetZedTimeDilation(Lerp(1.0, ZedTimeSlomoScale, ZedTimeRemaining/ZEDTimeBlendOutTime));
    }
}

/** Returns true if zed-time is currently active */
function bool IsZedTimeActive()
{
	return ZedTimeRemaining > 0.f;
}

/** Changes the current TimeDilation value for zed-time */
function SetZedTimeDilation(float NewTimeDilation)
{
	// Change this to swap between global/local zedtime systems
	SetGameSpeed(NewTimeDilation);
}

/** Trigger DramaticEvent/ZedTime when pawn is killed */
function CheckZedTimeOnKill(Controller Killer, Controller KilledPlayer, Pawn KilledPawn, class<DamageType> DamageType)
{
	local bool bIsHuman;
	local KFPlayerController KFPC;
	local KFPerk KillersPerk;
	local class<KFDamageType> KFDT;

	// Skip if the damagetype is (or can apply) damage over time
	KFDT = class<KFDamageType>(DamageType);
	if ( KFDT != None && KFDT.default.DoT_Type != DOT_None )
	{
		return;
	}

	// If already in zed time, check for zed time extensions
	if ( IsZedTimeActive() )
	{
		KFPC = KFPlayerController(Killer);
		if ( KFPC != none )
		{
			KillersPerk = KFPC.GetPerk();
			// Handle if someone has a perk with zed time extensions
			if ( ZedTimeRemaining > 0.f && KillersPerk != none && KillersPerk.GetZedTimeExtension( KFPC.GetLevel() ) > ZedTimeExtensionsUsed )
			{
				// Force Zed Time extension for every kill as long as the Player's Perk has Extensions left
				DramaticEvent(1.0);
				ZedTimeExtensionsUsed++;
			}
		}
	}
	else
	{
// NVCHANGE_BEGIN - RLS - Debugging Effects
		if (bNVAlwaysDramatic)
			DramaticEvent(1.0);
// NVCHANGE_END - RLS - Debugging Effects

		// Handle human kills
		bIsHuman = KilledPawn.IsA('KFPawn_Human');
		if ( bIsHuman )
		{
			DramaticEvent(0.05f);
			return;
		}

		if( KilledPawn.Controller == none )
		{
			// don't trigger dramatic event for brain-dead zeds
			return;
		}

		// Handle monster/zed kills - increased probability if closer to the player
		if( Killer != none && Killer.Pawn != none && VSizeSq(Killer.Pawn.Location - KilledPawn.Location) < 90000 ) // 3 meters
		{
			DramaticEvent(0.05);
		}
		else
		{
			DramaticEvent(0.025);
		}
	}
}

/** Called when pawn is killed by headshot */
function NotifyHeadshotKill(Controller Killer, Pawn KilledPawn)
{
// NVCHANGE_BEGIN - RLS - Debugging Effects
	if (bNVAlwaysDramatic)
		DramaticEvent(1.0);
// NVCHANGE_END - RLS - Debugging Effects

	// increased chance for long range kills
	if(Killer != none && Killer.Pawn != none && VSizeSq(Killer.Pawn.Location - KilledPawn.Location) > Square(2500)) // 25 meters
	{
		DramaticEvent(0.05);
	}
	else
	{
		DramaticEvent(0.03);
	}
}

/** notification when a NavigationPoint becomes blocked or unblocked */
function NotifyNavigationChanged( NavigationPoint N )
{
	local KFAIController AI;
	local int	 Idx;

	if( N.bBlocked )
	{
		foreach WorldInfo.AllControllers( class'KFAIController', AI )
		{
			if( AI!= None ) { AI.AILog_Internal(GetFuncName()$"() Notifying "$AI$" that navigation has changed for "$N,'PathWarning'); };
			if( !AI.bMovingToGoal )
			{
				if( AI!= None ) { AI.AILog_Internal(GetFuncName()$"() ** Skipping notification for "$AI$" because bMovingToGoal was false. bPreparingMove? : "$AI.bPreparingMove,'PathWarning'); };
				continue;
			}
			Idx = AI.RouteCache.Find( N );
			if( Idx >= 0 )
			{
				if( AI!= None ) { AI.AILog_Internal(GetFuncName()$"() setting bReEvaluatePath to true for "$AI$" thanks to "$N,'PathWarning'); };
				AI.bReevaluatePath = true;
				AI.MoveTimer = -1.f;
				AI.ForcePauseAndRepath();
			}
			else
			{
				if( AI!= None ) { AI.AILog_Internal("** WARNING ** "$GetFuncName()$" for "$N$" not telling "$AI$" to reevaluate path because I couldn't find "$N$" in the routecache! bPreparingMove: "$AI.bPreparingMove,'PathWarning'); };
			}
		}
	}
}

/************************************************************************************
 * @name		Music
 ***********************************************************************************/

/** Generally how intense the game is currently (MAX RETURN VALUE: 10, in line with TWMusicTrackStruct::MinGameIntensityLevel ClampMax) */
function byte GetGameIntensityForMusic();

/** Whether an action or ambient track should be played */
static function bool ShouldPlayActionMusicTrack(KFGameReplicationInfo GRI);

/** Whether this game mode should play music from the get-go */
static function bool ShouldPlayMusicAtStart();

simulated function ForceMenuMusicTrack()
{
    MyKFGRI.ForceNewMusicTrack( default.ForcedMusicTracks[EFM_MainMenu] );
}

simulated function ForceCreditsMusicTrack()
{
    MyKFGRI.ForceNewMusicTrack( default.ForcedMusicTracks[EFM_Credits] );
}

simulated function ForceHansMusicTrack()
{
    MyKFGRI.ForceNewMusicTrack( default.ForcedMusicTracks[EFM_Boss1] );
}

simulated function ForcePatriarchMusicTrack()
{
    MyKFGRI.ForceNewMusicTrack( default.ForcedMusicTracks[EFM_Boss2] );
}

simulated function ForceMatriarchMusicTrack()
{
    MyKFGRI.ForceNewMusicTrack( default.ForcedMusicTracks[EFM_Boss3] );
}

/*********************************************************************************************
 * @name		Map rotation
 *********************************************************************************************/

/**
 * Returns the next map to play.
 */
function string GetNextMap()
{
	local array<string> MapList;
	local int i;

		if ( bUseMapList && GameMapCycles.Length > 0 )
		{
			if ( MapCycleIndex == INDEX_NONE )
			{
				MapList = GameMapCycles[ActiveMapCycle].Maps;
				MapCycleIndex = GetCurrentMapCycleIndex(MapList);
				if ( MapCycleIndex == INDEX_NONE )
				{
					// Assume current map is actually zero
					MapCycleIndex = 0;
				}
			}

			for (i = 0; i < GameMapCycles[ActiveMapCycle].Maps.length; ++i)
			{
				MapCycleIndex = MapCycleIndex + 1 < GameMapCycles[ActiveMapCycle].Maps.length ? (MapCycleIndex + 1) : 0;
				if ( IsMapAllowedInCycle(GameMapCycles[ActiveMapCycle].Maps[MapCycleIndex]) )
				{
					SaveConfig();
					return GameMapCycles[ActiveMapCycle].Maps[MapCycleIndex];
				}
			}

			return string(WorldInfo.GetPackageName());
		}
		else
		{
			return string(WorldInfo.GetPackageName());
		}

	return "";
}

/** @return the index of the current map in the given list (used when starting up a server to start counting at the current map) */
function int GetCurrentMapCycleIndex(const out array<string> MapList)
{
	return MapList.Find(string(WorldInfo.GetPackageName()));
}

/*********************************************************************************************
 * @name Exec
 *********************************************************************************************/

exec function MaintenanceRestart()
{
	SetNeedsRestart();
}

// Save player's stats on leave
function UnregisterPlayer(PlayerController PC)
{
	local KFPlayerController KFPC;

	KFPC = KFPlayerController(PC);
	if( KFPC != none )
	{
		if(WorldInfo.GRI.GameClass.static.AllowAnalyticsLogging()) WorldInfo.TWLogEvent ("player_disconnected",
					   KFPC.PlayerReplicationInfo,
					   "#"$MyKFGRI.WaveNum);

		KFPC.ClientWriteAndFlushStats();
	}

	super.UnregisterPlayer(PC);
}

/** AddInactivePRI()
* Add PRI to the inactive list, remove from the active list
* Overrideen to include the time we quit
*/
function AddInactivePRI(PlayerReplicationInfo PRI, PlayerController PC)
{
	local KFPlayerReplicationInfo NewKFPRI;

	// don't store if it's an old PRI from the previous level or if it's a spectator
	if (!PRI.bFromPreviousLevel && !PRI.bOnlySpectator)
	{
		NewKFPRI = KFPlayerReplicationInfo(PRI);
		NewKFPRI.LastQuitTime = WorldInfo.TimeSeconds;
	}

	super.AddInactivePRI(PRI, PC);
}

/** FindInactivePRI()
* returns the PRI associated with this re-entering player
* Overrideen to increment the number of times we've reconnected to a server
*/
function bool FindInactivePRI(PlayerController PC)
{
	local KFPlayerReplicationInfo NewKFPRI;

	if( super.FindInactivePRI(PC) )
	{
		NewKFPRI = KFPlayerReplicationInfo(PC.PlayerReplicationInfo);
		NewKFPRI.NumTimesReconnected++;
		return true;
	}
	return false;
}

/************************************************************************************
 * @name		Reservations
 ***********************************************************************************/

function bool UniqueIdPresent(out array<UniqueNetId> PlayerIDs, UniqueNetId PlayerID)
{
	local UniqueNetId i;

	//array Find() won't work, for stupid Unrealscript reasons
	foreach PlayerIDs(i)
	{
		if (i == PlayerID)
		{
			return true;
		}
	}
	return false;
}

function bool ReservationPresent(UniqueNetId PlayerID)
{
	local PlayerReservation i;
	foreach PlayerReservations(i)
	{
		if (i.PlayerId == PlayerID)
		{
			return true;
		}
	}
	return false;
}

function UniqueIdAdd(out array<UniqueNetId> PlayerIDs, UniqueNetId PlayerID)
{
	if (!UniqueIdPresent(PlayerIDs, PlayerID))
	{
		PlayerIDs.AddItem(PlayerID);
	}
}

function bool AtCapacity(bool bSpectator, optional const UniqueNetId PlayerID)
{
	if (bSpectator)
	{
		return super.AtCapacity(bSpectator);
	}
	if ( GetAvailableReservations() <= 0 )
	{
		return !ReservationPresent(PlayerID);
	}
	return super.AtCapacity(bSpectator);
}

event MakeReservations(const string URLOptions, const UniqueNetId PlayerId, out string OutError)
{
	local array<UniqueNetId> Reservations;

	if (bLogReservations) LogInternal("KFGameInfo.MakeReservations");
	ReadReservations(URLOptions, PlayerId, Reservations);
	if (Reservations.length > 0)
	{
		if (!AddPlayerReservations(Reservations))
		{
			if (bLogReservations) LogInternal("KFGameInfo.MakeReservations failed");
			OutError = "<Strings:"$PathName(WorldInfo.Game.GameMessageClass)$".MaxedOutMessage>";
		}
	}
}

event PlayerController Login(string Portal, string Options, const UniqueNetID UniqueID, out string ErrorMessage)
{
	local PlayerController SpawnedPC;
	local string ClientAuthTicket, PlayerfabPlayerId;

	SeatPlayer(UniqueID);
	SpawnedPC = super.Login(Portal, Options, UniqueID, ErrorMessage);

	if( WorldInfo.IsPlayfabServer() && SpawnedPC != None )
	{
		LogInternal("Player login with options"@Options);

		ClientAuthTicket = ParseOption( Options, "AuthTicket" );
		PlayerfabPlayerId = ParseOption( Options, "PlayfabPlayerId" );
		LogInternal("Player controller log in with auth ticket"@ClientAuthTicket@"and playfab player id"@PlayerfabPlayerId);

		if( ClientAuthTicket != "" )
		{
			class'GameEngine'.static.GetPlayfabInterface().ServerValidatePlayer( ClientAuthTicket );
		}

		SpawnedPC.PlayerReplicationInfo.PlayfabPlayerId = PlayerfabPlayerId;
	}

	return SpawnedPC;
}

/** Broadcast message when server needs restart/update.  Called with commandline -autoupdate. */
event SendServerMaintenanceMessage()
{
	BroadcastLocalizedMessage(class'KFLocalMessage', LMT_ServerMaintenance);
}

function UniqueReservationAdd(UniqueNetId PlayerID)
{
	local PlayerReservation i;
	local PlayerReservation Reservation;
	local bool bFound;

	if (bLogReservations) LogInternal("KFGameInfo.UniqueReservationAdd" @ class'OnlineSubsystem'.static.UniqueNetIdToString(PlayerID));
	bFound = false;
	foreach PlayerReservations(i)
	{
		if (i.PlayerId == PlayerID)
		{
			bFound = true;
			break;
		}
	}
	if (!bFound)
	{
		if (bLogReservations) LogInternal("KFGameInfo.UniqueReservationAdd adding" @ class'OnlineSubsystem'.static.UniqueNetIdToString(PlayerID));
		Reservation.PlayerId = PlayerID;
		Reservation.Timer = 0;
		PlayerReservations.AddItem(Reservation);
	}
}

function RemoveDuplicates(out array<UniqueNetId> PlayerIDs)
{
	local int i;
	i = 0;
	while ( i < PlayerIDs.length )
	{
		if ( ReservationPresent(PlayerIDs[i]) )
		{
			PlayerIDs.Remove(i, 1);
		}
		else
		{
			++i;
		}
	}
}

function bool AddPlayerReservations(out array<UniqueNetId> PlayerIDs)
{
	local UniqueNetId PlayerID;
	local int OldCount;

	RemoveDuplicates(PlayerIDs);
	if (PlayerIDs.length == 0)
	{
		return true;
	}
	if (PlayerIDs.length > GetAvailableReservations())
	{
		return false;
	}
	OldCount = PlayerReservations.length;
	foreach PlayerIDs(PlayerID)
	{
		UniqueReservationAdd(PlayerID);
	}
	if (OldCount == 0 && PlayerReservations.length > 0)
	{
		SetTimer(1.f, true, 'TimeReservations');
	}
	return true;
}

function TimeReservations()
{
	local int i;
	local UniqueNetId stupid;

	i = 0;
	while ( i < PlayerReservations.length )
	{
		stupid=PlayerReservations[i].PlayerId;
		if (bLogReservations) LogInternal("KFGameInfo.TimeReservations" @ i @ class'OnlineSubsystem'.static.UniqueNetIdToString(stupid) @ "timer is" @ PlayerReservations[i].Timer);

		if (PlayerReservations[i].Timer > ReservationTimeout)
		{
			if (bLogReservations) LogInternal("KFGameInfo.TimeReservations expiring player" @ i @ class'OnlineSubsystem'.static.UniqueNetIdToString(stupid));
			PlayerReservations.Remove(i, 1);
		}
		else
		{
			if (PlayerReservations[i].Timer >= 0)
			{
				++PlayerReservations[i].Timer;
				if (bLogReservations)
				{
					if (bLogReservations) LogInternal("KFGameInfo.TimeReservations player" @ i @ class'OnlineSubsystem'.static.UniqueNetIdToString(stupid)@"="@string(PlayerReservations[i].Timer));
				}
			}
			++i;
		}
	}
	if (PlayerReservations.length == 0)
	{
		ClearTimer('TimeReservations');
	}
}

function ReadReservations(const string URLOptions, const UniqueNetId PlayerId, out array<UniqueNetId> Reservations)
{
	local string OptionsCopy, Option, Key, Value;
	local UniqueNetId Id;

	if (bLogReservations) LogInternal("KFGameInfo.ReadReservations reading reservations from"@URLOptions);

	OptionsCopy = URLOptions;
	Reservations.Remove(0, Reservations.length);
	while ( GrabOption(OptionsCopy, Option) && Reservations.length < 5 )
	{
		GetKeyValue(Option, Key, Value);
		if ( Len(Key) == 6 && Left(Key,5) ~= "party")
		{
			if ( class'OnlineSubsystem'.static.StringToUniqueNetId(Value, Id) )
			{
				if (bLogReservations) LogInternal("KFGameInfo.ReadReservations for player" @ Key);
				UniqueIdAdd(Reservations, Id);
			}
		}
		else if (Key ~= "SpectatorOnly" && Value ~= "1")
		{
			//Make no reservation if we're spectating
			if (bLogReservations) LogInternal("KFGameInfo.ReadReservations found" @ Key $ "=" $ Value @"in URL, making no reservations");
			Reservations.Remove(0, Reservations.length);
			return;
		}
	}
	if (bLogReservations) LogInternal("KFGameInfo.ReadReservations for player" @ class'OnlineSubsystem'.static.UniqueNetIdToString(PlayerId));
	UniqueIdAdd(Reservations, PlayerId);
}

event bool ConfirmReservation(const UniqueNetId PlayerID)
{
	local PlayerReservation i;
	local UniqueNetId stupid;
	local int index;
	if (bLogReservations) LogInternal("KFGameInfo.ConfirmReservation");
	foreach PlayerReservations(i, index)
	{
		if (i.PlayerId == PlayerID)
		{
			stupid=i.PlayerId;
			if (bLogReservations)
			{
				if (bLogReservations) LogInternal("KFGameInfo.ConfirmReservation for player"@ index @ class'OnlineSubsystem'.static.UniqueNetIdToString(stupid));
			}
			PlayerReservations[index].Timer = -1;
			if (bLogReservations) LogInternal("KFGameInfo.TimeReservations" @ index @ class'OnlineSubsystem'.static.UniqueNetIdToString(stupid) @ "timer is" @ string(PlayerReservations[index].Timer));
			return true;
		}
	}
	return false;
}

event bool SeatPlayer(const UniqueNetId SeatedPlayerID)
{
	local int i;
	local UniqueNetId stupid;

	if (bLogReservations) LogInternal("KFGameInfo.SeatPlayer");
	for (i = 0; i < PlayerReservations.length; ++i )
	{
		if (PlayerReservations[i].PlayerId == SeatedPlayerID)
		{
			if (bLogReservations)
			{
				stupid=PlayerReservations[i].PlayerId;
				if (bLogReservations) LogInternal("KFGameInfo.SeatPlayer for player" @ i @ class'OnlineSubsystem'.static.UniqueNetIdToString(stupid));
			}
			PlayerReservations.Remove(i, 1);
			return true;
		}
	}
	return false;
}

function int GetAvailableReservations()
{
	return Maxplayers - GetNumPlayers() - PlayerReservations.length;
}

/*********************************************************************************************
 * @name 	Debugging
 *********************************************************************************************/

static native function bool AllowBalanceLogging();
static native function bool AllowAnalyticsLogging();

/** logs what each player is carrying */
function LogPlayersInventory()
{
	local PlayerController PC;
	local Inventory Item;
	local string InvString;

	if ( !AllowBalanceLogging() )
	{
		return;
	}

	ForEach WorldInfo.AllControllers(class'PlayerController', PC)
	{
		if ( PC.Pawn != None && PC.Pawn.InvManager != None )
		{
			InvString = "";
			for (Item = PC.Pawn.InvManager.InventoryChain; Item != None; Item = Item.Inventory)
			{
				InvString $= Item.Class.Name $ ",";
			}
			if(class'KFGameInfo'.static.AllowBalanceLogging()) WorldInfo.LogGameBalance(GBE_Inventory$","$PC.PlayerReplicationInfo.PlayerName$","$InvString);
			// @note: for `AnalyticsLog see "pc_wave_start"
		}
	}
}

/** logs how much dosh each player is carrying */
function LogPlayersDosh(name EventName)
{
	local KFPlayerController PC;

	if ( !AllowBalanceLogging() )
	{
		return;
	}

	ForEach WorldInfo.AllControllers(class'KFPlayerController', PC)
	{
		if ( PC.PlayerReplicationInfo != None && !PC.PlayerReplicationInfo.bIsSpectator )
		{
			if(class'KFGameInfo'.static.AllowBalanceLogging()) WorldInfo.LogGameBalance(EventName$","$PC.PlayerReplicationInfo.PlayerName$","$"$"$PC.PlayerReplicationInfo.Score$","$PC.GetPerk());
			// @note: for `AnalyticsLog see "pc_wave_start"
		}
	}
}

/** logs how many total kills and deaths each player has at end of match */
function LogPlayersKillCount()
{
	local KFPlayerController PC;
	local PlayerReplicationInfo PRI;

	if ( !AllowBalanceLogging() )
	{
		return;
	}

	ForEach WorldInfo.AllControllers(class'KFPlayerController', PC)
	{
		PRI = PC.PlayerReplicationInfo;
		if ( PRI != None && !PRI.bIsSpectator )
		{
			if(class'KFGameInfo'.static.AllowBalanceLogging()) WorldInfo.LogGameBalance(GBE_Kills$","$PRI.PlayerName$","$PRI.Kills$","$PC.GetPerk());
			if(class'KFGameInfo'.static.AllowBalanceLogging()) WorldInfo.LogGameBalance(GBE_Deaths$","$PRI.PlayerName$","$PRI.Deaths$","$PC.GetPerk());
			// @note: for `AnalyticsLog see "player_death" and "pc_wave_end"
		}
	}
}

/*********************************************************************************************
 * state PendingMatch
 * This is the initial state for a kf game type.
 *********************************************************************************************/

auto State PendingMatch
{
	event Timer()
	{
		global.Timer();
 		if( bDelayedStart )
		{
		 	if( ShouldStartMatch() )
			{
				// start our default lobby countdown
				if( !IsTimerActive( nameof(LobbyCountdownComplete) ) && MajorityPlayersReady() )
				{
					MyKFGRI.RemainingTime = ReadyUpDelay;
					MyKFGRI.bStopCountDown = false;

					SetCountdown(false, ReadyUpDelay);
				}
				else if( IsTimerActive( nameof(LobbyCountdownComplete) ) && !MajorityPlayersReady() )
				{
					ClearTimer( nameof(LobbyCountdownComplete) );
					MyKFGRI.bStopCountDown = true;
					ResetCountDown();
				}

				// Everyone is ready, start the final countdwon
				if( CheckAllPlayersReady() )
				{
					if( !bStartFinalCount )
					{
						SetCountdown( true, GameStartDelay );
					}
				}
				// somebody canceled the final countdown
				else if( bStartFinalCount )
				{
					SetCountdown( false, MyKFGRI.RemainingTime );
				}
			}
			else if( IsTimerActive( nameof(LobbyCountdownComplete) ) )
			{
					ClearTimer( nameof(LobbyCountdownComplete) );
					MyKFGRI.bStopCountDown = true;
			}
            // If this is a dedicated server locked for use by players,
			// check if anyone is connected after ready-up time expires,
			// and unlock the server if no one is has connected
			if( KFGameEngine(class'Engine'.static.GetEngine()).IsLockedServer() && !IsTimerActive( nameof(CheckServerUnlock) ) )
			{
				SetTimer( ReadyUpDelay, false, nameof(CheckServerUnlock) );
			}
		}
	}
}

function SetCountdown(bool bFinalCountdown, byte CountdownTime)
{
	local KFPlayerController KFPC;

	bStartFinalCount = bFinalCountdown;
	SetTimer(CountdownTime, false, nameof(LobbyCountdownComplete));
	foreach WorldInfo.AllControllers(class'KFPlayerController', KFPC)
	{
		KFPC.ClientSetCountdown(bFinalCountdown, CountdownTime);
	}
}

/**
 * @brief Stops the countdown when no player is readied up anymore
  */
function ResetCountDown()
{
	local KFPlayerController KFPC;

	foreach WorldInfo.AllControllers(class'KFPlayerController', KFPC)
	{
		KFPC.ClientResetCountdown();
	}
}

function LobbyCountdownComplete()
{
	local KFPlayerController KFPC;
	foreach WorldInfo.AllControllers(class'KFPlayerController', KFPC)
	{
		KFPC.PlayerReplicationInfo.bReadyToPlay = true;
	}

	StartMatch();
}

function CheckServerUnlock()
{
	if ( GetNumPlayers() == 0 )
	{
		// Won't unlock a server that's not lockable
		KFGameEngine(class'Engine'.static.GetEngine()).UnlockServer();
	}
}

function StartMatch()
{
	super.StartMatch();
	bDelayedStart = false;
	MyKFGRI.RemainingTime = 0;
	MyKFGRI.bStopCountDown = true;
	ClearTimer(nameof(StartMatch));
	ClearTimer(nameof(LobbyCountdownComplete));
	if ( GameplayEventsWriter != None )
	{
		GameplayEventsWriter.StartLogging(0.0f);
	}
}

function bool ShouldStartMatch()
{
	if ( bWaitForNetPlayers && WorldInfo.NetMode != NM_Standalone )
	{
		return 	NumPlayers >= MinNetPlayers;
	}
	return true;
}

function bool CheckAllPlayersReady()
{
	local int i;
	local array<KFPlayerReplicationInfo> KFPRIArray;

	MyKFGRI.GetKFPRIArray(KFPRIArray);
	for ( i = 0; i < KFPRIArray.Length; i++ )
	{
		if ( !IsPlayerReady( KFPRIArray[i] ) )
		{
			return false;
		}
	}

	return true;
}

/**
 * @brief Checks if majority of players readied up yet
 * @return true if a majority of the players have readied up
 */
function bool MajorityPlayersReady()
{
	local int i, readyPlayers;
	local array<KFPlayerReplicationInfo> KFPRIArray;
	local float readyPercent;

	MyKFGRI.GetKFPRIArray(KFPRIArray);

	if( KFPRIArray.Length == 0 )
	{
		return false;
	}

	for( i = 0; i < KFPRIArray.Length; i++ )
	{
		if ( IsPlayerReady( KFPRIArray[i] ) )
		{
			readyPlayers++;
		}
	}

	if( readyPlayers == 0 )
	{
		return false;
	}

	readyPercent = float(readyPlayers) / float(KFPRIArray.length);

	return readyPercent >= 0.5f;
}

/**
 * @brief Checks if any player has readied up yet
 * @return true if at least one player has readied up
 */
function bool AnyPlayerReady()
{
	local int i;
	local array<KFPlayerReplicationInfo> KFPRIArray;

	MyKFGRI.GetKFPRIArray(KFPRIArray);
	for( i = 0; i < KFPRIArray.Length; i++ )
	{
		if ( IsPlayerReady( KFPRIArray[i] ) )
		{
			return true;
		}
	}

	return false;
}

function bool IsPlayerReady( KFPlayerReplicationInfo PRI )
{
	return PRI.bReadyToPlay;
}

function UpdateCurrentMapVoteTime(byte NewTime, optional bool bStartTime);

/*********************************************************************************************
 * @name AI
 *********************************************************************************************/

function OnAIChangeEnemy( BaseAIController AI, Pawn Enemy )
{

	if( BaseMutator != none )
	{
		BaseMutator.ModifyAIEnemy( AI, Enemy );
	}

}

defaultproperties
{
   POINTS_FOR_BOSS_KILL=10000
   POINTS_FOR_WAVE_COMPLETION=1000
   POINTS_PENALTY_FOR_DEATH=100
   CustomizationPawnClass=Class'KFGame.KFPawn_Customization'
   bWaitForNetPlayers=True
   bEnableDeadToVOIP=True
   bCanPerkAlwaysChange=True
   bUseMapList=True
   KFGFxManagerClass=Class'KFGame.KFGFxMoviePlayer_Manager'
   GameLength=1
   MinNetPlayers=1
   ReadyUpDelay=120
   GameStartDelay=4
   EndOfGameDelay=15
   GameModes(0)=(FriendlyName="Survival",ClassNameAndPath="KFGameContent.KFGameInfo_Survival",bSoloPlaySupported=True,DifficultyLevels=4,Lengths=4)
   GameModes(1)=(FriendlyName="Versus",ClassNameAndPath="KFGameContent.KFGameInfo_VersusSurvival",LocalizeID=1)
   KickVotePercentage=0.500000
   TimeBetweenFailedVotes=10.000000
   MapVoteDuration=60.000000
   ServerMOTD="Welcome to our server. \n \n Have fun and good luck!"
   ServerMOTDColor=(B=254,G=254,R=254,A=192)
   BannerLink="http://art.tripwirecdn.com/TestItemIcons/MOTDServer.png"
   WebsiteLink="http://killingfloor2.com/"
   WebLinkColor=(B=254,G=254,R=254,A=192)
   ClanMotto="This is the clan motto."
   ClanMottoColor=(B=254,G=254,R=254,A=192)
   ServerExpirationForKillWhenEmpty=120.000000
   ReconnectRespawnTime=30
   DifficultyTemplate=KFDifficultyInfo'GP_Difficulty_ARCH.Difficulty'
   DeathPenaltyModifiers(0)=0.050000
   DeathPenaltyModifiers(1)=0.100000
   DeathPenaltyModifiers(2)=0.200000
   DeathPenaltyModifiers(3)=0.250000
   GameLengthDoshScale(0)=1.000000
   GameLengthDoshScale(1)=1.000000
   GameLengthDoshScale(2)=1.000000
   GameConductorClass=Class'KFGame.KFGameConductor'
   ZedTimeSlomoScale=0.200000
   ZedTimeBlendOutTime=0.500000
   GameMapCycles(0)=(Maps=("KF-BurningParis","KF-Bioticslab","KF-Outpost","KF-VolterManor","KF-Catacombs","KF-EvacuationPoint","KF-Farmhouse","KF-BlackForest","KF-Prison","KF-ContainmentStation","KF-HostileGrounds"))
   DialogManagerClass=Class'KFGame.KFDialogManager'
   ActionMusicDelay=5.000000
   ForcedMusicTracks(0)=KFMusicTrackInfo'WW_MMNU_Login.TrackInfo'
   ForcedMusicTracks(1)=KFMusicTrackInfo'WW_MMNU_Login.TrackInfo'
   ForcedMusicTracks(2)=KFMusicTrackInfo'WW_MACT_Default.TI_SH_Boss_DieVolter'
   ForcedMusicTracks(3)=KFMusicTrackInfo'WW_MACT_Default.TI_Boss_Patriarch'
   ForcedMusicTracks(4)=KFMusicTrackInfo'WW_MACT_Default.TI_ID_Murderer'
   ReservationTimeout=32
   bRestartLevel=False
   bPauseable=False
   bTeamGame=True
   bWaitingToStartMatch=True
   bRequiresPushToTalk=True
   DefaultPawnClass=Class'KFGame.KFPawn_Human'
   HUDType=Class'KFGame.KFGFxHudWrapper'
   MaxPlayersAllowed=6
   AccessControlClass=Class'KFGame.KFAccessControl'
   PlayerControllerClass=Class'KFGame.KFPlayerController'
   PlayerReplicationInfoClass=Class'KFGame.KFPlayerReplicationInfo'
   GameReplicationInfoClass=Class'KFGame.KFGameReplicationInfo'
   PopulationManagerClass=Class'GameFramework.GameCrowdPopulationManager'
   OnlineGameSettingsClass=Class'KFGame.KFOnlineGameSettings'
   Name="Default__KFGameInfo"
   ObjectArchetype=FrameworkGame'GameFramework.Default__FrameworkGame'
}
