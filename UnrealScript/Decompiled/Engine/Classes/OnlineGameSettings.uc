/*******************************************************************************
 * OnlineGameSettings generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class OnlineGameSettings extends Settings
    native;

struct native PlayerResult
{
    var string PlayerName;
    var int Score;
    var float TimePlayed;

    structdefaultproperties
    {
        PlayerName=""
        Score=0
        TimePlayed=0
    }
};

var databinding int NumPublicConnections;
var databinding int NumPrivateConnections;
var databinding int NumOpenPublicConnections;
var databinding int NumOpenPrivateConnections;
var const QWord ServerNonce;
var string SessionGuid;
var string JoinString;
var databinding bool bShouldAdvertise;
var databinding bool bIsLanMatch;
var databinding bool bUsesStats;
var databinding bool bAllowJoinInProgress;
var databinding bool bAllowInvites;
var databinding bool bUsesPresence;
var databinding bool bAllowJoinViaPresence;
var databinding bool bAllowJoinViaPresenceFriendsOnly;
var databinding bool bUsesArbitration;
var databinding bool bAntiCheatProtected;
var const bool bWasFromInvite;
var databinding bool bIsDedicated;
var const bool bHasSkillUpdateInProgress;
var const bool bShouldShrinkArbitratedSessions;
var databinding bool bRequiresPassword;
var databinding string OwningPlayerName;
var UniqueNetId OwningPlayerId;
var databinding int PingInMs;
var databinding float MatchQuality;
var databinding const OnlineSubsystem.EOnlineGameState GameState;
var const int BuildUniqueId;
var string LobbyId;
var int GfxID;
var int ElementIdx;
var array<PlayerResult> PlayersInGame;

defaultproperties
{
    bShouldAdvertise=true
    bUsesStats=true
    bAllowJoinInProgress=true
    bAllowInvites=true
    bUsesPresence=true
    bAllowJoinViaPresence=true
    bShouldShrinkArbitratedSessions=true
    GfxID=-1
    ElementIdx=-1
}