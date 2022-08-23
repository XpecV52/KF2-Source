/*******************************************************************************
 * OnlinePlayerInterfaceEx generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
interface OnlinePlayerInterfaceEx extends Interface
    abstract;

function bool ShowFeedbackUI(byte LocalUserNum, UniqueNetId PlayerID);

function bool ShowHelpUI(byte LocalUserNum);

function bool ShowHelpForErrorUI(string ContextId, string ErrorString);

delegate OnShowHelpComplete(bool bWasSuccessful);

function AddShowHelpCompleteDelegate(delegate<OnShowHelpComplete> HelpDelegate);

function ClearShowHelpCompleteDelegate(delegate<OnShowHelpComplete> HelpDelegate);

function bool ShowVideo(string URL);

delegate OnShowGamerCardComplete(bool bWasSuccessful);

function AddShowGamerCardCompleteDelegate(delegate<OnShowGamerCardComplete> GamerCardDelegate);

function ClearShowGamerCardCompleteDelegate(delegate<OnShowGamerCardComplete> GamerCardDelegate);

function bool ShowGamerCardUI(byte LocalUserNum, UniqueNetId PlayerID);

function bool ShowGamerCardUIByUsername(byte LocalUserNum, string UserName);

function bool ShowMessagesUI(byte LocalUserNum);

function bool ShowAchievementsUI(byte LocalUserNum);

function bool ShowInviteUI(byte LocalUserNum, optional string InviteText);

function bool ShowPeoplePickerUI(byte LocalUserNum, array<OnlineFriend> People, int MaxSelectable, optional string Text);

delegate OnPeoplePickerComplete(bool bWasSuccessful, array<OnlineFriend> PeoplePicked);

function AddPeoplePickerCompleteDelegate(byte LocalUserNum, delegate<OnPeoplePickerComplete> InDelegate);

function ClearPeoplePickerCompleteDelegate(byte LocalUserNum, delegate<OnPeoplePickerComplete> InDelegate);

function bool ShowDataSendingUI(byte LocalUserNum, string Message, string DataName, string DataDescription, array<byte> Data, int MaxSelectableUsers);

delegate OnAcceptReceivedData(string Data);

function AddAcceptReceivedDataDelegate(byte LocalUserNum, delegate<OnAcceptReceivedData> InDelegate);

function ClearAcceptReceivedDataDelegate(byte LocalUserNum, delegate<OnAcceptReceivedData> InDelegate);

function bool ShowProductDetailsUI(byte LocalUserNum, optional string ParentProductId);

function bool ShowContentMarketplaceUI(byte LocalUserNum, int ParentProductType, int RequestedProductTypes, optional string ParentProductId);

function bool ShowContentPurchaseUI(byte LocalUserNum, string Offer);

function bool ShowContentRedeemCodeUI(byte LocalUserNum, string Offer);

function CloseCurrentContentUI();

function bool ShowMembershipMarketplaceUI(byte LocalUserNum);

function bool ShowDeviceSelectionUI(byte LocalUserNum, int SizeNeeded, optional bool bManageStorage);

delegate OnDeviceSelectionComplete(bool bWasSuccessful);

function AddDeviceSelectionDoneDelegate(byte LocalUserNum, delegate<OnDeviceSelectionComplete> DeviceDelegate);

function ClearDeviceSelectionDoneDelegate(byte LocalUserNum, delegate<OnDeviceSelectionComplete> DeviceDelegate);

function int GetDeviceSelectionResults(byte LocalUserNum, out string DeviceName);

function bool IsDeviceValid(int DeviceID, optional int SizeNeeded);

function bool UnlockGamerPicture(byte LocalUserNum, int PictureId);

delegate OnProfileDataChanged();

function AddProfileDataChangedDelegate(byte LocalUserNum, delegate<OnProfileDataChanged> ProfileDataChangedDelegate);

function ClearProfileDataChangedDelegate(byte LocalUserNum, delegate<OnProfileDataChanged> ProfileDataChangedDelegate);

function bool ShowFriendsInviteUI(byte LocalUserNum, UniqueNetId PlayerID);

function bool ShowPlayersUI(byte LocalUserNum);

function bool ShowCustomPlayersUI(byte LocalUserNum, const out array<UniqueNetId> Players, string Title, string Description);

function bool RecordPlayersRecentlyMet(byte LocalUserNum, out array<PlayerNameIdPair> Players, string GameDescription);

function bool AddInGamePost(int InPostID, optional string InPostParam);

function bool UnlockAvatarAward(byte LocalUserNum, int AvatarItemId);

function bool ReadCrossTitleProfileSettings(byte LocalUserNum, int TitleId, OnlineProfileSettings ProfileSettings);

delegate OnReadCrossTitleProfileSettingsComplete(byte LocalUserNum, int TitleId, bool bWasSuccessful);

function AddReadCrossTitleProfileSettingsCompleteDelegate(byte LocalUserNum, delegate<OnReadCrossTitleProfileSettingsComplete> ReadProfileSettingsCompleteDelegate);

function ClearReadCrossTitleProfileSettingsCompleteDelegate(byte LocalUserNum, delegate<OnReadCrossTitleProfileSettingsComplete> ReadProfileSettingsCompleteDelegate);

function OnlineProfileSettings GetCrossTitleProfileSettings(byte LocalUserNum, int TitleId);

function ClearCrossTitleProfileSettings(byte LocalUserNum, int TitleId);

function bool ShowCustomMessageUI(byte LocalUserNum, const out array<UniqueNetId> Recipients, string MessageTitle, string NonEditableMessage, optional string EditableMessage);

function PostActivityFeedBossKill(string BossName, string MapName);

function PostActivityFeedTeamAward(string AwardName);

function PostActivityFeedPerkLevelUp(string PerkClassName, int Level);

function ReadStoreData();

delegate OnStoreDataRead(bool bSuccessful);

function AddStoreDataReadCompleteDelegate(delegate<OnStoreDataRead> InDelegate);

function ClearStoreDataReadCompleteDelegate(delegate<OnStoreDataRead> InDelegate);

function ReadEntitlements();

delegate OnEntitlementsRead(bool bSuccess);

function AddOnEntitlementsReadDelegate(delegate<OnEntitlementsRead> InDelegate);

function ClearOnEntitlementsReadDelegate(delegate<OnEntitlementsRead> InDelegate);

function UpsellPremiumOnlineService();

function bool ShowSystemErrorUI(int ErrorCode, string ErrorContext);

function bool ShowCustomErrorUI(int ErrorCode, optional string ErrorContext, optional string DialogTitle, optional string DialogContent);

function bool GetPlayerNicknameForPlayerId(UniqueNetId InPlayerId, out string OutPlayerNickname);

function bool GetPlayerIDForPlayerNickname(string InPlayerNickname, out UniqueNetId OutPlayerId);

function bool ReadOnlineProfilesForPlayers(array<string> PlayerIDs);

delegate OnReadOnlineProfilesComplete(bool bWasSuccessful, array<string> PlayerIDs, array<OnlineProfile> OnlineProfiles);

function AddReadOnlineProfilesCompleteDelegate(delegate<OnReadOnlineProfilesComplete> ReadOnlineProfileDelegate);

function ClearReadOnlineProfilesCompleteDelegate(delegate<OnReadOnlineProfilesComplete> ReadOnlineProfileDelegate);

delegate OnRegisterLocalTalkerComplete(byte LocalUserNum, bool bWasSuccessful);

function AddRegisterLocalTalkerCompleteDelegate(delegate<OnRegisterLocalTalkerComplete> RegisterLocalTalkerCompleteDelegate);

function ClearRegisterLocalTalkerCompleteDelegate(delegate<OnRegisterLocalTalkerComplete> RegisterLocalTalkerCompleteDelegate);

delegate OnUnregisterLocalTalkerComplete(byte LocalUserNum, bool bWasSuccessful);

function AddUnregisterLocalTalkerCompleteDelegate(delegate<OnUnregisterLocalTalkerComplete> UnregisterLocalTalkerCompleteDelegate);

function ClearUnregisterLocalTalkerCompleteDelegate(delegate<OnUnregisterLocalTalkerComplete> UnregisterLocalTalkerCompleteDelegate);

delegate OnUnregisterRemoteTalkerComplete(UniqueNetId RemoteNetId, bool bWasSuccessful);

function AddUnregisterRemoteTalkerCompleteDelegate(delegate<OnUnregisterRemoteTalkerComplete> UnregisterRemoteTalkerCompleteDelegate);

function ClearUnregisterRemoteTalkerCompleteDelegate(delegate<OnUnregisterRemoteTalkerComplete> UnregisterRemoteTalkerCompleteDelegate);

delegate OnRemoteTalkerStatusChange(UniqueNetId RemoteNetId, bool bIsTalking);

function AddPlayerTalkingDelegate(delegate<OnRemoteTalkerStatusChange> RemoteTalkerStatusChangeDelegate);

function ClearPlayerTalkingDelegate(delegate<OnRemoteTalkerStatusChange> RemoteTalkerStatusChangeDelegate);
