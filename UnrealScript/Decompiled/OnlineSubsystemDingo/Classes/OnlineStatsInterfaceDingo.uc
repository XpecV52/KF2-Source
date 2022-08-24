/*******************************************************************************
 * OnlineStatsInterfaceDingo generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class OnlineStatsInterfaceDingo extends Object within onlinesubsystemdingo
    native
    config(Engine)
    implements(OnlineStatsInterface);

const KFMAX_Perks = 10;
const VIEWID_KFGameStats = 1;
const STATID_None = 0;
const STATID_Cmdo_Progress = 1;
const STATID_Cmdo_Build = 2;
const STATID_Bsrk_Progress = 10;
const STATID_Bsrk_Build = 11;
const STATID_Sup_Progress = 20;
const STATID_Sup_Build = 21;
const STATID_Sup_WeldPoints = 22;
const STATID_Fire_Progress = 30;
const STATID_Fire_Build = 31;
const STATID_Medic_Progress = 40;
const STATID_Medic_Build = 41;
const STATID_Medic_HealPoints = 42;
const STATID_Shrp_Progress = 50;
const STATID_Shrp_Build = 51;
const STATID_Demo_Progress = 60;
const STATID_Demo_Build = 61;
const STATID_Surv_Progress = 70;
const STATID_Surv_Build = 71;
const STATID_Guns_Progress = 80;
const STATID_Guns_Build = 81;
const STATID_SWAT_Progress = 90;
const STATID_SWAT_Build = 91;
const STATID_Kills = 200;
const STATID_StalkerKills = 201;
const STATID_CrawlerKills = 202;
const STATID_FleshpoundKills = 203;
const STATID_SpecialEventProgress = 300;
const STATID_WeeklyEventProgress = 301;
const STATID_AchievementPlaceholder = 500;
const STATID_AnalyticsPlaceholder = 800;
const STATID_PersonalBest_KnifeKills = 2000;
const STATID_PersonalBest_PistolKills = 2001;
const STATID_PersonalBest_HeadShots = 2002;
const STATID_PersonalBest_Healing = 2003;
const STATID_PersonalBest_Kills = 2004;
const STATID_PersonalBest_Assists = 2005;
const STATID_PersonalBest_LargeZedKill = 2006;
const STATID_PersonalBest_Dosh = 2007;
const STATID_MatchWins = 3000;
const STATID_DingoAchievementStart = 4000;
const STATID_ACHIEVE_MrPerky5 = 4001;
const STATID_ACHIEVE_MrPerky10 = 4002;
const STATID_ACHIEVE_MrPerky15 = 4003;
const STATID_ACHIEVE_MrPerky20 = 4004;
const STATID_ACHIEVE_MrPerky25 = 4005;
const STATID_ACHIEVE_HardWins = 4015;
const STATID_ACHIEVE_SuicidalWins = 4016;
const STATID_ACHIEVE_HellWins = 4017;
const STATID_ACHIEVE_VSZedWins = 4009;
const STATID_ACHIEVE_VSHumanWins = 4010;
const STATID_ACHIEVE_HoldOut = 4011;
const STATID_ACHIEVE_DieVolter = 4012;
const STATID_ACHIEVE_FleshPoundKill = 4013;
const STATID_ACHIEVE_ShrikeKill = 4014;
const STATID_ACHIEVE_SirenKill = 4018;
const STATID_ACHIEVE_Benefactor = 4019;
const STATID_ACHIEVE_HealTeam = 4020;
const STATID_ACHIEVE_QuickOnTheTrigger = 4033;
const STATID_ACHIEVE_CollectCatacolmbs = 4021;
const STATID_ACHIEVE_BioticsCollectibles = 4022;
const STATID_ACHIEVE_EvacsCollectibles = 4023;
const STATID_ACHIEVE_OutpostCollectibles = 4024;
const STATID_ACHIEVE_PrisonCollectibles = 4025;
const STATID_ACHIEVE_ManorCollectibles = 4026;
const STATID_ACHIEVE_ParisCollectibles = 4027;
const STATID_ACHIEVE_FarmhouseCollectibles = 4028;
const STATID_ACHIEVE_BlackForestCollectibles = 4029;
const STATID_ACHIEVE_ContainmentStationCollectibles = 4030;
const STATID_ACHIEVE_InfernalRealmCollectibles = 4031;
const STATID_ACHIEVE_HostileGroundsCollectibles = 4032;
const STATID_ACHIEVE_ZedLandingCollectibles = 4035;
const STATID_ACHIEVE_DescentCollectibles = 4036;
const STATID_ACHIEVE_NukedCollectibles = 4037;
const STATID_ACHIEVE_TragicKingdomCollectibles = 4038;

enum RealTimeActivityConnectionStatus
{
    RTA_NotConnected,
    RTA_Connecting,
    RTA_Connected,
    RTA_MAX
};

struct native RealTimeActivitySubscriptionData
{
    var UniqueNetId PlayerNetId;
    var name StatName;
    var delegate<OnStatisticChanged> OnStatisticChanged;

    structdefaultproperties
    {
        PlayerNetId=(Uid=none)
        StatName=None
        Statis=None
    }
};

struct native XboxLiveContextPlayerData
{
    var native HatPointer LiveContext;
    var UniqueNetId PlayerNetId;
    var Guid PlayerSessionGuid;
    var OnlineStatsInterfaceDingo.RealTimeActivityConnectionStatus MultiplayerSubscriptionStatus;
    var OnlineStatsInterfaceDingo.RealTimeActivityConnectionStatus RTAConnectionStatus;
    var array<RealTimeActivitySubscriptionData> RTASubscriptions;
    var QWord StatisticChangedTokenKey;
    var QWord WebSocketClosedTokenKey;

    structdefaultproperties
    {
        PlayerNetId=(Uid=none)
        PlayerSessionGuid=(A=0,B=0,C=0,D=0)
        MultiplayerSubscriptionStatus=RealTimeActivityConnectionStatus.RTA_NotConnected
        RTAConnectionStatus=RealTimeActivityConnectionStatus.RTA_NotConnected
        RTASubscriptions=none
        StatisticChangedTokenKey=none
        WebSocketClosedTokenKey=none
    }
};

var onlinesubsystemdingo OwningSubsystem;
var config float ReadProfileAsyncTimeout;
var native Pointer CurrentStatsRead;
var array< delegate<OnReadOnlineStatsComplete> > ReadOnlineStatsCompleteDelegates;
var bool EventsRegistered;
var native map<0, 0> PlayerXboxLiveContextMap;
var delegate<OnReadOnlineStatsComplete> __OnReadOnlineStatsComplete__Delegate;
var delegate<OnFlushOnlineStatsComplete> __OnFlushOnlineStatsComplete__Delegate;
var delegate<OnRegisterHostStatGuidComplete> __OnRegisterHostStatGuidComplete__Delegate;
var delegate<OnStatisticChanged> __OnStatisticChanged__Delegate;

delegate OnReadOnlineStatsComplete(bool bWasSuccessful);

// Export UOnlineStatsInterfaceDingo::execReadOnlineStatsForPlayer(FFrame&, void* const)
native function bool ReadOnlineStatsForPlayer(byte LocalUserNum, OnlineStatsRead StatsRead);

// Export UOnlineStatsInterfaceDingo::execReadOnlineStats(FFrame&, void* const)
native function bool ReadOnlineStats(byte LocalUserNum, const out array<UniqueNetId> Players, OnlineStatsRead StatsRead);

// Export UOnlineStatsInterfaceDingo::execReadOnlineStatsForFriends(FFrame&, void* const)
native function bool ReadOnlineStatsForFriends(byte LocalUserNum, OnlineStatsRead StatsRead, optional bool FavoriteFriendsOnly, optional int NumToRead)
{
    FavoriteFriendsOnly = false;
    NumToRead = 100;                        
}

// Export UOnlineStatsInterfaceDingo::execReadOnlineStatsByRank(FFrame&, void* const)
native function bool ReadOnlineStatsByRank(byte LocalUserNum, OnlineStatsRead StatsRead, optional int StartIndex, optional int NumToRead)
{
    StartIndex = 1;
    NumToRead = 100;                        
}

// Export UOnlineStatsInterfaceDingo::execReadOnlineStatsByRankAroundPlayer(FFrame&, void* const)
native function bool ReadOnlineStatsByRankAroundPlayer(byte LocalUserNum, OnlineStatsRead StatsRead, optional int NumRows)
{
    NumRows = 10;                    
}

function AddReadOnlineStatsCompleteDelegate(delegate<OnReadOnlineStatsComplete> ReadOnlineStatsCompleteDelegate)
{
    if(ReadOnlineStatsCompleteDelegates.Find(ReadOnlineStatsCompleteDelegate == -1)
    {
        ReadOnlineStatsCompleteDelegates.AddItem(ReadOnlineStatsCompleteDelegate;
    }
}

function ClearReadOnlineStatsCompleteDelegate(delegate<OnReadOnlineStatsComplete> ReadOnlineStatsCompleteDelegate)
{
    local int RemoveIndex;

    RemoveIndex = ReadOnlineStatsCompleteDelegates.Find(ReadOnlineStatsCompleteDelegate;
    if(RemoveIndex != -1)
    {
        ReadOnlineStatsCompleteDelegates.Remove(RemoveIndex, 1;
    }
}

// Export UOnlineStatsInterfaceDingo::execFreeStats(FFrame&, void* const)
native function FreeStats(OnlineStatsRead StatsRead);

// Export UOnlineStatsInterfaceDingo::execWriteOnlineStats(FFrame&, void* const)
native function bool WriteOnlineStats(name SessionName, UniqueNetId Player, OnlineStatsWrite StatsWrite);

function bool FlushOnlineStats(name SessionName);

delegate OnFlushOnlineStatsComplete(name SessionName, bool bWasSuccessful);

function AddFlushOnlineStatsCompleteDelegate(delegate<OnFlushOnlineStatsComplete> FlushOnlineStatsCompleteDelegate);

function ClearFlushOnlineStatsCompleteDelegate(delegate<OnFlushOnlineStatsComplete> FlushOnlineStatsCompleteDelegate);

function bool WriteOnlinePlayerScores(name SessionName, int LeaderboardId, const out array<OnlinePlayerScore> PlayerScores);

function string GetHostStatGuid();

function bool RegisterHostStatGuid(const out string HostStatGuid);

delegate OnRegisterHostStatGuidComplete(bool bWasSuccessful);

function AddRegisterHostStatGuidCompleteDelegate(delegate<OnRegisterHostStatGuidComplete> RegisterHostStatGuidCompleteDelegate);

function ClearRegisterHostStatGuidCompleteDelegateDelegate(delegate<OnRegisterHostStatGuidComplete> RegisterHostStatGuidCompleteDelegate);

function string GetClientStatGuid();

function bool RegisterStatGuid(UniqueNetId PlayerID, const out string ClientStatGuid);

function CalcAggregateSkill(array<Double> Mus, array<Double> Sigmas, out Double OutAggregateMu, out Double OutAggregateSigma);

delegate OnStatisticChanged(UniqueNetId PlayerNetId, name StatName, string NewStatValue);

// Export UOnlineStatsInterfaceDingo::execSubscribeToStatisticEvent(FFrame&, void* const)
native function SubscribeToStatisticEvent(byte LocalUserNum, UniqueNetId PlayerNetId, name StatName, delegate<OnStatisticChanged> EventDelegate);

// Export UOnlineStatsInterfaceDingo::execUnsubscribeToStatisticEvent(FFrame&, void* const)
native function UnsubscribeToStatisticEvent(byte LocalUserNum, UniqueNetId PlayerNetId, name StatName);

function bool SendPlayerSessionStart(byte LocalUserNum, string MultiplayerCorrelationId, int GameplayModeId, int DifficultyLevelId);

function bool SendPlayerSessionEnd(byte LocalUserNum, string MultiplayerCorrelationId, int GameplayModeId, int DifficultyLevelId, int ExitStatusId);

function bool SendPlayerSessionPause(byte LocalUserNum, string MultiplayerCorrelationId);

function bool SendPlayerSessionResume(byte LocalUserNum, string MultiplayerCorrelationId, int GameplayModeId, int DifficultyLevelId);

function bool SendTestEvent(byte LocalUserNum, string TestStatInstancing, int TestStatParameter);
