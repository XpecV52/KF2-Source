//=============================================================================
// AICommand_HuskFlameThrowerAttack.uc
//=============================================================================
// 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class AICommand_HuskFlameThrowerAttack extends AICommand_SpecialMove
	within KFAIController_ZedHusk
	config(AI);

/*********************************************************************************************
* Initialization
********************************************************************************************* */

/** Simple constructor that pushes a new instance of the command for the AI */
static function bool FlameThrowerAttack( KFAIController_ZedHusk AI )
{
	local AICommand_HuskFlameThrowerAttack Cmd;

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

	if( ! class'Engine'.static.GetEngine().bDisableAILogging) {AILog_Internal("Beginning to flamethrower "$Enemy,'Command_FlameThrower',);};
	AIActionStatus = "Starting flamethrower AICommand";
	if( Focus != None )
	{
		SetDesiredRotation(rotator(Focus.Location - Pawn.Location));
	}

	DisableMeleeRangeEventProbing();
}


function Popped()
{
	AIActionStatus = "Finished flamethrower AICommand";
	LastFlameThrowerTime = WorldInfo.TimeSeconds;
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

		if( ! class'Engine'.static.GetEngine().bDisableAILogging) {AILog_Internal(GetFuncName()@SpecialMove,'Command_FlameThrower',);};

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
		return SM_HoseWeaponAttack;
	}
}

defaultproperties
{
   bShouldCheckSpecialMove=True
   TimeOutDelaySeconds=25.000000
   Name="Default__AICommand_HuskFlameThrowerAttack"
   ObjectArchetype=AICommand_SpecialMove'KFGame.Default__AICommand_SpecialMove'
}
