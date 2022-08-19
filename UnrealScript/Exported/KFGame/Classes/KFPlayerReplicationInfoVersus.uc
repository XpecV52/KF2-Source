//=============================================================================
// KFPlayerReplicationInfoVersus
//=============================================================================
// PlayerReplicationInfo for Versus mode
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFPlayerReplicationInfoVersus extends KFPlayerReplicationInfo
	config(Game)
	native(ReplicationInfo)
	nativereplication
	dependson(KFVoteCollector);

/** Cached (non-replicated) player owner, used by server */
var PlayerController PlayerOwner;

/** Replicated, compressed locations of human players */
var private vector 		PawnLocationCompressed;
var private vector 		LastReplicatedSmoothedLocation;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

replication
{
	if( !bNetOwner && bNetDirty )
		PawnLocationCompressed;
}

simulated event PostBeginPlay()
{
	super.PostBeginPlay();

	if( Role == ROLE_Authority )
	{
		PlayerOwner = PlayerController( Owner );
	}
}

simulated function Pawn GetOwnerPawn()
{
	local Pawn aPawn;

	// Set owning pawn
	foreach WorldInfo.AllPawns( class'Pawn', aPawn )
	{
		if( aPawn.PlayerReplicationInfo == self )
		{
			return aPawn;
		}
	}

	return none;
}

function SetPlayerTeam( TeamInfo NewTeam )
{
	super.SetPlayerTeam( NewTeam );

	if( NewTeam == none )
	{
		return;
	}

	PlayerOwner = PlayerController( Owner );

	SetTimer( 1.f, true, nameOf(UpdateReplicatedVariables) );
}

reliable server function ServerSwitchTeam()
{
	local KFGameInfo MyGameInfo;
	local KFGameReplicationInfo KFGRI;
	
	MyGameInfo = KFGameInfo(WorldInfo.Game);
	if( MyGameInfo == none )
	{
		return;
	}

	KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
	if( KFGRI == None || !KFGRI.bAllowSwitchTeam )
	{
		return;
	}

	if( KFGRI.bMatchHasBegun )
	{
		//will this switch upset current game balance?
		if(!WillMaintainTeamBalance()) 
		{
			ClientRefusedTeamSwitch();
			return;
		}
		PlayerController(Owner).Pawn.Suicide();
	}

	switch( GetTeamNum() )
	{
		case MyGameInfo.Teams[0].TeamIndex:
			MyGameInfo.SetTeam( PlayerController(Owner), MyGameInfo.Teams[1] );
			break;
	
		case MyGameInfo.Teams[1].TeamIndex:
				MyGameInfo.SetTeam( PlayerController(Owner), MyGameInfo.Teams[0] );
			break;
	
		default:
			LogInternal("Function: KFPlayerReplicationInfo::ServerSwitchTeam Team index not accounted for - " @GetTeamNum());
	}

	if(PlayerController(Owner).IsLocalController() && Role == Role_Authority)
	{
		ClientRecieveNewTeam();
	}
}

//SERVER ONLY
function bool WillMaintainTeamBalance()
{
	local KFGameInfo MyGameInfo;
	local KFGameReplicationInfo KFGRI;
	local KFPlayerController KFPC;
	
	KFPC = KFPlayerController(Owner);
	
	MyGameInfo = KFGameInfo(WorldInfo.Game);
	KFGRI = KFGameReplicationInfo(WorldInfo.GRI);

	if(KFGRI.bMatchHasBegun)
	{		//dead 					//human
		if( KFPC.Pawn == none && GetTeamNum() == 0 )
		{
			//dead return false
			return false;
		}

		switch( GetTeamNum() )
		{
			case MyGameInfo.Teams[0].TeamIndex:
				//the team i want to go to is smaller than my current team  AND the desired team is also smaller than half the allowed max players
				return MyGameInfo.Teams[1].Size < MyGameInfo.Teams[0].Size  && MyGameInfo.Teams[1].Size < (MyGameInfo.MaxPlayersAllowed / 2);	

			case MyGameInfo.Teams[1].TeamIndex:
				return MyGameInfo.Teams[0].Size < MyGameInfo.Teams[1].Size  && MyGameInfo.Teams[0].Size < (MyGameInfo.MaxPlayersAllowed / 2);	
			default:
				LogInternal("Function: KFPlayerReplicationInfo::WillUpsetTeamBalance Team index not accounted for - " @GetTeamNum());
		}
	}

	return true;
}

reliable client function ClientRefusedTeamSwitch()
{
	local KFPlayerController KFPC;
	
	KFPC = KFPlayerController(Owner);
	if(KFPC != none && KFPC.IsLocalController())
	{
		if(KFPC.MyGFxManager != none && KFPC.MyGFxManager.bMenusOpen)
		{
			KFPC.MyGFxManager.OpenPopup(ENotification, class'KFCommon_LocalizedStrings'.default.UnableToSwitchTeamString, class'KFCommon_LocalizedStrings'.default.NoSwitchReasonString, class'KFCommon_LocalizedStrings'.default.OKString);
		}
		else if(KFPC.MyGFxHUD != none )
		{
			KFPC.MyGFxHUD.ShowNonCriticalMessage(class'KFCommon_LocalizedStrings'.default.NoSwitchReasonString);
		}
	}

}

reliable client function ClientRecieveNewTeam()
{
	local KFGameReplicationInfo KFGRI;
	local KFGFxHudWrapper MyGFxHUD;
	local KFPlayerController KFPC;

	KFPC = KFPlayerController(Owner);

	if(KFPC != none && KFPC.IsLocalController())
	{
		MyGFxHud = KFGFxHudWrapper(KFPC.myHUD);
		KFPC.ClientRecieveNewTeam();
	}
	else
	{
		return;
	}

	KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
	if(KFGRI.bMatchHasBegun)
	{
		MyGFxHud.CreateHUDMovie();
	}

}

function UpdateReplicatedVariables()
{
	if( !bIsSpectator && 
		PlayerOwner != none && 
		PlayerOwner.GetTeamNum() == 0 &&
		PlayerOwner.Pawn != none && 
		PlayerOwner.Pawn.IsAliveAndWell() )
	{
		UpdatePawnLocation();
	}
	else if( !IsZero( PawnLocationCompressed ) )
	{
		PawnLocationCompressed = vect(0,0,0);
	}

	UpdateReplicatedPlayerHealth();
}

/** Called once per second while on the human team to refresh replicated position */
function UpdatePawnLocation()
{
		PawnLocationCompressed = PlayerOwner.Pawn.Location;
		// Compress
		PawnLocationCompressed *= 0.01f;
}

function UpdateReplicatedPlayerHealth()
{
	local Pawn OwnerPawn;

	if( PlayerOwner != none )
	{
		OwnerPawn = PlayerOwner.Pawn;
		if( OwnerPawn != none && OwnerPawn.Health != PlayerHealth )
		{
			PlayerHealth = OwnerPawn.Health;
			PlayerHealthPercent = FloatToByte( float(OwnerPawn.Health) / float(OwnerPawn.HealthMax) );
		}
	}
}

/** Called when owner's pawn is killed */
function IncrementDeaths(optional int Amt = 1)
{
	Super.IncrementDeaths(Amt);

	// Update (zero) replicated location immediately instead of waiting for the timer
	PawnLocationCompressed = vect(0,0,0);
}

/** Return location used for overhead icon */
simulated function vector GetReplicatedPawnIconLocation(float BlendSpeed)
{
	local vector UncompressedLocation;

	UncompressedLocation = PawnLocationCompressed * 100.f;

	// if new location is nearby add some quick and dirty blending
	// @note: We're faking timestep and making a few assumptions about the HUD
	if ( BlendSpeed > 0 && !IsZero(UncompressedLocation) && VSizeSq(UncompressedLocation - LastReplicatedSmoothedLocation) < Square(500) )
	{
		LastReplicatedSmoothedLocation = VInterpTo( LastReplicatedSmoothedLocation,
                                UncompressedLocation, WorldInfo.DeltaSeconds,
                                VSize(UncompressedLocation - LastReplicatedSmoothedLocation) * BlendSpeed );
	}
	else
	{
		LastReplicatedSmoothedLocation = UncompressedLocation;		
	}

	return LastReplicatedSmoothedLocation;
}

simulated function VOIPStatusChanged( PlayerReplicationInfo Talker, bool bIsTalking )
{
	if(Talker.GetTeamNum() != GetTeamNum())
	{
		return;
	}

	super.VOIPStatusChanged(Talker, bIsTalking);
}

defaultproperties
{
   Name="Default__KFPlayerReplicationInfoVersus"
   ObjectArchetype=KFPlayerReplicationInfo'KFGame.Default__KFPlayerReplicationInfo'
}
