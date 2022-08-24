/*******************************************************************************
 * KFPlayerReplicationInfoVersus generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFPlayerReplicationInfoVersus extends KFPlayerReplicationInfo
    native(ReplicationInfo)
    nativereplication
    hidecategories(Navigation,Movement,Collision);

var int KillsAsZed;
var int AssistsAsZed;
var int DamageDealtAsZed;
var int ZedGrabs;
var int IndirectDamageDealt;
var array<int> WaveKills;

simulated function Pawn GetOwnerPawn()
{
    local Pawn aPawn;

    foreach WorldInfo.AllPawns(Class'Pawn', aPawn)
    {
        if(aPawn.PlayerReplicationInfo == self)
        {            
            return aPawn;
        }        
    }    
    return none;
}

function SetPlayerTeam(TeamInfo NewTeam)
{
    super.SetPlayerTeam(NewTeam);
    if(NewTeam == none)
    {
        return;
    }
    SetTimer(1, true, 'UpdateReplicatedVariables');
}

reliable server function ServerSwitchTeam()
{
    local KFGameInfo MyGameInfo;
    local KFGameReplicationInfo KFGRI;

    MyGameInfo = KFGameInfo(WorldInfo.Game);
    if(MyGameInfo == none)
    {
        return;
    }
    KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
    if((KFGRI == none) || !KFGRI.bAllowSwitchTeam)
    {
        return;
    }
    if(KFGRI.bMatchHasBegun)
    {
        if(!WillMaintainTeamBalance())
        {
            ClientRefusedTeamSwitch();
            return;
        }
        PlayerController(Owner).Pawn.Suicide();
    }
    switch(GetTeamNum())
    {
        case byte(MyGameInfo.Teams[0].TeamIndex):
            MyGameInfo.SetTeam(PlayerController(Owner), MyGameInfo.Teams[1]);
            break;
        case byte(MyGameInfo.Teams[1].TeamIndex):
            MyGameInfo.SetTeam(PlayerController(Owner), MyGameInfo.Teams[0]);
            break;
        default:
            LogInternal("Function: KFPlayerReplicationInfo::ServerSwitchTeam Team index not accounted for - " @ string(GetTeamNum()));
            break;
    }
    if(PlayerController(Owner).IsLocalController() && Role == ROLE_Authority)
    {
        ClientRecieveNewTeam();
    }
}

function bool WillMaintainTeamBalance()
{
    local KFGameInfo MyGameInfo;
    local KFGameReplicationInfo KFGRI;
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(Owner);
    MyGameInfo = KFGameInfo(WorldInfo.Game);
    KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
    if(KFGRI.bMatchHasBegun)
    {
        if((KFPC.Pawn == none) && GetTeamNum() == 0)
        {
            return false;
        }
        switch(GetTeamNum())
        {
            case byte(MyGameInfo.Teams[0].TeamIndex):
                return (MyGameInfo.Teams[1].Size < MyGameInfo.Teams[0].Size) && MyGameInfo.Teams[1].Size < (MyGameInfo.MaxPlayersAllowed / 2);
            case byte(MyGameInfo.Teams[1].TeamIndex):
                return (MyGameInfo.Teams[0].Size < MyGameInfo.Teams[1].Size) && MyGameInfo.Teams[0].Size < (MyGameInfo.MaxPlayersAllowed / 2);
            default:
                LogInternal("Function: KFPlayerReplicationInfo::WillUpsetTeamBalance Team index not accounted for - " @ string(GetTeamNum()));
                break;
            }
    }
    return true;
}

reliable client simulated function ClientRefusedTeamSwitch()
{
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(Owner);
    if((KFPC != none) && KFPC.IsLocalController())
    {
        if((KFPC.MyGFxManager != none) && KFPC.MyGFxManager.bMenusOpen)
        {
            KFPC.MyGFxManager.DelayedOpenPopup(2, 1, Class'KFCommon_LocalizedStrings'.default.UnableToSwitchTeamString, Class'KFCommon_LocalizedStrings'.default.NoSwitchReasonString, Class'KFCommon_LocalizedStrings'.default.OKString);            
        }
        else
        {
            if(KFPC.myGfxHUD != none)
            {
                KFPC.myGfxHUD.ShowNonCriticalMessage(Class'KFCommon_LocalizedStrings'.default.NoSwitchReasonString);
            }
        }
    }
}

reliable client simulated function ClientRecieveNewTeam()
{
    local KFGameReplicationInfo KFGRI;
    local KFGFxHudWrapper myGfxHUD;
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(Owner);
    if((KFPC != none) && KFPC.IsLocalController())
    {
        myGfxHUD = KFGFxHudWrapper(KFPC.myHUD);
        if(myGfxHUD != none)
        {
            KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
            if(KFGRI.bMatchHasBegun && KFPC.PlayerReplicationInfo.bReadyToPlay)
            {
                myGfxHUD.CreateHUDMovie(true);
            }
        }
        KFPC.ClientRecieveNewTeam();
    }
}

simulated function VOIPStatusChanged(PlayerReplicationInfo Talker, bool bIsTalking)
{
    if(Talker.GetTeamNum() != GetTeamNum())
    {
        return;
    }
    super.VOIPStatusChanged(Talker, bIsTalking);
}

function RecordEndGameInfo()
{
    local KFPlayerController KFPC;

    if(GetTeamNum() == 255)
    {
        KFPC = KFPlayerController(Owner);
        if((KFPC != none) && KFPC.MatchStats != none)
        {
            KillsAsZed = Kills;
            AssistsAsZed = Assists;
            DamageDealtAsZed = KFPC.MatchStats.TotalDamageDealt;
        }
    }
}

function IncrementDeaths(optional int Amt)
{
    local KFGameInfo MyGameInfo;

    Amt = 1;
    super.IncrementDeaths(Amt);
    if((((bReadyToPlay && !bWaitingPlayer) && WorldInfo.GRI.bMatchHasBegun) && !WorldInfo.GRI.bMatchIsOver) && GetTeamNum() == 0)
    {
        MyGameInfo = KFGameInfo(WorldInfo.Game);
        if(MyGameInfo != none)
        {
            MyGameInfo.HumanDeaths += Amt;
        }
    }
}

function Reset()
{
    local bool bPrevWaitingPlayer, bPrevReadyToPlay;

    Assists = 0;
    bPrevWaitingPlayer = bWaitingPlayer;
    bPrevReadyToPlay = bReadyToPlay;
    super(PlayerReplicationInfo).Reset();
    bWaitingPlayer = bPrevWaitingPlayer;
    bReadyToPlay = bPrevReadyToPlay;
}
