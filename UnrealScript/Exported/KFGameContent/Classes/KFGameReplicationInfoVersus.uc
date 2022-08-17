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

var bool bTeamBalanceEnabled;
var byte TeamBalanceDelta;

var float TimeToLockSwitchTeam;


replication
{
	if ( bNetInitial )
		bTeamBalanceEnabled;
}

simulated event ReplicatedEvent( name VarName )
{
    if( VarName == nameOf(bTraderIsOpen) && bTraderIsOpen )
    {
        FadeOutCrawlerSuicides();
    }

    super.ReplicatedEvent( VarName );
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

/** Called from the GameInfo when the trader pod should be activated */
function SetWaveActive(bool bWaveActive, optional byte NewMusicIntensity)
{
    local KFProj_BloatPukeMine PukeMine;

    super.SetWaveActive( bWaveActive, NewMusicIntensity );

    if( bTraderIsOpen )
    {
        // Destroy all puke mine projectiles
        foreach DynamicActors( class'KFProj_BloatPukeMine', PukeMine )
        {
            PukeMine.FadeOut();
        }

        // Destroy all lingering crawler suicide explosions
        FadeOutCrawlerSuicides();
    }
}

simulated function FadeOutCrawlerSuicides()
{
    local KFExplosion_PlayerCrawlerSuicide CrawlerSuicideExplosion;

    foreach DynamicActors( class'KFExplosion_PlayerCrawlerSuicide', CrawlerSuicideExplosion )
    {
        CrawlerSuicideExplosion.FadeOut();
    }    
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

defaultproperties
{
   TeamBalanceDelta=1
   TimeToLockSwitchTeam=3.000000
   bAllowSwitchTeam=True
   Name="Default__KFGameReplicationInfoVersus"
   ObjectArchetype=KFGameReplicationInfo'KFGame.Default__KFGameReplicationInfo'
}
