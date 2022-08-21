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
	// Case for player-controlled Husk
	if( KFPOwner.Controller != none && AIOwner == none )
	{
		return KFPOwner.IsAliveAndWell();
	}

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
		if( AIOwner!= None ) { AIOwner.AILog_Internal(self@"started for"@AIOwner,'Husk'); };
		AIOwner.AIZeroMovementVariables();
	}
}

function SpecialMoveEnded(Name PrevMove, Name NextMove)
{
	super.SpecialMoveEnded( PrevMove, NextMove );

	if( AIOwner != none )
	{
		if( AIOwner!= None ) { AIOwner.AILog_Internal(self@"ended for"@AIOwner,'Husk'); };
	}
}

/**
 * Can a new special move override this one before it is finished?
 * This is only if CanDoSpecialMove() == TRUE && !bForce when starting it.
 */
function bool CanOverrideMoveWith( Name NewMove )
{
	if ( bCanBeInterrupted && (NewMove == 'KFSM_Stunned' || NewMove == 'KFSM_Stumble' || NewMove == 'KFSM_Knockdown' || NewMove == 'KFSM_Frozen') )
	{
		return TRUE; // for NotifyAttackParried
	}
	return FALSE;
}

defaultproperties
{
   AnimName="Atk_Shoot_V1"
   bCanBeInterrupted=True
   bUseCustomRotationRate=True
   bDisableMovement=True
   bDisableSteering=False
   bDisableTurnInPlace=True
   CustomRotationRate=(Pitch=66000,Yaw=100000,Roll=66000)
   Handle="KFSM_Husk_FireBallAttack"
   Name="Default__KFSM_Husk_FireBallAttack"
   ObjectArchetype=KFSM_PlaySingleAnim'KFGame.Default__KFSM_PlaySingleAnim'
}
