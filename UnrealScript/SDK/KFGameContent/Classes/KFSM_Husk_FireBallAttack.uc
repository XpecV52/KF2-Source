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
	if( KFPOwner.IsHumanControlled() )
	{
		return KFPOwner.IsCombatCapable();
	}

	if( AIOwner == none || AIOwner.MyKFPawn == none || AIOwner.Enemy == none )
	{
		return false;
	}

	if( !KFPOwner.IsCombatCapable() )
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

	SetLockPawnRotation( false );

	if( AIOwner != none )
	{
		`AILog_Ext( self@"started for"@AIOwner, 'Husk', AIOwner );
		AIOwner.AIZeroMovementVariables();
	}
}

/** Notification from KFPawn_ZedHusk that the animnotify to fire a shot has been triggered */
function NotifyFireballFired()
{
	SetLockPawnRotation( true );
}

function SpecialMoveEnded(Name PrevMove, Name NextMove)
{
	super.SpecialMoveEnded( PrevMove, NextMove );

	SetLockPawnRotation( false );

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
	if ( bCanBeInterrupted && (NewMove == 'KFSM_Stunned' || NewMove == 'KFSM_Stumble' || NewMove == 'KFSM_Knockdown' || NewMove == 'KFSM_Frozen') )
	{
		return TRUE; // for NotifyAttackParried
	}
	return FALSE;
}

DefaultProperties
{
	// SpecialMove
	Handle=KFSM_Husk_FireBallAttack
	bDisableSteering=false
	bDisableMovement=true
	bDisableTurnInPlace=true
   	bCanBeInterrupted=true
   	bUseCustomRotationRate=true
   	CustomRotationRate=(Pitch=66000,Yaw=30000,Roll=66000)

   	// Animation
	AnimName=Atk_Shoot_V1
	AnimStance=EAS_FullBody
}