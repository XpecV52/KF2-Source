//=============================================================================
// AICommand_Matriarch_SweepingClaw
//=============================================================================
// Handler for matriarch's sweeping claw melee attack running through AI.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

class AICommand_Matriarch_SweepingClaw extends AICommand_SpecialMove
    within KFAIController_ZedMatriarch
    config(AI);

/** Base constructor to handle init */
static function bool SweepingClaw(KFAIController_ZedMatriarch AI)
{
    local AICommand_Matriarch_SweepingClaw Cmd;

    if (AI != none)
    {
        Cmd = new (AI) default.class;
        if (Cmd != none)
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

    if( ! class'Engine'.static.GetEngine().bDisableAILogging) {AILog_Internal("Beginning sweeping claw "$Enemy,'Command_SweepingClaw',);};
    AIActionStatus = "Starting sweeping claw AICommand";

    if (Enemy != none)
    {
        Focus = Enemy;
    }
}

function Popped()
{
    AIActionStatus = "Finished sweeping claw AICommand";
    LastSweepingClawTime = WorldInfo.TimeSeconds;

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

        if( ! class'Engine'.static.GetEngine().bDisableAILogging) {AILog_Internal(GetFuncName()@SpecialMove,'Command_SweepingClaw',);};

        if (SpecialMove != SM_None && MyKFPawn.CanDoSpecialMove(SpecialMove))
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
        return SM_Custom1;
    }
}

defaultproperties
{
   bShouldCheckSpecialMove=True
   TimeOutDelaySeconds=6.000000
   Name="Default__AICommand_Matriarch_SweepingClaw"
   ObjectArchetype=AICommand_SpecialMove'KFGame.Default__AICommand_SpecialMove'
}
