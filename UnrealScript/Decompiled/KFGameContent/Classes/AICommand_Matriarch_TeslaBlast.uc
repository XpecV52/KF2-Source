/*******************************************************************************
 * AICommand_Matriarch_TeslaBlast generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AICommand_Matriarch_TeslaBlast extends AICommand_RangedAttack within KFAIController_ZedMatriarch;

static function bool TeslaBlast(KFAIController_ZedMatriarch AI)
{
    local AICommand_Matriarch_TeslaBlast Cmd;

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
        Outer.AILog_Internal("Beginning Tesla Blast " $ string(Outer.Enemy), 'Command_Matriarch_TeslaBlast');
    }
    Outer.AIActionStatus = "Starting Matriarch TeslaBlast AICommand";
}

function Popped()
{
    Outer.AIActionStatus = "Finished Matriarch TeslaBlast AICommand";
    Outer.LastTeslaBlastTime = Outer.WorldInfo.TimeSeconds;
    super.Popped();
}

defaultproperties
{
    SpecialMoveClass=Class'KFSM_Matriarch_TeslaBlast'
}