/*******************************************************************************
 * AICommand_SpecialMove generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AICommand_SpecialMove extends AICommand within KFAIController
    native(AI);

var KFPawn.ESpecialMove SpecialMove;
var name DefaultStartState;
var float TerminationTime;
var bool bShouldCheckSpecialMove;
var bool bUpdateStartAnchor;
var bool bUpdateAnchorOnSuccess;
var bool bForceReady;
var bool bWaitForLanding;
var float TimeOutDelaySeconds;
var float FailureSleepTimeSeconds;
var Vector EndDest;
var float FailSafeReadyTime;
var int MaxExecuteSMAttemptsBeforeAbort;
var int ExecuteSMCount;
var Object Observer;

function Pushed()
{
    super.Pushed();
    Outer.AILog_Internal(string(self) $ " Pushed", 'Command_SpecialMove');
    LockdownAI();
    if(DefaultStartState != 'None')
    {
        GotoState(DefaultStartState);
    }
}

function Resumed(name OldCommandName)
{
    Outer.AILog_Internal((string(self) $ " Resumed, previous command: ") $ string(OldCommandName), 'Command_SpecialMove');
    ExecuteSMCount = 0;
    super.Resumed(OldCommandName);
    LockdownAI();
}

function Paused(GameAICommand NewCommand)
{
    Outer.AILog_Internal((string(self) $ " Paused by command ") $ string(NewCommand), 'Command_SpecialMove');
    super.Paused(NewCommand);
    UnlockAI();
}

function Popped()
{
    local int Idx;
    local NavigationPoint NewAnchor;

    super.Popped();
    Outer.AILog_Internal("Popped()", 'Command_SpecialMove');
    UnlockAI();
    ClearTimeout();
    if(bUpdateAnchorOnSuccess)
    {
        if(Status == 'Success')
        {
            NewAnchor = GetUpdatedAnchor();
            if(NewAnchor != none)
            {
                Outer.Pawn.SetAnchor(NewAnchor);
                Idx = Outer.RouteCache.Find(NewAnchor;
                if(Idx != -1)
                {
                    Outer.RouteCache_RemoveIndex(0, Idx + 1);
                }
            }
        }
    }
}

function ClearTimeout()
{
    Outer.ClearTimer('SpecialMoveTimeout', self);
}

function NavigationPoint GetStartAnchor()
{
    return none;
}

function NavigationPoint GetUpdatedAnchor()
{
    return none;
}

function LockdownAI()
{
    Outer.AILog_Internal(string(GetFuncName()), 'Command_SpecialMove');
    Outer.bPreparingMove = true;
    Outer.AIZeroMovementVariables();
}

function UnlockAI()
{
    Outer.AILog_Internal(string(GetFuncName()), 'Command_SpecialMove');
    Outer.bPreparingMove = false;
    Outer.bPreciseDestination = false;
    if(Outer.Pawn != none)
    {
        Outer.Pawn.LockDesiredRotation(false);
    }
}

function SpecialMoveTimeout();

function float GetFailSafeReadyTime()
{
    return FailSafeReadyTime;
}

function Timer_FailSafeReadyTriggered()
{
    Outer.AILog_Internal(string(self) $ " Failsafe triggered for special move action", 'Command_SpecialMove');
    bForceReady = true;
}

state Command_SpecialMove extends DebugState
{
    ignores FinishedSpecialMove, GetSpecialMove, GetPostSpecialMoveSleepTime, GetPreSpecialMoveSleepTime, SetupMoveToEndDest, ShouldFinishRotation, 
	    ShouldFinishPostRotation, GetInteractionPawn;

    function bool SetupSpecialMove()
    {
        return true;
    }

    function bool IsReady()
    {
        return true;
    }

    event BeginState(name PreviousStateName)
    {
        if(bUpdateStartAnchor)
        {
            Outer.Pawn.SetAnchor(GetStartAnchor());
        }
    }

    function byte GetSpecialMoveFlags(KFPawn.ESpecialMove InSpecialMove)
    {
        if((Outer.MyKFPawn != none) && Outer.MyKFPawn.CanDoSpecialMove(InSpecialMove))
        {
            return Outer.MyKFPawn.SpecialMoves[InSpecialMove].PackFlagsBase(Outer.MyKFPawn);
        }
        return 255;
    }

    function bool AllowPushOfDefaultCommandForSpecialMove(KFPawn.ESpecialMove SM)
    {
        return SM != GetSpecialMove();
    }

    function bool ExecuteSpecialMove()
    {
        SpecialMove = GetSpecialMove();
        Outer.AILog_Internal((string(GetFuncName()) $ "()") @ string(SpecialMove), 'Command_SpecialMove');
        if((SpecialMove != 0) && !bShouldCheckSpecialMove || Outer.MyKFPawn.CanDoSpecialMove(SpecialMove))
        {
            Outer.MyKFPawn.DoSpecialMove(SpecialMove, true, GetInteractionPawn(), GetSpecialMoveFlags(SpecialMove));
            Outer.AIActionStatus = "SpecialMove: " $ string(Outer.MyKFPawn.SpecialMoves[SpecialMove]);
            return true;            
        }
        else
        {
            return false;
        }
    }

    function bool IsSpecialMoveComplete()
    {
        if((!Outer.bPreparingMove || Outer.MyKFPawn == none) || Outer.MyKFPawn.SpecialMove == 0)
        {
            return true;
        }
        return false;
    }

    function SpecialMoveTimeout()
    {
        Outer.AILog_Internal(string(GetFuncName()) $ " Special move timed out - failing and aborting", 'Command_SpecialMove');
        LogInternal("special move timed out" @ string(self));
        if(Outer.MyKFPawn.SpecialMove == SpecialMove)
        {
            Outer.MyKFPawn.EndSpecialMove();
        }
        UpdateHistoryString("[F] SM TimedOut");
        Status = 'Failure';
        Outer.AbortCommand(self);
    }

    function OnFailedToDoSpecialMove()
    {
        Outer.AILog_Internal(string(self) $ " Failed to do special move", 'Command_SpecialMove');
        UpdateHistoryString("[F] SM Aborted");
    }
Begin:

    Outer.AILog_Internal(((((string(self) $ " --") @ string(GetStateName())) $ ":") $ string(Class)) @ "-- BEGIN LABEL", 'Command_SpecialMove');
    if(bWaitForLanding && Outer.MyKFPawn.Physics == 2)
    {
        Outer.WaitForLanding();
    }
    if(!SetupSpecialMove())
    {
        Outer.AILog_Internal(string(self) $ " Setup Special Move failed", 'Command_SpecialMove');
        goto 'Abort';
    }
    if((ShouldFinishRotation()) && !Outer.Pawn.ReachedDesiredRotation())
    {
        Outer.FinishRotation();
    }
    if((GetPreSpecialMoveSleepTime()) > float(0))
    {
        Outer.Sleep(GetPreSpecialMoveSleepTime());
    }
    bForceReady = false;
    Outer.SetTimer(GetFailSafeReadyTime(), false, 'Timer_FailSafeReadyTriggered', self);
    J0x1F8:

    if(!IsReady() && !bForceReady)
    {
        Outer.AILog_Internal(string(self) $ " Waiting for ready", 'Command_SpecialMove');
        Outer.Sleep(0.1);
        goto J0x1F8;
    }
    Outer.ClearTimer('Timer_FailSafeReadyTriggered', self);
    if(ExecuteSpecialMove())
    {
        Outer.SetTimer(TimeOutDelaySeconds, false, 'SpecialMoveTimeout', self);
        J0x2DE:

        Outer.AILog_Internal((string(self) $ " Waiting for SM to end TimeOutDelaySeconds: ") $ string(TimeOutDelaySeconds), 'Command_SpecialMove');
        Outer.Sleep(0.1);
        if(!(IsSpecialMoveComplete()))
            goto J0x2DE;
        if(ShouldFinishPostRotation())
        {
            Outer.FinishRotation();
        }
        if(SetupMoveToEndDest())
        {
            Outer.MoveTo(EndDest);
        }
        UpdateHistoryString("SM Ended at " $ string(Outer.WorldInfo.TimeSeconds));
        FinishedSpecialMove();
        TerminationTime = Outer.WorldInfo.TimeSeconds + (GetPostSpecialMoveSleepTime());
        J0x46B:

        if(TerminationTime > Outer.WorldInfo.TimeSeconds)
        {
            Outer.Sleep(0.1);
            goto J0x46B;
        }
        Status = 'Success';        
    }
    else
    {
        if((MaxExecuteSMAttemptsBeforeAbort > 0) && MaxExecuteSMAttemptsBeforeAbort >= ExecuteSMCount)
        {
            Outer.FinishRotation();
            Outer.Sleep(0.1);
            ++ ExecuteSMCount;
            goto 'Begin';            
        }
        else
        {
Abort:


            Outer.AILog_Internal("Abort label", 'Command_SpecialMove');
            OnFailedToDoSpecialMove();
            Status = 'Failure';
            Outer.Sleep(FailureSleepTimeSeconds);
        }
    }
    Outer.AILog_Internal("Calling PopCommand() at bottom of state code", 'Command_SpecialMove');
    Outer.PopCommand(self);
    stop;        
}

defaultproperties
{
    DefaultStartState=Command_SpecialMove
    bWaitForLanding=true
    TimeOutDelaySeconds=10
    FailureSleepTimeSeconds=0.5
    FailSafeReadyTime=5
    MaxExecuteSMAttemptsBeforeAbort=5
    bAllowedToAttack=false
    bIgnoreStepAside=true
}