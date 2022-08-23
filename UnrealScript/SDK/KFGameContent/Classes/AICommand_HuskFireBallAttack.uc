//=============================================================================
// AICommand_HuskFireBallAttack.uc
//=============================================================================
// 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class AICommand_HuskFireBallAttack extends AICommand_SpecialMove
	within KFAIController_ZedHusk
	config(AI);

var vector LastKnownEnemyLocation;
var float LastEnemyLocationCheckTime;

/*********************************************************************************************
* Initialization
********************************************************************************************* */

/** Simple constructor that pushes a new instance of the command for the AI */
static function bool FireBallAttack( KFAIController_ZedHusk AI )
{
	local AICommand_HuskFireBallAttack Cmd;

	if( AI != None )
	{
		Cmd = new(AI) default.class;
		if( Cmd != None )
		{
			AI.PushCommand( Cmd );
			return true;
		}
	}

	return false;
}

function Pushed()
{
	Super.Pushed();
	StopAllLatentMovement();
	AIZeroMovementVariables();

	if( Enemy != none )
	{
		Focus = Enemy;
	}

	`AILog( "Beginning fireball "$Enemy, 'Command_FireBall' );
	AIActionStatus = "Starting fireball AICommand";
	if( Focus != None )
	{
		SetDesiredRotation(rotator(Focus.Location - Pawn.Location));
	}

	DisableMeleeRangeEventProbing();
}

function Popped()
{
	AIActionStatus = "Finished fireball AICommand";
	LastFireBallTime = WorldInfo.TimeSeconds;
	EnableMeleeRangeEventProbing();
	Super.Popped();
}

state Command_SpecialMove
{
	function float GetPreSpecialMoveSleepTime()
	{
		return FRand();
	}

	function bool ExecuteSpecialMove()
	{
		SpecialMove = GetSpecialMove();

		`AILog( GetFuncName()@SpecialMove, 'Command_FireBall' );

		if( SpecialMove != SM_None && MyKFPawn.CanDoSpecialMove(SpecialMove) )
		{
			MyKFPawn.DoSpecialMove(SpecialMove, true, GetInteractionPawn(), class'KFSM_Husk_FireBallAttack'.static.PackFlagsBase(MyKFPawn) );
			return true;
		}
		else
		{
			return false;
		}
	}

	function ESpecialMove GetSpecialMove()
	{
		return SM_StandAndShootAttack;
	}
}

/** Overridden to keep track of the enemys last known location */
event HandleAICommandSpecialAction()
{
	super.HandleAICommandSpecialAction();

	if( MyKFPawn == none || Enemy == none )
	{
		return;
	}
	
	// Do not update LastKnownEnemyLocation every tick since it uses a swept box trace
	if( `TimeSince(LastEnemyLocationCheckTime) >= 0.25f )
	{
		// Check if our projectile could hit our target
		if( DirectProjectileFireBehavior.IsThereClearDirectFireAttackLaneFromGivenLoc( MyKFPawn.Location, Enemy) )
		{
			// Update last known enemy location
			LastKnownEnemyLocation = Enemy.Location;
			LastEnemyLocationCheckTime = WorldInfo.TimeSeconds;
		}
	}
}

DefaultProperties
{
	bShouldCheckSpecialMove=true
	bIgnoreNotifies=true
	bAllowedToAttack=false
	TimeOutDelaySeconds=25.f
	bIgnoreStepAside=true
}