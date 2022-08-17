/*******************************************************************************
 * AICommand_Flee generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AICommand_Flee extends AICommand within KFAIController;

var bool bStopAtGoal;
var bool bWasSprinting;
var bool bHaveGoal;
var Actor FleeTarget;
var float Dot;
var int PathAttempts;
var float FleeDuration;
var float FleeDistance;
var float GoalOffset;

static function bool FleeFrom(KFAIController AI, Actor inFleeTarget, optional float inFleeDuration, optional float inFleeDistance, optional bool bShouldStopAtGoal)
{
    local AICommand_Flee Cmd;

    inFleeDistance = 5000;
    bShouldStopAtGoal = false;
    if(AI != none)
    {
        Cmd = new (AI) default.Class;
        if(Cmd != none)
        {
            Cmd.FleeTarget = inFleeTarget;
            Cmd.FleeDistance = inFleeDistance;
            Cmd.FleeDuration = inFleeDuration;
            Cmd.bStopAtGoal = bShouldStopAtGoal;
            AI.PushCommand(Cmd);
            return true;
        }
    }
    return false;
}

function Pushed()
{
    super.Pushed();
    bWasSprinting = Outer.MyKFPawn.bIsSprinting;
    Outer.DisableMeleeRangeEventProbing();
    Outer.MoveTimer = -1;
    Outer.Pawn.ZeroMovementVariables();
    Outer.StopAllLatentMovement();
    Outer.RouteGoal = none;
    bHaveGoal = false;
    GoalOffset = Square(384 + (FRand() * 128));
    if(FleeDuration > 0)
    {
        Outer.SetTimer(FleeDuration, false, 'Timer_FleeDurationExpired', self);
    }
    StartFleeing();
}

function Timer_FleeDurationExpired()
{
    Status = 'Success';
    Outer.NotifyFleeFinished();
    Outer.PopCommand(self);
}

function StartFleeing()
{
    GotoState('Fleeing', 'Begin');
}

function Popped()
{
    super.Popped();
    if(Outer.MyKFPawn != none)
    {
        Outer.MyKFPawn.bIsSprinting = bWasSprinting;
        Outer.MyKFPawn.ClearHeadTrackTarget(FleeTarget);
    }
    Outer.EnableMeleeRangeEventProbing();
}

state Fleeing
{
    event BeginState(name PreviousStateName)
    {
        super(Object).BeginState(PreviousStateName);
        Outer.Enemy = none;
    }

    function bool CheckRetreat()
    {
        if((Outer.RouteGoal != none) && bHaveGoal)
        {
            Outer.AIActionStatus = ((("Attempting to flee from [" $ string(FleeTarget)) $ "] at [") $ string(Outer.RouteGoal)) $ "]";
            return true;            
        }
        else
        {
            bHaveGoal = false;
        }
        if(FleeTarget == none)
        {
            Class'NavigationPoint'.static.GetNearestNavToActor(Outer.Pawn);
        }
        if(FleeTarget != none)
        {
            Outer.AIActionStatus = ("Searching for navigable path from [" $ string(FleeTarget)) $ "]";
            Class'Goal_AwayFromPosition'.static.FleeFrom(Outer.Pawn, FleeTarget.Location, int(FleeDistance));
            if(Outer.FindPathToward(Outer.Pawn) != none)
            {
                bHaveGoal = true;
                Outer.AIActionStatus = ((("Attempting to flee from [" $ string(FleeTarget)) $ "] at [") $ string(Outer.RouteGoal)) $ "]";
                Outer.Focus = none;
                PathAttempts = 0;
                return true;                
            }
            else
            {
                PathAttempts += 1;
                return false;
            }
        }
        PathAttempts += 1;
        return false;
    }
Begin:

    if((Outer.MyKFPawn == none) || !Outer.MyKFPawn.IsAliveAndWell())
    {
        Status = 'Failure';
        Outer.AILog_Internal("No pawn, aborting", 'Command_Flee');
        Outer.NotifyFleeFinished();
        Outer.PopCommand(self);        
    }
    else
    {
        if(Outer.MyKFPawn.Physics == 2)
        {
            Outer.AIActionStatus = "Fleeing, waiting for landing...";
            Outer.WaitForLanding();
        }
        if((Outer.MyKFPawn == none) || !Outer.MyKFPawn.IsAliveAndWell())
        {
            Status = 'Failure';
            Outer.AILog_Internal("No pawn, or pawn died from falling", 'Command_Flee');
            Outer.NotifyFleeFinished();
            Outer.PopCommand(self);            
        }
        else
        {
            Outer.Focus = none;
            if(CheckRetreat())
            {
                Outer.MyKFPawn.SetSprinting(true);
                Outer.SetMoveGoal(Outer.RouteGoal, none, false, 256, true, true, true, false, false);
                if(!bStopAtGoal || VSizeSq(Outer.Pawn.Location - Outer.RouteGoal.Location) > GoalOffset)
                {
                    Outer.Sleep(0);
                    goto 'Begin';
                }
                Dot = Normal(Outer.Location - FleeTarget.Location) Dot vector(FleeTarget.Rotation);
                if(Dot > 0.78)
                {
                    PushState('RotateToFocus');
                    Status = 'Success';
                    Outer.Sleep(0);
                    Outer.NotifyFleeFinished();
                    Outer.PopCommand(self);                    
                }
                else
                {
                    Status = 'Success';
                    Outer.Sleep(0);
                    Outer.NotifyFleeFinished();
                    Outer.PopCommand(self);
                }                
            }
            else
            {
                if(PathAttempts > 30)
                {
                    Status = 'Failure';
                    Outer.AILog_Internal(("Failed to find flee path from [" $ string(FleeTarget)) $ "] after 30 attempts, aborting...", 'Command_Flee');
                    Outer.NotifyFleeFinished();
                    Outer.PopCommand(self);                    
                }
                else
                {
                    Outer.Sleep(0);
                    goto 'Begin';
                }
            }
        }
    }
    J0x667:

    Status = 'Success';
    Outer.NotifyFleeFinished();
    Outer.PopCommand(self);
    stop;            
}

state RotateToFocus extends DebugState
{Begin:

    Outer.AIActionStatus = "Rotating to focus";
    Outer.SetFocalPoint(vect(0, 0, 0));
    Outer.Focus = FleeTarget;
    Outer.FinishRotation();
    PopState();
    stop;        
}

defaultproperties
{
    bAllowedToAttack=false
}