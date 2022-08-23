//=============================================================================
// KFSM_Husk_FireBallAttack
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFSM_Husk_FireBallAttack extends KFSM_PlaySingleAnim;

var array<Name> AnimNames;

/** Offsets for firing fireballs. */
var array<vector> FireOffsets;

/** Set once each time move is invoked */
var transient protected vector FireOffset;

static function byte PackFlagsBase( KFPawn P )
{
	return Rand( default.AnimNames.Length );
}

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
	if( !AIOwner.DirectProjectileFireBehavior.IsThereClearDirectFireAttackLaneFromGivenLoc(PawnOwner.Location, AIOwner.Enemy) )
	{
		return false;
	}

	return super.InternalCanDoSpecialMove();
}

function vector GetFireOffset()
{
	return FireOffset;
}

function SpecialMoveStarted( bool bForced, name PrevMove )
{
	super.SpecialMoveStarted( bForced, PrevMove );	

	SetLockPawnRotation( false );

	if( AIOwner != none )
	{
		if( !class'Engine'.static.GetEngine().bDIsableAILogging && AIOwner!= None ) { AIOwner.AILog_Internal(self@"started for"@AIOwner,'Husk'); };
		AIOwner.AIZeroMovementVariables();
	}
}

function PlayAnimation()
{
	local int AnimNum;

	AnimNum = Clamp( KFPOwner.SpecialMoveFlags, 0, AnimNames.Length );
	AnimName = AnimNames[AnimNum];
	FireOffset = FireOffsets[AnimNum];

	super.PlayAnimation();
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
		if( !class'Engine'.static.GetEngine().bDIsableAILogging && AIOwner!= None ) { AIOwner.AILog_Internal(self@"ended for"@AIOwner,'Husk'); };
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
   AnimNames(0)="Atk_Shoot_V1"
   AnimNames(1)="Atk_Shoot_V2"
   FireOffsets(0)=(X=15.000000,Y=32.000000,Z=-22.000000)
   FireOffsets(1)=(X=15.000000,Y=32.000000,Z=-62.000000)
   bCanBeInterrupted=True
   bUseCustomRotationRate=True
   bDisableMovement=True
   bDisableSteering=False
   bDisableTurnInPlace=True
   CustomRotationRate=(Pitch=66000,Yaw=30000,Roll=66000)
   Handle="KFSM_Husk_FireBallAttack"
   Name="Default__KFSM_Husk_FireBallAttack"
   ObjectArchetype=KFSM_PlaySingleAnim'KFGame.Default__KFSM_PlaySingleAnim'
}
