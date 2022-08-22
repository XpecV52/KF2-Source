/*******************************************************************************
 * OnlineGameInterfaceImpl generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class OnlineGameInterfaceImpl extends Object within OnlineSubsystemCommonImpl
    native
    config(Engine)
    implements(OnlineGameInterface);

var private native const noexport Pointer VfTable_IOnlineGameInterface;
var OnlineSubsystemCommonImpl OwningSubsystem;
var const OnlineGameSettings GameSettings;
var const OnlineGameSearch GameSearch;
var array< delegate<OnCreateOnlineGameComplete> > CreateOnlineGameCompleteDelegates;
var array< delegate<OnUpdateOnlineGameComplete> > UpdateOnlineGameCompleteDelegates;
var array< delegate<OnDestroyOnlineGameComplete> > DestroyOnlineGameCompleteDelegates;
var array< delegate<OnJoinOnlineGameComplete> > JoinOnlineGameCompleteDelegates;
var array< delegate<OnMigrateOnlineGameComplete> > MigrateOnlineGameCompleteDelegates;
var array< delegate<OnJoinMigratedOnlineGameComplete> > JoinMigratedOnlineGameCompleteDelegates;
var array< delegate<OnRecalculateSkillRatingComplete> > RecalculateSkillRatingCompleteDelegates;
var array< delegate<OnStartOnlineGameComplete> > StartOnlineGameCompleteDelegates;
var array< delegate<OnEndOnlineGameComplete> > EndOnlineGameCompleteDelegates;
var array< delegate<OnFindOnlineGamesComplete> > FindOnlineGamesCompleteDelegates;
var array< delegate<OnCancelFindOnlineGamesComplete> > CancelFindOnlineGamesCompleteDelegates;
var const Engine.OnlineSubsystem.ELanBeaconState LanBeaconState;
var const byte LanNonce[8];
var const config int LanAnnouncePort;
var const config int LanGameUniqueId;
var const config int LanPacketPlatformMask;
var float LanQueryTimeLeft;
var config float LanQueryTimeout;
var native const transient Pointer LanBeacon;
var private native const transient Pointer SessionInfo;
var array<string> PendingMembersToInvite;
var delegate<OnFindOnlineGamesComplete> __OnFindOnlineGamesComplete__Delegate;
var delegate<OnCreateOnlineGameComplete> __OnCreateOnlineGameComplete__Delegate;
var delegate<OnUpdateOnlineGameComplete> __OnUpdateOnlineGameComplete__Delegate;
var delegate<OnDestroyOnlineGameComplete> __OnDestroyOnlineGameComplete__Delegate;
var delegate<OnCancelFindOnlineGamesComplete> __OnCancelFindOnlineGamesComplete__Delegate;
var delegate<OnJoinOnlineGameComplete> __OnJoinOnlineGameComplete__Delegate;
var delegate<OnRegisterPlayerComplete> __OnRegisterPlayerComplete__Delegate;
var delegate<OnUnregisterPlayerComplete> __OnUnregisterPlayerComplete__Delegate;
var delegate<OnRetrievedGameSettingsForIP> __OnRetrievedGameSettingsForIP__Delegate;
var delegate<OnStartOnlineGameComplete> __OnStartOnlineGameComplete__Delegate;
var delegate<OnEndOnlineGameComplete> __OnEndOnlineGameComplete__Delegate;
var delegate<OnArbitrationRegistrationComplete> __OnArbitrationRegistrationComplete__Delegate;
var delegate<OnGameInviteAccepted> __OnGameInviteAccepted__Delegate;
var delegate<OnPlayTogetherStarted> __OnPlayTogetherStarted__Delegate;
var delegate<OnRecalculateSkillRatingComplete> __OnRecalculateSkillRatingComplete__Delegate;
var delegate<OnMigrateOnlineGameComplete> __OnMigrateOnlineGameComplete__Delegate;
var delegate<OnJoinMigratedOnlineGameComplete> __OnJoinMigratedOnlineGameComplete__Delegate;
var delegate<OnQosStatusChanged> __OnQosStatusChanged__Delegate;
var delegate<OnGetNumberOfCurrentPlayersComplete> __OnGetNumberOfCurrentPlayersComplete__Delegate;
var delegate<OnGetRoomIdFromTitleService> __OnGetRoomIdFromTitleService__Delegate;
var delegate<OnGetPlayerListComplete> __OnGetPlayerListComplete__Delegate;

delegate OnFindOnlineGamesComplete(bool bWasSuccessful);

function OnlineGameSettings GetGameSettings(name SessionName)
{
    return GameSettings;
}

function OnlineGameSearch GetGameSearch()
{
    return GameSearch;
}

// Export UOnlineGameInterfaceImpl::execGetGameServerRemoteAddress(FFrame&, void* const)
native function bool GetGameServerRemoteAddress(out string RemoteAddressString);

// Export UOnlineGameInterfaceImpl::execCreateOnlineGame(FFrame&, void* const)
native function bool CreateOnlineGame(byte HostingPlayerNum, name SessionName, OnlineGameSettings NewGameSettings);

delegate OnCreateOnlineGameComplete(name SessionName, bool bWasSuccessful);

function AddCreateOnlineGameCompleteDelegate(delegate<OnCreateOnlineGameComplete> CreateOnlineGameCompleteDelegate)
{
    if(CreateOnlineGameCompleteDelegates.Find(CreateOnlineGameCompleteDelegate == -1)
    {
        CreateOnlineGameCompleteDelegates[CreateOnlineGameCompleteDelegates.Length] = CreateOnlineGameCompleteDelegate;
    }
}

function ClearCreateOnlineGameCompleteDelegate(delegate<OnCreateOnlineGameComplete> CreateOnlineGameCompleteDelegate)
{
    local int RemoveIndex;

    RemoveIndex = CreateOnlineGameCompleteDelegates.Find(CreateOnlineGameCompleteDelegate;
    if(RemoveIndex != -1)
    {
        CreateOnlineGameCompleteDelegates.Remove(RemoveIndex, 1;
    }
}

function bool UpdateOnlineGame(name SessionName, OnlineGameSettings UpdatedGameSettings, optional bool bShouldRefreshOnlineData)
{
    bShouldRefreshOnlineData = false;
}

delegate OnUpdateOnlineGameComplete(name SessionName, bool bWasSuccessful);

function AddUpdateOnlineGameCompleteDelegate(delegate<OnUpdateOnlineGameComplete> UpdateOnlineGameCompleteDelegate)
{
    if(UpdateOnlineGameCompleteDelegates.Find(UpdateOnlineGameCompleteDelegate == -1)
    {
        UpdateOnlineGameCompleteDelegates[UpdateOnlineGameCompleteDelegates.Length] = UpdateOnlineGameCompleteDelegate;
    }
}

function ClearUpdateOnlineGameCompleteDelegate(delegate<OnUpdateOnlineGameComplete> UpdateOnlineGameCompleteDelegate)
{
    local int RemoveIndex;

    RemoveIndex = UpdateOnlineGameCompleteDelegates.Find(UpdateOnlineGameCompleteDelegate;
    if(RemoveIndex != -1)
    {
        UpdateOnlineGameCompleteDelegates.Remove(RemoveIndex, 1;
    }
}

// Export UOnlineGameInterfaceImpl::execDestroyOnlineGame(FFrame&, void* const)
native function bool DestroyOnlineGame(name SessionName);

delegate OnDestroyOnlineGameComplete(name SessionName, bool bWasSuccessful);

function AddDestroyOnlineGameCompleteDelegate(delegate<OnDestroyOnlineGameComplete> DestroyOnlineGameCompleteDelegate)
{
    if(DestroyOnlineGameCompleteDelegates.Find(DestroyOnlineGameCompleteDelegate == -1)
    {
        DestroyOnlineGameCompleteDelegates[DestroyOnlineGameCompleteDelegates.Length] = DestroyOnlineGameCompleteDelegate;
    }
}

function ClearDestroyOnlineGameCompleteDelegate(delegate<OnDestroyOnlineGameComplete> DestroyOnlineGameCompleteDelegate)
{
    local int RemoveIndex;

    RemoveIndex = DestroyOnlineGameCompleteDelegates.Find(DestroyOnlineGameCompleteDelegate;
    if(RemoveIndex != -1)
    {
        DestroyOnlineGameCompleteDelegates.Remove(RemoveIndex, 1;
    }
}

// Export UOnlineGameInterfaceImpl::execFindOnlineGames(FFrame&, void* const)
native function bool FindOnlineGames(byte SearchingPlayerNum, OnlineGameSearch SearchSettings);

function AddFindOnlineGamesCompleteDelegate(delegate<OnFindOnlineGamesComplete> FindOnlineGamesCompleteDelegate)
{
    if(FindOnlineGamesCompleteDelegates.Find(FindOnlineGamesCompleteDelegate == -1)
    {
        FindOnlineGamesCompleteDelegates[FindOnlineGamesCompleteDelegates.Length] = FindOnlineGamesCompleteDelegate;
    }
}

function ClearFindOnlineGamesCompleteDelegate(delegate<OnFindOnlineGamesComplete> FindOnlineGamesCompleteDelegate)
{
    local int RemoveIndex;

    RemoveIndex = FindOnlineGamesCompleteDelegates.Find(FindOnlineGamesCompleteDelegate;
    if(RemoveIndex != -1)
    {
        FindOnlineGamesCompleteDelegates.Remove(RemoveIndex, 1;
    }
}

// Export UOnlineGameInterfaceImpl::execCancelFindOnlineGames(FFrame&, void* const)
native function bool CancelFindOnlineGames();

delegate OnCancelFindOnlineGamesComplete(bool bWasSuccessful);

function AddCancelFindOnlineGamesCompleteDelegate(delegate<OnCancelFindOnlineGamesComplete> CancelFindOnlineGamesCompleteDelegate)
{
    if(CancelFindOnlineGamesCompleteDelegates.Find(CancelFindOnlineGamesCompleteDelegate == -1)
    {
        CancelFindOnlineGamesCompleteDelegates[CancelFindOnlineGamesCompleteDelegates.Length] = CancelFindOnlineGamesCompleteDelegate;
    }
}

function ClearCancelFindOnlineGamesCompleteDelegate(delegate<OnCancelFindOnlineGamesComplete> CancelFindOnlineGamesCompleteDelegate)
{
    local int RemoveIndex;

    RemoveIndex = CancelFindOnlineGamesCompleteDelegates.Find(CancelFindOnlineGamesCompleteDelegate;
    if(RemoveIndex != -1)
    {
        CancelFindOnlineGamesCompleteDelegates.Remove(RemoveIndex, 1;
    }
}

// Export UOnlineGameInterfaceImpl::execFreeSearchResults(FFrame&, void* const)
native function bool FreeSearchResults(OnlineGameSearch Search);

// Export UOnlineGameInterfaceImpl::execJoinOnlineGame(FFrame&, void* const)
native function bool JoinOnlineGame(byte PlayerNum, name SessionName, const out OnlineGameSearchResult DesiredGame);

function bool JoinOnlineGameByMatchingParams(QWord RoomId, out OnlineGameSettings JoinedGameSettings);

function bool IsJoinOperationInProgress()
{
    return false;
}

function bool SetRankedReadyStatus(bool bReady);

function bool IsCurrentRoomOwner()
{
    return false;
}

delegate OnJoinOnlineGameComplete(name SessionName, bool bWasSuccessful);

function AddJoinOnlineGameCompleteDelegate(delegate<OnJoinOnlineGameComplete> JoinOnlineGameCompleteDelegate)
{
    if(JoinOnlineGameCompleteDelegates.Find(JoinOnlineGameCompleteDelegate == -1)
    {
        JoinOnlineGameCompleteDelegates[JoinOnlineGameCompleteDelegates.Length] = JoinOnlineGameCompleteDelegate;
    }
}

function ClearJoinOnlineGameCompleteDelegate(delegate<OnJoinOnlineGameComplete> JoinOnlineGameCompleteDelegate)
{
    local int RemoveIndex;

    RemoveIndex = JoinOnlineGameCompleteDelegates.Find(JoinOnlineGameCompleteDelegate;
    if(RemoveIndex != -1)
    {
        JoinOnlineGameCompleteDelegates.Remove(RemoveIndex, 1;
    }
}

// Export UOnlineGameInterfaceImpl::execGetResolvedConnectString(FFrame&, void* const)
native function bool GetResolvedConnectString(name SessionName, out string ConnectInfo);

function bool RegisterPlayer(name SessionName, UniqueNetId PlayerID, bool bWasInvited);

function bool RegisterPlayers(name SessionName, const out array<UniqueNetId> Players);

delegate OnRegisterPlayerComplete(name SessionName, UniqueNetId PlayerID, bool bWasSuccessful);

function AddRegisterPlayerCompleteDelegate(delegate<OnRegisterPlayerComplete> RegisterPlayerCompleteDelegate);

function ClearRegisterPlayerCompleteDelegate(delegate<OnRegisterPlayerComplete> RegisterPlayerCompleteDelegate);

function bool UnregisterPlayer(name SessionName, UniqueNetId PlayerID);

function bool UnregisterPlayers(name SessionName, const out array<UniqueNetId> Players);

delegate OnUnregisterPlayerComplete(name SessionName, UniqueNetId PlayerID, bool bWasSuccessful);

function AddUnregisterPlayerCompleteDelegate(delegate<OnUnregisterPlayerComplete> UnregisterPlayerCompleteDelegate);

function ClearUnregisterPlayerCompleteDelegate(delegate<OnUnregisterPlayerComplete> UnregisterPlayerCompleteDelegate);

delegate OnRetrievedGameSettingsForIP(bool bSuccessful, const out OnlineGameSearchResult ConnectResult);

function AddOnRetrieveGameSettingsForIPDelegate(delegate<OnRetrievedGameSettingsForIP> NewRetrieveIPDelegate);

function ClearOnRetrieveGameSettingsForIPDelegate(delegate<OnRetrievedGameSettingsForIP> RetrieveIPDelegate);

function RetrieveGameSettingsForIP(string IPAddress);

// Export UOnlineGameInterfaceImpl::execStartOnlineGame(FFrame&, void* const)
native function bool StartOnlineGame(name SessionName);

delegate OnStartOnlineGameComplete(name SessionName, bool bWasSuccessful);

function AddStartOnlineGameCompleteDelegate(delegate<OnStartOnlineGameComplete> StartOnlineGameCompleteDelegate)
{
    if(StartOnlineGameCompleteDelegates.Find(StartOnlineGameCompleteDelegate == -1)
    {
        StartOnlineGameCompleteDelegates[StartOnlineGameCompleteDelegates.Length] = StartOnlineGameCompleteDelegate;
    }
}

function ClearStartOnlineGameCompleteDelegate(delegate<OnStartOnlineGameComplete> StartOnlineGameCompleteDelegate)
{
    local int RemoveIndex;

    RemoveIndex = StartOnlineGameCompleteDelegates.Find(StartOnlineGameCompleteDelegate;
    if(RemoveIndex != -1)
    {
        StartOnlineGameCompleteDelegates.Remove(RemoveIndex, 1;
    }
}

// Export UOnlineGameInterfaceImpl::execEndOnlineGame(FFrame&, void* const)
native function bool EndOnlineGame(name SessionName);

delegate OnEndOnlineGameComplete(name SessionName, bool bWasSuccessful);

function AddEndOnlineGameCompleteDelegate(delegate<OnEndOnlineGameComplete> EndOnlineGameCompleteDelegate)
{
    if(EndOnlineGameCompleteDelegates.Find(EndOnlineGameCompleteDelegate == -1)
    {
        EndOnlineGameCompleteDelegates[EndOnlineGameCompleteDelegates.Length] = EndOnlineGameCompleteDelegate;
    }
}

function ClearEndOnlineGameCompleteDelegate(delegate<OnEndOnlineGameComplete> EndOnlineGameCompleteDelegate)
{
    local int RemoveIndex;

    RemoveIndex = EndOnlineGameCompleteDelegates.Find(EndOnlineGameCompleteDelegate;
    if(RemoveIndex != -1)
    {
        EndOnlineGameCompleteDelegates.Remove(RemoveIndex, 1;
    }
}

function bool RegisterForArbitration(name SessionName);

delegate OnArbitrationRegistrationComplete(name SessionName, bool bWasSuccessful);

function AddArbitrationRegistrationCompleteDelegate(delegate<OnArbitrationRegistrationComplete> ArbitrationRegistrationCompleteDelegate);

function ClearArbitrationRegistrationCompleteDelegate(delegate<OnArbitrationRegistrationComplete> ArbitrationRegistrationCompleteDelegate);

function array<OnlineArbitrationRegistrant> GetArbitratedPlayers(name SessionName);

delegate OnGameInviteAccepted(const out OnlineGameSearchResult InviteResult, Engine.OnlineSubsystem.OnGameInviteAcceptedResult ResultReason);

function AddGameInviteAcceptedDelegate(byte LocalUserNum, delegate<OnGameInviteAccepted> GameInviteAcceptedDelegate);

function ClearGameInviteAcceptedDelegate(byte LocalUserNum, delegate<OnGameInviteAccepted> GameInviteAcceptedDelegate);

function bool AcceptGameInvite(byte LocalUserNum, name SessionName, const out OnlineGameSearchResult DesiredGame);

delegate OnPlayTogetherStarted();

function AddPlayTogetherStartedDelegate(byte LocalUserNum, delegate<OnPlayTogetherStarted> PlayTogetherStartedDelegate);

function ClearPlayTogetherStartedDelegate(byte LocalUserNum, delegate<OnPlayTogetherStarted> PlayTogetherStartedDelegate);

function array<string> GetPendingMembersToInvite()
{
    return PendingMembersToInvite;
}

function ResetPendingMembersToInvite()
{
    PendingMembersToInvite.Length = 0;
}

function SetPendingMembersToInvite(array<string> Members)
{
    PendingMembersToInvite = Members;
}

function bool RecalculateSkillRating(name SessionName, const out array<UniqueNetId> Players);

delegate OnRecalculateSkillRatingComplete(name SessionName, bool bWasSuccessful);

function AddRecalculateSkillRatingCompleteDelegate(delegate<OnRecalculateSkillRatingComplete> RecalculateSkillRatingCompleteDelegate);

function ClearRecalculateSkillRatingCompleteDelegate(delegate<OnRecalculateSkillRatingComplete> RecalculateSkillRatingGameCompleteDelegate);

function bool MigrateOnlineGame(byte HostingPlayerNum, name SessionName);

delegate OnMigrateOnlineGameComplete(name SessionName, bool bWasSuccessful);

function AddMigrateOnlineGameCompleteDelegate(delegate<OnMigrateOnlineGameComplete> MigrateOnlineGameCompleteDelegate)
{
    if(MigrateOnlineGameCompleteDelegates.Find(MigrateOnlineGameCompleteDelegate == -1)
    {
        MigrateOnlineGameCompleteDelegates.AddItem(MigrateOnlineGameCompleteDelegate;
    }
}

function ClearMigrateOnlineGameCompleteDelegate(delegate<OnMigrateOnlineGameComplete> MigrateOnlineGameCompleteDelegate)
{
    local int RemoveIndex;

    RemoveIndex = MigrateOnlineGameCompleteDelegates.Find(MigrateOnlineGameCompleteDelegate;
    if(RemoveIndex != -1)
    {
        MigrateOnlineGameCompleteDelegates.Remove(RemoveIndex, 1;
    }
}

function bool JoinMigratedOnlineGame(byte PlayerNum, name SessionName, const out OnlineGameSearchResult DesiredGame);

delegate OnJoinMigratedOnlineGameComplete(name SessionName, bool bWasSuccessful);

function AddJoinMigratedOnlineGameCompleteDelegate(delegate<OnJoinMigratedOnlineGameComplete> JoinMigratedOnlineGameCompleteDelegate)
{
    if(JoinMigratedOnlineGameCompleteDelegates.Find(JoinMigratedOnlineGameCompleteDelegate == -1)
    {
        JoinMigratedOnlineGameCompleteDelegates.AddItem(JoinMigratedOnlineGameCompleteDelegate;
    }
}

function ClearJoinMigratedOnlineGameCompleteDelegate(delegate<OnJoinMigratedOnlineGameComplete> JoinMigratedOnlineGameCompleteDelegate)
{
    local int RemoveIndex;

    RemoveIndex = JoinMigratedOnlineGameCompleteDelegates.Find(JoinMigratedOnlineGameCompleteDelegate;
    if(RemoveIndex != -1)
    {
        JoinMigratedOnlineGameCompleteDelegates.Remove(RemoveIndex, 1;
    }
}

function bool QueryNonAdvertisedData(int StartAt, int NumberToQuery);

// Export UOnlineGameInterfaceImpl::execReadPlatformSpecificSessionInfo(FFrame&, void* const)
native function bool ReadPlatformSpecificSessionInfo(const out OnlineGameSearchResult DesiredGame, out byte PlatformSpecificInfo[80]);

// Export UOnlineGameInterfaceImpl::execReadPlatformSpecificSessionInfoBySessionName(FFrame&, void* const)
native function bool ReadPlatformSpecificSessionInfoBySessionName(name SessionName, out byte PlatformSpecificInfo[80]);

function bool ReadSessionGuidBySessionName(name SessionName, out string SessionGuid);

// Export UOnlineGameInterfaceImpl::execBindPlatformSpecificSessionToSearch(FFrame&, void* const)
native function bool BindPlatformSpecificSessionToSearch(byte SearchingPlayerNum, OnlineGameSearch SearchSettings, byte PlatformSpecificInfo[80]);

function bool BindSessionGuidToSearch(byte SearchingPlayerNum, OnlineGameSearch SearchSettings, string SessionGuid);

delegate OnQosStatusChanged(int NumComplete, int NumTotal);

function AddQosStatusChangedDelegate(delegate<OnQosStatusChanged> QosStatusChangedDelegate);

function ClearQosStatusChangedDelegate(delegate<OnQosStatusChanged> QosStatusChangedDelegate);

function bool GetNumberOfCurrentPlayers();

function int GetNumberOfCurrentPlayersCached();

delegate OnGetNumberOfCurrentPlayersComplete(int TotalPlayers);

function AddGetNumberOfCurrentPlayersCompleteDelegate(delegate<OnGetNumberOfCurrentPlayersComplete> GetNumberOfCurrentPlayersCompleteDelegate);

function ClearGetNumberOfCurrentPlayersCompleteDelegate(delegate<OnGetNumberOfCurrentPlayersComplete> GetNumberOfCurrentPlayersCompleteDelegate);

function bool SendPlayerList(const array<PlayerReplicationInfo> Players);

function string GetRoomId();

delegate OnGetRoomIdFromTitleService(QWord RoomId);

function GetRoomIdFromTitleService(QWord DataId);

function GetRoomIdFromSessionId(string SessionId);

function AddGetRoomIdFromTitleServiceDelegate(delegate<OnGetRoomIdFromTitleService> InDelegate);

function ClearGetRoomIdFromTitleServiceDelegate(delegate<OnGetRoomIdFromTitleService> InDelegate);

function bool IsAllowedToNetworkHost()
{
    return true;
}

function RunBandwidthTest();

function SetMatchmakingTypeMode(Engine.OnlineGameInterface.ESteamMatchmakingType InMatchmakingTypeMode);

function bool AddSearchResultToFavorites(int Index);

function bool IsSearchResultInFavoritesList(int Index);

delegate OnGetPlayerListComplete(OnlineGameSettings PlayerListSettings, bool Success);

function AddGetPlayerListCompleteDelegate(delegate<OnGetPlayerListComplete> GetPlayerListCompleteDelegate);

function ClearGetPlayerListCompleteDelegate(delegate<OnGetPlayerListComplete> GetPlayerListCompleteDelegate);

function bool RemoveSearchResultFromFavorites(int Index);

function ClearOnlineDelegates()
{
    UpdateOnlineGameCompleteDelegates.Length = 0;
    DestroyOnlineGameCompleteDelegates.Length = 0;
    JoinOnlineGameCompleteDelegates.Length = 0;
    MigrateOnlineGameCompleteDelegates.Length = 0;
    JoinMigratedOnlineGameCompleteDelegates.Length = 0;
    RecalculateSkillRatingCompleteDelegates.Length = 0;
    StartOnlineGameCompleteDelegates.Length = 0;
    EndOnlineGameCompleteDelegates.Length = 0;
    FindOnlineGamesCompleteDelegates.Length = 0;
    CancelFindOnlineGamesCompleteDelegates.Length = 0;
}

defaultproperties
{
    LanAnnouncePort=14001
    LanGameUniqueId=948179132
    LanPacketPlatformMask=-1
    LanQueryTimeout=5
}