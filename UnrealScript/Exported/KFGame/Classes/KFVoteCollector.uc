class KFVoteCollector extends Object within KFGameReplicationInfo;

/************************************
* @name 	Kick Vote Vars
************************************/

struct sKickVoteInfo
{
	var UniqueNetId PlayerID;
	var PlayerReplicationInfo PlayerPRI;
	var string PlayerIPAddress;
};

var byte VoteTime;
var byte ShortenedTime;
var sKickVoteInfo CurrentVote;
var bool bIsVoteInProgress;
var bool bIsFailedVoteTimerActive;
var byte YesVotes;
var byte NoVotes;
var byte KickedPlayers;
var const int TopResultsToShow;
var const int ActiveTimeUntilVoteEnabled;
//keep track of people that have voted so that they cannot hack and force a player out
var array<PlayerReplicationInfo> PlayersThatHaveVoted;
var byte LastKickVoteValue;

/************************************
* @name 	Map Vote Vars
************************************/

struct MapVote
{
	var Array<PlayerReplicationInfo> VoterPRIList; //the pri of the user that voted
	var int MapIndex; //the map the user voted for
};

struct TopVotes
{
	var string Map1Name;
	var byte Map1Votes;

	var string Map2Name;
	var byte Map2Votes;

	var string Map3Name;
	var byte Map3Votes;

	StructDefaultProperties
	{
		Map1Votes=255
		Map2Votes=255
		Map3Votes=255
	}
};

var bool bAllPlayersVotedOnMap;
var TopVotes TopVotesObject;
var array<MapVote> MapVoteList;
var array<string> MapList;

//==============================================================
// @name Kick Vote
//==============================================================

function ServerStartVoteKick(PlayerReplicationInfo PRI_Kickee, PlayerReplicationInfo PRI_Kicker)
{
	local int i;
	local array<KFPlayerReplicationInfo> PRIs;
	local KFGameInfo KFGI;
	local KFPlayerController KFPC, KickeePC;

	KFGI = KFGameInfo(WorldInfo.Game);
	KFPC = KFPlayerController(PRI_Kicker.Owner);
	KickeePC = KFPlayerController(PRI_Kickee.Owner);

	// Kick voting is disabled
	if(KFGI.bDisableKickVote)
	{
		KFPC.ReceiveLocalizedMessage(class'KFLocalMessage', LMT_KickVoteDisabled);
		return;
	}

	// Spectators aren't allowed to vote
	if(PRI_Kicker.bOnlySpectator)
	{
		KFPC.ReceiveLocalizedMessage(class'KFLocalMessage', LMT_KickVoteNoSpectators);
		return;
	}


	// Not enough players to start a vote
	if( KFGI.NumPlayers <= 2 )
	{
		KFPC.ReceiveLocalizedMessage(class'KFLocalMessage', LMT_KickVoteNotEnoughPlayers);
		return;
	}

	// Maximum number of players kicked per match has been reached
	if( KickedPlayers >= 2 )
	{
		KFPC.ReceiveLocalizedMessage(class'KFLocalMessage', LMT_KickVoteMaxKicksReached);
		return;
	}

	// Too early in the match to initiate a vote
	/*if(WorldInfo.GRI.ElapsedTime < ActiveTimeUntilVoteEnabled)  //YAY!  We get to remove this!
	{
		if(WorldInfo.GRI.bMatchHasBegun)
		{
			KFPC.ReceiveLocalizedMessage(class'KFLocalMessage', LMT_KickVoteActiveTime);
		}
		else
		{
			KFPC.ReceiveLocalizedMessage(class'KFLocalMessage', LMT_KickVoteMatchNotStarted);	
		}
		
		return;
	}*/

	// Can't kick admins
	if(KFGI.AccessControl != none)
	{
		if(KFGI.AccessControl.IsAdmin(KickeePC))
		{
			KFPC.ReceiveLocalizedMessage(class'KFLocalMessage', LMT_KickVoteAdmin);
			return;
		}
	}

	// Last vote failed, must wait until failed vote cooldown before starting a new vote
	if( bIsFailedVoteTimerActive )
	{
		KFPC.ReceiveLocalizedMessage(class'KFLocalMessage', LMT_KickVoteRejected);
		return;
	}

	if( !bIsVoteInProgress )
	{
		// Clear voter array
		PlayersThatHaveVoted.Length = 0;

		// Cache off these values in case player leaves before vote ends -- no cheating!
		CurrentVote.PlayerID = PRI_Kickee.UniqueId;
		CurrentVote.PlayerPRI = PRI_Kickee;
		CurrentVote.PlayerIPAddress = KickeePC.GetPlayerNetworkAddress();

		bIsVoteInProgress = true;

		
		
		GetKFPRIArray(PRIs);
		for (i = 0; i < PRIs.Length; i++)
		{
			PRIs[i].ShowKickVote(PRI_Kickee, VoteTime, !(PRIs[i] == PRI_Kicker || PRIs[i] == PRI_Kickee));
		}
		KFGI.BroadcastLocalized(KFGI, class'KFLocalMessage', LMT_KickVoteStarted, CurrentVote.PlayerPRI);
		SetTimer( VoteTime, false, nameof(ConcludeVoteKick), self );
		// Cast initial vote
		RecieveVoteKick(PRI_Kicker, true);
	}
	else if(PRI_Kickee == CurrentVote.PlayerPRI)
	{
		RecieveVoteKick(PRI_Kicker, false);
	}
	else
	{
		// Can't start a new vote until current one is over
		KFPlayerController(PRI_Kicker.Owner).ReceiveLocalizedMessage(class'KFLocalMessage', LMT_KickVoteInProgress);
	}
}

reliable server function RecieveVoteKick(PlayerReplicationInfo PRI, bool bKick)
{
	local KFPlayerController KFPC;

	if(PlayersThatHaveVoted.Find(PRI) == INDEX_NONE)
	{
		//accept their vote
		PlayersThatHaveVoted.AddItem(PRI);
		if(bKick)
		{
			yesVotes++;
		}
		else
		{
			noVotes++;
		}

		KFPC = KFPlayerController(PRI.Owner);
		if(KFPC != none)
		{
			if(bKick)
			{
				KFPC.ReceiveLocalizedMessage(class'KFLocalMessage', LMT_KickVoteYesReceived, CurrentVote.PlayerPRI);
			}
			else
			{
				KFPC.ReceiveLocalizedMessage(class'KFLocalMessage', LMT_KickVoteNoReceived, CurrentVote.PlayerPRI);	
			}
			
		}

		if( ShouldConcludeVote() )
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
	RepKickVotes = Min(YesVotes, 15) << 4;
	RepKickVotes = RepKickVotes | Min(NoVotes, 15);
	if(Role == Role_Authority && WorldInfo.NetMode != NM_DedicatedServer)
	{
		UnPackVotes();
	}
}

function UnPackVotes()
{
	local KFPlayerController KFPC;
	if(LastKickVoteValue != RepKickVotes)
	{
		NoVotes = RepKickVotes & 15;
		YesVotes = RepKickVotes >> 4;

		//Update UI
		KFPC = KFPlayerController(GetALocalPlayerController());
		if(KFPC != none && KFPC.MyGFxHUD != none)
		{
			KFPC.MyGFxHUD.UpdateKickVoteCount(YesVotes, NoVotes);
		}

		LastKickVoteValue = RepKickVotes;
	}
}

function bool ShouldConcludeVote()
{
	local array<KFPlayerReplicationInfo> PRIs;
	local KFGameInfo KFGI;
	local int NumPRIs;
	local int KickVotesNeeded;

	KFGI = KFGameInfo(WorldInfo.Game);

	GetKFPRIArray(PRIs);
	NumPRIs = PRIs.Length;

	// Current Kickee PRI should not count towards vote percentage
	if( PRIs.Find(CurrentVote.PlayerPRI) != INDEX_NONE )
	{
		NumPRIs--;
	}

	if( YesVotes + NoVotes >= NumPRIs )
	{
		return true;
	}
	else if( KFGI != none )
	{
		KickVotesNeeded = FCeil(float(NumPRIs) * KFGI.KickVotePercentage);
		KickVotesNeeded = Clamp(KickVotesNeeded, 1, NumPRIs);

		if( YesVotes >= KickVotesNeeded ) // conclude if vote kick is majority yes
		{
			return true;
		}
		else if( NoVotes > (NumPRIs - KickVotesNeeded) ) // conclude if vote kick can never succeed
		{
			return true;
		}
	}

	return false;
}

reliable server function ConcludeVoteKick()
{
	
	local array<KFPlayerReplicationInfo> PRIs;
	local int i, NumPRIs;
	local KFGameInfo KFGI;
	local KFPlayerController KickedPC;
	local int KickVotesNeeded;

	KFGI = KFGameInfo(WorldInfo.Game);

	if(bIsVoteInProgress)
	{
		GetKFPRIArray(PRIs);

		for (i = 0; i < PRIs.Length; i++)
		{
			PRIs[i].HideKickVote();			
		}

		NumPRIs = PRIs.Length;

		// Current Kickee PRI should not count towards vote percentage
		if( PRIs.Find(CurrentVote.PlayerPRI) != INDEX_NONE )
		{
			NumPRIs--;
		}

		KickVotesNeeded = FCeil(float(NumPRIs) * KFGI.KickVotePercentage);
		KickVotesNeeded = Clamp(KickVotesNeeded, 1, NumPRIs);

		if( YesVotes >= KickVotesNeeded )
		{
			// See if kicked player has left
			if( CurrentVote.PlayerPRI == none || CurrentVote.PlayerPRI.bPendingDelete )
			{
				for( i = 0; i < WorldInfo.Game.InactivePRIArray.Length; i++ )
				{
					if( WorldInfo.Game.InactivePRIArray[i].UniqueId == CurrentVote.PlayerID )
					{
						CurrentVote.PlayerPRI = WorldInfo.Game.InactivePRIArray[i];
						break;
					}
				}
			}


			if(KFGI.AccessControl != none)
			{
				KickedPC = ( (CurrentVote.PlayerPRI != none) && (CurrentVote.PlayerPRI.Owner != none) ) ? KFPlayerController(CurrentVote.PlayerPRI.Owner) : none;
				KFAccessControl(KFGI.AccessControl).KickSessionBanPlayer(KickedPC, CurrentVote.PlayerID, KFGI.AccessControl.KickedMsg);
			}
			//tell server to kick target PRI
			KFGI.BroadcastLocalized(KFGI, class'KFLocalMessage', LMT_KickVoteSucceeded, CurrentVote.PlayerPRI);

			// Increment number of kicked players this session
			KickedPlayers++;
		}
		else
		{
			//Set timer so that votes cannot be spammed
			bIsFailedVoteTimerActive=true;
			SetTimer( KFGI.TimeBetweenFailedVotes, false, nameof(ClearFailedVoteFlag), self );
			KFGI.BroadcastLocalized(KFGI, class'KFLocalMessage', LMT_KickVoteFailed, CurrentVote.PlayerPRI);
		}

		bIsVoteInProgress = false;
		CurrentVote.PlayerPRI = none;
		CurrentVote.PlayerID = class'PlayerReplicationInfo'.default.UniqueId;
		yesVotes = 0;
		noVotes = 0;
	}
}

function ClearFailedVoteFlag()
{
	bIsFailedVoteTimerActive=false;
}

//==============================================================
// @name Map Vote
//==============================================================

function AddMapOption(string MapOption)
{
	if(WorldInfo.NetMode != NM_Standalone)
	{
		MapList.AddItem(MapOption);
	}
}

function int GetNextMap()
{	
	if(MapVoteList.length > 0)
	{
		return MapVoteList[0].MapIndex;
	}

	return -1;
}

function SearchAndClearPreviousVote(PlayerReplicationInfo PRI)
{
	local int i;
	for (i = 0; i < MapVoteList.length; i++)
	{
		if(MapVoteList[i].VoterPRIList.Find(PRI) != INDEX_NONE)
		{
			MapVoteList[i].VoterPRIList.RemoveItem(PRI);
			return;
		}
	}
}

reliable server function ReceiveVoteMap(PlayerReplicationInfo PRI, int MapIndex)
{
	local int  i;
	local bool bMapFound;
	local MapVote TempMapVote;
	local array<KFPlayerReplicationInfo> PRIs;
	local KFGameInfo KFGI;

	GetKFPRIArray(PRIs);

	if(MapVoteList.length > 0)
	{
		SearchAndClearPreviousVote(PRI);

		//Search to see if this user has voted already
		for (i = 0; i < MapVoteList.length; i++)
		{
			if(MapVoteList[i].MapIndex == MapIndex)
			{
				bMapFound = true;
				MapVoteList[i].VoterPRIList.AddItem(PRI);
				break;
			}
		}
	}

	if(!bMapFound)
	{
		TempMapVote.MapIndex = MapIndex;
		TempMapVote.VoterPRIList.AddItem(PRI);
		MapVoteList.AddItem(TempMapVote);
	}

	//Sort Map list 
	MapVoteList.Sort(MapVoteSort);

	KFGI = KFGameInfo(WorldInfo.Game);
	for (i = 0; i < TopResultsToShow; i++)
	{
		if(i < MapVoteList.length)
		{
			switch (i)
			{
				case 0:
					TopVotesObject.Map1Votes = MapVoteList[i].VoterPRIList.length;
					if(WorldInfo.NetMode == NM_StandAlone)
					{
						TopVotesObject.Map1Name = MapList[MapIndex];
					}
					else
					{
						TopVotesObject.Map1Name = KFGI.GameMapCycles[KFGI.ActiveMapCycle].Maps[MapVoteList[i].MapIndex];
					}
					
					if(CheckMajorityPlayersVotedOnMap(PRIs, MapVoteList[i].VoterPRIList.length))
					{
						ShortenVoteTime(KFGI);
					}
					break;
			
				case 1:
					TopVotesObject.Map2Votes = MapVoteList[i].VoterPRIList.length;
					if(WorldInfo.NetMode == NM_StandAlone)
					{
						TopVotesObject.Map2Name = MapList[MapIndex];
					}
					else
					{
						TopVotesObject.Map2Name = KFGI.GameMapCycles[KFGI.ActiveMapCycle].Maps[MapVoteList[i].MapIndex];
					}
					
					break;
					
				case 2:
					TopVotesObject.Map3Votes = MapVoteList[i].VoterPRIList.length;
					if(WorldInfo.NetMode == NM_StandAlone)
					{
						TopVotesObject.Map3Name = MapList[MapIndex];
					}
					else
					{
						TopVotesObject.Map3Name = KFGI.GameMapCycles[KFGI.ActiveMapCycle].Maps[MapVoteList[i].MapIndex];
					}
					
					break;					
			}
		}
	}

	//Send out top 3 votes
	for(i = 0; i < PRIs.length; i++)
	{
		PRIs[i].RecieveTopMaps(TopVotesObject);
	}

	if(CheckAllPlayerVoted(PRIs))
	{
		ShortenVoteTime(KFGI);
	}
}

function ShortenVoteTime(KFGameInfo KFGI)
{
	if( !bAllPlayersVotedOnMap && KFGI != none)
	{
		bAllPlayersVotedOnMap = true;
		KFGI.UpdateCurrentMapVoteTime(ShortenedTime, true);
	}
}

function bool CheckMajorityPlayersVotedOnMap(out array<KFPlayerReplicationInfo> PRIs, int NumOfVotesOnMap)
{
	local float VotePercentage;

	VotePercentage = Float(NumOfVotesOnMap) / Float(PRIs.Length);

	return VotePercentage > 0.5f;
}

function bool CheckAllPlayerVoted(out array<KFPlayerReplicationInfo> PRIs)
{
	local int i, j, PlayerVoteCount;
	for (i = 0; i < PRIs.length; i++)
	{
		for (j = 0; j < MapVoteList.length; j++)
		{
			if(MapVoteList[j].VoterPRIList.Find(PRIs[i]) != INDEX_NONE)
			{
				PlayerVoteCount++;
			}
		}
	}

	return PlayerVoteCount >= PRIs.length;
}

function int MapVoteSort(MapVote A, MapVote B)
{
	local int Result;

	if (A.VoterPRIList.Length == B.VoterPRIList.Length)
	{
		Result = 0;
	}
	else 
	{
		Result = A.VoterPRIList.Length > B.VoterPRIList.Length ? 1 : -1;
	}

	return Result;
}

defaultproperties
{
   VoteTime=30
   ShortenedTime=10
   TopResultsToShow=3
   ActiveTimeUntilVoteEnabled=30
   TopVotesObject=(Map1Votes=255,Map2Votes=255,Map3Votes=255)
   Name="Default__KFVoteCollector"
   ObjectArchetype=Object'Core.Default__Object'
}
