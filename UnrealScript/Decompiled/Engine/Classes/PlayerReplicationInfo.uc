/*******************************************************************************
 * PlayerReplicationInfo generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class PlayerReplicationInfo extends ReplicationInfo
    native(ReplicationInfo)
    nativereplication
    notplaceable
    hidecategories(Navigation,Movement,Collision);

struct native AutomatedTestingDatum
{
    var int NumberOfMatchesPlayed;
    var int NumMapListCyclesDone;

    structdefaultproperties
    {
        NumberOfMatchesPlayed=0
        NumMapListCyclesDone=0
    }
};

var repnotify float Score;
var int Deaths;
var byte Ping;
var transient AudioDevice.ETTSSpeaker TTSSpeaker;
var int NumLives;
var repnotify string PlayerName;
var string OldName;
var int PlayerID;
var repnotify editinline TeamInfo Team;
var bool bAdmin;
var bool bIsSpectator;
var bool bOnlySpectator;
var bool bWaitingPlayer;
var bool bReadyToPlay;
var bool bOutOfLives;
var bool bBot;
var bool bHasBeenWelcomed;
var repnotify bool bIsInactive;
var bool bFromPreviousLevel;
var int StartTime;
var const localized string StringSpectating;
var const localized string StringUnknown;
var int Kills;
var class<GameMessage> GameMessageClass;
var float ExactPing;
var string SavedNetworkAddress;
var repnotify UniqueNetId UniqueId;
var const name SessionName;
var AutomatedTestingDatum AutomatedTestingData;
var int StatConnectionCounts;
var int StatPingTotals;
var int StatPingMin;
var int StatPingMax;
var int StatPKLTotal;
var int StatPKLMin;
var int StatPKLMax;
var int StatMaxInBPS;
var int StatAvgInBPS;
var int StatMaxOutBPS;
var int StatAvgOutBPS;
var transient Texture2D Avatar;

replication
{
     if(bNetDirty)
        Deaths, Kills, 
        PlayerName, Score, 
        StartTime, Team, 
        UniqueId, bAdmin, 
        bFromPreviousLevel, bIsSpectator, 
        bOnlySpectator, bOutOfLives, 
        bReadyToPlay, bWaitingPlayer;

     if(bNetDirty && !bNetOwner)
        Ping;

     if(bNetInitial)
        PlayerID, bBot, 
        bIsInactive;
}

simulated event PostBeginPlay()
{
    if(WorldInfo.GRI != none)
    {
        WorldInfo.GRI.AddPRI(self);
    }
    if(Role < ROLE_Authority)
    {
        return;
    }
    if(AIController(Owner) != none)
    {
        bBot = true;
    }
    StartTime = WorldInfo.GRI.ElapsedTime;
}

simulated function ClientInitialize(Controller C)
{
    local Actor A;
    local PlayerController PlayerOwner;

    SetOwner(C);
    PlayerOwner = PlayerController(C);
    if(PlayerOwner != none)
    {
        if(Team != default.Team)
        {
            foreach AllActors(Class'Actor', A)
            {
                A.NotifyLocalPlayerTeamReceived();                
            }            
        }
    }
}

function SetPlayerTeam(TeamInfo NewTeam)
{
    bForceNetUpdate = Team != NewTeam;
    Team = NewTeam;
}

simulated event ReplicatedEvent(name VarName)
{
    local Pawn P;
    local PlayerController PC;
    local int WelcomeMessageNum;
    local Actor A;
    local UniqueNetId ZeroId;

    if(VarName == 'Team')
    {
        foreach DynamicActors(Class'Pawn', P)
        {
            if(P.PlayerReplicationInfo == self)
            {
                P.NotifyTeamChanged();
                break;
            }            
        }        
        foreach LocalPlayerControllers(Class'PlayerController', PC)
        {
            if(PC.PlayerReplicationInfo == self)
            {
                foreach AllActors(Class'Actor', A)
                {
                    A.NotifyLocalPlayerTeamReceived();                    
                }                
                break;
            }            
        }                
    }
    else
    {
        if(VarName == 'PlayerName')
        {
            if(IsInvalidName())
            {
                return;
            }
            if(WorldInfo.TimeSeconds < float(2))
            {
                bHasBeenWelcomed = true;
                OldName = PlayerName;
                return;
            }
            if(bHasBeenWelcomed)
            {
                if(ShouldBroadCastWelcomeMessage())
                {
                    foreach LocalPlayerControllers(Class'PlayerController', PC)
                    {
                        PC.ReceiveLocalizedMessage(GameMessageClass, 2, self);                        
                    }                    
                }                
            }
            else
            {
                if(bOnlySpectator)
                {
                    WelcomeMessageNum = 16;                    
                }
                else
                {
                    WelcomeMessageNum = 1;
                }
                bHasBeenWelcomed = true;
                if(ShouldBroadCastWelcomeMessage())
                {
                    foreach LocalPlayerControllers(Class'PlayerController', PC)
                    {
                        PC.ReceiveLocalizedMessage(GameMessageClass, WelcomeMessageNum, self);                        
                    }                    
                }
            }
            OldName = PlayerName;            
        }
        else
        {
            if(VarName == 'UniqueId')
            {
                if(UniqueId != ZeroId)
                {
                    RegisterPlayerWithSession();
                }                
            }
            else
            {
                if(VarName == 'bIsInactive')
                {
                    WorldInfo.GRI.RemovePRI(self);
                    WorldInfo.GRI.AddPRI(self);
                }
            }
        }
    }
}

// Export UPlayerReplicationInfo::execUpdatePing(FFrame&, void* const)
native final function UpdatePing(float TimeStamp);

simulated function bool ShouldBroadCastWelcomeMessage(optional bool bExiting)
{
    return !bIsInactive && WorldInfo.NetMode != NM_Standalone;
}

simulated event Destroyed()
{
    local PlayerController PC;
    local UniqueNetId ZeroId;

    if(WorldInfo.GRI != none)
    {
        WorldInfo.GRI.RemovePRI(self);
    }
    if(ShouldBroadCastWelcomeMessage(true))
    {
        foreach LocalPlayerControllers(Class'PlayerController', PC)
        {
            PC.ReceiveLocalizedMessage(GameMessageClass, 4, self);            
        }        
    }
    if(UniqueId != ZeroId)
    {
        UnregisterPlayerFromSession();
    }
    super(Actor).Destroyed();
}

function Reset()
{
    super(Actor).Reset();
    Score = 0;
    Kills = 0;
    Deaths = 0;
    bReadyToPlay = false;
    NumLives = 0;
    bOutOfLives = false;
    bForceNetUpdate = true;
}

simulated function string GetHumanReadableName()
{
    return PlayerName;
}

simulated function DisplayDebug(HUD HUD, out float YL, out float YPos)
{
    local float XS, YS;

    if(Team == none)
    {
        HUD.Canvas.SetDrawColor(255, 255, 0);        
    }
    else
    {
        if(Team.TeamIndex == 0)
        {
            HUD.Canvas.SetDrawColor(255, 0, 0);            
        }
        else
        {
            HUD.Canvas.SetDrawColor(64, 64, 255);
        }
    }
    HUD.Canvas.SetPos(4, YPos);
    HUD.Canvas.Font = Class'Engine'.static.GetSmallFont();
    HUD.Canvas.StrLen(PlayerName, XS, YS);
    HUD.Canvas.DrawText(PlayerName);
    HUD.Canvas.SetPos(4 + XS, YPos);
    HUD.Canvas.Font = Class'Engine'.static.GetTinyFont();
    HUD.Canvas.SetDrawColor(255, 255, 0);
    YPos += YS;
    HUD.Canvas.SetPos(4, YPos);
    if((PlayerController(Owner) != none) && PlayerController(HUD.Owner).ViewTarget != PlayerController(HUD.Owner).Pawn)
    {
        HUD.Canvas.SetDrawColor(128, 128, 255);
        HUD.Canvas.DrawText((((((((("      bIsSpec:" @ string(bIsSpectator)) @ "OnlySpec:") $ string(bOnlySpectator)) @ "Waiting:") $ string(bWaitingPlayer)) @ "Ready:") $ string(bReadyToPlay)) @ "OutOfLives:") $ string(bOutOfLives));
        YPos += YL;
        HUD.Canvas.SetPos(4, YPos);
    }
}

event SetPlayerName(string S)
{
    PlayerName = S;
    if((WorldInfo.NetMode == NM_Standalone) || WorldInfo.NetMode == NM_ListenServer)
    {
        ReplicatedEvent('PlayerName');
    }
    OldName = PlayerName;
    bForceNetUpdate = true;
}

function SetWaitingPlayer(bool B)
{
    bIsSpectator = B;
    bWaitingPlayer = B;
    bForceNetUpdate = true;
}

function PlayerReplicationInfo Duplicate()
{
    local PlayerReplicationInfo NewPRI;

    NewPRI = Spawn(Class);
    CopyProperties(NewPRI);
    return NewPRI;
}

function OverrideWith(PlayerReplicationInfo PRI)
{
    bIsSpectator = PRI.bIsSpectator;
    bOnlySpectator = PRI.bOnlySpectator;
    bWaitingPlayer = PRI.bWaitingPlayer;
    bReadyToPlay = PRI.bReadyToPlay;
    bOutOfLives = PRI.bOutOfLives || bOutOfLives;
    Team = PRI.Team;
}

function CopyProperties(PlayerReplicationInfo PRI)
{
    PRI.Score = Score;
    PRI.Deaths = Deaths;
    PRI.Ping = Ping;
    PRI.NumLives = NumLives;
    PRI.PlayerName = PlayerName;
    PRI.PlayerID = PlayerID;
    PRI.StartTime = StartTime;
    PRI.Kills = Kills;
    PRI.bOutOfLives = bOutOfLives;
    PRI.SavedNetworkAddress = SavedNetworkAddress;
    PRI.Team = Team;
    PRI.UniqueId = UniqueId;
    PRI.AutomatedTestingData = AutomatedTestingData;
}

function IncrementDeaths(optional int Amt)
{
    Amt = 1;
    Deaths += Amt;
}

function SeamlessTravelTo(PlayerReplicationInfo NewPRI)
{
    CopyProperties(NewPRI);
    NewPRI.bOnlySpectator = bOnlySpectator;
}

simulated function SetUniqueId(UniqueNetId PlayerUniqueId)
{
    UniqueId = PlayerUniqueId;
}

// Export UPlayerReplicationInfo::execGetTeamNum(FFrame&, void* const)
native simulated function byte GetTeamNum();

simulated function bool IsInvalidName()
{
    local LocalPlayer LocPlayer;
    local PlayerController PC;
    local string ProfileName;
    local OnlineSubsystem OnlineSub;

    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    if(OnlineSub != none)
    {
        PC = PlayerController(Owner);
        if(PC != none)
        {
            LocPlayer = LocalPlayer(PC.Player);
            if(((LocPlayer != none) && NotEqual_InterfaceInterface(OnlineSub.GameInterface, (none))) && NotEqual_InterfaceInterface(OnlineSub.PlayerInterface, (none)))
            {
                if(OnlineSub.PlayerInterface.GetLoginStatus(byte(LocPlayer.ControllerId)) == 2)
                {
                    ProfileName = OnlineSub.PlayerInterface.GetPlayerNickname(byte(LocPlayer.ControllerId));
                    if(ProfileName != PlayerName)
                    {
                        PC.SetName(ProfileName);
                        return true;
                    }
                }
            }
        }
    }
    return false;
}

simulated function RegisterPlayerWithSession()
{
    local OnlineSubsystem Online;
    local OnlineRecentPlayersList PlayersList;
    local UniqueNetId ZeroId;

    Online = Class'GameEngine'.static.GetOnlineSubsystem();
    if((((UniqueId != ZeroId && Online != none) && NotEqual_InterfaceInterface(Online.GameInterface, (none))) && SessionName != 'None') && Online.GameInterface.GetGameSettings(SessionName) != none)
    {
        Online.GameInterface.RegisterPlayer(SessionName, UniqueId, false);
        if(!bNetOwner)
        {
            PlayersList = OnlineRecentPlayersList(Online.GetNamedInterface('RecentPlayersList'));
            if(PlayersList != none)
            {
                PlayersList.AddPlayerToRecentPlayers(UniqueId);
            }
        }
    }
}

simulated function UnregisterPlayerFromSession()
{
    local OnlineSubsystem OnlineSub;
    local UniqueNetId ZeroId;

    if((UniqueId != ZeroId && WorldInfo.NetMode == NM_Client) && SessionName != 'None')
    {
        OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
        if((((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.GameInterface, (none))) && OnlineSub.GameInterface.GetGameSettings(SessionName) != none) && !WorldInfo.PeerHostMigration.bHostMigrationEnabled && WorldInfo.PeerHostMigration.HostMigrationProgress != 0)
        {
            OnlineSub.GameInterface.UnregisterPlayer(SessionName, UniqueId);
        }
    }
}

simulated function bool IsPrimaryPlayer()
{
    return true;
}

defaultproperties
{
    StringSpectating="Spectating"
    StringUnknown="Unknown"
    GameMessageClass=Class'GameMessage'
    SessionName=Game
    TickGroup=ETickingGroup.TG_DuringAsyncWork
    NetUpdateFrequency=1
}