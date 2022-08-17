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

cpptext
{
	INT* GetOptimizedRepList( BYTE* InDefault, FPropertyRetirement* Retire, INT* Ptr, UPackageMap* Map, UActorChannel* Channel );
	UBOOL IsTeamReplicationViewer( BYTE TeamNum );
}

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
	bReplicateInstigator=false
}