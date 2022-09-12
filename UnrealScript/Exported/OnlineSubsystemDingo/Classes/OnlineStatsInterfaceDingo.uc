/**
 * Copyright 1998-2012 Epic Games, Inc. All Rights Reserved.
 */

/**
 * Class that implements a Dingo version of the game interface
 */
class OnlineStatsInterfaceDingo extends Object within OnlineSubsystemDingo
	native
	implements(OnlineStatsInterface)
	config(Engine);


const KFMAX_Perks = 					10;

 
const VIEWID_KFGameStats =				1;

 
const STATID_None 			 =			0;

 
const STATID_Cmdo_Progress	 =			1;
const STATID_Cmdo_Build      =				2;

 
const STATID_Bsrk_Progress	 =			10;
const STATID_Bsrk_Build		 =			11;

 
const STATID_Sup_Progress	 =				20;
const STATID_Sup_Build		 =			21;
const STATID_Sup_WeldPoints	 =			22;

 
const STATID_Fire_Progress	 =			30;
const STATID_Fire_Build		 =			31;

 
const STATID_Medic_Progress		 =		40;
const STATID_Medic_Build	 =				41;
const STATID_Medic_HealPoints =				42;

 
const STATID_Shrp_Progress	 =			50;
const STATID_Shrp_Build		 =			51;

 
const STATID_Demo_Progress	=			60;
const STATID_Demo_Build		=			61;

 
const STATID_Surv_Progress	 =			70;
const STATID_Surv_Build		 =			71;

 
const STATID_Guns_Progress	 =			80;
const STATID_Guns_Build		 =			81;

 
const STATID_SWAT_Progress	 =			90;
const STATID_SWAT_Build		 =			91;

 
const STATID_Kills 			 =			200;
const STATID_StalkerKills 	 =			201;
const STATID_CrawlerKills 	 =			202;
const STATID_FleshpoundKills	 =			203;

 
const STATID_SpecialEventProgress =     300;
const STATID_WeeklyEventProgress =      301;
const STATID_DailyEventInfo =           302;
const STATID_DailyEventIDs =            303;
const STATID_DailyEventStats1 =         304;
const STATID_DailyEventStats2 =         305;
const STATID_SpecialEventKills_DEPRECATED =		306;
const STATID_SeasonalEventStats1 =		307;
const STATID_SeasonalEventStats2 =		308;
const STATID_SeasonalEventStats3 =		309;
const STATID_SeasonalEventStats4 =		310;
const STATID_SeasonalEventStats5 =		311;

 
const STATID_DoshVaultTotal =           400;
const STATID_LastViewedDoshVaultTotal = 401;
const STATID_DoshVaultProgress =		402;
const STATID_DoshVaultRecovered =		403;

 
const STATID_AchievementPlaceholder	 =	500;

 
const STATID_AnalyticsPlaceholder	 =		800;

 
const STATID_PersonalBest_KnifeKills =		2000;
const STATID_PersonalBest_PistolKills	 =	2001;
const STATID_PersonalBest_HeadShots	 =		2002;
const STATID_PersonalBest_Healing	 =		2003;
const STATID_PersonalBest_Kills	 =		2004;
const STATID_PersonalBest_Assists =			2005;
const STATID_PersonalBest_LargeZedKill =	2006;
const STATID_PersonalBest_Dosh =			2007;

 
const STATID_MatchWins =					3000;

 
const STATID_DingoAchievementStart	= 4000;
const STATID_ACHIEVE_MrPerky5		= 4001;
const STATID_ACHIEVE_MrPerky10		= 4002;
const STATID_ACHIEVE_MrPerky15		= 4003;
const STATID_ACHIEVE_MrPerky20		= 4004;
const STATID_ACHIEVE_MrPerky25		= 4005;

const STATID_ACHIEVE_HardWins		= 4015;
const STATID_ACHIEVE_SuicidalWins	= 4016;
const STATID_ACHIEVE_HellWins		= 4017;

const STATID_ACHIEVE_VSZedWins		= 4009;
const STATID_ACHIEVE_VSHumanWins	= 4010;

const STATID_ACHIEVE_HoldOut			= 4011;
const STATID_ACHIEVE_DieVolter			= 4012;
const STATID_ACHIEVE_FleshPoundKill		= 4013;
const STATID_ACHIEVE_ShrikeKill			= 4014;
const STATID_ACHIEVE_SirenKill			= 4018;
const STATID_ACHIEVE_Benefactor			= 4019;
const STATID_ACHIEVE_HealTeam			= 4020;
const STATID_ACHIEVE_QuickOnTheTrigger	= 4033;

const STATID_ACHIEVE_CollectCatacolmbs		= 4021;
const STATID_ACHIEVE_BioticsCollectibles	= 4022;
const STATID_ACHIEVE_EvacsCollectibles		= 4023;
const STATID_ACHIEVE_OutpostCollectibles	= 4024;
const STATID_ACHIEVE_PrisonCollectibles		= 4025;
const STATID_ACHIEVE_ManorCollectibles		= 4026;
const STATID_ACHIEVE_ParisCollectibles		= 4027;
const STATID_ACHIEVE_FarmhouseCollectibles	= 4028;
const STATID_ACHIEVE_BlackForestCollectibles= 4029;
const STATID_ACHIEVE_ContainmentStationCollectibles	= 4030;
const STATID_ACHIEVE_InfernalRealmCollectibles		= 4031;
const STATID_ACHIEVE_HostileGroundsCollectibles		= 4032;
const STATID_ACHIEVE_ZedLandingCollectibles			= 4035;
const STATID_ACHIEVE_DescentCollectibles			= 4036;
const STATID_ACHIEVE_NukedCollectibles				= 4037;
const STATID_ACHIEVE_TragicKingdomCollectibles		= 4038;
const STATID_ACHIEVE_NightmareCollectibles			= 4039;
const STATID_ACHIEVE_KrampusCollectibles			= 4040;
const STATID_ACHIEVE_ArenaCollectibles				= 4041;
const STATID_ACHIEVE_PowercoreCollectibles			= 4042;
const STATID_ACHIEVE_AirshipCollectibles			= 4043;
const STATID_ACHIEVE_LockdownCollectibles			= 4044;
const STATID_ACHIEVE_MonsterBallCollectibles		= 4045;
const STATID_ACHIEVE_MonsterBallSecretRoom			= 4046;
const STATID_ACHIEVE_SantasWorkshopCollectibles		= 4047;
const STATID_ACHIEVE_ShoppingSpreeCollectibles		= 4048;
const STATID_ACHIEVE_SpillwayCollectibles			= 4049;
const STATID_ACHIEVE_SteamFortressCollectibles		= 4050;
const STATID_ACHIEVE_AsylumCollectibles				= 4051;
const STATID_ACHIEVE_SanitariumCollectibles			= 4052;
const STATID_ACHIEVE_DefeatMatriarch				= 4053;
const STATID_ACHIEVE_BiolapseCollectibles			= 4054;
const STATID_ACHIEVE_DesolationCollectibles			= 4055;
const STATID_ACHIEVE_HellmarkStationCollectibles	= 4056;
const STATID_ACHIEVE_ElysiumEndlessWaveFifteen	    = 4057;
const STATID_ACHIEVE_Dystopia2029Collectibles       = 4058;
 
#linenumber 14;


/** The owning subsystem that this object is providing an implementation for */
var OnlineSubsystemDingo OwningSubsystem;

/** The stats interface will cancel any profile read that takes longer than this timeout */
var config float ReadProfileAsyncTimeout;

/** Track the current stats read so we don't allow more than one in-flight at a time */
var init array<native pointer> CurrentStatsRead{class FDingoAsyncTaskReadOnlineStats};

/** This is the list of delegates requesting notification when a stats read finishes */
var array<delegate<OnReadOnlineStatsComplete> > ReadOnlineStatsCompleteDelegates;

/** Used to initialize ETW events for stats */
var bool  EventsRegistered;

enum RealTimeActivityConnectionStatus
{
	RTA_NotConnected,
	RTA_Connecting,
	RTA_Connected
};

struct native RealTimeActivitySubscriptionData
{
	var UniqueNetId PlayerNetId;
	var name StatName;
	var delegate<OnStatisticChanged> OnStatisticChanged;
	//var native hatpointer RTAStatisticChangeSubscription{Microsoft::Xbox::Services::RealTimeActivity::RealTimeActivityStatisticChangeSubscription};
};

struct native XboxLiveContextPlayerData
{
	var native hatpointer LiveContext{Microsoft::Xbox::Services::XboxLiveContext};
    var UniqueNetId PlayerNetId;
    var Guid PlayerSessionGuid;

	var RealTimeActivityConnectionStatus MultiplayerSubscriptionStatus;
	var RealTimeActivityConnectionStatus RTAConnectionStatus;
	var array<RealTimeActivitySubscriptionData> RTASubscriptions;
	//var native array<hatpointer> QueuedRTAChangeEvents {Microsoft::Xbox::Services::RealTimeActivity::RealTimeActivityStatisticChangeEventArgs};

	var qword StatisticChangedTokenKey;
	var qword WebSocketClosedTokenKey;

	structcpptext
	{
		FXboxLiveContextPlayerData()
		{
			appMemzero(this, sizeof(FXboxLiveContextPlayerData));
		}

		void SubscribeToStatisticEvent(FUniqueNetId PlayerNetId, FName StatName, FScriptDelegate EventDelegate);
		void UnsubscribeToStatisticEvent(FUniqueNetId PlayerNetId, FName StatName);
		void Update();

		private:
		void ConnectToRTAService();
		void OnRTAConnect();
		void OnRTADisconnect();
		//void OnRTAStatisticChanged(Microsoft::Xbox::Services::RealTimeActivity::RealTimeActivityStatisticChangeEventArgs^ args);
		void OnRTAWebSocketClosed(Windows::Networking::Sockets::WebSocketClosedEventArgs^ args);
		void SubscribeToRTA(FRealTimeActivitySubscriptionData& SubscriptionData);
		void UnsubscribeToRTA(FRealTimeActivitySubscriptionData& SubscriptionData);

		static FCriticalSection RTACriticalSection;

		public:
	}
};

var native map{QWORD, FXboxLiveContextPlayerData} PlayerXboxLiveContextMap;


/**
 * Notifies the interested party that the last stats read has completed
 *
 * @param bWasSuccessful true if the async action completed without error, false if there was an error
 */
delegate OnReadOnlineStatsComplete(bool bWasSuccessful);

/**
 * Reads a set of stats for a player
 *
 * @param LocalUserNum the local player having their stats queried
 * @param StatsRead holds the names of the stats to be queried and
 *		  results are copied into the specified object
 *
 * @return TRUE if the call is successful, FALSE otherwise
 */
native function bool ReadOnlineStatsForPlayer(byte LocalUserNum, OnlineStatsRead StatsRead);

/**
 * Reads a set of stats for the specified list of players
 *
 * @param Players the array of unique ids to read stats for
 * @param StatsRead holds the definitions of the tables to read the data from and
 *		  results are copied into the specified object
 *
 * @return TRUE if the call is successful, FALSE otherwise
 */
native function bool ReadOnlineStats(byte LocalUserNum, const out array<UniqueNetId> Players,OnlineStatsRead StatsRead);

/**
 * Reads a player's stats and all of that player's friends stats for the
 * specified set of stat views. This allows you to easily compare a player's
 * stats to their friends.
 *
 * @param LocalUserNum the local player having their stats and friend's stats read for
 * @param StatsRead holds the definitions of the tables to read the data from and
 *		  results are copied into the specified object
 *
 * @return TRUE if the call is successful, FALSE otherwise
 */
native function bool ReadOnlineStatsForFriends(byte LocalUserNum,OnlineStatsRead StatsRead, optional bool FavoriteFriendsOnly=false, optional int NumToRead = 100);

/**
 * Reads stats by ranking. This grabs the rows starting at StartIndex through
 * NumToRead and places them in the StatsRead object.
 *
 * @param StatsRead holds the definitions of the tables to read the data from and
 *		  results are copied into the specified object
 * @param StartIndex the starting rank to begin reads at (1 for top)
 * @param NumToRead the number of rows to read (clamped at 100 underneath)
 *
 * @return TRUE if the call is successful, FALSE otherwise
 */
native function bool ReadOnlineStatsByRank(byte LocalUserNum, OnlineStatsRead StatsRead,optional int StartIndex = 1,optional int NumToRead = 100);

/**
 * Reads stats by ranking centered around a player. This grabs a set of rows
 * above and below the player's current rank
 *
 * @param LocalUserNum the local player having their stats being centered upon
 * @param StatsRead holds the definitions of the tables to read the data from and
 *		  results are copied into the specified object
 * @param NumRows the number of rows to read above and below the player's rank
 *
 * @return TRUE if the call is successful, FALSE otherwise
 */
native function bool ReadOnlineStatsByRankAroundPlayer(byte LocalUserNum,OnlineStatsRead StatsRead,optional int NumRows = 10);

/**
 * Adds the delegate to a list used to notify the gameplay code that the stats read has completed
 *
 * @param ReadOnlineStatsCompleteDelegate the delegate to use for notifications
 */
function AddReadOnlineStatsCompleteDelegate(delegate<OnReadOnlineStatsComplete> ReadOnlineStatsCompleteDelegate)
{
	if (ReadOnlineStatsCompleteDelegates.Find(ReadOnlineStatsCompleteDelegate) == INDEX_NONE)
	{
		ReadOnlineStatsCompleteDelegates.AddItem(ReadOnlineStatsCompleteDelegate);
	}
}

/**
 * Removes the delegate from the notify list
 *
 * @param ReadOnlineStatsCompleteDelegate the delegate to use for notifications
 */
function ClearReadOnlineStatsCompleteDelegate(delegate<OnReadOnlineStatsComplete> ReadOnlineStatsCompleteDelegate)
{
	local int RemoveIndex;
	// Find it in the list
	RemoveIndex = ReadOnlineStatsCompleteDelegates.Find(ReadOnlineStatsCompleteDelegate);
	// Only remove if found
	if (RemoveIndex != INDEX_NONE)
	{
		ReadOnlineStatsCompleteDelegates.Remove(RemoveIndex,1);
	}
}

/**
 * Cleans up any platform specific allocated data contained in the stats data
 *
 * @param StatsRead the object to handle per platform clean up on
 */
native function FreeStats(OnlineStatsRead StatsRead);

/**
 * Writes out the stats contained within the stats write object to the online
 * subsystem's cache of stats data. Note the new data replaces the old. It does
 * not write the data to the permanent storage until a FlushOnlineStats() call
 * or a session ends. Stats cannot be written without a session or the write
 * request is ignored. No more than 5 stats views can be written to at a time
 * or the write request is ignored.
 *
 * @param SessionName the name of the session to write stats for
 * @param Player the player to write stats for
 * @param StatsWrite the object containing the information to write
 *
 * @return TRUE if the call is successful, FALSE otherwise
 */
native function bool WriteOnlineStats(name SessionName, UniqueNetId Player, OnlineStatsWrite StatsWrite);

/**
 * Commits any changes in the online stats cache to the permanent storage
 *
 * @param SessionName the name of the session having stats flushed
 *
 * @return TRUE if the call is successful, FALSE otherwise
 */
function bool FlushOnlineStats(name SessionName)
{
}

/**
 * Delegate called when the stats flush operation has completed
 *
 * @param SessionName the name of the session having stats flushed
 * @param bWasSuccessful true if the async action completed without error, false if there was an error
 */
delegate OnFlushOnlineStatsComplete(name SessionName,bool bWasSuccessful);

/**
 * Adds the delegate used to notify the gameplay code that the stats flush has completed
 *
 * @param FlushOnlineStatsCompleteDelegate the delegate to use for notifications
 */
function AddFlushOnlineStatsCompleteDelegate(delegate<OnFlushOnlineStatsComplete> FlushOnlineStatsCompleteDelegate)
{
}

/**
 * Clears the delegate used to notify the gameplay code that the stats flush has completed
 *
 * @param FlushOnlineStatsCompleteDelegate the delegate to use for notifications
 */
function ClearFlushOnlineStatsCompleteDelegate(delegate<OnFlushOnlineStatsComplete> FlushOnlineStatsCompleteDelegate)
{
}

/**
 * Writes the score data for the match
 *
 * @param SessionName the name of the session to write scores for
 * @param LeaderboardId the leaderboard to write the score information to
 * @param PlayerScores the list of players, teams, and scores they earned
 *
 * @return TRUE if the call is successful, FALSE otherwise
 */
function bool WriteOnlinePlayerScores(name SessionName,int LeaderboardId,const out array<OnlinePlayerScore> PlayerScores)
{
}

/**
 * Reads the host's stat guid for synching up stats. Only valid on the host.
 *
 * @return the host's stat guid
 */
function string GetHostStatGuid();

/**
 * Registers the host's stat guid with the client for verification they are part of
 * the stat. Note this is an async task for any backend communication that needs to
 * happen before the registration is deemed complete
 *
 * @param HostStatGuid the host's stat guid
 *
 * @return TRUE if the call is successful, FALSE otherwise
 */
function bool RegisterHostStatGuid(const out string HostStatGuid);

/**
 * Called when the host stat guid registration is complete
 *
 * @param bWasSuccessful whether the registration has completed or not
 */
delegate OnRegisterHostStatGuidComplete(bool bWasSuccessful);

/**
 * Adds the delegate for notifying when the host guid registration is done
 *
 * @param RegisterHostStatGuidCompleteDelegate the delegate to use for notifications
 */
function AddRegisterHostStatGuidCompleteDelegate(delegate<OnRegisterHostStatGuidComplete> RegisterHostStatGuidCompleteDelegate);

/**
 * Clears the delegate used to notify the gameplay code
 *
 * @param RegisterHostStatGuidCompleteDelegate the delegate to use for notifications
 */
function ClearRegisterHostStatGuidCompleteDelegateDelegate(delegate<OnRegisterHostStatGuidComplete> RegisterHostStatGuidCompleteDelegate);

/**
 * Reads the client's stat guid that was generated by registering the host's guid
 * Used for synching up stats. Only valid on the client. Only callable after the
 * host registration has completed
 *
 * @return the client's stat guid
 */
function string GetClientStatGuid();

/**
 * Registers the client's stat guid on the host to validate that the client was in the stat.
 * Used for synching up stats. Only valid on the host.
 *
 * @param PlayerId the client's unique net id
 * @param ClientStatGuid the client's stat guid
 *
 * @return TRUE if the call is successful, FALSE otherwise
 */
function bool RegisterStatGuid(UniqueNetId PlayerId,const out string ClientStatGuid);

/**
 * Calculates the aggregate skill from an array of skills.
 *
 * @param Mus - array that holds the mu values
 * @param Sigmas - array that holds the sigma values
 * @param OutAggregateMu - aggregate Mu
 * @param OutAggregateSigma - aggregate Sigma
 */
function CalcAggregateSkill(array<double> Mus, array<double> Sigmas, out double OutAggregateMu, out double OutAggregateSigma);

/**
 * Delegate used when an event subscription is notified
 *
 * @param PlayerNetId: the player whos stat change caused the event to occur
 * @param StatName: the name of the stat that changed
 * @param NewStatValue: the new value of that stat
 */
delegate OnStatisticChanged(UniqueNetId PlayerNetId, name StatName, string NewStatValue);

/**
 * Subscribe and unsubscribe from RTA events.
 * Unfortunately these need to be tied to a User on the recieving end too since that is how the API is defined.
 *
 * @param LocalUserNum: the user that will be subscribed to listen for stat-event changes
 * @param PlayerNetId: the (probably remote) player whos events we want to listen for
 * @param StatName: the name of the stat that we want to get events for
 * @param EventDelegate: the delegate that will be notified when a stat event occurs
 */
native function SubscribeToStatisticEvent(byte LocalUserNum, UniqueNetId PlayerNetId, name StatName, delegate<OnStatisticChanged> EventDelegate);
native function UnsubscribeToStatisticEvent(byte LocalUserNum, UniqueNetId PlayerNetId, name StatName);

//@HSL_BEGIN_XBOX - JRO - 1/23/2015 - Adding game events to update stats
function bool SendPlayerSessionStart(byte LocalUserNum, string MultiplayerCorrelationId, int GameplayModeId, int DifficultyLevelId);
function bool SendPlayerSessionEnd(byte LocalUserNum, string MultiplayerCorrelationId, int GameplayModeId, int DifficultyLevelId, int ExitStatusId);
function bool SendPlayerSessionPause(byte LocalUserNum, string MultiplayerCorrelationId);
function bool SendPlayerSessionResume(byte LocalUserNum, string MultiplayerCorrelationId, int GameplayModeId, int DifficultyLevelId);
function bool SendTestEvent(byte LocalUserNum, string TestStatInstancing, int TestStatParameter);
//@HSL_END_XBOX


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
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   Name="Default__OnlineStatsInterfaceDingo"
   ObjectArchetype=Object'Core.Default__Object'
}
