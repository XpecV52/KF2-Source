/*******************************************************************************
 * AICommand_Matriarch_LightningStorm generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AICommand_Matriarch_LightningStorm extends AICommand_SpecialMove within KFAIController_ZedMatriarch;

static function bool LightningStorm(KFAIController_ZedMatriarch AI)
{
    local AICommand_Matriarch_LightningStorm Cmd;

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
        Outer.AILog_Internal("Beginning lightning storm " $ string(Outer.Enemy), 'Command_LightningStorm');
    }
    Outer.AIActionStatus = "Starting lightning storm AICommand";
    if(Outer.Enemy != none)
    {
        Outer.Focus = Outer.Enemy;
    }
}

function Popped()
{
    Outer.AIActionStatus = "Finished lightning storm AICommand";
    Outer.LastLightningStormTime = Outer.WorldInfo.TimeSeconds;
    super.Popped();
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
        if(!Class'Engine'.static.GetEngine().bDisableAILogging)
        {
            Outer.AILog_Internal(string(GetFuncName()) @ string(SpecialMove), 'Command_LightningStorm');
        }
        if((SpecialMove != 0) && Outer.MyKFPawn.CanDoSpecialMove(SpecialMove))
        {
            Outer.MyKFPawn.DoSpecialMove(SpecialMove, true, GetInteractionPawn(), 255);
            return true;            
        }
        else
        {
            return false;
        }
    }

    function KFGame.KFPawn.ESpecialMove GetSpecialMove()
    {
        return 45;
    }
    stop;    
}

defaultproperties
{
    bShouldCheckSpecialMove=true
    TimeOutDelaySeconds=6
}