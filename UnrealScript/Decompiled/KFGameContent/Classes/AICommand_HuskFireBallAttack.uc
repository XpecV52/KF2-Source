/*******************************************************************************
 * AICommand_HuskFireBallAttack generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AICommand_HuskFireBallAttack extends AICommand_RangedAttack within KFAIController_ZedHusk;

static function bool FireBallAttack(KFAIController_ZedHusk AI)
{
    local AICommand_HuskFireBallAttack Cmd;

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
        Outer.AILog_Internal("Beginning fireball " $ string(Outer.Enemy), 'Command_FireBall');
    }
    Outer.AIActionStatus = "Starting fireball AICommand";
}

function Popped()
{
    Outer.AIActionStatus = "Finished fireball AICommand";
    Outer.LastFireBallTime = Outer.WorldInfo.TimeSeconds;
    super.Popped();
}

defaultproperties
{
    SpecialMoveClass=Class'KFSM_Husk_FireBallAttack'
}