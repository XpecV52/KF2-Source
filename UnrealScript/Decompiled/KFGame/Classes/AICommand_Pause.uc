/*******************************************************************************
 * AICommand_Pause generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AICommand_Pause extends AICommand within KFAIController;

var float PauseTime;
var bool bStopMovement;
var bool bAbortCommands;
var bool bWaitForLanding;

static function bool Pause(KFAIController AI, float InDuration, optional bool InStopMovement, optional bool InAbortCommands, optional bool InWaitForLanding)
{
    local AICommand_Pause Cmd;

    InStopMovement = true;
    InAbortCommands = false;
    InWaitForLanding = true;
    if(AI != none)
    {
        Cmd = new (AI) default.Class;
        if(Cmd != none)
        {
            Cmd.PauseTime = InDuration;
            Cmd.bStopMovement = InStopMovement;
            Cmd.bAbortCommands = InAbortCommands;
            Cmd.bWaitForLanding = InWaitForLanding;
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
        Outer.AILog_Internal(("Pausing for " $ string(PauseTime)) $ " second(s)", 'Command_Pause');
    }
    Outer.AIActionStatus = ("Pausing for " $ string(PauseTime)) $ " seconds";
    Outer.DisableMeleeRangeEventProbing();
    GotoState('Wait');
}

function Popped()
{
    Outer.AIActionStatus = "Finished pause";
    super.Popped();
    Outer.EnableMeleeRangeEventProbing();
}

function Paused(GameAICommand NewCommand);

function bool AllowTransitionTo(class<GameAICommand> AttemptCommand)
{
    local class<AICommand> AIC;

    AIC = class<AICommand>(AttemptCommand);
    if((AIC != none) && AIC.static.CanInterruptPauseCommand())
    {
        return true;
    }
    return super(GameAICommand).AllowTransitionTo(AttemptCommand);
}

function bool CanChangeEnemy(Pawn NewEnemy)
{
    return false;
}

state Wait
{Begin:

    if(bWaitForLanding && Outer.MyKFPawn.Physics == 2)
    {
        Outer.WaitForLanding();
    }
    if(bStopMovement)
    {
        Outer.AIZeroMovementVariables();
    }
    if(bAbortCommands)
    {
        Outer.AbortMovementCommands();
        Outer.AbortMovementPlugIns();
    }
    Outer.Sleep(PauseTime);
    GotoState('DelaySuccess');
    stop;            
}

defaultproperties
{
    PauseTime=10
    bAllowedToAttack=false
    bIgnoreNotifies=true
    bIgnoreStepAside=true
}