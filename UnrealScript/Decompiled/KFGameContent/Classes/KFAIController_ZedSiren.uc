/*******************************************************************************
 * KFAIController_ZedSiren generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFAIController_ZedSiren extends KFAIController_Monster
    config(AI)
    hidecategories(Navigation);

var float ScreamDelayTime;
var float ScreamCooldown;
var transient float LastScreamTime;

function PreMoveToEnemy()
{
    if((WorldInfo.TimeSeconds - CreationTime) > 1)
    {
        DoScream(true);        
    }
    else
    {
        SetTimer(1, false, 'DoScream');
    }
}

function DoScream(optional bool bCalledFromPreMove)
{
    bCalledFromPreMove = false;
    if(((MyKFPawn == none) || !MyKFPawn.IsCombatCapable()) || GetIsInZedVictoryState())
    {
        return;
    }
    if((WorldInfo.TimeSeconds - LastScreamTime) > ScreamCooldown)
    {
        if(FindCommandOfClass(Class'AICommand_Siren_Scream') == none)
        {
            Class'AICommand_Siren_Scream'.static.Scream(self);
        }
        if(!bCalledFromPreMove)
        {
            SetEnemyMoveGoal(self, true);
        }        
    }
    else
    {
        SetTimer(1, false, 'DoScream');
    }
}

function AcquireEnemyAndScream(optional bool bStartScreamTimer, optional float ScreamTimer)
{
    local Pawn BestTarget;
    local bool bScreamActive;

    ScreamTimer = 1;
    if((((MyKFPawn == none) || !MyKFPawn.IsCombatCapable()) || IsTimerActive('DoScream')) || GetIsInZedVictoryState())
    {
        if((MyKFPawn != none) && !MyKFPawn.IsCombatCapable())
        {
            SetTimer(1, false, 'AcquireEnemyAndScream');
        }
        return;
    }
    if(Enemy == none)
    {
        BestTarget = MyKFPawn.GetBestAggroEnemy();
        if(BestTarget == none)
        {
            BestTarget = GetClosestEnemy();
        }
        if(BestTarget != none)
        {
            ChangeEnemy(BestTarget, true);
        }
    }
    bScreamActive = FindCommandOfClass(Class'AICommand_Siren_Scream') != none;
    if(bStartScreamTimer)
    {
        if(bScreamActive)
        {
            ScreamDelayTime = WorldInfo.TimeSeconds + ScreamTimer;            
        }
        else
        {
            SetTimer(ScreamTimer, false, 'DoScream');
        }        
    }
    else
    {
        if(!bScreamActive)
        {
            DoScream();
        }
    }
}

function NotifySpecialMoveStarted(KFSpecialMove SM)
{
    local AICommand_Siren_Scream ScreamCommand;

    if((MyKFPawn == none) || !MyKFPawn.IsAliveAndWell())
    {
        return;
    }
    if(!MyKFPawn.IsCombatCapable())
    {
        ScreamCommand = FindCommandOfClass(Class'AICommand_Siren_Scream');
        if(ScreamCommand != none)
        {
            AbortCommand(ScreamCommand);
        }
    }
    super(KFAIController).NotifySpecialMoveStarted(SM);
}

function NotifySpecialMoveEnded(KFSpecialMove SM)
{
    super(KFAIController).NotifySpecialMoveEnded(SM);
    if((((SM.Handle == 'KFSM_Stumble') || SM.Handle == 'KFSM_Stunned') || SM.Handle == 'KFSM_Frozen') || SM.Handle == 'KFSM_RecoverFromRagdoll')
    {
        AcquireEnemyAndScream(true, 0.5);
    }
}

function NotifyReachedLatentMoveGoal()
{
    AcquireEnemyAndScream(false);
}

function NotifyMeleeAttackFinished()
{
    super(KFAIController).NotifyMeleeAttackFinished();
    if(MyKFPawn != none)
    {
        MyKFPawn.NotifyMeleeAttackFinished();
    }
}

function NotifyCommandFinished(AICommand FinishedCommand)
{
    if(AICommand_PanicWander(FinishedCommand) != none)
    {
        AcquireEnemyAndScream(true, 0.75);
    }
    super(KFAIController).NotifyCommandFinished(FinishedCommand);
}

function DoPanicWander()
{
    local GameAICommand ActiveCommand;
    local AICommand_Siren_Scream ScreamCommand;

    ActiveCommand = GetActiveCommand();
    if((ActiveCommand != none) && AICommand_PanicWander(ActiveCommand) != none)
    {
        return;
    }
    ScreamCommand = FindCommandOfClass(Class'AICommand_Siren_Scream');
    if(ScreamCommand != none)
    {
        AbortCommand(ScreamCommand);
    }
    super(KFAIController).DoPanicWander();
}

function EnterZedVictoryState()
{
    local AICommand_Siren_Scream ScreamCommand;

    if(IsTimerActive('DoScream'))
    {
        ClearTimer('DoScream');
    }
    ScreamCommand = FindCommandOfClass(Class'AICommand_Siren_Scream');
    if(ScreamCommand != none)
    {
        AbortCommand(ScreamCommand);
    }
    super(KFAIController).EnterZedVictoryState();
}

defaultproperties
{
    ScreamCooldown=4
    bCanTeleportCloser=false
    bIsProbingMeleeRangeEvents=true
    SprintWithinEnemyRange=(X=600,Y=1200)
    LowIntensityAttackCooldown=7
}