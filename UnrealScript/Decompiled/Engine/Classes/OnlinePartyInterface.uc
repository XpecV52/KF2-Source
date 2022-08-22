/*******************************************************************************
 * OnlinePartyInterface generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
interface OnlinePartyInterface extends Interface
    abstract;

function GetPartyMembers(out array<PartyMember> OutPartyMembers);

function UniqueNetId GetLeaderMemberId();

function UniqueNetId GetMyMemberId();

function bool InviteToPartyByUserNames(array<string> UserNames, string InviteMessage);

function bool CreateParty(bool bPrivate);

function bool LeaveParty();

function bool SendMessage(string Message);

delegate OnNotifyMessageReceived(string Message, UniqueNetId Sender);

function AddNotifyMessageReceivedDelegate(delegate<OnNotifyMessageReceived> InDelegate);

function ClearNotifyMessageReceivedDelegate(delegate<OnNotifyMessageReceived> InDelegate);

delegate OnNotifyPartyMembersUpdated(array<PartyMember> UpdatedMembers);

function AddNotifyPartyMembersUpdatedDelegate(delegate<OnNotifyPartyMembersUpdated> InDelegate);

function ClearNotifyPartyMembersUpdatedDelegate(delegate<OnNotifyPartyMembersUpdated> InDelegate);

delegate OnNotifyLeaderChanged(UniqueNetId NewLeader);

function AddNotifyLeaderChangedDelegate(delegate<OnNotifyLeaderChanged> InDelegate);

function ClearNotifyLeaderChangedDelegate(delegate<OnNotifyLeaderChanged> InDelegate);
