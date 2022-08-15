/*******************************************************************************
 * AICommand_Attack_Grab generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AICommand_Attack_Grab extends AICommand_SM_Attack within KFAIController_Monster;

static function bool Grab(KFAIController_Monster AI, KFPawn NewGrabTarget, optional float InPostSpecialMoveSleepTime)
{
    local AICommand_Attack_Grab OtherCmd, Cmd;

    InPostSpecialMoveSleepTime = 0;
    if((AI != none) && AI.Pawn != none)
    {
        OtherCmd = AI.FindCommandOfClass(Class'AICommand_Attack_Grab');
        if(OtherCmd == none)
        {
            Cmd = new (AI) default.Class;
            if(InPostSpecialMoveSleepTime > 0)
            {
                Cmd.PostSpecialMoveSleepTime = InPostSpecialMoveSleepTime;
            }
            AI.PushCommand(Cmd);
            return true;
        }
    }
    return false;
}

event string GetDumpString()
{
    return (super(GameAICommand).GetDumpString() @ "Grab Target:") @ string(Outer.Enemy);
}

function Pushed()
{
    super.Pushed();
    Outer.DisableMeleeRangeEventProbing();
    Outer.AILog_Internal((string(self) $ " ... Enemy") @ string(Outer.Enemy), 'Command_Attack_Grab');
}

function Resumed(name OldCommandName)
{
    super(AICommand_SpecialMove).Resumed(OldCommandName);
    Status = 'Failure';
    Outer.PopCommand(self);
}

function Paused(GameAICommand NewCommand)
{
    if((Outer.IsDead() || Outer.MyKFPawn == none) || !Outer.MyKFPawn.IsAliveAndWell())
    {
        Outer.AbortCommand(self);
    }
    super.Paused(NewCommand);
}

function Popped()
{
    Outer.LastAttackTime_Grab = Outer.WorldInfo.TimeSeconds;
    Outer.LastAttackTime_Melee = Outer.LastAttackTime_Grab;
    super.Popped();
    Outer.EnableMeleeRangeEventProbing();
}

function NotifyEnemyChanged(optional Pawn OldEnemy)
{
    if((Outer.MyKFPawn != none) && Outer.MyKFPawn.IsDoingSpecialMove(4))
    {
        Outer.MyKFPawn.EndSpecialMove();
    }
    super(AICommand).NotifyEnemyChanged(OldEnemy);
}

function UpdateLastMeleeTime()
{
    Outer.LastAttackTime_Grab = Outer.WorldInfo.TimeSeconds;
    Outer.LastAttackTime_Melee = Outer.LastAttackTime_Grab;
}

state Command_SpecialMove
{
    function BeginState(name PreviousStateName)
    {
        super.BeginState(PreviousStateName);
        Outer.MyKFPawn.bForceMaxAccel = false;
        bIgnoreNotifies = true;
        Outer.SetDesiredRotation(rotator(Outer.Enemy.Location - Outer.Pawn.Location));
    }

    function EndState(name NextStateName)
    {
        local KFPawn GP;

        super(DebugState).EndState(NextStateName);
        GP = KFPawn(AIOwner.Pawn);
        if(GP != none)
        {
            GP.InteractionPawn = none;
        }
    }

    function SpecialMoveTimeout()
    {
        Outer.AILog_Internal(string(self) $ " Special move timed out", 'Command_Attack_Grab');
        if((Outer.MyKFPawn.SpecialMove == SpecialMove) || Outer.MyKFPawn.SpecialMove == 4)
        {
            Outer.MyKFPawn.EndSpecialMove();
        }
        Status = 'Failure';
        Outer.AbortCommand(self);
    }

    function bool ShouldFinishRotation()
    {
        return true;
    }

    function KFPawn GetInteractionPawn()
    {
        return KFPawn(Outer.Enemy);
    }

    function KFPawn.ESpecialMove GetSpecialMove()
    {
        return 3;
    }

    function bool ExecuteSpecialMove()
    {
        Outer.AIZeroMovementVariables();
        Outer.StopLatentExecution();
        return super.ExecuteSpecialMove();
    }

    function bool IsSpecialMoveComplete()
    {
        return (Outer.MyKFPawn == none) || (!Outer.MyKFPawn.IsDoingSpecialMove(3) && !Outer.MyKFPawn.IsDoingSpecialMove(4)) && super.IsSpecialMoveComplete();
    }

    function FinishedSpecialMove()
    {
        UpdateLastMeleeTime();
        Outer.EndOfMeleeAttackNotification();
    }
    stop;    
}

defaultproperties
{
    TimeOutDelaySeconds=50
}