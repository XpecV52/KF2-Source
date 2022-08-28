/*******************************************************************************
 * AICommand_DAR_RocketAttack generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AICommand_DAR_RocketAttack extends AICommand_RangedAttack within KFAIController_ZedDAR_Rocket;

static function bool RocketAttack(KFAIController_ZedDAR_Rocket AI)
{
    local AICommand_DAR_RocketAttack Cmd;

    if(AI != none)
    {
        Cmd = new (AI) default.Class;
        if(Cmd != none)
        {
            AI.PushCommand(Cmd);
            return true;
        }
    }
    return false;
}

function Pushed()
{
    super.Pushed();
    if(!Class'Engine'.static.GetEngine().bDisableAILogging)
    {
        Outer.AILog_Internal("Beginning Rocket " $ string(Outer.Enemy), 'Command_Rocket');
    }
    Outer.AIActionStatus = "Starting Rocket AICommand";
}

function Popped()
{
    Outer.AIActionStatus = "Finished Rocket AICommand";
    Outer.LastRangeAttackTime = Outer.WorldInfo.TimeSeconds;
    super.Popped();
}

defaultproperties
{
    SpecialMoveClass=Class'KFSM_DAR_RocketAttack'
}