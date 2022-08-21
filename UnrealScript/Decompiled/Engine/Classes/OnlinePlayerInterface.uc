/*******************************************************************************
 * OnlinePlayerInterface generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
interface OnlinePlayerInterface extends Interface
    abstract;

delegate OnLoginChange(byte LocalUserNum);

delegate OnLoginCancelled();

delegate OnMutingChange();

delegate OnFriendsChange();

function bool ShowLoginUI(optional bool bShowOnlineOnly)
{
    bShowOnlineOnly = false;
}

function bool Login(byte LocalUserNum, string LoginName, string Password, optional bool bWantsLocalOnly);

function bool AutoLogin();

delegate OnLoginFailed(byte LocalUserNum, OnlineSubsystem.EOnlineServerConnectionStatus ErrorCode);

function AddLoginFailedDelegate(byte LocalUserNum, delegate<OnLoginFailed> LoginDelegate);

function ClearLoginFailedDelegate(byte LocalUserNum, delegate<OnLoginFailed> LoginDelegate);

function bool Logout(byte LocalUserNum);

delegate OnLogoutCompleted(bool bWasSuccessful);

function AddLogoutCompletedDelegate(byte LocalUserNum, delegate<OnLogoutCompleted> LogoutDelegate);

function ClearLogoutCompletedDelegate(byte LocalUserNum, delegate<OnLogoutCompleted> LogoutDelegate);

function OnlineSubsystem.ELoginStatus GetLoginStatus(byte LocalUserNum);

function bool GetUniquePlayerId(byte LocalUserNum, out UniqueNetId PlayerID);

function string GetPlayerNickname(byte LocalUserNum);

function bool IsGuestLogin(byte LocalUserNum);

function bool IsLocalLogin(byte LocalUserNum);

delegate OnPrivilegeLevelChecked(byte LocalUserNum, OnlineSubsystem.EFeaturePrivilege Privilege, OnlineSubsystem.EFeaturePrivilegeLevel PrivilegeLevel);

function AddPrivilegeLevelCheckedDelegate(delegate<OnPrivilegeLevelChecked> PrivilegeDelegate);

function ClearPrivilegeLevelCheckedDelegate(delegate<OnPrivilegeLevelChecked> PrivilegeDelegate);

function OnlineSubsystem.EFeaturePrivilegeLevel CanPlayOnline(byte LocalUserNum);

function OnlineSubsystem.EFeaturePrivilegeLevel CanCommunicate(byte LocalUserNum);

function OnlineSubsystem.EFeaturePrivilegeLevel CanDownloadUserContent(byte LocalUserNum);

function OnlineSubsystem.EFeaturePrivilegeLevel CanPurchaseContent(byte LocalUserNum);

function OnlineSubsystem.EFeaturePrivilegeLevel CanViewPlayerProfiles(byte LocalUserNum);

function OnlineSubsystem.EFeaturePrivilegeLevel CanShowPresenceInformation(byte LocalUserNum);

function bool IsFriend(byte LocalUserNum, UniqueNetId PlayerID);

function bool AreAnyFriends(byte LocalUserNum, out array<FriendsQuery> Query);

function bool IsMuted(byte LocalUserNum, UniqueNetId PlayerID);

function bool ShowFriendsUI(byte LocalUserNum);

function AddLoginChangeDelegate(delegate<OnLoginChange> LoginDelegate);

function ClearLoginChangeDelegate(delegate<OnLoginChange> LoginDelegate);

delegate OnLoginStatusChange(OnlineSubsystem.ELoginStatus NewStatus, UniqueNetId NewId);

function AddLoginStatusChangeDelegate(delegate<OnLoginStatusChange> LoginStatusDelegate, byte LocalUserNum);

function ClearLoginStatusChangeDelegate(delegate<OnLoginStatusChange> LoginStatusDelegate, byte LocalUserNum);

function AddLoginCancelledDelegate(delegate<OnLoginCancelled> CancelledDelegate);

function ClearLoginCancelledDelegate(delegate<OnLoginCancelled> CancelledDelegate);

function AddMutingChangeDelegate(delegate<OnMutingChange> MutingDelegate);

function ClearMutingChangeDelegate(delegate<OnMutingChange> MutingDelegate);

function AddFriendsChangeDelegate(byte LocalUserNum, delegate<OnFriendsChange> FriendsDelegate);

function ClearFriendsChangeDelegate(byte LocalUserNum, delegate<OnFriendsChange> FriendsDelegate);

function bool ReadProfileSettings(byte LocalUserNum, OnlineProfileSettings ProfileSettings);

delegate OnReadProfileSettingsComplete(byte LocalUserNum, bool bWasSuccessful);

function AddReadProfileSettingsCompleteDelegate(byte LocalUserNum, delegate<OnReadProfileSettingsComplete> ReadProfileSettingsCompleteDelegate);

function ClearReadProfileSettingsCompleteDelegate(byte LocalUserNum, delegate<OnReadProfileSettingsComplete> ReadProfileSettingsCompleteDelegate);

function OnlineProfileSettings GetProfileSettings(byte LocalUserNum);

function bool WriteProfileSettings(byte LocalUserNum, OnlineProfileSettings ProfileSettings);

delegate OnWriteProfileSettingsComplete(byte LocalUserNum, bool bWasSuccessful);

function AddWriteProfileSettingsCompleteDelegate(byte LocalUserNum, delegate<OnWriteProfileSettingsComplete> WriteProfileSettingsCompleteDelegate);

function ClearWriteProfileSettingsCompleteDelegate(byte LocalUserNum, delegate<OnWriteProfileSettingsComplete> WriteProfileSettingsCompleteDelegate);

function bool ReadPlayerStorage(byte LocalUserNum, OnlinePlayerStorage PlayerStorage, optional int DeviceID)
{
    DeviceID = -1;
}

delegate OnReadPlayerStorageComplete(byte LocalUserNum, bool bWasSuccessful);

function AddReadPlayerStorageCompleteDelegate(byte LocalUserNum, delegate<OnReadPlayerStorageComplete> ReadPlayerStorageCompleteDelegate);

function ClearReadPlayerStorageCompleteDelegate(byte LocalUserNum, delegate<OnReadPlayerStorageComplete> ReadPlayerStorageCompleteDelegate);

function bool ReadPlayerStorageForNetId(byte LocalUserNum, UniqueNetId NetId, OnlinePlayerStorage PlayerStorage);

delegate OnReadPlayerStorageForNetIdComplete(UniqueNetId NetId, bool bWasSuccessful);

function AddReadPlayerStorageForNetIdCompleteDelegate(UniqueNetId NetId, delegate<OnReadPlayerStorageForNetIdComplete> ReadPlayerStorageForNetIdCompleteDelegate);

function ClearReadPlayerStorageForNetIdCompleteDelegate(UniqueNetId NetId, delegate<OnReadPlayerStorageForNetIdComplete> ReadPlayerStorageForNetIdCompleteDelegate);

function OnlinePlayerStorage GetPlayerStorage(byte LocalUserNum);

function bool WritePlayerStorage(byte LocalUserNum, OnlinePlayerStorage PlayerStorage, optional int DeviceID)
{
    DeviceID = -1;
}

delegate OnWritePlayerStorageComplete(byte LocalUserNum, bool bWasSuccessful);

function AddWritePlayerStorageCompleteDelegate(byte LocalUserNum, delegate<OnWritePlayerStorageComplete> WritePlayerStorageCompleteDelegate);

function ClearWritePlayerStorageCompleteDelegate(byte LocalUserNum, delegate<OnWritePlayerStorageComplete> WritePlayerStorageCompleteDelegate);

function bool ReadFriendsList(byte LocalUserNum, optional int Count, optional int StartingAt);

delegate OnReadFriendsComplete(bool bWasSuccessful);

function AddReadFriendsCompleteDelegate(byte LocalUserNum, delegate<OnReadFriendsComplete> ReadFriendsCompleteDelegate);

function ClearReadFriendsCompleteDelegate(byte LocalUserNum, delegate<OnReadFriendsComplete> ReadFriendsCompleteDelegate);

function OnlineSubsystem.EOnlineEnumerationReadState GetFriendsList(byte LocalUserNum, out array<OnlineFriend> Friends, optional int Count, optional int StartingAt);

function SetOnlineStatus(byte LocalUserNum, string StatusString, optional bool PlayerActive)
{
    PlayerActive = true;
}

function bool ShowKeyboardUI(byte LocalUserNum, string TitleText, string DescriptionText, optional bool bIsPassword, optional bool bShouldValidate, optional string DefaultText, optional int MaxResultLength)
{
    bIsPassword = false;
    bShouldValidate = true;    
    MaxResultLength = 256;
}

delegate OnKeyboardInputComplete(bool bWasSuccessful);

function AddKeyboardInputDoneDelegate(delegate<OnKeyboardInputComplete> InputDelegate);

function ClearKeyboardInputDoneDelegate(delegate<OnKeyboardInputComplete> InputDelegate);

function string GetKeyboardInputResults(out byte bWasCanceled);

function bool AddFriend(byte LocalUserNum, UniqueNetId NewFriend, optional string Message);

function bool AddFriendByName(byte LocalUserNum, string FriendName, optional string Message);

delegate OnAddFriendByNameComplete(bool bWasSuccessful);

function AddAddFriendByNameCompleteDelegate(byte LocalUserNum, delegate<OnAddFriendByNameComplete> FriendDelegate);

function ClearAddFriendByNameCompleteDelegate(byte LocalUserNum, delegate<OnAddFriendByNameComplete> FriendDelegate);

function bool AcceptFriendInvite(byte LocalUserNum, UniqueNetId RequestingPlayer);

function bool DenyFriendInvite(byte LocalUserNum, UniqueNetId RequestingPlayer);

function bool RemoveFriend(byte LocalUserNum, UniqueNetId FormerFriend);

delegate OnFriendInviteReceived(byte LocalUserNum, UniqueNetId RequestingPlayer, string RequestingNick, string Message);

function AddFriendInviteReceivedDelegate(byte LocalUserNum, delegate<OnFriendInviteReceived> InviteDelegate);

function ClearFriendInviteReceivedDelegate(byte LocalUserNum, delegate<OnFriendInviteReceived> InviteDelegate);

function bool SendMessageToFriend(byte LocalUserNum, UniqueNetId Friend, string Message);

function bool SendGameInviteToFriend(byte LocalUserNum, UniqueNetId Friend, optional string Text);

function bool SendGameInviteToFriends(byte LocalUserNum, array<UniqueNetId> Friends, optional string Text);

delegate OnReceivedGameInvite(byte LocalUserNum, string InviterName);

function AddReceivedGameInviteDelegate(byte LocalUserNum, delegate<OnReceivedGameInvite> ReceivedGameInviteDelegate);

function ClearReceivedGameInviteDelegate(byte LocalUserNum, delegate<OnReceivedGameInvite> ReceivedGameInviteDelegate);

function bool JoinFriendGame(byte LocalUserNum, UniqueNetId Friend);

delegate OnJoinFriendGameComplete(bool bWasSuccessful);

function AddJoinFriendGameCompleteDelegate(delegate<OnJoinFriendGameComplete> JoinFriendGameCompleteDelegate);

function ClearJoinFriendGameCompleteDelegate(delegate<OnJoinFriendGameComplete> JoinFriendGameCompleteDelegate);

function GetFriendMessages(byte LocalUserNum, out array<OnlineFriendMessage> FriendMessages);

delegate OnFriendMessageReceived(byte LocalUserNum, UniqueNetId SendingPlayer, string SendingNick, string Message);

function AddFriendMessageReceivedDelegate(byte LocalUserNum, delegate<OnFriendMessageReceived> MessageDelegate);

function ClearFriendMessageReceivedDelegate(byte LocalUserNum, delegate<OnFriendMessageReceived> MessageDelegate);

function bool DeleteMessage(byte LocalUserNum, int MessageIndex);

function bool UnlockAchievement(byte LocalUserNum, int AchievementId, optional float PercentComplete)
{
    PercentComplete = 100;
}

delegate OnUnlockAchievementComplete(bool bWasSuccessful);

function AddUnlockAchievementCompleteDelegate(byte LocalUserNum, delegate<OnUnlockAchievementComplete> UnlockAchievementCompleteDelegate);

function ClearUnlockAchievementCompleteDelegate(byte LocalUserNum, delegate<OnUnlockAchievementComplete> UnlockAchievementCompleteDelegate);

function bool ReadAchievements(byte LocalUserNum, optional int TitleId, optional bool bShouldReadText, optional bool bShouldReadImages)
{
    TitleId = 0;
    bShouldReadText = true;
    bShouldReadImages = false;
}

delegate OnReadAchievementsComplete(int TitleId);

function AddReadAchievementsCompleteDelegate(byte LocalUserNum, delegate<OnReadAchievementsComplete> ReadAchievementsCompleteDelegate);

function ClearReadAchievementsCompleteDelegate(byte LocalUserNum, delegate<OnReadAchievementsComplete> ReadAchievementsCompleteDelegate);

function OnlineSubsystem.EOnlineEnumerationReadState GetAchievements(byte LocalUserNum, out array<AchievementDetails> Achievements, optional int TitleId)
{
    TitleId = 0;
}
