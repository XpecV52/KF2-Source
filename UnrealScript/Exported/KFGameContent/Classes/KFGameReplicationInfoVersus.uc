//=============================================================================
// KFGameReplicationInfoVersus
//=============================================================================
// 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class KFGameReplicationInfoVersus extends KFGameReplicationInfo;

struct sPlayerZedSpawnWaitTimeData
{
	var byte SpawnWaitTime;
	var bool bTakeOverActive;
	var byte DirtyFlag;
};

var bool bTeamBalanceEnabled;
var byte TeamBalanceDelta;

var float TimeToLockSwitchTeam;

/** Current round of play */
var byte CurrentRound;

/** Current wait time until next spawn */
var repnotify sPlayerZedSpawnWaitTimeData PlayerZedSpawnWaitTimeData;
var byte TimeUntilNextSpawn;

/** Indicates that we are in the post-round waiting period */
var repnotify bool bRoundIsOver;

replication
{
	if ( bNetInitial )
		bTeamBalanceEnabled;

	if( bNetDirty )
		CurrentRound, bRoundIsOver, PlayerZedSpawnWaitTimeData;
}

simulated event ReplicatedEvent( name VarName )
{
	local KFPlayerController KFPC;

    if( VarName == nameOf(PlayerZedSpawnWaitTimeData) )
    {
    	TimeUntilNextSpawn = PlayerZedSpawnWaitTimeData.SpawnWaitTime;
		if( TimeUntilNextSpawn != 255 )
		{
	    	SetTimer( 1.f, true, nameOf(Timer_TickDownSpawnTimer) );
	    }
	    else
	    {
	    	ClearTimer( nameOf(Timer_TickDownSpawnTimer) );
	    }
    }
    else if( VarName == nameOf(CurrentRound) )
    {
    	if( CurrentRound > 0 )
    	{
    		OnRoundIncremented();
    	}
    }
    else if( VarName == nameOf(bRoundIsOver) )
    {
		KFPC = KFPlayerController(GetALocalPlayerController());
		if( KFPC != none )
		{
			if( KFPC.MyGFxManager != none )
			{
				KFPC.MyGFxManager.OnRoundOver();
			}
		}
    }
    else
    {
    	super.ReplicatedEvent( VarName );   	
    }
}

function SetPlayerZedSpawnTime( byte NewSpawnTime, bool bTakeOverActive )
{
	PlayerZedSpawnWaitTimeData.SpawnWaitTime = NewSpawnTime;
	PlayerZedSpawnWaitTimeData.DirtyFlag++;
	PlayerZedSpawnWaitTimeData.bTakeOverActive = bTakeOverActive;
	bNetDirty = true;
	bForceNetUpdate = true;
	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		TimeUntilNextSpawn = PlayerZedSpawnWaitTimeData.SpawnWaitTime;
		if( TimeUntilNextSpawn != 255 )
		{
	    	SetTimer( 1.f, true, nameOf(Timer_TickDownSpawnTimer) );
	    }
	    else
	    {
	    	ClearTimer( nameOf(Timer_TickDownSpawnTimer) );
	    }
	}
}

simulated function Timer_TickDownSpawnTimer()
{
	if( TimeUntilNextSpawn < 255 )
	{
		--TimeUntilNextSpawn;
		if( TimeUntilNextSpawn == 0 )
		{
			ClearTimer( nameOf(Timer_TickDownSpawnTimer) );
		}
	}
}

simulated function SetTeam( int Index, TeamInfo TI )
{
	if(Index == 255)
	{
		// No!!!
		Index = 1;
	}

	Super.SetTeam(Index, TI);
}


// Called once a second
simulated event Timer()
{
    local KFGameInfo_VersusSurvival MyKFGameInfo;

	super.Timer();

	if(Role == ROLE_Authority)
	{
		MyKFGameInfo = KFGameInfo_VersusSurvival(WorldInfo.Game);

		bAllowSwitchTeam = !IsFinalWave() && !( (MyKFGameInfo.MajorityPlayersReady() && RemainingTime <= TimeToLockSwitchTeam || MyKFGameInfo.CheckAllPlayersReady()) && !bMatchHasBegun);

		if(bAllowSwitchTeam)
		{
			return;
		}
		else
		{
			if(bMatchHasBegun)
			{
				//do not attempt to auto balance when match has begun
				return;
			}
			if(MyKFGameInfo != none && AreTeamsOutOfBalanced())
        	{
        		MyKFGameInfo.BalanceTeams();
        	}
		}
	}
}

simulated function bool AreTeamsOutOfBalanced()
{
	local int ZedTeamSize, HumanTeamSize, i;

	if(!bTeamBalanceEnabled)
	{
		return false;
	}

	for ( i = 0; i < PRIArray.Length; i++)
    {
		if ( PRIArray[i] != None && !PRIArray[i].bOnlySpectator)
		{
			if(PRIArray[i].Team != none)
			{
				if(PRIArray[i].GetTeamNum() == 255)
				{
					ZedTeamSize++;
				}
				else
				{
					HumanTeamSize++;
				}
			}
		}
    }

    if( ZedTeamSize > 6|| HumanTeamSize > 6)
    {
    	return true;
    }

    if( abs(ZedTeamSize - HumanTeamSize) > TeamBalanceDelta)
    {
    	return true;
    }

	return false;
}

simulated function int GetCurrentRoundNumber()
{
	return CurrentRound;
}

/** Overridden to allow perk changes during round over period */
simulated event bool CanChangePerks()
{
	return super.CanChangePerks() || bRoundIsOver;
}

function ServerStartVoteKick( PlayerReplicationInfo PRI_Kickee, PlayerReplicationInfo PRI_Kicker )
{
	local KFPawn_Monster KFPM;
	local PLayerController C;

	C = PLayerController(PRI_Kickee.Owner);
	if( C != none )
	{
		KFPM = KFPawn_Monster(C.Pawn);
		if( KFPM != none && KFPM.IsABoss() )
		{
			return;
		}
	}

	if( VoteCollector != none )
	{
		VoteCollector.ServerStartVoteKick( PRI_Kickee, PRI_Kicker );
	}
}

/** Performs client-specific resets */
simulated function OnRoundIncremented();

/** Resets the GRI */
function Reset()
{
	WaveNum = 0;

	super.Reset();
}

defaultproperties
{
   TeamBalanceDelta=1
   TimeToLockSwitchTeam=3.000000
   bAllowSwitchTeam=True
   Name="Default__KFGameReplicationInfoVersus"
   ObjectArchetype=KFGameReplicationInfo'KFGame.Default__KFGameReplicationInfo'
}
