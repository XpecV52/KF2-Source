/*******************************************************************************
 * AICommand generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AICommand extends GameAICommand within KFAIController
    native(AI);

var KFAIController AIOwner;
var AICommand CachedChildCommand;
var bool bAllowedToAttack;
var bool bInterruptPauseCommand;
var bool bDisableMovementPluginOnPushed;
var string OverrideLogCategory;

function PrePushed(GameAIController AI)
{
    AIOwner = Outer;
    super.PrePushed(AI);
}

function Pushed()
{
    if((Outer.bUsePluginsForMovement && Outer.MovementPlugin != none) && bDisableMovementPluginOnPushed)
    {
        Outer.MovementPlugin.DisablePlugin();
    }
    super.Pushed();
}

function PostPopped()
{
    AIOwner = none;
    super.PostPopped();
}

function Paused(GameAICommand NewCommand)
{
    if(!Class'Engine'.static.GetEngine().bDisableAILogging)
    {
        Outer.AILog_Internal((((string(GetFuncName()) $ " [") $ string(self)) $ "] setting CachedChildCommand to ") $ string(NewCommand), 'Command_Base');
    }
    CachedChildCommand = AICommand(NewCommand);
    super.Paused(NewCommand);
}

function Resumed(name OldCommandName)
{
    if(!Class'Engine'.static.GetEngine().bDisableAILogging)
    {
        Outer.AILog_Internal(string(GetFuncName()) $ " Command resumed, setting CachedChildCommand to none", 'Command_Base');
    }
    CachedChildCommand = none;
    super.Resumed(OldCommandName);
}

function Popped()
{
    if((Outer.bUsePluginsForMovement && Outer.MovementPlugin != none) && bDisableMovementPluginOnPushed)
    {
        Outer.MovementPlugin.EnablePlugin();
    }
    if((Outer.MyKFPawn != none) && Outer.MyKFPawn.IsAliveAndWell())
    {
        UpdateCommandHistory();
        if(!Class'Engine'.static.GetEngine().bDisableAILogging)
        {
            Outer.AILog_Internal(string(GetFuncName()) $ " Command Popped, setting CachedChildCommand to none", 'Command_Base');
        }
    }
    CachedChildCommand = none;
    if(AIOwner != none)
    {
        AIOwner.NotifyCommandFinished(self);
    }
    super.Popped();
}

event HandleAICommandSpecialAction();

function bool AllowPushOfDefaultCommandForSpecialMove(KFPawn.ESpecialMove SM)
{
    return true;
}

function AICommandBase GetParentCommand()
{
    local GameAICommand ParentCommand;

    ParentCommand = Outer.CommandList;
    J0x28:

    if((ParentCommand != none) && ParentCommand.ChildCommand != self)
    {
        ParentCommand = ParentCommand.ChildCommand;
        goto J0x28;
    }
    if(ParentCommand != none)
    {
        return ParentCommand;
    }
    return none;
}

function bool NotifyHearNoise(float Loudness, Actor NoiseMaker, optional name NoiseType)
{
    if(CachedChildCommand != none)
    {
        if(!Class'Engine'.static.GetEngine().bDisableAILogging)
        {
            Outer.AILog_Internal((((((string(GetFuncName()) $ "() Loudness: ") $ string(Loudness)) $ " NoiseMaker: ") $ string(NoiseMaker)) $ " Type: ") $ string(NoiseType), 'HearNoise');
        }
        return CachedChildCommand.NotifyHearNoise(Loudness, NoiseMaker, NoiseType);
    }
    return false;
}

function bool NotifyCombatBehaviorChange(name BehaviorName, bool bEnabled)
{
    if(CachedChildCommand != none)
    {
        if(!Class'Engine'.static.GetEngine().bDisableAILogging)
        {
            Outer.AILog_Internal((((string(GetFuncName()) $ "() BehaviorName: ") $ string(BehaviorName)) $ " bEnabled: ") $ string(bEnabled));
        }
        return CachedChildCommand.NotifyCombatBehaviorChange(BehaviorName, bEnabled);
    }
    return false;
}

function bool CanChangeEnemy(Pawn NewEnemy)
{
    if(CachedChildCommand != none)
    {
        return CachedChildCommand.CanChangeEnemy(NewEnemy);
    }
    return true;
}

function NotifyEnemyChanged(optional Pawn OldEnemy)
{
    if(CachedChildCommand != none)
    {
        CachedChildCommand.NotifyEnemyChanged(OldEnemy);
    }
}

function NotifyDoorOpened()
{
    if(CachedChildCommand != none)
    {
        if(!Class'Engine'.static.GetEngine().bDisableAILogging)
        {
            Outer.AILog_Internal(((string(GetFuncName()) $ "() notifying ") $ string(CachedChildCommand)) $ " and letting it handle the event.", 'NotifyDoorOpened');
        }
        CachedChildCommand.NotifyDoorOpened();
    }
}

function bool NotifyPlayerBecameVisible(Pawn VisiblePlayer)
{
    if(CachedChildCommand != none)
    {
        if(!Class'Engine'.static.GetEngine().bDisableAILogging)
        {
            Outer.AILog_Internal(((((string(GetFuncName()) $ "() Seen: ") $ string(VisiblePlayer)) $ " notifying ") $ string(CachedChildCommand)) $ " and letting it handle the event.", 'SeePlayer');
        }
        return CachedChildCommand.NotifyPlayerBecameVisible(VisiblePlayer);
    }
    return false;
}

function bool NotifyEnemyNotVisible()
{
    if(CachedChildCommand != none)
    {
        if(!Class'Engine'.static.GetEngine().bDisableAILogging)
        {
            Outer.AILog_Internal(((string(GetFuncName()) $ "() notifying ") $ string(CachedChildCommand)) $ " and letting it handle the event.", 'EnemyNotVisible');
        }
        return CachedChildCommand.NotifyEnemyNotVisible();
    }
    return false;
}

function bool NotifyBaseChange(Actor NewBase, Vector NewFloor)
{
    if(CachedChildCommand != none)
    {
        if(CachedChildCommand.NotifyBaseChange(NewBase, NewFloor))
        {
            return true;
        }
    }
    return false;
}

function bool NotifyLanded(Vector HitNormal, Actor FloorActor)
{
    if(CachedChildCommand != none)
    {
        if(!Class'Engine'.static.GetEngine().bDisableAILogging)
        {
            Outer.AILog_Internal(((((((string(GetFuncName()) $ "() HitNormal:") $ string(HitNormal)) $ " FloorActor:") $ string(FloorActor)) $ " notifying ") $ string(CachedChildCommand)) $ " and letting it handle the event.", 'PathWarning');
        }
        return CachedChildCommand.NotifyLanded(HitNormal, FloorActor);
    }
    return false;
}

function bool EnemyIsSurrounded()
{
    if(CachedChildCommand != none)
    {
        if(!Class'Engine'.static.GetEngine().bDisableAILogging)
        {
            Outer.AILog_Internal(((string(GetFuncName()) $ "() notifying ") $ string(CachedChildCommand)) $ " and letting it handle the event.", 'PathWarning');
        }
        return CachedChildCommand.EnemyIsSurrounded();
    }
    return false;
}

function bool NotifyHitWall(Vector HitNormal, Actor Wall)
{
    if(CachedChildCommand != none)
    {
        if(!Class'Engine'.static.GetEngine().bDisableAILogging)
        {
            Outer.AILog_Internal(((string(GetFuncName()) $ "() notifying ") $ string(CachedChildCommand)) $ " and letting it handle the event.", 'HitWall');
        }
        return CachedChildCommand.NotifyHitWall(HitNormal, Wall);
    }
    return false;
}

function bool NotifyFallingHitWall(Vector HitNormal, Actor Wall)
{
    if(CachedChildCommand != none)
    {
        if(!Class'Engine'.static.GetEngine().bDisableAILogging)
        {
            Outer.AILog_Internal(((string(GetFuncName()) $ "() notifying ") $ string(CachedChildCommand)) $ " and letting it handle the event.", 'HitWall');
        }
        return CachedChildCommand.NotifyFallingHitWall(HitNormal, Wall);
    }
    return false;
}

function bool NotifyHuskSuicide(KFPawn_Monster Husk)
{
    return false;
    if(Outer.CachedAICommandList != none)
    {
        if(Outer.CachedAICommandList.NotifyHuskSuicide(Husk))
        {
            return true;
        }
    }
    return false;
}

function bool NotifyBump(Actor Other, Vector HitNormal)
{
    if(CachedChildCommand != none)
    {
        if(!Class'Engine'.static.GetEngine().bDisableAILogging)
        {
            Outer.AILog_Internal(((string(GetFuncName()) $ "() notifying ") $ string(CachedChildCommand)) $ " and letting it handle the event.", 'BumpEvent');
        }
        if(CachedChildCommand.NotifyBump(Other, HitNormal))
        {
            return true;
        }
    }
    return false;
}

function bool NotifyLatentPostPhysWalking()
{
    if(CachedChildCommand != none)
    {
        if(!Class'Engine'.static.GetEngine().bDisableAILogging)
        {
            Outer.AILog_Internal(((string(GetFuncName()) $ "() notifying ") $ string(CachedChildCommand)) $ " and letting it handle the event.", 'PostPhysWalking');
        }
        if(CachedChildCommand.NotifyLatentPostPhysWalking())
        {
            return true;
        }
    }
    return false;
}

function bool NotifyTouch(Actor Other, PrimitiveComponent OtherComp, Vector HitLocation, Vector HitNormal)
{
    if(CachedChildCommand != none)
    {
        if(!Class'Engine'.static.GetEngine().bDisableAILogging)
        {
            Outer.AILog_Internal(((string(GetFuncName()) $ "() notifying ") $ string(CachedChildCommand)) $ " and letting it handle the event.", 'TouchEvent');
        }
        if(CachedChildCommand.NotifyTouch(Other, OtherComp, HitLocation, HitNormal))
        {
            return true;
        }
    }
    return false;
}

function bool NotifyMovingOnToDestructibleEdge(KFDestructibleActor TheDestructiblePathObject, out KFNavMeshMovementStepData EdgeData, out Vector outMove2Point)
{
    if(CachedChildCommand != none)
    {
        if(!Class'Engine'.static.GetEngine().bDisableAILogging)
        {
            Outer.AILog_Internal(((string(GetFuncName()) $ "() notifying ") $ string(CachedChildCommand)) $ " and letting it handle the event.", 'NotifyZedStuck');
        }
        if(CachedChildCommand.NotifyMovingOnToDestructibleEdge(TheDestructiblePathObject, EdgeData, outMove2Point))
        {
            return true;
        }
    }
    return false;
}

function bool NotifyNpcTerminallyStuck()
{
    if(CachedChildCommand != none)
    {
        if(!Class'Engine'.static.GetEngine().bDisableAILogging)
        {
            Outer.AILog_Internal(((string(GetFuncName()) $ "() notifying ") $ string(CachedChildCommand)) $ " and letting it handle the event.", 'NotifyNpcTerminallyStuck');
        }
        if(CachedChildCommand.NotifyNpcTerminallyStuck())
        {
            return true;
        }
    }
    return false;
}

function bool NotifyNpcInGrannyMode()
{
    if(CachedChildCommand != none)
    {
        if(!Class'Engine'.static.GetEngine().bDisableAILogging)
        {
            Outer.AILog_Internal(((string(GetFuncName()) $ "() notifying ") $ string(CachedChildCommand)) $ " and letting it handle the event.", 'NotifyNpcInGrannyMode');
        }
        if(CachedChildCommand.NotifyNpcInGrannyMode())
        {
            return true;
        }
    }
    return false;
}

function bool ShouldIgnoreTimeTransitions()
{
    local bool bShouldIgnore;

    if(CachedChildCommand != none)
    {
        bShouldIgnore = CachedChildCommand.ShouldIgnoreTimeTransitions();
    }
    if(bShouldIgnore)
    {
        if(!Class'Engine'.static.GetEngine().bDisableAILogging)
        {
            Outer.AILog_Internal(string(GetFuncName()) $ "() returning TRUE - ignoring time transitions", 'CombatTransitions');
        }
    }
    return bShouldIgnore;
}

function bool IsAllowedToAttack()
{
    local bool bCanAttack;

    bCanAttack = bAllowedToAttack && (CachedChildCommand == none) || CachedChildCommand.IsAllowedToAttack();
    if(!bCanAttack)
    {
        if(!Class'Engine'.static.GetEngine().bDisableAILogging)
        {
            Outer.AILog_Internal(string(GetFuncName()) $ "() returning false because !bAllowedToAttack");
        }
    }
    return bCanAttack;
}

function bool IsPawnAlive(Pawn P)
{
    if(P == none)
    {
        return false;
    }
    if((P.Controller == none) || !P.IsAliveAndWell())
    {
        return false;
    }
    return true;
}

function bool IsControllerAlive(Controller C)
{
    if(C == none)
    {
        return false;
    }
    if((C.Pawn == none) || !C.Pawn.IsAliveAndWell())
    {
        return false;
    }
    return true;
}

function bool ShouldSelectTarget()
{
    if(CachedChildCommand != none)
    {
        return CachedChildCommand.ShouldSelectTarget();
    }
    return true;
}

function AdjustEnemyRating(out float out_Rating, Pawn EnemyPawn)
{
    if(CachedChildCommand != none)
    {
        CachedChildCommand.AdjustEnemyRating(out_Rating, EnemyPawn);
    }
}

function FindDirectPath()
{
    if(!Class'Engine'.static.GetEngine().bDisableAILogging)
    {
        Outer.AILog_Internal(string(GetFuncName()), 'Move_DirectPath');
    }
    if(CachedChildCommand != none)
    {
        if(!Class'Engine'.static.GetEngine().bDisableAILogging)
        {
            Outer.AILog_Internal(((((string(GetFuncName()) $ "(), [I am ") $ string(self)) $ "] letting ") $ string(CachedChildCommand)) $ " decide what to do about it.", 'Move_DirectPath');
        }
        CachedChildCommand.FindDirectPath();
    }
}

function bool MoveUnreachable(Vector AttemptedDest, Actor AttemptedTarget)
{
    if(AttemptedTarget != none)
    {
        if(!Class'Engine'.static.GetEngine().bDisableAILogging)
        {
            Outer.AILog_Internal((string(GetFuncName()) $ " AttemptedTarget: ") $ string(AttemptedTarget), 'PathWarning');
        }
    }
    if(CachedChildCommand != none)
    {
        if(!Class'Engine'.static.GetEngine().bDisableAILogging)
        {
            Outer.AILog_Internal(((string(GetFuncName()) $ "() letting ") $ string(CachedChildCommand)) $ " decide what to do about it.", 'PathWarning');
        }
        return CachedChildCommand.MoveUnreachable(AttemptedDest, AttemptedTarget);
    }
    return false;
}

function NotifyNeedRepath()
{
    if(CachedChildCommand != none)
    {
        if(!Class'Engine'.static.GetEngine().bDisableAILogging)
        {
            Outer.AILog_Internal(((((string(GetFuncName()) $ "() ") $ string(self)) $ " called, letting ") $ string(CachedChildCommand)) $ " decide what to do about it.", 'PathWarning');
        }
        CachedChildCommand.NotifyNeedRepath();        
    }
    else
    {
        if(!Class'Engine'.static.GetEngine().bDisableAILogging)
        {
            Outer.AILog_Internal(((string(GetFuncName()) $ "() ") $ string(self)) $ " called.", 'PathWarning');
        }
    }
}

function UpdateCommandHistory()
{
    local int I;

    if(Outer.Pawn != none)
    {
        I = 0;
        J0x2F:

        if(I < Outer.KFAICommandHistory.Length)
        {
            if((Outer.KFAICommandHistory[I].CmdName != "") && Outer.KFAICommandHistory[I].CmdName == string(Name))
            {
                if(Status == 'Aborted')
                {
                    Outer.KFAICommandHistory[I].bAborted = true;
                }
                if(Status == 'Failure')
                {
                    Outer.KFAICommandHistory[I].bFailure = true;
                }
                if(Status == 'Success')
                {
                    Outer.KFAICommandHistory[I].bSuccess = true;
                }
                UpdateHistoryString("Status: " $ string(Status));
                Outer.KFAICommandHistory[I].Duration = Outer.WorldInfo.TimeSeconds - Outer.KFAICommandHistory[I].TimeStamp;
                Outer.KFAICommandHistory[I].VerboseString = HistoryString;
            }
            ++ I;
            goto J0x2F;
        }
    }
}

function UpdateHistoryString(string AddString)
{
    if(Outer.Pawn != none)
    {
        if(Outer.CommandHistoryNum > 0)
        {
            HistoryString = (HistoryString $ " ") $ AddString;
        }
    }
}

simulated event DrawDebug(HUD H, name Category)
{
    if(ChildCommand != none)
    {
        ChildCommand.DrawDebug(H, Category);
    }
}

event string GetDebugVerboseText()
{
    return HistoryString;
}

static function bool CanInterruptPauseCommand()
{
    return default.bInterruptPauseCommand;
}

defaultproperties
{
    bAllowedToAttack=true
    bDisableMovementPluginOnPushed=true
}