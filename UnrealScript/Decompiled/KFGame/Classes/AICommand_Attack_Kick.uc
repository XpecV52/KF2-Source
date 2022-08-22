/*******************************************************************************
 * AICommand_Attack_Kick generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AICommand_Attack_Kick extends AICommand_SM_Attack within KFAIController_ZedFleshpound;

var bool bForce;

static function bool Kick(KFAIController_ZedFleshpound AI, optional KFPawn InTarget, optional byte InSMFlags, optional bool InForce)
{
    local AICommand_Attack_Kick Cmd;

    if(AI != none)
    {
        Cmd = new (AI) default.Class;
        if(Cmd != none)
        {
            if(InTarget != none)
            {
                Cmd.AttackTarget = InTarget;                
            }
            else
            {
                Cmd.AttackTarget = AI.Enemy;
            }
            Cmd.bForce = InForce;
            Cmd.SMFlags = InSMFlags;
            AI.PushCommand(Cmd);
            return true;
        }
    }
    return false;
}

function Pushed()
{
    Outer.AIActionStatus = "Doing forced Kick attack";
    Outer.Focus = AttackTarget;
    Outer.AIZeroMovementVariables();
    super.Pushed();
}

function Popped()
{
    Outer.AIActionStatus = "Finished forced Kick attack";
    Outer.LastKickClotTime = Outer.WorldInfo.TimeSeconds;
    Outer.Focus = none;
    super.Popped();
    Outer.AIZeroMovementVariables();
    Outer.LastAttackTime_Melee = Outer.WorldInfo.TimeSeconds;
}

state Command_SpecialMove
{
    function bool ExecuteSpecialMove()
    {
        if(Outer.MyKFPawn == none)
        {
            return false;
        }
        if(!Class'Engine'.static.GetEngine().bDisableAILogging)
        {
            Outer.AILog_Internal((string(self) $ " ExecuteSpecialMove() AttackTarget: ") $ string(AttackTarget), 'Command_Attack_Melee');
        }
        if(AttackTarget != none)
        {
            KFAIController(KFPawn(AttackTarget).Controller).AIZeroMovementVariables();
            KFAIController(KFPawn(AttackTarget).Controller).DoPauseAI(1, true, true);
        }
        if(((ShouldFinishRotation()) && AttackTarget != none) && AttackTarget != Outer.Pawn)
        {
            Outer.SetDesiredRotation(rotator(AttackTarget.Location - Outer.Pawn.Location));
        }
        Outer.MyKFPawn.DoSpecialMove(GetSpecialMove(), true, none, SMFlags);
        return true;
        if(!Class'Engine'.static.GetEngine().bDisableAILogging)
        {
            Outer.AILog_Internal((string(self) $ " ExecuteSpecialMove returning false because ReachedDesiredRotation isn't done?  AttackTarget: ") $ string(AttackTarget), 'Command_Attack_Melee');
        }
        return false;
    }

    function bool ShouldFinishRotation()
    {
        local float Dot;

        Dot = Normal(AttackTarget.Location - Outer.MyKFPawn.Location) Dot vector(Outer.MyKFPawn.Rotation);
        if(Dot > 0.7)
        {
            return false;
        }
        return bFinishRotationBeforeAttack;
    }

    function bool IsSpecialMoveComplete()
    {
        if(Outer.MyKFPawn != none)
        {
            if(Outer.MyKFPawn.IsDoingMeleeAttack())
            {
                return false;
            }
            if(!Outer.MyKFPawn.IsDoingSpecialMove(GetSpecialMove()))
            {
                return true;
            }
        }
        return false;
    }

    function FinishedSpecialMove()
    {
        Outer.UpdateLastMeleeTime(0);
        Status = 'Success';
        super.FinishedSpecialMove();
    }
    stop;    
}

defaultproperties
{
    bFinishRotationBeforeAttack=true
    MaxExecuteSMAttemptsBeforeAbort=25
}