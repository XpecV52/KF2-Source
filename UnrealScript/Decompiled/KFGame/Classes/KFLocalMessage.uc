/*******************************************************************************
 * KFLocalMessage generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFLocalMessage extends LocalMessage
    abstract;

enum ELocalMessageType
{
    LMT_AdminLogin,
    LMT_AdminLogout,
    LMT_MustLoginToCheat,
    LMT_CheatsEnabled,
    LMT_ServerMaintenance,
    LMT_OtherVoteInProgress,
    LMT_KickVoteStarted,
    LMT_KickVoteFailed,
    LMT_KickVoteSucceeded,
    LMT_KickVoteRejected,
    LMT_KickVoteInProgress,
    LMT_KickVoteDisabled,
    LMT_KickVoteYesReceived,
    LMT_KickVoteNoReceived,
    LMT_KickVoteAdmin,
    LMT_KickVoteActiveTime,
    LMT_KickVoteMatchNotStarted,
    LMT_KickVoteMaxKicksReached,
    LMT_KickVoteNotEnoughPlayers,
    LMT_KickVoteNoSpectators,
    LMT_SkipTraderVoteStarted,
    LMT_SkipTraderTime,
    LMT_SkipTraderTimeSuccess,
    LMT_SkipTraderVoteFailed,
    LMT_SkipTraderVoteNoSpectators,
    LMT_SkipTraderIsNotOpen,
    LMT_SkipTraderVoteInProgress,
    LMT_SkipTraderVoteYesReceived,
    LMT_SkipTraderVoteNoReceived,
    LMT_SkipTraderNoEnoughTime,
    LMT_SkipTraderThisUserAlreadyStartedAVote,
    LMT_PauseVoteStarted,
    LMT_PauseVoteInProgress,
    LMT_PauseVoteYesReceived,
    LMT_PauseVoteNoReceived,
    LMT_PauseVoteNoEnoughTime,
    LMT_PauseVoteNoSpectators,
    LMT_PauseVoteTime,
    LMT_PauseVoteSuccess,
    LMT_PauseVoteFailed,
    LMT_PauseVoteWaveActive,
    LMT_PauseVoteWrongMode,
    LMT_ResumeVoteStarted,
    LMT_ResumeVoteInProgress,
    LMT_ResumeVoteYesReceived,
    LMT_ResumeVoteNoReceived,
    LMT_ResumeVoteNoEnoughTime,
    LMT_ResumeVoteNoSpectators,
    LMT_ResumeVoteTime,
    LMT_ResumeVoteSuccess,
    LMT_ResumeVoteFailed,
    LMT_ResumeVoteWaveActive,
    LMT_MAX
};

var const localized string SystemString;
var const localized string AdminString;
var const localized string LoggedInAsAdminString;
var const localized string LoggedOutAsAdminString;
var const localized string MustLoginToCheatString;
var const localized string CheatsEnabledString;
var const localized string ServerMaintenanceString;
var const localized string OtherVoteInProgressString;
var const localized string KickVoteStartedString;
var const localized string KickVoteFailedString;
var const localized string KickVoteSucceededString;
var const localized string KickVoteRejectedString;
var const localized string KickVoteInProgressString;
var const localized string KickVoteDisabledString;
var const localized string KickVoteYesReceivedString;
var const localized string KickVoteNoReceivedString;
var const localized string KickVoteKickAdminString;
var const localized string KickVoteActiveTimeString;
var const localized string KickVoteMatchNotStartedString;
var const localized string KickVoteMaxKicksReachedString;
var const localized string KickVoteNotEnoughPlayersString;
var const localized string KickVoteNoSpectatorsString;
var const localized string KickedFromServerString;
var const localized string BannedFromServerString;
var const localized string ServerNoLongerAvailableString;
var const localized string SkipTraderVoteStartedString;
var const localized string SkipTraderTimeString;
var const localized string SkipTraderSuccessString;
var const localized string SkipTraiderVoteFailedString;
var const localized string SkipTraderVoteNoSpectatorsString;
var const localized string SkipTraderIsNotOpenString;
var const localized string SkipTraderVoteInProgressString;
var const localized string SkipTraderNoEnoughTimeString;
var const localized string SkipTraderThisUserAlreadyStartedAVoteString;
var const localized string SkipTraderVoteYesReceivedString;
var const localized string SkipTraderVoteNoReceivedString;
var const localized string PauseVoteStartedString;
var const localized string PauseVoteInProgressString;
var const localized string PauseVoteYesReceivedString;
var const localized string PauseVoteNoReceivedString;
var const localized string PauseVoteNoEnoughTimeString;
var const localized string PauseVoteNoSpectatorsString;
var const localized string PauseVoteTimeString;
var const localized string PauseVoteSuccessString;
var const localized string PauseVoteFailedString;
var const localized string PauseVoteWaveActiveString;
var const localized string PauseVoteWrongModeString;
var const localized string ResumeVoteStartedString;
var const localized string ResumeVoteInProgressString;
var const localized string ResumeVoteYesReceivedString;
var const localized string ResumeVoteNoReceivedString;
var const localized string ResumeVoteNoEnoughTimeString;
var const localized string ResumeVoteNoSpectatorsString;
var const localized string ResumeVoteTimeString;
var const localized string ResumeVoteSuccessString;
var const localized string ResumeVoteFailedString;
var const localized string ResumeVoteWaveActiveString;
var int MessageArea;
var int AnnouncementPriority;
var bool bShowPortrait;
var float AnnouncementVolume;
var float AnnouncementDelay;
var const string SayColor;
var const string TeamSayColor;
var const string NonAffialiatedColor;
var const string EventColor;
var const string GameColor;
var const string InteractionColor;
var const string PriorityColor;
var const string DefaultColor;
var const string ConnectionColor;

static function string GetString(optional int Switch, optional bool bPRI1HUD, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    local WorldInfo WI;
    local KFPlayerController KFPC;
    local string PlayerName;

    switch(Switch)
    {
        case 7:
        case 8:
        case 12:
        case 13:
            if(RelatedPRI_1 != none)
            {
                PlayerName = RelatedPRI_1.PlayerName;                
            }
            else
            {
                WI = Class'WorldInfo'.static.GetWorldInfo();
                if(WI != none)
                {
                    KFPC = KFPlayerController(WI.GetALocalPlayerController());
                    if((KFPC != none) && KFPC.myGfxHUD != none)
                    {
                        PlayerName = KFPC.myGfxHUD.PendingKickPlayerName;
                    }
                }
            }
            break;
        default:
            break;
    }
    switch(Switch)
    {
        case 42:
            return RelatedPRI_1.PlayerName @ default.ResumeVoteStartedString;
        case 43:
            return default.ResumeVoteInProgressString;
        case 44:
            return default.ResumeVoteYesReceivedString;
        case 45:
            return default.ResumeVoteNoReceivedString;
        case 46:
            return default.ResumeVoteNoEnoughTimeString;
        case 47:
            return default.ResumeVoteNoSpectatorsString;
        case 48:
            return default.ResumeVoteTimeString;
        case 49:
            return default.ResumeVoteSuccessString;
        case 50:
            return default.ResumeVoteFailedString;
        case 51:
            return default.ResumeVoteWaveActiveString;
        case 31:
            return RelatedPRI_1.PlayerName @ default.PauseVoteStartedString;
        case 32:
            return default.PauseVoteInProgressString;
        case 33:
            return default.PauseVoteYesReceivedString;
        case 34:
            return default.PauseVoteNoReceivedString;
        case 35:
            return default.PauseVoteNoEnoughTimeString;
        case 36:
            return default.PauseVoteNoSpectatorsString;
        case 37:
            return default.PauseVoteTimeString;
        case 38:
            return default.PauseVoteSuccessString;
        case 39:
            return default.PauseVoteFailedString;
        case 40:
            return default.PauseVoteWaveActiveString;
        case 41:
            return default.PauseVoteWrongModeString;
        case 5:
            return default.OtherVoteInProgressString;
        case 20:
            return RelatedPRI_1.PlayerName @ default.SkipTraderVoteStartedString;
        case 22:
            return default.SkipTraderSuccessString;
        case 23:
            return default.SkipTraiderVoteFailedString;
        case 21:
            return default.SkipTraderTimeString;
        case 24:
            return default.SkipTraderVoteNoSpectatorsString;
        case 25:
            return default.SkipTraderIsNotOpenString;
        case 26:
            return default.SkipTraderVoteInProgressString;
        case 27:
            return default.SkipTraderVoteYesReceivedString;
        case 28:
            return default.SkipTraderVoteNoReceivedString;
        case 29:
            return default.SkipTraderNoEnoughTimeString;
        case 30:
            return default.SkipTraderThisUserAlreadyStartedAVoteString;
        case 0:
            return RelatedPRI_1.PlayerName @ default.LoggedInAsAdminString;
        case 1:
            return RelatedPRI_1.PlayerName @ default.LoggedOutAsAdminString;
        case 2:
            return default.MustLoginToCheatString;
        case 3:
            return RelatedPRI_1.PlayerName @ default.CheatsEnabledString;
        case 4:
            return default.ServerMaintenanceString;
        case 6:
            WI = Class'WorldInfo'.static.GetWorldInfo();
            if(WI != none)
            {
                KFPC = KFPlayerController(WI.GetALocalPlayerController());
                if((KFPC != none) && KFPC.myGfxHUD != none)
                {
                    KFPC.myGfxHUD.PendingKickPlayerName = RelatedPRI_1.PlayerName;
                }
            }
            return default.KickVoteStartedString @ RelatedPRI_1.PlayerName;
        case 7:
            return default.KickVoteFailedString @ PlayerName;
        case 8:
            return default.KickVoteSucceededString @ PlayerName;
        case 9:
            return default.KickVoteRejectedString;
        case 10:
            return default.KickVoteInProgressString;
        case 11:
            return default.KickVoteDisabledString;
        case 12:
            return default.KickVoteYesReceivedString @ PlayerName;
        case 13:
            return default.KickVoteNoReceivedString @ PlayerName;
        case 14:
            return default.KickVoteKickAdminString;
        case 15:
            return default.KickVoteActiveTimeString;
        case 16:
            return default.KickVoteMatchNotStartedString;
        case 17:
            return default.KickVoteMaxKicksReachedString;
        case 18:
            return default.KickVoteNotEnoughPlayersString;
        case 19:
            return default.KickVoteNoSpectatorsString;
        default:
            return "";
            break;
    }
}

static function byte AnnouncementLevel(byte MessageIndex)
{
    return 1;
}

static function SoundNodeWave AnnouncementSound(int MessageIndex, Object OptionalObject, PlayerController PC)
{
    return SoundNodeWave(OptionalObject);
}

static function float GetPos(int Switch, HUD myHUD)
{
    return 0.5;
}

static function bool KilledByVictoryMessage(int AnnouncementIndex)
{
    return default.AnnouncementPriority < 6;
}

static function string GetHexColor(int Switch)
{
    switch(Switch)
    {
        case 0:
        case 1:
        case 4:
        case 22:
        case 21:
            return default.PriorityColor;
        case 9:
        case 8:
        case 7:
        case 6:
        case 10:
        case 11:
            return default.EventColor;
        default:
            return default.DefaultColor;
            break;
    }
}

static final function string getLocalized(coerce string Data)
{
    local array<string> parts;

    if(!Left(Data, 9) ~= "<Strings:")
    {
        return Data;
    }
    Data = Mid(Data, 9, Len(Data) - 10);
    ParseStringIntoArray(Data, parts, ".", true);
    if(parts.Length >= 3)
    {
        return Localize(parts[1], parts[2], parts[0]);
    }
    return "";
}

defaultproperties
{
    SystemString="System:"
    AdminString="(Admin)"
    LoggedInAsAdminString=" logged in as Server Admin"
    LoggedOutAsAdminString=" logged out as Server Admin"
    MustLoginToCheatString="You must be logged in to enable cheats"
    CheatsEnabledString=" has enabled cheats. Stats have been disabled for this session"
    ServerMaintenanceString="Server will be shutdown for maintenance at end of game"
    OtherVoteInProgressString="Can?t start a new vote until the current is resolved"
    KickVoteStartedString="A vote has started to kick:"
    KickVoteFailedString="Vote failed to kick:"
    KickVoteSucceededString="Vote passed to kick:"
    KickVoteRejectedString="Not enough time has passed since the last failed vote. Please wait then try again"
    KickVoteInProgressString="Cannot start a kick vote, one is already active"
    KickVoteDisabledString="Kick vote is disabled on this server"
    KickVoteYesReceivedString="You have voted to kick:"
    KickVoteNoReceivedString="You have voted to not kick:"
    KickVoteKickAdminString="You may not kick the server admin"
    KickVoteActiveTimeString="Match has not been active long enough for kick vote"
    KickVoteMatchNotStartedString="Kick vote may not be started before match"
    KickVoteMaxKicksReachedString="You cannot initiate any more kicks during this match"
    KickVoteNotEnoughPlayersString="Not enough players to initiate a kick vote"
    KickVoteNoSpectatorsString="Spectators may not initiate a kick vote"
    KickedFromServerString="You have been removed from the server"
    BannedFromServerString="You have been removed from this server. You cannot rejoin at this time"
    ServerNoLongerAvailableString="The server is no longer available to join"
    SkipTraderVoteStartedString="initiated a Skip Trader vote"
    SkipTraderTimeString="SKIP TRADER activated. Select 'SKIP TRADER' on the game menu to vote.  All players must agree."
    SkipTraderSuccessString="Skip trader vote successful!"
    SkipTraiderVoteFailedString="Skip Trader vote failed!"
    SkipTraderVoteNoSpectatorsString="Spectators may not initiate a skip trader vote"
    SkipTraderIsNotOpenString="Skip trader not allowed during a wave"
    SkipTraderVoteInProgressString="Cannot start a skip trader vote, one is already active"
    SkipTraderNoEnoughTimeString="Not enough time to start a skip trader vote"
    SkipTraderThisUserAlreadyStartedAVoteString="You can't start a new skip trader vote until the next trader phase"
    SkipTraderVoteYesReceivedString="You have voted to skip trader"
    SkipTraderVoteNoReceivedString="You have voted to not skip trader"
    PauseVoteStartedString="Initiated a Pause Game vote"
    PauseVoteInProgressString="Cannot start a Pause Game vote, one is already active"
    PauseVoteYesReceivedString="You have voted to pause the game"
    PauseVoteNoReceivedString="You have voted to not pause the game"
    PauseVoteNoEnoughTimeString="Not enough time to start a Pause Game vote"
    PauseVoteNoSpectatorsString="Spectators may not initiate a Pause Game vote"
    PauseVoteTimeString="PAUSE GAME activated. Select 'PAUSE GAME' on the game menu to vote.  All players must agree."
    PauseVoteSuccessString="Pause Game vote successful!"
    PauseVoteFailedString="Pause Game vote failed!"
    PauseVoteWaveActiveString="Cannot start a Pause Game vote, the wave is active"
    PauseVoteWrongModeString="This option is only available on Endless mode"
    ResumeVoteStartedString="Initiated a Resume Game vote"
    ResumeVoteInProgressString="Cannot start a Resume Game vote, one is already active"
    ResumeVoteYesReceivedString="You have voted to resume the game"
    ResumeVoteNoReceivedString="You have voted to not resume the game"
    ResumeVoteNoEnoughTimeString="Not enough time to start a Resume Game vote"
    ResumeVoteNoSpectatorsString="Spectators may not initiate a Resume Game vote"
    ResumeVoteTimeString="RESUME GAME activated. Select 'RESUME GAME' on the game menu to vote.  All players must agree."
    ResumeVoteSuccessString="Resume Game vote successful!"
    ResumeVoteFailedString="Resume Game vote failed!"
    ResumeVoteWaveActiveString="Cannot start a Resume Game vote, the wave is active"
    MessageArea=1
    AnnouncementVolume=2
    SayColor="FFFFFF"
    TeamSayColor="00FFFF"
    NonAffialiatedColor="000000"
    EventColor="0099FF"
    GameColor="00FF00"
    InteractionColor="FF0000"
    PriorityColor="FFFF00"
    DefaultColor="FFFFFF"
    ConnectionColor="8E1720"
}