//=============================================================================
// KFSM_Siren_Scream
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFSM_Siren_Scream extends KFSM_ScreamBase;

/** Cached pawn reference */
var KFPawn_ZedSiren MySirenPawn;

/**
 * Can a new special move override this one before it is finished?
 * This is only if CanDoSpecialMove() == TRUE && !bForce when starting it.
 */
function bool CanOverrideMoveWith( Name NewMove )
{
	if ( bCanBeInterrupted && (NewMove == 'KFSM_Stunned' || NewMove == 'KFSM_Stumble' || NewMove == 'KFSM_Knockdown' || NewMove == 'KFSM_Frozen') )
	{
		return TRUE;
	}
	return FALSE;
}

/**
 * Can the special move be chained after the current one finishes?
 */
function bool CanChainMove( Name NextMove )
{
	if( NextMove == 'KFSM_MeleeAttack' )
	{
		return true;
	}

	return super.CanChainMove( NextMove );
}

function SpecialMoveStarted( bool bForced, name PrevMove )
{
	super.SpecialMoveStarted( bForced, PrevMove );

	if (MySirenPawn == none)
	{
		MySirenPawn = KFPawn_ZedSiren(KFPOwner);
	}
}

/** Create and initialize projectile shield */
function SpawnProjectileShield()
{
	super.SpawnProjectileShield();

	// Flicker neck light as a visual cue
	if ( MySirenPawn != none )
	{
		MySirenPawn.EnableScreamFlicker( true );
	}
}

/** Destroys the projectile shield based on position in animation */
function Timer_DestroyProjectileShield()
{
	DestroyProjectileShield();
}

/** Destroy and clear proectile shield */
function DestroyProjectileShield()
{
	super.DestroyProjectileShield();

	// Turn off flicker when projectile shield goes down
	if( MySirenPawn != none )
	{
		MySirenPawn.EnableScreamFlicker( false );
	}
}

defaultproperties
{
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFSM_Siren_Scream:ExploTemplate0'
   Handle="KFSM_Siren_Scream"
   Name="Default__KFSM_Siren_Scream"
   ObjectArchetype=KFSM_ScreamBase'kfgamecontent.Default__KFSM_ScreamBase'
}
