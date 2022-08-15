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

	AILog_Internal("Beginning fireball "$Enemy,'Command_FireBall',);
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

		AILog_Internal(GetFuncName()@SpecialMove,'Command_FireBall',);

		if( SpecialMove != SM_None && MyKFPawn.CanDoSpecialMove(SpecialMove) )
		{
			MyKFPawn.DoSpecialMove(SpecialMove, true, GetInteractionPawn(), 255);
			return true;
		}
		else
		{
			return false;
		}
	}

	function ESpecialMove GetSpecialMove()
	{
		return SM_StandAndShotAttack;
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
	if( (WorldInfo.TimeSeconds - LastEnemyLocationCheckTime) >= 0.25f )
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

defaultproperties
{
   bShouldCheckSpecialMove=True
   TimeOutDelaySeconds=25.000000
   bIgnoreNotifies=True
   Name="Default__AICommand_HuskFireBallAttack"
   ObjectArchetype=AICommand_SpecialMove'KFGame.Default__AICommand_SpecialMove'
}
