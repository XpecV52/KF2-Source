/*******************************************************************************
 * AICommand_Base_Combat generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AICommand_Base_Combat extends AICommand within KFAIController
    native(AI);

var Vector2D InitialTransitionCheckTime;
var Vector2D TransitionCheckTime;
var name DefaultStateName;

function Pushed()
{
    super.Pushed();
}

function Popped()
{
    super.Popped();
    Outer.ClearTimer('CheckInterruptCombatTransitions');
    Outer.ClearTimer('CombatSelectTarget', self);
}

function Paused(GameAICommand NewCommand)
{
    super.Paused(NewCommand);
}

final function float GetInitialTransitionCheckTime()
{
    return RandRange(InitialTransitionCheckTime.X, InitialTransitionCheckTime.Y);
}

final function float GetTransitionCheckTime()
{
    return RandRange(TransitionCheckTime.X, TransitionCheckTime.Y);
}

function bool TimedTransitionCheck(out class<AICommand> out_NewCommand, out string out_Reason);

function bool CheckTransition(out class<AICommand> out_NewCommand, out string out_Reason);

final function CombatSelectTarget()
{
    Outer.AILog_Internal(string(GetFuncName()) $ "() calling SelectTarget()", 'SetEnemy');
    Outer.SetTimer(2.5 + (FRand() * 0.75), false, 'CombatSelectTarget', self);
    Outer.SelectTarget();
}

state InCombat
{
    function BeginState(name PreviousStateName)
    {
        super(Object).BeginState(PreviousStateName);
        SetTargetSelectionTimer();
    }

    function SetTargetSelectionTimer()
    {
        Outer.SetTimer(1.5 + (FRand() * 0.75), false, 'CombatSelectTarget', self);
    }

    function EndState(name NextStateName)
    {
        super(Object).EndState(NextStateName);
        Outer.ClearTimer('CombatSelectTarget', self);
    }
    stop;    
}

defaultproperties
{
    InitialTransitionCheckTime=(X=1,Y=1)
    TransitionCheckTime=(X=1,Y=1)
    DefaultStateName=InCombat
}