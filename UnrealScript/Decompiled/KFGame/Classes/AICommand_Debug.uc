/*******************************************************************************
 * AICommand_Debug generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AICommand_Debug extends AICommand within KFAIController;

var bool bTestStepAside;
var bool bNoFocus;
var bool bOldDebugPostRenderInfo;
var bool bTempDisableHitWall;
var bool bStoppedRotationTowardEnemy;
var Vector DebugMoveLocation;
var KFPawn DebuggingPlayer;
var float MaxRoamDist;
var float RoamStartTime;
var float RoamEnvelopeOuter;
var float RoamEnvelopeInner;
var float RoamWaitMin;
var float RoamWaitMax;
var Actor LastDebugGoal;

static function bool Debug(KFAIController AI)
{
    local AICommand_Debug Cmd;

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
    Outer.AILog_Internal("Entering debug mode", 'Command_Debug');
    Outer.bHasDebugCommand = true;
    Outer.ClearTimer('Debug_CheckRecentMoveTime', Outer);
    bOldDebugPostRenderInfo = Outer.bDebug_PostRenderInfo;
    GotoState('Wait');
}

function Resumed(name OldCommandName)
{
    Outer.DisableMeleeRangeEventProbing();
    if(OldCommandName == 'AICommand_MoveToGoal')
    {
        Outer.AILog_Internal((((((("Resuming " $ string(self)) $ " after ") $ string(OldCommandName)) $ " ChildStatus: ") $ string(ChildStatus)) $ " LastDebugGoal: ") $ string(LastDebugGoal));
    }
    if((((OldCommandName == 'AICommand_MoveToGoal') && (ChildStatus == 'Aborted') || ChildStatus == 'Failure') && Outer.Pawn != none) && Outer.Pawn.IsAliveAndWell())
    {
        Outer.AILog_Internal("Resuming from failed MoveToGoal command", 'PathWarning');
        if(LastDebugGoal != none)
        {
            Outer.Pawn.ZeroMovementVariables();
            Outer.StopLatentExecution();
            Outer.msg(((((("Debug NPC [" $ string(Outer.Pawn)) $ "] retrying path to ") $ string(LastDebugGoal)) $ ", ") $ string(VSize(LastDebugGoal.Location - Outer.Pawn.Location))) $ " units away.");
        }
    }
    super.Resumed(OldCommandName);
}

function GrabTestTimer()
{
    if(VSizeSq(Outer.Enemy.Location - Outer.Pawn.Location) < 48400)
    {
        bAllowedToAttack = true;
        Outer.DoGrabAttack(Outer.Enemy);
        bAllowedToAttack = false;
    }
}

function Popped()
{
    Outer.bDebug_PostRenderInfo = bOldDebugPostRenderInfo;
    Outer.SetPostRendering(Outer.bDebug_PostRenderInfo);
    super.Popped();
    Outer.bHasDebugCommand = false;
    Outer.AILog_Internal("Exiting Debug Mode", 'Command_Debug');
}

function bool NotifyPlayerBecameVisible(Pawn VisiblePlayer)
{
    if(CachedChildCommand != none)
    {
        Outer.AILog_Internal(((((string(GetFuncName()) $ "() Seen: ") $ string(VisiblePlayer)) $ " notifying ") $ string(CachedChildCommand)) $ " and letting it handle the event.", 'Command_Debug');
        return CachedChildCommand.NotifyPlayerBecameVisible(VisiblePlayer);
    }
    Outer.AILog_Internal(((string(GetFuncName()) $ " ") $ string(VisiblePlayer)) $ " ignoring this event", 'Command_Debug');
    return true;
}

function Debug_Charge();

function Debug_MoveForward();

function Debug_Vision(Pawn P);

function Debug_Flank();

function Debug_Hide();

function Debug_Enemy(Pawn P);

function Debug_StepAside(optional bool bOn)
{
    bOn = true;
}

function Debug_Steering();

function Debug_Wander(optional float WanderDuraion)
{
    WanderDuraion = -1;
}

function Debug_DebugLines();

function Debug_Leap();

function Debug_DebugNodes();

function Debug_CrawlerAttack();

function Debug_LOS();

function EvaluateThreats();

function CheckVision();

function bool NotifyHitWall(Vector HitNormal, Actor Wall)
{
    if(CachedChildCommand != none)
    {
        Outer.AILog_Internal(((string(GetFuncName()) $ "() notifying ") $ string(CachedChildCommand)) $ " and letting it handle the event.", 'HitWall');
        return CachedChildCommand.NotifyHitWall(HitNormal, Wall);
    }
    return false;
}

function EnableNotifyHitWall()
{
    bTempDisableHitWall = false;
}

function bool ReadyToCharge()
{
    return false;
}

function bool CanSeePawn(Pawn Seen)
{
    return true;
}

simulated function DrawDebug(HUD HUD, name Category);

state Debugging
{
    event BeginState(name PreviousStateName)
    {
        Outer.AILog_Internal((((string(GetFuncName()) $ "() in ") $ string(GetStateName())) $ " Previous: ") $ string(PreviousStateName), 'Command_Debug');
    }

    function InitState()
    {
        Outer.AILog_Internal((string(GetFuncName()) $ "() in ") $ string(GetStateName()), 'Command_Debug');
        Outer.AIActionStatus = "Awaiting debug command";
    }

    event EndState(name NextStateName)
    {
        Outer.AILog_Internal((((string(GetFuncName()) $ "() in ") $ string(GetStateName())) $ " Next: ") $ string(NextStateName), 'Command_Debug');
    }

    function PushedState()
    {
        Outer.AILog_Internal((string(GetFuncName()) $ "() in ") $ string(GetStateName()), 'Command_Debug');
    }

    function PausedState()
    {
        Outer.AILog_Internal((string(GetFuncName()) $ "() in ") $ string(GetStateName()), 'Command_Debug');
    }

    function ContinuedState()
    {
        Outer.AILog_Internal((string(GetFuncName()) $ "() in ") $ string(GetStateName()), 'Command_Debug');
    }

    function PoppedState()
    {
        Outer.AILog_Internal((string(GetFuncName()) $ "() in ") $ string(GetStateName()), 'Command_Debug');
    }

    function Debug_CrawlerAttack()
    {
        local PlayerController P;

        foreach Outer.WorldInfo.AllActors(Class'PlayerController', P)
        {
            if(P.Pawn != none)
            {
                Outer.Enemy = P.Pawn;
            }            
        }        
        if(Outer.Enemy != none)
        {
            bAllowedToAttack = true;
        }
        Outer.EnableMeleeRangeEventProbing();
        Outer.Pawn.SetPhysics(1);
        Outer.EnemyInMeleeRange();
    }
    stop;    
}

state MoveToRandomDebugNodes
{
    ignores GetGoal;

    function Debug_DebugNodes()
    {
        Outer.StopAllLatentMovement();
        PopState();
    }
Begin:

    Outer.WaitForLanding();
    GetGoal();
    Outer.Sleep(RandRange(3, 8));
    goto 'Begin';
    stop;            
}

state DebugLOS
{
    function BeginState(name PreviousStateName)
    {
        StartLOSTimer();
    }

    function PushedState()
    {
        StartLOSTimer();
    }

    function StartLOSTimer()
    {
        Disable('SeePlayer');
        Disable('HearNoise');
        Outer.SetTimer(0.5, true, 'CheckLOS', self);
    }

    function EndState(name NextStateName)
    {
        Outer.ClearTimer('CheckLOS', self);
    }

    function PoppedState()
    {
        Outer.ClearTimer('CheckLOS', self);
    }

    function CheckLOS()
    {
        local KFPlayerController KFPC;

        foreach Outer.WorldInfo.AllControllers(Class'KFPlayerController', KFPC)
        {
            if(((KFPC.Pawn != none) && Outer.CanSee(KFPC.Pawn)) && Outer.Pawn.LineOfSightTo(KFPC.Pawn))
            {
                Outer.msg((string(self) $ " CAN SEE ") $ string(KFPC.Pawn));
                continue;
            }
            Outer.msg((string(self) $ " CANNOT SEE ") $ string(KFPC.Pawn));            
        }        
    }
    stop;    
}

auto state Wait extends Debugging
{
    function BeginState(name PreviousStateName)
    {
        super.BeginState(PreviousStateName);
        InitState();
    }

    function ContinuedState()
    {
        super.ContinuedState();
        InitState();
    }

    function Debug_MoveForward()
    {
        PushState('DebugMoveForward', 'Ready');
    }

    function Debug_Hide()
    {
        PushState('DebugHiding');
    }

    function Debug_Vision(Pawn P)
    {
        DebuggingPlayer = KFPawn(P);
        PushState('DebugVision');
    }

    function Debug_Enemy(Pawn P)
    {
        DebuggingPlayer = KFPawn(P);
        PushState('DebugEnemy');
    }

    function Debug_Leap()
    {
        PushState('DebugLeap');
    }

    function Debug_LOS()
    {
        PushState('DebugLOS');
    }

    function Debug_DebugNodes()
    {
        PushState('MoveToRandomDebugNodes');
    }

    function Debug_StepAside(optional bool bOn)
    {
        bOn = true;
        if(!bOn)
        {
            Outer.msg(string(Outer) $ " : StepAside debugging is already turned off.");            
        }
        else
        {
            PushState('DebugStepAside');
        }
    }

    function Debug_Steering()
    {
        PushState('DebugSteering');
    }

    function Debug_Wander(optional float WanderDuraion)
    {
        WanderDuraion = -1;
        Class'AICommand_Wander'.static.BeginWander(Outer, WanderDuraion, Outer.GetALocalPlayerController().Pawn, false);
    }

    function Debug_DebugLines()
    {
        PushState('DebugDebugLines');
    }
    stop;    
}

state DebugTurn
{
    event HandleAICommandSpecialAction()
    {
        if(Outer.GetFocalPoint() != vect(0, 0, 0))
        {
            Outer.DrawDebugLine(Outer.Pawn.Location, Outer.Pawn.Location + (Normal(Outer.GetFocalPoint() - Outer.Pawn.Location) * 1024), 0, 255, 0, false);
        }
    }

    function PushedState()
    {
        Outer.SetFocalPoint(vect(0, 0, 0));
        Outer.Focus = none;
    }
    stop;    
}

state DebugLeap
{
    function PushedState()
    {
        local KFWallPathNode KFWP, BestKFWP;
        local float bestDist;

        foreach Outer.WorldInfo.AllNavigationPoints(Class'KFWallPathNode', KFWP)
        {
            if((BestKFWP == none) || VSize(KFWP.Location - Outer.Pawn.Location) < bestDist)
            {
                if(KFWP.Location.Z > 350)
                {
                    bestDist = VSize(KFWP.Location - Outer.Pawn.Location);
                    BestKFWP = KFWP;
                }
            }            
        }        
        Outer.MoveTarget = BestKFWP;
        Outer.Pawn.bCrawler = true;
    }

    function bool NotifyHitWall(Vector HitNormal, Actor Wall)
    {
        Outer.Pawn.SetPhysics(8);
        Outer.Pawn.SetBase(Wall, HitNormal);
        return false;
    }
Begin:

    if(Outer.Pawn.Physics == 2)
    {
        Outer.WaitForLanding();
    }
    Outer.Pawn.SetPhysics(1);
    PushState('RotateToMoveTarget');
    Outer.Focus = none;
    Outer.SetFocalPoint(vect(0, 0, 0));
    Outer.Sleep(1);
    Outer.Sleep(0.1);
    if(Outer.Pawn.Physics == 2)
    {
        Outer.WaitForLanding();
    }
    stop;                
}

state DebugSteering extends Debugging
{
    function PushedState()
    {
        super.PushedState();
        Outer.AIActionStatus = "In DebugSteering state";
        Outer.bDebug_DrawSeparationSteering = true;
    }

    function Debug_Steering()
    {
        PopState();
    }

    function PoppedState()
    {
        Outer.bDebug_DrawSeparationSteering = false;
        super.PoppedState();
    }
    stop;    
}

state DebugStepAside extends Debugging
{
    function PushedState()
    {
        super.PushedState();
        Outer.AIActionStatus = "In DebugStepAside state";
        Outer.msg(string(Outer) $ " in DebugStepAside state. Forcing NPC collision will invoke StepAside command, or type AIDEBUGSTEPASIDE again to force NPC to step aside with no collision.");
        bIgnoreStepAside = false;
    }

    function Debug_StepAside(optional bool bOn)
    {
        bOn = true;
        if(!bOn)
        {
            Outer.msg(string(Outer) $ " : Turning off StepAside debugging");
            PopState();            
        }
        else
        {
            if(CachedChildCommand == none)
            {
                Outer.msg(string(Outer) $ " : random step aside");
            }
        }
    }

    function bool NotifyBump(Actor Other, Vector HitNormal)
    {
        local bool bPrevIgnoreStepAside, bResult;

        Outer.AILog_Internal((string(GetFuncName()) $ " bumped into ") $ string(Other), 'Command_Debug');
        if(Pawn(Other) != none)
        {
            Outer.AILog_Internal(((string(GetFuncName()) $ " bumped into ") $ string(Other)) $ ", starting StepAside command", 'Command_Debug');
            bPrevIgnoreStepAside = Outer.bIgnoreStepAside;
            Outer.bIgnoreStepAside = false;
            Outer.StepAsideFor(Pawn(Other), HitNormal);
            Outer.bIgnoreStepAside = bPrevIgnoreStepAside;
            bResult = true;
        }
        Outer.DisableBump(1);
        return bResult;
    }
    stop;    
}

state DebugEnemy extends Debugging
{
    function PushedState()
    {
        super.PushedState();
        Outer.EnableSeePlayer();
        Outer.AIActionStatus = "In DebugEnemy state";
        Outer.SetTimer(1, true, 'EvaluateThreats', self);
    }

    function EvaluateThreats()
    {
        local KFPlayerController KFPC;

        foreach Outer.WorldInfo.AllControllers(Class'KFPlayerController', KFPC)
        {
            Outer.EvaluateThreatFrom(KFPC.Pawn);            
        }        
    }

    simulated function DrawDebug(HUD HUD, name Category)
    {
        if(DebuggingPlayer != none)
        {
            Outer.DrawDebugText(HUD, (("LOS: " $ string(Outer.LineOfSightTo(DebuggingPlayer))) $ " CanSee: ") $ string(Outer.CanSee(DebuggingPlayer)));
            Outer.DrawDebugText(HUD, "VISIBLE BY TRACE: " $ string(Outer.IsPawnVisibleViaTrace(DebuggingPlayer)));
        }
    }
    stop;    
}

state DebugHiding extends Debugging
{
    function PushedState()
    {
        super.PushedState();
        Outer.MyKFPawn.SetSprinting(true);
        Outer.AIActionStatus = "In DebugHiding state";
        if(Outer.Enemy == none)
        {
            Outer.Enemy = Outer.GetClosestEnemy();
        }
    }

    function Debug_Hide()
    {
        PopState();
    }

    function bool CheckRetreat()
    {
        local Pawn ClosestEnemy;

        ClosestEnemy = Outer.GetClosestEnemy();
        if((ClosestEnemy != none) && Outer.CanSee(ClosestEnemy))
        {
            Class'Path_AlongLine'.static.AlongLine(Outer.Pawn, -Normal(ClosestEnemy.Location - Outer.Pawn.Location));
            Class'Goal_AwayFromPosition'.static.FleeFrom(Outer.Pawn, ClosestEnemy.Location, 4000);
            if(Outer.FindPathToward(ClosestEnemy) != none)
            {
                Outer.AIActionStatus = (("Hiding from " $ string(ClosestEnemy)) $ " at ") $ string(Outer.RouteGoal);
                return true;
            }
        }
        return false;
    }
Begin:

    if(Outer.Pawn.Physics == 2)
    {
        Outer.WaitForLanding();
    }
    if(CheckRetreat())
    {
        Outer.Sleep(0.25);
        goto 'Begin';
    }
    Outer.MyKFPawn.SetSprinting(false);
    PopState();
    stop;                    
}

state DebugVision extends Debugging
{
    ignores CheckVision;

    function PushedState()
    {
        super.PushedState();
        Outer.msg(((((("Debugging " $ string(Outer.MyKFPawn)) $ " vision, current PeripheralVision: ") $ string(Outer.MyKFPawn.PeripheralVision)) $ " Current SightRadius: ") $ string(Outer.MyKFPawn.SightRadius)) $ " Checking LOS every 0.5 seconds");
        Outer.SetTimer(2, true, 'CheckVision', self);
        Outer.AIActionStatus = "In DebugVision state";
        Outer.EnableSeePlayer();
    }

    function bool NotifyEnemyBecameVisible(Pawn VisiblePlayer)
    {
        Outer.msg("YOU ARE VISIBLE : " $ string(Normal(Outer.Enemy.Location - Outer.Pawn.Location) Dot vector(Outer.Pawn.Rotation)));
        Outer.Enable('EnemyNotVisible');
        Outer.Disable('SeePlayer');
        return true;
    }

    function bool NotifyEnemyNotVisible()
    {
        Outer.msg("YOU ARE NO LONGER VISIBLE" $ string(Normal(Outer.Enemy.Location - Outer.Pawn.Location) Dot vector(Outer.Pawn.Rotation)));
        Outer.Enable('SeePlayer');
        Outer.Disable('EnemyNotVisible');
        return true;
    }

    function Debug_Vision(Pawn P)
    {
        Outer.ClearTimer('CheckVision');
        PopState();
    }
    stop;    
}

state DebugMoveForward extends Debugging
{
    function PushedState()
    {
        super.PushedState();
        Outer.AIActionStatus = "In DebugMoveForward state";
    }
Ready:

    Outer.Steering.EnableDefaultAcceleration();
    Outer.MoveTo(Outer.Pawn.Location + (vector(Outer.Pawn.Rotation) * float(1024)));
    Outer.Steering.DisableDefaultAcceleration();
    PopState();
    stop;            
}

state RotateToFocus extends Debugging
{
    function PushedState()
    {
        super.PushedState();
        Outer.AIActionStatus = "In RotateToFocus state";
    }
Begin:

    Outer.SetFocalPoint(vect(0, 0, 0));
    Outer.Focus = Outer.Enemy;
    Outer.FinishRotation();
    Outer.SetFocalPoint(vect(0, 0, 0));
    Outer.Pawn.ResetDesiredRotation();
    Outer.Focus = none;
    PopState();
    stop;        
}

state RotateToMoveTarget extends Debugging
{
    function PushedState()
    {
        super.PushedState();
        Outer.AIActionStatus = "In RotateToFocus state";
    }
Begin:

    Outer.SetFocalPoint(vect(0, 0, 0));
    Outer.Focus = Outer.MoveTarget;
    Outer.FinishRotation();
    Outer.SetFocalPoint(vect(0, 0, 0));
    Outer.Pawn.ResetDesiredRotation();
    Outer.Focus = none;
    PopState();
    stop;        
}

state DebugRoaming extends Debugging
{
    function PushedState()
    {
        super.PushedState();
        if(Outer.Enemy == none)
        {
            Outer.Enemy = Outer.GetClosestEnemy();
        }
        Outer.AIActionStatus = "In DebugRoaming state";
        RoamStartTime = Outer.WorldInfo.TimeSeconds;
    }

    function Debug_Wander(optional float WanderDuraion)
    {
        WanderDuraion = -1;
        PopState();
    }

    function Actor GenerateRoamPath(Actor Goal, optional float Distance, optional bool bAllowPartialPath)
    {
        local Actor NewGoal;

        Class'Path_TowardGoal'.static.TowardGoal(Outer.Pawn, Goal);
        Class'Path_WithinTraversalDist'.static.DontExceedMaxDist(Outer.Pawn, MaxRoamDist, false);
        Class'Path_WithinDistanceEnvelope'.static.StayWithinEnvelopeToLoc(Outer.Pawn, Goal.Location, RoamEnvelopeOuter, RoamEnvelopeInner, false,, true);
        Class'Path_AvoidInEscapableNodes'.static.DontGetStuck(Outer.Pawn);
        Class'Goal_Null'.static.GoUntilBust(Outer.Pawn, 1024);
        NewGoal = Outer.FindPathToward(Goal);
        Outer.Pawn.ClearConstraints();
        return NewGoal;
    }

    function bool RoamTowardEnemy()
    {
        local Actor Path;

        Path = GenerateRoamPath(Outer.Enemy, 100, true);
        if(Path != none)
        {
            return true;
        }
        return false;
    }

    simulated function DrawDebug(HUD HUD, name Category)
    {
        Outer.DrawDebugText(KFHUDBase(HUD), (((("MaxRoamDist: " $ string(MaxRoamDist)) $ " RoamWaitMin: ") $ string(RoamWaitMin)) $ " RoamWaitMax: ") $ string(RoamWaitMax));
        Outer.DrawDebugText(KFHUDBase(HUD), (("RoamEnvelopeInner: " $ string(RoamEnvelopeInner)) $ " RoamEnvelopeOuter: ") $ string(RoamEnvelopeOuter));
    }
Begin:

    Outer.AIActionStatus = ("Roaming toward enemy (" $ string(Outer.Enemy)) $ ")";
    if((Outer.Enemy == none) || !RoamTowardEnemy())
    {
        Outer.AIActionStatus = "Failed to find roam location for " $ string(Outer.Enemy);
        Outer.Sleep(1.5);
        goto 'Begin';
    }
    if(!Outer.IsPawnVisibleViaTrace(Outer.Enemy))
    {
        Outer.AILog_Internal("Enemy wasn't visible, reacquiring", 'Command_Debug');
        Outer.Sleep(0);
        goto 'Begin';
    }
    Outer.AIActionStatus = "Rotating toward enemy";
    Outer.Focus = Outer.Enemy;
    Outer.SetFocalPoint(vect(0, 0, 0));
    Outer.Focus = Outer.MoveFocus;
    Outer.FinishRotation();
    Outer.Sleep(RandRange(RoamWaitMin, RoamWaitMax));
    goto 'Begin';
    stop;            
}

defaultproperties
{
    MaxRoamDist=4096
    RoamEnvelopeOuter=1800
    RoamEnvelopeInner=750
    RoamWaitMin=0.5
    RoamWaitMax=3.5
}