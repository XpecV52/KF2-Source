//=============================================================================
// AICommand_HuskFireBallAttack.uc
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class AICommand_HuskFireBallAttack extends AICommand_RangedAttack
	within KFAIController_ZedHusk
	config(AI);

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

	if( ! class'Engine'.static.GetEngine().bDisableAILogging) {AILog_Internal("Beginning fireball " $ Enemy,'Command_FireBall',);};
	AIActionStatus = "Starting fireball AICommand";
}

function Popped()
{
	AIActionStatus = "Finished fireball AICommand";
	LastFireBallTime = WorldInfo.TimeSeconds;
	Super.Popped();
}

defaultproperties
{
   SpecialMoveClass=Class'kfgamecontent.KFSM_Husk_FireBallAttack'
   Name="Default__AICommand_HuskFireBallAttack"
   ObjectArchetype=AICommand_RangedAttack'kfgamecontent.Default__AICommand_RangedAttack'
}
