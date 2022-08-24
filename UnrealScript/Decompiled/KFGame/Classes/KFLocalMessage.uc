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
    LMT_MAX
};

var const localized string SystemString;
var const localized string AdminString;
var const localized string LoggedInAsAdminString;
var const localized string LoggedOutAsAdminString;
var const localized string MustLoginToCheatString;
var const localized string CheatsEnabledString;
var const localized string ServerMaintenanceString;
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
        case 6:
        case 7:
        case 11:
        case 12:
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
        case 5:
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
        case 6:
            return default.KickVoteFailedString @ PlayerName;
        case 7:
            return default.KickVoteSucceededString @ PlayerName;
        case 8:
            return default.KickVoteRejectedString;
        case 9:
            return default.KickVoteInProgressString;
        case 10:
            return default.KickVoteDisabledString;
        case 11:
            return default.KickVoteYesReceivedString @ PlayerName;
        case 12:
            return default.KickVoteNoReceivedString @ PlayerName;
        case 13:
            return default.KickVoteKickAdminString;
        case 14:
            return default.KickVoteActiveTimeString;
        case 15:
            return default.KickVoteMatchNotStartedString;
        case 16:
            return default.KickVoteMaxKicksReachedString;
        case 17:
            return default.KickVoteNotEnoughPlayersString;
        case 18:
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
            return default.PriorityColor;
        case 8:
        case 7:
        case 6:
        case 5:
        case 9:
        case 10:
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