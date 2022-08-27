/*******************************************************************************
 * KFVoteCollector generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFVoteCollector extends Object within KFGameReplicationInfo;

struct sKickVoteInfo
{
    var UniqueNetId PlayerID;
    var PlayerReplicationInfo PlayerPRI;
    var string PlayerIPAddress;

    structdefaultproperties
    {
        PlayerID=(Uid=none)
        PlayerPRI=none
        PlayerIPAddress=""
    }
};

struct MapVote
{
    var array<PlayerReplicationInfo> VoterPRIList;
    var int MapIndex;

    structdefaultproperties
    {
        VoterPRIList=none
        MapIndex=0
    }
};

struct TopVotes
{
    var string Map1Name;
    var byte Map1Votes;
    var string Map2Name;
    var byte Map2Votes;
    var string Map3Name;
    var byte Map3Votes;

    structdefaultproperties
    {
        Map1Name=""
        Map1Votes=255
        Map2Name=""
        Map2Votes=255
        Map3Name=""
        Map3Votes=255
    }
};

var byte VoteTime;
var byte ShortenedTime;
var byte YesVotes;
var byte NoVotes;
var byte KickedPlayers;
var byte LastKickVoteValue;
var sKickVoteInfo CurrentVote;
var bool bIsVoteInProgress;
var bool bIsFailedVoteTimerActive;
var bool bAllPlayersVotedOnMap;
var const int TopResultsToShow;
var const int ActiveTimeUntilVoteEnabled;
var array<PlayerReplicationInfo> PlayersThatHaveVoted;
var array<PlayerReplicationInfo> PlayersReadyToSkipTrader;
var int TimeAfterSkipTrader;
var TopVotes TopVotesObject;
var array<MapVote> MapVoteList;
var array<string> MapList;

function ServerStartVoteKick(PlayerReplicationInfo PRI_Kickee, PlayerReplicationInfo PRI_Kicker)
{
    local int I;
    local array<KFPlayerReplicationInfo> PRIs;
    local KFGameInfo KFGI;
    local KFPlayerController KFPC, KickeePC;

    KFGI = KFGameInfo(Outer.WorldInfo.Game);
    KFPC = KFPlayerController(PRI_Kicker.Owner);
    KickeePC = KFPlayerController(PRI_Kickee.Owner);
    if(KFGI.bDisableKickVote)
    {
        KFPC.ReceiveLocalizedMessage(Class'KFLocalMessage', 10);
        return;
    }
    if(PRI_Kicker.bOnlySpectator)
    {
        KFPC.ReceiveLocalizedMessage(Class'KFLocalMessage', 18);
        return;
    }
    if(KFGI.NumPlayers <= 2)
    {
        KFPC.ReceiveLocalizedMessage(Class'KFLocalMessage', 17);
        return;
    }
    if(KickedPlayers >= 2)
    {
        KFPC.ReceiveLocalizedMessage(Class'KFLocalMessage', 16);
        return;
    }
    if(KFGI.AccessControl != none)
    {
        if(KFGI.AccessControl.IsAdmin(KickeePC))
        {
            KFPC.ReceiveLocalizedMessage(Class'KFLocalMessage', 13);
            return;
        }
    }
    if(bIsFailedVoteTimerActive)
    {
        KFPC.ReceiveLocalizedMessage(Class'KFLocalMessage', 8);
        return;
    }
    if(!bIsVoteInProgress)
    {
        PlayersThatHaveVoted.Length = 0;
        CurrentVote.PlayerID = PRI_Kickee.UniqueId;
        CurrentVote.PlayerPRI = PRI_Kickee;
        CurrentVote.PlayerIPAddress = KickeePC.GetPlayerNetworkAddress();
        bIsVoteInProgress = true;
        Outer.GetKFPRIArray(PRIs);
        I = 0;
        J0x3A8:

        if(I < PRIs.Length)
        {
            PRIs[I].ShowKickVote(PRI_Kickee, VoteTime, !(PRIs[I] == PRI_Kicker) || PRIs[I] == PRI_Kickee);
            ++ I;
            goto J0x3A8;
        }
        KFGI.BroadcastLocalized(KFGI, Class'KFLocalMessage', 5, CurrentVote.PlayerPRI);
        Outer.SetTimer(float(VoteTime), false, 'ConcludeVoteKick', self);
        RecieveVoteKick(PRI_Kicker, true);        
    }
    else
    {
        if(PRI_Kickee == CurrentVote.PlayerPRI)
        {
            RecieveVoteKick(PRI_Kicker, false);            
        }
        else
        {
            KFPlayerController(PRI_Kicker.Owner).ReceiveLocalizedMessage(Class'KFLocalMessage', 9);
        }
    }
}

reliable server function ResetTraderVote()
{
    PlayersReadyToSkipTrader.Length = 0;
}

reliable server function SkipTraderTime()
{
    local KFGameReplicationInfo KFGRI;
    local KFGameInfo KFGI;

    KFGI = KFGameInfo(Outer.WorldInfo.Game);
    KFGRI = Outer;
    if(KFGRI.RemainingTime > TimeAfterSkipTrader)
    {
        KFGRI.RemainingTime = TimeAfterSkipTrader;
        KFGRI.RemainingMinute = TimeAfterSkipTrader;
        KFGI.SkipTrader(TimeAfterSkipTrader);
    }
}

reliable server function RecieveSkipTraderTimeVote(PlayerReplicationInfo PRI)
{
    if(PlayersThatHaveVoted.Find(PRI == -1)
    {
        PlayersReadyToSkipTrader.AddItem(PRI;
        if(ShouldSkipTrader())
        {
            SkipTraderTime();
            ResetTraderVote();
        }
    }
}

function bool ShouldSkipTrader()
{
    local array<KFPlayerReplicationInfo> PRIs;
    local int I;

    if(PlayersReadyToSkipTrader.Length <= 0)
    {
        return false;
    }
    Outer.GetKFPRIArray(PRIs);
    I = 0;
    J0x46:

    if(I < PRIs.Length)
    {
        if(PlayersReadyToSkipTrader.Find(PRIs[I] == -1)
        {
            return false;
        }
        ++ I;
        goto J0x46;
    }
    return true;
}

reliable server function RecieveVoteKick(PlayerReplicationInfo PRI, bool bKick)
{
    local KFPlayerController KFPC;

    if(PlayersThatHaveVoted.Find(PRI == -1)
    {
        PlayersThatHaveVoted.AddItem(PRI;
        if(bKick)
        {
            ++ YesVotes;            
        }
        else
        {
            ++ NoVotes;
        }
        KFPC = KFPlayerController(PRI.Owner);
        if(KFPC != none)
        {
            if(bKick)
            {
                KFPC.ReceiveLocalizedMessage(Class'KFLocalMessage', 11, CurrentVote.PlayerPRI);                
            }
            else
            {
                KFPC.ReceiveLocalizedMessage(Class'KFLocalMessage', 12, CurrentVote.PlayerPRI);
            }
        }
        if(ShouldConcludeVote())
        {
            ConcludeVoteKick();            
        }
        else
        {
            ReplicateVotes();
        }
    }
}

function ReplicateVotes()
{
    Outer.RepKickVotes = byte(Min(YesVotes, 15) << 4);
    Outer.RepKickVotes = byte(Outer.RepKickVotes | Min(NoVotes, 15));
    if((Outer.Role == ROLE_Authority) && Outer.WorldInfo.NetMode != NM_DedicatedServer)
    {
        UnPackVotes();
    }
}

function UnPackVotes()
{
    local KFPlayerController KFPC;

    if(LastKickVoteValue != Outer.RepKickVotes)
    {
        NoVotes = byte(Outer.RepKickVotes & 15);
        YesVotes = byte(Outer.RepKickVotes >> 4);
        KFPC = KFPlayerController(Outer.GetALocalPlayerController());
        if((KFPC != none) && KFPC.myGfxHUD != none)
        {
            KFPC.myGfxHUD.UpdateKickVoteCount(YesVotes, NoVotes);
        }
        LastKickVoteValue = Outer.RepKickVotes;
    }
}

function bool ShouldConcludeVote()
{
    local array<KFPlayerReplicationInfo> PRIs;
    local KFGameInfo KFGI;
    local int NumPRIs, KickVotesNeeded;

    KFGI = KFGameInfo(Outer.WorldInfo.Game);
    Outer.GetKFPRIArray(PRIs);
    NumPRIs = PRIs.Length;
    if(PRIs.Find(CurrentVote.PlayerPRI != -1)
    {
        -- NumPRIs;
    }
    if((YesVotes + NoVotes) >= NumPRIs)
    {
        return true;        
    }
    else
    {
        if(KFGI != none)
        {
            KickVotesNeeded = FCeil(float(NumPRIs) * KFGI.KickVotePercentage);
            KickVotesNeeded = Clamp(KickVotesNeeded, 1, NumPRIs);
            if(YesVotes >= KickVotesNeeded)
            {
                return true;                
            }
            else
            {
                if(NoVotes > (NumPRIs - KickVotesNeeded))
                {
                    return true;
                }
            }
        }
    }
    return false;
}

reliable server function ConcludeVoteKick()
{
    local array<KFPlayerReplicationInfo> PRIs;
    local int I, NumPRIs;
    local KFGameInfo KFGI;
    local KFPlayerController KickedPC;
    local int KickVotesNeeded;

    KFGI = KFGameInfo(Outer.WorldInfo.Game);
    if(bIsVoteInProgress)
    {
        Outer.GetKFPRIArray(PRIs);
        I = 0;
        J0x87:

        if(I < PRIs.Length)
        {
            PRIs[I].HideKickVote();
            ++ I;
            goto J0x87;
        }
        NumPRIs = PRIs.Length;
        if(PRIs.Find(CurrentVote.PlayerPRI != -1)
        {
            -- NumPRIs;
        }
        KickVotesNeeded = FCeil(float(NumPRIs) * KFGI.KickVotePercentage);
        KickVotesNeeded = Clamp(KickVotesNeeded, 1, NumPRIs);
        if(YesVotes >= KickVotesNeeded)
        {
            if((CurrentVote.PlayerPRI == none) || CurrentVote.PlayerPRI.bPendingDelete)
            {
                I = 0;
                J0x203:

                if(I < Outer.WorldInfo.Game.InactivePRIArray.Length)
                {
                    if(Outer.WorldInfo.Game.InactivePRIArray[I].UniqueId == CurrentVote.PlayerID)
                    {
                        CurrentVote.PlayerPRI = Outer.WorldInfo.Game.InactivePRIArray[I];
                        goto J0x369;
                    }
                    ++ I;
                    goto J0x203;
                }
            }
            J0x369:

            if(KFGI.AccessControl != none)
            {
                KickedPC = (((CurrentVote.PlayerPRI != none) && CurrentVote.PlayerPRI.Owner != none) ? KFPlayerController(CurrentVote.PlayerPRI.Owner) : none);
                KFAccessControl(KFGI.AccessControl).KickSessionBanPlayer(KickedPC, CurrentVote.PlayerID, KFGI.AccessControl.KickedMsg);
            }
            KFGI.BroadcastLocalized(KFGI, Class'KFLocalMessage', 7, CurrentVote.PlayerPRI);
            ++ KickedPlayers;            
        }
        else
        {
            bIsFailedVoteTimerActive = true;
            Outer.SetTimer(KFGI.TimeBetweenFailedVotes, false, 'ClearFailedVoteFlag', self);
            KFGI.BroadcastLocalized(KFGI, Class'KFLocalMessage', 6, CurrentVote.PlayerPRI);
        }
        bIsVoteInProgress = false;
        CurrentVote.PlayerPRI = none;
        CurrentVote.PlayerID = Class'PlayerReplicationInfo'.default.UniqueId;
        YesVotes = 0;
        NoVotes = 0;
    }
}

function ClearFailedVoteFlag()
{
    bIsFailedVoteTimerActive = false;
}

function AddMapOption(string MapOption)
{
    if(Outer.WorldInfo.NetMode != NM_Standalone)
    {
        MapList.AddItem(MapOption;
    }
}

function int GetNextMap()
{
    if(MapVoteList.Length > 0)
    {
        return MapVoteList[0].MapIndex;
    }
    return -1;
}

function SearchAndClearPreviousVote(PlayerReplicationInfo PRI)
{
    local int I;

    I = 0;
    J0x0B:

    if(I < MapVoteList.Length)
    {
        if(MapVoteList[I].VoterPRIList.Find(PRI != -1)
        {
            MapVoteList[I].VoterPRIList.RemoveItem(PRI;
            return;
        }
        ++ I;
        goto J0x0B;
    }
}

reliable server function ReceiveVoteMap(PlayerReplicationInfo PRI, int MapIndex)
{
    local int I;
    local bool bMapFound;
    local MapVote TempMapVote;
    local array<KFPlayerReplicationInfo> PRIs;
    local KFGameInfo KFGI;

    Outer.GetKFPRIArray(PRIs);
    if(MapVoteList.Length > 0)
    {
        SearchAndClearPreviousVote(PRI);
        I = 0;
        J0x57:

        if(I < MapVoteList.Length)
        {
            if(MapVoteList[I].MapIndex == MapIndex)
            {
                bMapFound = true;
                MapVoteList[I].VoterPRIList.AddItem(PRI;
                goto J0xF3;
            }
            ++ I;
            goto J0x57;
        }
    }
    J0xF3:

    if(!bMapFound)
    {
        TempMapVote.MapIndex = MapIndex;
        TempMapVote.VoterPRIList.AddItem(PRI;
        MapVoteList.AddItem(TempMapVote;
    }    
    MapVoteList.Sort(MapVoteSort;
    KFGI = KFGameInfo(Outer.WorldInfo.Game);
    I = 0;
    J0x1DF:

    if(I < TopResultsToShow)
    {
        if(I < MapVoteList.Length)
        {
            switch(I)
            {
                case 0:
                    TopVotesObject.Map1Votes = byte(MapVoteList[I].VoterPRIList.Length);
                    if(Outer.WorldInfo.NetMode == NM_Standalone)
                    {
                        TopVotesObject.Map1Name = MapList[MapIndex];                        
                    }
                    else
                    {
                        TopVotesObject.Map1Name = KFGI.GameMapCycles[KFGI.ActiveMapCycle].Maps[MapVoteList[I].MapIndex];
                    }
                    if(CheckMajorityPlayersVotedOnMap(PRIs, MapVoteList[I].VoterPRIList.Length))
                    {
                        ShortenVoteTime(KFGI);
                    }
                    break;
                case 1:
                    TopVotesObject.Map2Votes = byte(MapVoteList[I].VoterPRIList.Length);
                    if(Outer.WorldInfo.NetMode == NM_Standalone)
                    {
                        TopVotesObject.Map2Name = MapList[MapIndex];                        
                    }
                    else
                    {
                        TopVotesObject.Map2Name = KFGI.GameMapCycles[KFGI.ActiveMapCycle].Maps[MapVoteList[I].MapIndex];
                    }
                    break;
                case 2:
                    TopVotesObject.Map3Votes = byte(MapVoteList[I].VoterPRIList.Length);
                    if(Outer.WorldInfo.NetMode == NM_Standalone)
                    {
                        TopVotesObject.Map3Name = MapList[MapIndex];                        
                    }
                    else
                    {
                        TopVotesObject.Map3Name = KFGI.GameMapCycles[KFGI.ActiveMapCycle].Maps[MapVoteList[I].MapIndex];
                    }
                    break;
                default:
                    break;
            }
        }
        else
        {
            ++ I;
            goto J0x1DF;
        }/* !MISMATCHING REMOVE, tried Loop got Type:Else Position:0x66B! */
        I = 0;
        J0x684:

        if(I < PRIs.Length)
        {
            PRIs[I].RecieveTopMaps(TopVotesObject);
            ++ I;
            goto J0x684;
        }
        if(CheckAllPlayerVoted(PRIs))
        {
            ShortenVoteTime(KFGI);
        }
    }/* !MISMATCHING REMOVE, tried Else got Type:Loop Position:0x1DF! */
}

function ShortenVoteTime(KFGameInfo KFGI)
{
    if(!bAllPlayersVotedOnMap && KFGI != none)
    {
        bAllPlayersVotedOnMap = true;
        KFGI.UpdateCurrentMapVoteTime(ShortenedTime, true);
    }
}

function bool CheckMajorityPlayersVotedOnMap(out array<KFPlayerReplicationInfo> PRIs, int NumOfVotesOnMap)
{
    local float VotePercentage;

    VotePercentage = float(NumOfVotesOnMap) / float(PRIs.Length);
    return VotePercentage > 0.5;
}

function bool CheckAllPlayerVoted(out array<KFPlayerReplicationInfo> PRIs)
{
    local int I, J, PlayerVoteCount;

    I = 0;
    J0x0B:

    if(I < PRIs.Length)
    {
        J = 0;
        J0x2E:

        if(J < MapVoteList.Length)
        {
            if(MapVoteList[J].VoterPRIList.Find(PRIs[I] != -1)
            {
                ++ PlayerVoteCount;
            }
            ++ J;
            goto J0x2E;
        }
        ++ I;
        goto J0x0B;
    }
    return PlayerVoteCount >= PRIs.Length;
}

function int MapVoteSort(MapVote A, MapVote B)
{
    local int Result;

    if(A.VoterPRIList.Length == B.VoterPRIList.Length)
    {
        Result = 0;        
    }
    else
    {
        Result = ((A.VoterPRIList.Length > B.VoterPRIList.Length) ? 1 : -1);
    }
    return Result;
}

defaultproperties
{
    VoteTime=30
    ShortenedTime=10
    TopResultsToShow=3
    ActiveTimeUntilVoteEnabled=30
    TimeAfterSkipTrader=5
    TopVotesObject=(Map1Name="",Map1Votes=255,Map2Name="",Map2Votes=255,Map3Name="",Map3Votes=255)
}