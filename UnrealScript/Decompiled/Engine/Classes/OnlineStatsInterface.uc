/*******************************************************************************
 * OnlineStatsInterface generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
interface OnlineStatsInterface extends Interface
    abstract;

function bool ReadOnlineStatsForPlayer(byte LocalUserNum, OnlineStatsRead StatsRead);

function bool ReadOnlineStats(byte LocalUserNum, const out array<UniqueNetId> Players, OnlineStatsRead StatsRead);

function bool ReadOnlineStatsForFriends(byte LocalUserNum, OnlineStatsRead StatsRead, optional bool FavoriteFriendsOnly, optional int NumToRead)
{
    FavoriteFriendsOnly = false;
    NumToRead = 100;
}

function bool ReadOnlineStatsByRank(byte LocalUserNum, OnlineStatsRead StatsRead, optional int StartIndex, optional int NumToRead)
{
    StartIndex = 1;
    NumToRead = 100;
}

function bool ReadOnlineStatsByRankAroundPlayer(byte LocalUserNum, OnlineStatsRead StatsRead, optional int NumRows)
{
    NumRows = 10;
}

delegate OnReadOnlineStatsComplete(bool bWasSuccessful);

function AddReadOnlineStatsCompleteDelegate(delegate<OnReadOnlineStatsComplete> ReadOnlineStatsCompleteDelegate);

function ClearReadOnlineStatsCompleteDelegate(delegate<OnReadOnlineStatsComplete> ReadOnlineStatsCompleteDelegate);

function FreeStats(OnlineStatsRead StatsRead);

function bool WriteOnlineStats(name SessionName, UniqueNetId Player, OnlineStatsWrite StatsWrite);

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

function SubscribeToStatisticEvent(byte LocalUserNum, UniqueNetId PlayerNetId, name StatName, delegate<OnStatisticChanged> EventDelegate);

function UnsubscribeToStatisticEvent(byte LocalUserNum, UniqueNetId PlayerNetId, name StatName);

function bool SendPlayerSessionStart(byte LocalUserNum, string MultiplayerCorrelationId, int GameplayModeId, int DifficultyLevelId);

function bool SendPlayerSessionEnd(byte LocalUserNum, string MultiplayerCorrelationId, int GameplayModeId, int DifficultyLevelId, int ExitStatusId);

function bool SendPlayerSessionPause(byte LocalUserNum, string MultiplayerCorrelationId);

function bool SendPlayerSessionResume(byte LocalUserNum, string MultiplayerCorrelationId, int GameplayModeId, int DifficultyLevelId);

function bool SendTestEvent(byte LocalUserNum, string TestStatInstancing, int TestStatParameter);
