interface OnlinePartyInterface dependson(OnlineSubsystem);

function GetPartyMembers( out array<OnlineFriend> OutPartyMembers );
function UniqueNetId GetLeaderMemberId();
function UniqueNetId GetMyMemberId();

function bool InviteToPartyByUserNames( array<string> UserNames );

function bool CreateParty( bool bPrivate );
function bool LeaveParty();

// Messages
function bool SendMessage( string Message );
delegate OnNotifyMessageReceived( string Message );
function AddNotifyMessageReceivedDelegate( delegate<OnNotifyMessageReceived> InDelegate );
function ClearNotifyMessageReceivedDelegate( delegate<OnNotifyMessageReceived> InDelegate );

// Notify that member(s) have updated
delegate OnNotifyPartyMembersUpdated( array<OnlineFriend> UpdatedMembers );
function AddNotifyPartyMembersUpdatedDelegate( delegate<OnNotifyPartyMembersUpdated> InDelegate );
function ClearNotifyPartyMembersUpdatedDelegate( delegate<OnNotifyPartyMembersUpdated> InDelegate );

defaultproperties
{
   Name="Default__OnlinePartyInterface"
   ObjectArchetype=Interface'Core.Default__Interface'
}
