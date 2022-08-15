//=============================================================================
// KFSM_Husk_FireBallAttack
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFSM_Husk_FireBallAttack extends KFSM_PlaySingleAnim;

protected function bool InternalCanDoSpecialMove()
{
	if( AIOwner == none || AIOwner.MyKFPawn == none || AIOwner.Enemy == none )
	{
		return false;
	}

	if( AIOwner.MyKFPawn.IsImpaired() )
	{
		return false;
	}
	
    // Make sure we have line of sight
	if( !AIOwner.DirectProjectileFireBehavior.IsThereClearDirectFireAttackLaneFromGivenLoc( PawnOwner.Location, AIOwner.Enemy) )
	{
		return false;
	}

	return super.InternalCanDoSpecialMove();
}

function SpecialMoveStarted( bool bForced, name PrevMove )
{
	super.SpecialMoveStarted( bForced, PrevMove );	

	if( AIOwner != none )
	{
		`AILog_Ext( self@"started for"@AIOwner, 'Husk', AIOwner );
		AIOwner.AIZeroMovementVariables();
	}
}

function SpecialMoveEnded(Name PrevMove, Name NextMove)
{
	super.SpecialMoveEnded( PrevMove, NextMove );

	if( AIOwner != none )
	{
		`AILog_Ext( self@"ended for"@AIOwner, 'Husk', AIOwner );
	}
}

/**
 * Can a new special move override this one before it is finished?
 * This is only if CanDoSpecialMove() == TRUE && !bForce when starting it.
 */
function bool CanOverrideMoveWith( Name NewMove )
{
	if ( bCanBeInterrupted && (NewMove == 'KFSM_Stunned' || NewMove == 'KFSM_Stumble' || NewMove == 'Knockdown') )
	{
		return TRUE; // for NotifyAttackParried
	}
	return FALSE;
}

DefaultProperties
{
	// SpecialMove
	AnimName=Atk_Shoot_V1
	Handle=KFSM_Husk_FireBallAttack
	bDisableSteering=false
	bDisableMovement=true
	AnimStance=EAS_FullBody
   	bCanBeInterrupted=true
}
