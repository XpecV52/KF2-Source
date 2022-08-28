//=============================================================================
// AICommand_DAR_RocketAttack
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class AICommand_DAR_RocketAttack extends AICommand_RangedAttack
	within KFAIController_ZedDAR_Rocket
	config(AI);

/** Simple constructor that pushes a new instance of the command for the AI */
static function bool RocketAttack(KFAIController_ZedDAR_Rocket AI)
{
	local AICommand_DAR_RocketAttack Cmd;

	if (AI != None)
	{
		Cmd = new(AI) default.class;
		if (Cmd != None)
		{
			AI.PushCommand(Cmd);
			return true;
		}
	}

	return false;
}

function Pushed()
{
	Super.Pushed();

	if( ! class'Engine'.static.GetEngine().bDisableAILogging) {AILog_Internal("Beginning Rocket " $ Enemy,'Command_Rocket',);};
	AIActionStatus = "Starting Rocket AICommand";
}

function Popped()
{
	AIActionStatus = "Finished Rocket AICommand";
	LastRangeAttackTime = WorldInfo.TimeSeconds;
	Super.Popped();
}

defaultproperties
{
   SpecialMoveClass=Class'kfgamecontent.KFSM_DAR_RocketAttack'
   Name="Default__AICommand_DAR_RocketAttack"
   ObjectArchetype=AICommand_RangedAttack'kfgamecontent.Default__AICommand_RangedAttack'
}
