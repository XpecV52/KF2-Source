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

`define GAMEINFO(dummy)
`include(KFGame\KFGameAnalytics.uci);
`undefine(GAMEINFO)
`include(KFGame\KFMatchStats.uci);

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

var bool 							bEnableDeadToDeadVOIP;

/************************************************************************************
 * @name		Game Settings
 ***********************************************************************************/
 /** If true we can change our perks at any point in this game mode */
 var const bool bCanPerkAlwaysChange;

/** The time it takes to respawn when we have reconnected to the same server multiple times */
var const int 							ReconnectRespawnTime;

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

/************************************************************************************
 * @name		Game Length
 ***********************************************************************************/

enum EGameLength
{
	GL_Short,
	GL_Normal,
	GL_Long,
	GL_Custom
};

/** The maxiumum number of game lengths available */
const MAX_GAMELENGTHS = 3;

/************************************************************************************
 * @name		Game balance
 ***********************************************************************************/

/** Game conductor which dynamically manages the difficulty and fun of the game */
var KFGameConductor						GameConductor;

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
var config			bool	bEnableDevAnalytics;
var	class<KFGameplayEventsWriter>	GameplayEventsWriterClass;
var	transient		KFGameplayEventsWriter	GameplayEventsWriter;
var transient 		KFGameStatsUploader MCPUploader;

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

cpptext
{
	// static members (doesn't contribute to class size)
	static UBOOL bServerNeedsRestart;

	virtual void PreBeginPlay();
	virtual void TickSpecial( FLOAT DeltaSeconds );

	// -autoupdate commandline
	virtual void CheckGameUpToDate();
	virtual void SendUpToDateCheck();
	virtual void ServerCleanExit();

	virtual UBOOL IsUnrankedGame() {return bIsUnrankedGame;}
}

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

	GameLength = Clamp(GetIntOption( Options, "GameLength", GameLength ), 0, MAX_GAMELENGTHS);

	OnlineSub.GetLobbyInterface().LobbyJoinGame();

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
protected function bool CheckForCustomSettings()
{
	return bDisablePickups || MaxPlayers < 6 || FriendlyFireScale > 0.f;
}

event PreBeginPlay()
{
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
`if(`notdefined(ShippingPC))
	/* @todo: dev analytics override */
	if ( !bEnableDevAnalytics )
	{
		return;
	}
	`log("Developer analytics forced ON.");
`endif
	//Optionally setup the gameplay event logger
   if (bEnableGameAnalytics && GameplayEventsWriterClass != None)
   {
    	`log("Recording game events with"@GameplayEventsWriterClass);
    	GameplayEventsWriter = new(self) GameplayEventsWriterClass;
   }
   else
   {
      `log("Gameplay events will not be recorded.");
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

function EndLogging(string Reason)
{
	local WorldInfo WI;

	// Upload previous stats and start anew
	if (bEnableGameAnalytics && GameplayEventsWriter != None && GameplayEventsWriter.IsSessionInProgress())
	{
		// End logging
		GameplayEventsWriter.EndLogging();
		WI = class'WorldInfo'.static.GetWorldInfo();
		if (OnlineSub != None ) //&& (WI.NetMode == NM_DedicatedServer || WI.NetMode == NM_ListenServer))
		{
			// Parse data and upload to MCP
			UploadGameplayStats();
		}
		else
		{
			`Log("Stats upload skipped. OnlineSub:"@OnlineSub@"NetMode:"@WI.NetMode, bLogAnalytics);
		}
	}
	else
	{
		`Log("End logging skipped for stats. bLog:"@bEnableGameAnalytics@"Writer:"@GameplayEventsWriter@"InProgress:"@GameplayEventsWriter != None ? string(GameplayEventsWriter.IsSessionInProgress()) : "False", bLogAnalytics);
	}

	Super.EndLogging(Reason);
}

/**
 * Sends the gameplay stats to the configured services
 */
function UploadGameplayStats()
{
 	local TWOnlineEventsInterface MCPInterface;
 	local WorldInfo WI;

	if (bEnableGameAnalytics && GameplayEventsWriter != None && OnlineSub != None && MCPUploader == None)
	{
		// Ask for the interface by name and cast to our well known type
		MCPInterface = TWOnlineEventsInterface(OnlineSub.GetNamedInterface('AnalyticsUpload'));
		WI = class'WorldInfo'.static.GetWorldInfo();

		if (MCPInterface != None)
		{
			MCPUploader = new(None) class'KFGameStatsUploader';
			MCPUploader.Init(GameplayEventsWriter);

			if 	((WI.NetMode == NM_DedicatedServer && MCPUploader.bUploadDedicatedServer) ||
				 (WI.NetMode == NM_ListenServer && MCPUploader.bUploadListenServer) ||
				 (WI.NetMode == NM_Standalone && MCPUploader.bUploadOfflineGame)
				)
			{
				UploadGameplayStatsInternal();
			}
			else
			{
				`Log("Upload disabled for NetMode:"@WI.NetMode, bLogAnalytics);
			}
		}
		else
		{
			`Log("Upload skipped for stats. No MCPInterface.", bLogAnalytics);
		}
	}
	else
	{
		`Log("Upload skipped for stats. bLog:"@bEnableGameAnalytics@"Writer:"@GameplayEventsWriter@"Uploader:"@MCPUploader@"InProgress:"@GameplayEventsWriter.IsSessionInProgress(), bLogAnalytics);
	}
}

function UploadGameplayStatsInternal()
{
	local TWOnlineEventsInterface MCPInterface;

	// Ask for the interface by name and cast to our well known type
	MCPInterface = TWOnlineEventsInterface(OnlineSub.GetNamedInterface('AnalyticsUpload'));
	// Submit to our LSP
	if (MCPInterface != None)
	{
		// Console might be flushing the data
		if (MCPUploader.IsFinishedFlushing())
		{
			MCPUploader.UploadGameplayStats(MCPInterface);
			MCPUploader = None;
		}
		else
		{
			`Log("Waiting for MCPUploader.IsFinishedFlushing()", bLogAnalytics);
			// Wait for the flush to complete
			SetTimer(0.2, false, nameof(UploadGameplayStatsInternal));
		}
	}
	else
	{
		`Log("No MCP Interface found for upload.", bLogAnalytics);
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
		`log(Address@"is banned, rejecting...");
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
}

event InitAIDirector()
{
	AIDirector = new(self) class'KFAIDirector';
	AIDirector.Initialize();
}

/* Initialize the Game Conductor */
function InitGameConductor()
{
	GameConductor = new(self) class'KFGameConductor';
}

/* Initialize the GRI varaibles */
function InitGRIVariables()
{
	MyKFGRI.GameDifficulty 	= GameDifficulty;
	MyKFGRI.GameLength 		= GameLength;
}

/**
 * AllowCheats - Allow cheating in single player games and coop games.
 */
function bool AllowCheats(PlayerController P)
{
`if(`notdefined(ShippingPC))
	return true;
`else
	return false; // see KFPlayerController.EnableCheats
`endif
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
		`log("Couldn't spawn player of type "$DefaultPlayerClass$" at "$StartSpot);
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
		`log("Couldn't spawn player of type "$CustomizationPawnClass$" at "$StartSpot);
	}
	return ResultPawn;
}

/** Overwritten to restart the player even if we are using a customization pawn*/
function StartHumans()
{
	local PlayerController P;
	local int NumPlayerPawns;

	foreach WorldInfo.AllControllers(class'PlayerController', P)
	{
		if( P.Pawn == None || KFPawn_Customization(P.Pawn) != none )
		{
			if( bGameEnded )
			{
				return; // telefrag ended the game with ridiculous frag limit
			}
			else if( P.CanRestartPlayer() )
			{
				RestartPlayer( P );
			}
		}

		if ( P.Pawn != None )
		{
			NumPlayerPawns++;
		}
	}

	bOnePlayerAtStart = (NumPlayerPawns == 1);
}

function RestartPlayer(Controller NewPlayer)
{
	local KFPlayerController KFPC;

    if( NewPlayer.Pawn != none && KFPawn_Customization(NewPlayer.Pawn) != none )
	{
		// If we have a customization pawn, destroy it before spawning a new pawn with super.RestartPlayer
	 	NewPlayer.Pawn.Destroy();
	}

  	super.RestartPlayer( NewPlayer );

	// Give players a TeamInfo for friendly fire checks (see ReduceDamage)
	SetTeam( NewPlayer, Teams[0] );

	KFPC = KFPlayerController(NewPlayer);
	if( KFPC != none )
	{
		// Initialize game play post process effects such as damage, low health, etc.
		KFPC.InitGameplayPostProcessFX();
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
			break;
		}
	}
	return CP;
}

function bool CheckPointCollision( NavigationPoint P, Controller Player )
{
	local KFPlayerController KFPC;
	foreach WorldInfo.AllControllers(class'KFPlayerController', KFPC)
	{
		if ( KFPC != Player && KFPC.Pawn != None )
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
function SetAIDefaults(KFPawn_Monster P)
{
	local float HealthMod;
	local float HeadHealthMod;
	local float GroundSpeedMod;
	local float HiddenSpeedMod;
	local float DamageMod;
	local float SprintChance;
	local float SprintDamagedChance;
	local byte NumLivingPlayers;
	local KFCharacterInfo_Monster MonsterInfo;

	NumLivingPlayers = GetLivingPlayerCount();
    MonsterInfo = P.GetCharacterMonsterInfo();

    if( MonsterInfo != none )
    {
		DifficultyInfo.GetAIHealthModifier(MonsterInfo, GameDifficulty, NumLivingPlayers, HealthMod, HeadHealthMod);
		SprintChance = DifficultyInfo.GetCharSprintChanceByDifficulty( MonsterInfo,GameDifficulty );
		SprintDamagedChance = DifficultyInfo.GetCharSprintWhenDamagedChanceByDifficulty( MonsterInfo,GameDifficulty );
		DamageMod = DifficultyInfo.GetAIDamageModifier(MonsterInfo,GameDifficulty,bOnePlayerAtStart);
	}
	else
	{
        DamageMod = DifficultyInfo.GetBaseAIDamageModifier();
	}

	GroundSpeedMod = DifficultyInfo.GetAdjustedAIGroundSpeedMod();
	GroundSpeedMod *= GameConductor.CurrentAIMovementSpeedMod;
	HiddenSpeedMod = DifficultyInfo.GetAIHiddenSpeedModifier( NumLivingPlayers );

	// scale damage
    if( KFAIController_Monster(P.Controller) != none )
    {
        KFAIController_Monster(P.Controller).DifficultyDamageMod = DamageMod;
	}

	// scale hidden speed
	P.HiddenGroundSpeed = P.default.HiddenGroundSpeed * HiddenSpeedMod;

	// scale movement speed
	P.GroundSpeed = P.default.GroundSpeed * GroundSpeedMod;
	P.SprintSpeed = P.default.SprintSpeed * GroundSpeedMod;

	// Store the difficulty adjusted ground speed to restore if we change it elsewhere
	P.NormalGroundSpeed = P.GroundSpeed;

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

	if ( P.PawnAnimInfo != none )
	{
		P.PawnAnimInfo.SetDifficultyValues( DifficultyInfo );
	}

	// Each zed has a chance he will sprint at a certain difficulty
	// NOTE: Some zeds now bypass this check because they need to sprint under certain conditions regardless of
	//	difficulty!  Search the code for bIsSprinting = true.  Evil, yes, but necessary
	P.SetCanSprint( FRand() <= SprintChance );
	P.SetCanSprintWhenDamaged( FRand() <= SprintDamagedChance );

	if ( BaseMutator != None )
	{
		BaseMutator.ModifyAI( P );
	}

	// debug logging
   	`log("==== SetAIDefaults for pawn: " @P @"====",bLogAIDefaults);
	`log("HealthMod: " @HealthMod @ "Original Health: " @P.default.Health @" Final Health = " @P.Health, bLogAIDefaults);
	`log("HeadHealthMod: " @HeadHealthMod @ "Original Head Health: " @P.default.HitZones[HZI_HEAD].GoreHealth @" Final Head Health = " @P.HitZones[HZI_HEAD].GoreHealth, bLogAIDefaults);
	`log("GroundSpeedMod: " @GroundSpeedMod @" Final Ground Speed = " @P.GroundSpeed, bLogAIDefaults);
	`log("HiddenSpeedMod: " @HiddenSpeedMod @" Final Hidden Speed = " @P.HiddenGroundSpeed, bLogAIDefaults);
	`log("SprintSpeedMod: " @GroundSpeedMod @" Final Sprint Speed = " @P.SprintSpeed, bLogAIDefaults);
	`log("DamageMod: " @DamageMod @" Final Melee Damage = " @P.MeleeAttackHelper.BaseDamage * DamageMod, bLogAIDefaults);
	`log("bCanSprint: " @P.bCanSprint @ " from SprintChance: " @SprintChance, bLogAIDefaults);
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
	if ( Other.PlayerReplicationInfo == None )
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
}

/* create a player team, and fill from the team roster
*/
function CreateTeam(int TeamIndex)
{
	Teams[TeamIndex] = spawn(class'KFGame.KFTeamInfo_Human');
	GameReplicationInfo.SetTeam(TeamIndex, Teams[TeamIndex]);
}

function byte PickTeam(byte Current, Controller C)
{
	return 0;
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
		// Only human players who are not on team 255 (zeds team) will scale friendly firef
		if ( Injured.GetTeamNum() != 255 && Injured.GetTeamNum() == InstigatedBy.GetTeamNum() )
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
		KilledPRI = KFPlayerReplicationInfo( KilledPlayer.PlayerReplicationInfo );
		KFPC = KFPlayerController( KilledPlayer );
		if( KilledPRI != none )
		{
			if ( KilledPlayer == Killer )
			{
				KillerLabel = "self";
			}
			else
			{
				KFAIC = KFAIController(Killer);
				if ( KFAIC != none )
				{
					KillerLabel = string(KFAIC.MyKFPawn.Class.Name);
				}
			}
		}			

		`AnalyticsLog(("player_death",
					   KilledPRI,
					   KillerLabel,
					   DT.Name,
					   "#"$MyKFGRI.WaveNum,
					   KFPC.GetPerk().PerkName,
					   KFPC.GetPerk().GetLevel(),
					   KFInventoryManager(KilledPawn.InvManager).DumpInventory() ));
	}

	Super.Killed( Killer, KilledPlayer, KilledPawn, DT );

	/* __TW_ANALYTICS_ */
	`RecordKillEvent( NORMAL, Killer, DT, KilledPlayer );

	// Maybe do a DramaticEvent that may trigger Zedtime when someone is killed
	if( Killer != KilledPlayer )
	{
		CheckZedTimeOnKill(Killer, KilledPlayer, KilledPawn, DT);
	}

	// Update pawn counters
    if( KilledPawn.IsA('KFPawn_Monster') )
    {
		KFPC = KFPlayerController(Killer);
		MonsterPawn = KFPawn_Monster(KilledPawn);
		if( KFPC != none && KFPC.bIsPlayer && MonsterPawn != none )
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

		AIAliveCount = GetMonsterAliveCount();

		if ( SpawnManager != None )
		{
			MyKFGRI.AIRemaining--;
		}
	}

	// Dosh penalty on death
	if ( KilledPlayer != None && KilledPlayer.bIsPlayer )
	{
		KilledPRI = KFPlayerReplicationInfo(KilledPlayer.PlayerReplicationInfo);
        if( KilledPRI != none )
		{
        	PlayerScoreDelta = GetAdjustedDeathPenalty( KilledPRI );
        	`log("SCORING: Player" @ KilledPRI.PlayerName @ "next starting dosh =" @ PlayerScoreDelta + KilledPRI.score, bLogScoring);
        	KilledPRI.AddDosh( PlayerScoreDelta );
        	TeamPenalty = GetAdjustedTeamDeathPenalty( KilledPRI );
        	KilledPRI.Team.Score -= TeamPenalty;
        	`log("SCORING: Team lost" @ TeamPenalty @ "dosh for a player dying", bLogScoring);
        	KilledPRI.PlayerHealth = 0;
        }

        KFPawn_Human(KilledPawn).BroadcastDeathMessage( Killer );
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

function BossDied(Controller Killer);

/************************************************************************************
 * @name		Scoring/DO$H
 ***********************************************************************************/

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
function ScoreMonsterKill( Controller Killer, Controller Monster, KFPawn_Monster MonsterPawn )
{
	local KFAIController KFAIC;

	KFAIC = KFAIController(Monster);
	if( KFAIC != none )
	{
		if( KFAIC.DamageHistory.Length > 0 )
		{
			DistributeMoneyAndXP( MonsterPawn.class, KFAIC.DamageHistory, Killer );

			if( MonsterPawn.IsStalkerClass() &&
			 	MonsterPawn.LastStoredCC != none &&
			 	MonsterPawn.bIsCloakingSpottedByTeam )
			{
				MonsterPawn.LastStoredCC.AddPlayerXP( MonsterPawn.static.GetXPValue(GameDifficulty), class'KFPerk_Commando' );
			}
		}
	}

	/* __TW_ANALYTICS_ */
	`RecordZedKilledEvent( Killer, Monster, MonsterPawn );
	if(WorldInfo.NetMode == NM_DedicatedServer)
	{
		`RecordAARZedKill(KFPlayerController(Killer), MonsterPawn.Class, None );
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
				`RecordPlayerXP(`StatID(PLAYER_XP_SMALL_RADIUS), KFPC, class'KFPerk_Berserker'.static.GetSmallRadiusKillXP( GameDifficulty ));
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
`if(`notdefined(ShippingPC))
	if ( ForcedNumLivingPlayers != 0 )
	{
		return ForcedNumLivingPlayers;
	}
`endif

    return Super.GetNumPlayers();
}

/* Who needs some do$h? Give players money after a Zed was killed based on the percentage of damage they dealt*/
function DistributeMoneyAndXP(class<KFPawn_Monster> MonsterClass, const out array<DamageInfo> DamageHistory, Controller Killer)
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
		`warn("Total damage given to this zed is less or equal zero! This should never happen");
		return;
	}

	// Scale value (via GameInfo) by difficulty and length & player count;
	AdjustedAIValue = GetAdjustedAIDoshValue( MonsterClass );
    ScoreDenominator = AdjustedAIValue / TotalDamage;

	for ( i = 0; i < DamageHistory.Length; i++ )
	{
		if ( DamageHistory[i].DamagerController != none && DamageHistory[i].DamagerController.bIsPlayer && DamageHistory[i].DamagerPRI != none )
		{
			EarnedDosh = Round( DamageHistory[i].TotalDamage * ScoreDenominator );
			`log("SCORING: Player" @ DamageHistory[i].DamagerPRI.PlayerName @ "received" @ EarnedDosh @ "dosh for killing a" @ MonsterClass, bLogScoring);

			DamagerKFPRI = KFPlayerReplicationInfo(DamageHistory[i].DamagerPRI);
			if( DamagerKFPRI != none )
			{
				DamagerKFPRI.AddDosh(EarnedDosh, true);
				//Killer cannot receive assists.
				if( Killer.PlayerReplicationInfo != DamagerKFPRI )
				{
					DamagerKFPRI.Assists++;
				}

				if( DamagerKFPRI.Team != none )
				{
					//Dosh
					DamagerKFPRI.Team.Score += EarnedDosh;

					if ( DamageHistory[i].DamagePerks.Length <= 0 )
					{
						continue;
					}

					// Distribute experience points
					KFPC = KFPlayerController(DamagerKFPRI.Owner);
					if( KFPC != none )
					{
						XP = MonsterClass.static.GetXPValue(GameDifficulty) / DamageHistory[i].DamagePerks.Length;

						for ( j =0; j < DamageHistory[i].DamagePerks.Length; j++ )
						{
							KFPC.AddPlayerXP(FCeil(XP), DamageHistory[i].DamagePerks[j]);

							// GameStats
							/* _TW__ANALYTICS */
							`RecordZedKilledPerPlayerEvent(KFPC, TotalDamage, XP, EarnedDosh, DamageHistory[i].DamagePerks[j]);
						}
					}
				}
			}
		}
	}
	if ( `ValidStatsContext )
	{
		`StatsContext.DeathEvent.CommitToDisk();
	}
}

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

    TimeSinceLastEvent = `TimeSince(LastZedTimeEvent);

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
			`AILog_Ext( GetFuncName()$"() Notifying "$AI$" that navigation has changed for "$N, 'PathWarning', AI );
			if( !AI.bMovingToGoal )
			{
				`AILog_Ext( GetFuncName()$"() ** Skipping notification for "$AI$" because bMovingToGoal was false. bPreparingMove? : "$AI.bPreparingMove, 'PathWarning', AI );
				continue;
			}
			Idx = AI.RouteCache.Find( N );
			if( Idx >= 0 )
			{
				`AILog_Ext( GetFuncName()$"() setting bReEvaluatePath to true for "$AI$" thanks to "$N, 'PathWarning', AI );
				AI.bReevaluatePath = true;
				AI.MoveTimer = -1.f;
				AI.ForcePauseAndRepath();
			}
			else
			{
				`AILog_Ext( "** WARNING ** "$GetFuncName()$" for "$N$" not telling "$AI$" to reevaluate path because I couldn't find "$N$" in the routecache! bPreparingMove: "$AI.bPreparingMove, 'PathWarning', AI );
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
		`AnalyticsLog(("player_disconnected",
					   KFPC.PlayerReplicationInfo,
					   "#"$MyKFGRI.WaveNum));

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

	`log("KFGameInfo.MakeReservations", bLogReservations);
	ReadReservations(URLOptions, PlayerId, Reservations);
	if (Reservations.length > 0)
	{
		if (!AddPlayerReservations(Reservations))
		{
			`log("KFGameInfo.MakeReservations failed", bLogReservations);
			OutError = "<Strings:"$PathName(WorldInfo.Game.GameMessageClass)$".MaxedOutMessage>";
		}
	}
}

event PlayerController Login(string Portal, string Options, const UniqueNetID UniqueID, out string ErrorMessage)
{
	SeatPlayer(UniqueID);
	return super.Login(Portal, Options, UniqueID, ErrorMessage);
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

	`log("KFGameInfo.UniqueReservationAdd" @ class'OnlineSubsystem'.static.UniqueNetIdToString(PlayerID), bLogReservations);
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
		`log("KFGameInfo.UniqueReservationAdd adding" @ class'OnlineSubsystem'.static.UniqueNetIdToString(PlayerID), bLogReservations);
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
		`log("KFGameInfo.TimeReservations" @ i @ class'OnlineSubsystem'.static.UniqueNetIdToString(stupid) @ "timer is" @ PlayerReservations[i].Timer, bLogReservations);

		if (PlayerReservations[i].Timer > ReservationTimeout)
		{
			`log("KFGameInfo.TimeReservations expiring player" @ i @ class'OnlineSubsystem'.static.UniqueNetIdToString(stupid), bLogReservations);
			PlayerReservations.Remove(i, 1);
		}
		else
		{
			if (PlayerReservations[i].Timer >= 0)
			{
				++PlayerReservations[i].Timer;
				if (bLogReservations)
				{
					`log("KFGameInfo.TimeReservations player" @ i @ class'OnlineSubsystem'.static.UniqueNetIdToString(stupid)@"="@string(PlayerReservations[i].Timer), bLogReservations);
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

	`log("KFGameInfo.ReadReservations reading reservations from"@URLOptions, bLogReservations);

	OptionsCopy = URLOptions;
	Reservations.Remove(0, Reservations.length);
	while ( GrabOption(OptionsCopy, Option) && Reservations.length < 5 )
	{
		GetKeyValue(Option, Key, Value);
		if ( Len(Key) == 6 && Left(Key,5) ~= "party")
		{
			if ( class'OnlineSubsystem'.static.StringToUniqueNetId(Value, Id) )
			{
				`log("KFGameInfo.ReadReservations for player" @ Key, bLogReservations);
				UniqueIdAdd(Reservations, Id);
			}
		}
		else if (Key ~= "SpectatorOnly" && Value ~= "1")
		{
			//Make no reservation if we're spectating
			`log("KFGameInfo.ReadReservations found" @ Key $ "=" $ Value @"in URL, making no reservations", bLogReservations);
			Reservations.Remove(0, Reservations.length);
			return;
		}
	}
	`log("KFGameInfo.ReadReservations for player" @ class'OnlineSubsystem'.static.UniqueNetIdToString(PlayerId), bLogReservations);
	UniqueIdAdd(Reservations, PlayerId);
}

event bool ConfirmReservation(const UniqueNetId PlayerID)
{
	local PlayerReservation i;
	local UniqueNetId stupid;
	local int index;
	`log("KFGameInfo.ConfirmReservation", bLogReservations);
	foreach PlayerReservations(i, index)
	{
		if (i.PlayerId == PlayerID)
		{
			stupid=i.PlayerId;
			if (bLogReservations)
			{
				`log("KFGameInfo.ConfirmReservation for player"@ index @ class'OnlineSubsystem'.static.UniqueNetIdToString(stupid), bLogReservations);
			}
			PlayerReservations[index].Timer = -1;
			`log("KFGameInfo.TimeReservations" @ index @ class'OnlineSubsystem'.static.UniqueNetIdToString(stupid) @ "timer is" @ string(PlayerReservations[index].Timer), bLogReservations);
			return true;
		}
	}
	return false;
}

event bool SeatPlayer(const UniqueNetId SeatedPlayerID)
{
	local int i;
	local UniqueNetId stupid;

	`log("KFGameInfo.SeatPlayer", bLogReservations);
	for (i = 0; i < PlayerReservations.length; ++i )
	{
		if (PlayerReservations[i].PlayerId == SeatedPlayerID)
		{
			if (bLogReservations)
			{
				stupid=PlayerReservations[i].PlayerId;
				`log("KFGameInfo.SeatPlayer for player" @ i @ class'OnlineSubsystem'.static.UniqueNetIdToString(stupid), bLogReservations);
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
			`BalanceLog(GBE_Inventory, PC.PlayerReplicationInfo, InvString);
			`AnalyticsLog(("inventory", PC.PlayerReplicationInfo, InvString));
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
			`BalanceLog(EventName, PC.PlayerReplicationInfo, "$"$PC.PlayerReplicationInfo.Score$","$PC.GetPerk());
//			`AnalyticsLog(("dosh", PC.PlayerReplicationInfo, EventName, "#"$PC.PlayerReplicationInfo.Score, PC.GetPerk(), "#"$MyKFGRI.WaveNum ));
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
			`BalanceLog(GBE_Kills, PRI, PRI.Kills$","$PC.GetPerk());
			`BalanceLog(GBE_Deaths, PRI, PRI.Deaths$","$PC.GetPerk());
//			`AnalyticsLog(("kills", PRI, "#"$PRI.Kills, PC.GetPerk()));
//			`AnalyticsLog(("deaths", PRI, "#"$PRI.Deaths, PC.GetPerk()));
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
	local KFPlayerController PC;

	super.StartMatch();
	bDelayedStart = false;
	MyKFGRI.RemainingTime = 0;
	MyKFGRI.bStopCountDown = true;
	ClearTimer(nameof(StartMatch));
	ClearTimer(nameof(LobbyCountdownComplete));
	if ( GameplayEventsWriter != None )
	{
		GameplayEventsWriter.StartLogging(0.0f);
		`RecordSurvivalInfo(GameDifficulty, GameDifficulty);

		foreach WorldInfo.AllControllers(class'KFPlayerController', PC)
		{
			`RecordKFPlayerPerk(PC, PC.CurrentPerk.class);
		}
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
	for( i = 0; i < KFPRIArray.Length; i++ )
	{
		if ( IsPlayerReady( KFPRIArray[i] ) )
		{
			readyPlayers++;
		}
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
	local KFPlayerController KFPC;

	// Spawn our player even if we don't have a perk while using the editor or skip lobby
	if (class'KFGameEngine'.static.CheckSkipLobby() || class'Engine'.static.IsEditor())
 	{
 		return true;
 	}

	if ( PRI.bReadyToPlay )
	{
		KFPC = KFPlayerController(PRI.Owner);
		if ( KFPC != None && (KFPC.CurrentPerk == None || !KFPC.CurrentPerk.bInitialized) )
		{
			`log("ERROR: Failed to load perk for:"@KFPC@KFPC.CurrentPerk);
			//ForceKickPlayer(KFPC, "Failed to find perk");
			return false; // critical error
		}

		return true;
	}

	return false;
}

/*********************************************************************************************
*	@Name End of game 
*********************************************************************************************/

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
	bTeamGame=true
	bCanPerkAlwaysChange=true
    bRequiresPushToTalk=true
    bPauseable=false

    ZedTimeSlomoScale=0.2
	ZedTimeBlendOutTime=0.5

    DeathPenaltyModifiers(0)=0.05
    DeathPenaltyModifiers(1)=0.1f
    DeathPenaltyModifiers(2)=0.2f
    DeathPenaltyModifiers(3)=0.25

    AccessControlClass=class'KFGame.KFAccessControl'
	OnlineGameSettingsClass=class'KFGame.KFOnlineGameSettings'
	PlayerControllerClass=class'KFGame.KFPlayerController'
	PlayerReplicationInfoClass=class'KFGame.KFPlayerReplicationInfo'
	GameReplicationInfoClass=class'KFGame.KFGameReplicationInfo'
	DefaultPawnClass=class'KFGame.KFPawn_Human'
	CustomizationPawnClass=class'KFGame.KFPawn_Customization'
	PopulationManagerClass=class'GameFramework.GameCrowdPopulationManager'
	DialogManagerClass=class'KFGame.KFDialogManager'
	HUDType=class'KFGame.KFGFXHudWrapper'
	KFGFxManagerClass=class'KFGame.KFGFxMoviePlayer_Manager'

	DifficultyTemplate=KFDifficultyInfo'GP_Difficulty_ARCH.Difficulty'

	bRestartLevel=false
	bWaitingToStartMatch=true
	bDelayedStart=true

	ActionMusicDelay=5.0
    ForcedMusicTracks(0)=KFMusicTrackInfo'WW_MMNU_Login.TrackInfo' // menu
    ForcedMusicTracks(1)=KFMusicTrackInfo'WW_MMNU_Login.TrackInfo' // credits
    ForcedMusicTracks(2)=KFMusicTrackInfo'WW_MACT_Default.TI_SH_Boss_DieVolter' // hans
    ForcedMusicTracks(3)=KFMusicTrackInfo'WW_MACT_Default.TI_Boss_Patriarch' // patriarch
    ForcedMusicTracks(4)=KFMusicTrackInfo'WW_MACT_Default.TI_ID_Murderer' // matriarch

	ReservationTimeout=32
	bLogReservations=false

	MaxPlayersAllowed=6

	ReconnectRespawnTime=30

	bLogAnalytics=false
	bEnableDeadToDeadVOIP=false

// NVCHANGE_BEGIN - RLS - Debugging Effects
	bNVAlwaysDramatic=false
	bNVBlockDramatic=false
	bNVAlwaysHeadshot=false
	bNVDebugDamage=false
// NVCHANGE_END - RLS - Debugging Effects
}
