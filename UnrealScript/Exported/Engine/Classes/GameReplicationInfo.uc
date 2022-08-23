//=============================================================================
// GameReplicationInfo.
// Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
//
// Every GameInfo creates a GameReplicationInfo, which is always relevant, to replicate
// important game data to clients (as the GameInfo is not replicated).
//=============================================================================
class GameReplicationInfo extends ReplicationInfo
	config(Game)
	native(ReplicationInfo)
	nativereplication;

/** Class of the server's gameinfo, assigned by GameInfo. */
var repnotify class<GameInfo> GameClass;

/** If true, stop RemainingTime countdown */
var bool bStopCountDown;

/** Match is in progress (replicated) */
var repnotify bool bMatchHasBegun;

/** Match is over (replicated) */
var repnotify bool bMatchIsOver;

//@HSL_BEGIN - JRO - 6/26/2016 - Moving this from KFGameReplicationInfoVersus so it can be used in OnlineSubsystem
/** Indicates that we are in the post-round waiting period */
var repnotify bool bRoundIsOver;
//@HSL_END

//@HSL_BEGIN - JRO - 6/15/2016 - Make sure we're still at full speed before the end of game menu shows up
/** Match is almost over, but not quite */
var bool bWaitingForAAR;
//@HSL_END

/** Used for counting down time in time limited games */
var int  RemainingTime, ElapsedTime, RemainingMinute;

/** Replicates scoring goal for this match */
var int GoalScore;

/** Replicates time limit for this match */
var int TimeLimit;

/** Replicated list of teams participating in this match */
var array<TeamInfo > Teams;

/** Name of the server, i.e.: Bob's Server. */
var() globalconfig string ServerName;		

/** Match winner.  Set by gameinfo when game ends */
var Actor Winner;			

/** Array of all PlayerReplicationInfos, maintained on both server and clients (PRIs are always relevant) */
var		array<PlayerReplicationInfo> PRIArray;

/** This list mirrors the GameInfo's list of inactive PRI objects */
var		array<PlayerReplicationInfo> InactivePRIArray;


/** Set when the exit cue of the current music track is hit */
var bool bPendingMusicTrackChange;


// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

replication
{
	if ( bNetDirty )
		bStopCountDown, Winner, bMatchHasBegun, bMatchIsOver, bRoundIsOver;

	if ( !bNetInitial && bNetDirty )
		RemainingMinute;

	if ( bNetInitial )
		GameClass, RemainingTime, ElapsedTime, GoalScore, TimeLimit, ServerName;
}


simulated event PostBeginPlay()
{
	local PlayerReplicationInfo PRI;
	local TeamInfo TI;

	if( WorldInfo.NetMode == NM_Client )
	{
		// clear variables so we don't display our own values if the server has them left blank
		ServerName = "";
	}

	SetTimer(WorldInfo.TimeDilation, true);

	WorldInfo.GRI = self;

	ForEach DynamicActors(class'PlayerReplicationInfo',PRI)
	{
		AddPRI(PRI);
	}
	foreach DynamicActors(class'TeamInfo', TI)
	{
		if (TI.TeamIndex >= 0)
		{
			SetTeam(TI.TeamIndex, TI);
		}
	}
}

simulated event ReplicatedEvent(name VarName)
{
	if ( VarName == 'bMatchHasBegun' )
	{
		if (bMatchHasBegun)
		{
			WorldInfo.NotifyMatchStarted();
			// @todo ib2merge - Chair added this - we could add a boolean to call this or not, set it to true in SwordGRI
			// StartMatch();
		}
	}
	else if ( VarName == 'bMatchIsOver' )
	{
		if ( bMatchIsOver )
		{
			EndGame();
		}
	}
	else if ( VarName == 'GameClass' )
	{
		ReceivedGameClass();
	}
	else
	{
		Super.ReplicatedEvent(VarName);
	}
}


/** Called when the GameClass property is set (at startup for the server, after the variable has been replicated on clients) */
simulated function ReceivedGameClass()
{
	local PlayerController PC;
	// Tell each PlayerController that the Game class is here
	foreach LocalPlayerControllers(class'PlayerController',PC)
	{
		PC.ReceivedGameClass(GameClass);
	}
}

/* Reset()
reset actor to initial state - used when restarting level without reloading.
*/
function Reset()
{
	Super.Reset();
	Winner = None;
}

simulated event Timer()
{
	if ( (WorldInfo.Game == None) || WorldInfo.Game.MatchIsInProgress() )
	{
		ElapsedTime++;
	}
	if ( WorldInfo.NetMode == NM_Client )
	{
		// sync remaining time with server once a minute
		if ( RemainingMinute != 0 )
		{
			RemainingTime = RemainingMinute;
			RemainingMinute = 0;
		}
	}
	if ( (RemainingTime > 0) && !bStopCountDown )
	{
		RemainingTime--;
		if ( WorldInfo.NetMode != NM_Client )
		{
			if ( RemainingTime % 60 == 0 )
			{
				RemainingMinute = RemainingTime;
			}
		}
	}

	SetTimer(WorldInfo.TimeDilation, true);
}

/**
 * Checks to see if two actors are on the same team.
 *
 * @return	true if they are, false if they aren't
 */
simulated native function bool OnSameTeam(Actor A, Actor B);


simulated function AddPRI(PlayerReplicationInfo PRI)
{
	local int i;

	// Determine whether it should go in the active or inactive list
	if (!PRI.bIsInactive)
	{
		// make sure no duplicates
		for (i=0; i<PRIArray.Length; i++)
		{
			if (PRIArray[i] == PRI)
				return;
		}

		PRIArray[PRIArray.Length] = PRI;
	}
	else
	{
		// Add once only
		if (InactivePRIArray.Find(PRI) == INDEX_NONE)
		{
			InactivePRIArray[InactivePRIArray.Length] = PRI;
		}
	}
}

simulated function RemovePRI(PlayerReplicationInfo PRI)
{
    local int i;

    for (i=0; i<PRIArray.Length; i++)
    {
		if (PRIArray[i] == PRI)
		{
		    PRIArray.Remove(i,1);
			return;
		}
    }
}

/**
 * Assigns the specified TeamInfo to the location specified.
 *
 * @param	Index	location in the Teams array to place the new TeamInfo.
 * @param	TI		the TeamInfo to assign
 */
simulated function SetTeam( int Index, TeamInfo TI )
{
	//`log(GetFuncName()@`showvar(Index)@`showvar(TI));
	if ( Index >= 0 )
	{
		Teams[Index] = TI;
	}
}

/**
 * Called on the server when the match has begin
 *
 * Network - Server and Client (Via ReplicatedEvent)
 */

simulated function StartMatch()
{
	bMatchHasBegun = true;
}

/**
 * Called on the server when the match is over
 *
 * Network - Server and Client (Via ReplicatedEvent)
 */

simulated function EndGame()
{
	bMatchIsOver = true;
}

/** Is the current gametype a multiplayer game? */
simulated function bool IsMultiplayerGame()
{
	return (WorldInfo.NetMode != NM_Standalone);
}

/** Is the current gametype a coop multiplayer game? */
simulated function bool IsCoopMultiplayerGame()
{
	return FALSE;
}

/** Should players show gore? */
simulated event bool ShouldShowGore()
{
	return TRUE;
}


//@HSL_BEGIN - BWJ - 6-8-16 - Playfab hooks for server
simulated event PlayerReplicationInfo GetPRIByPlayfabId( const string InPlayfabPlayerId )
{
	local int i;

	if( InPlayfabPlayerId != "" )
	{
		for( i = 0; i < PRIArray.Length; i++ )
		{
			if( PRIArray[i].PlayfabPlayerId == InPlayfabPlayerId )
			{
				return PRIArray[i];
			}
		}
	}

	return none;
}
//@HSL_END

//@HSL_BEGIN - AGM - 7-16-15 - Support for checking for valid stats session
simulated event bool IsStatsSessionValid();
//@HSL_END

defaultproperties
{
   bStopCountDown=True
   ServerName="Killing Floor 2 Server"
   TickGroup=TG_DuringAsyncWork
   Name="Default__GameReplicationInfo"
   ObjectArchetype=ReplicationInfo'Engine.Default__ReplicationInfo'
}
