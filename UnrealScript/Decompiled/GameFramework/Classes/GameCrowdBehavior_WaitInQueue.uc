/*******************************************************************************
 * GameCrowdBehavior_WaitInQueue generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class GameCrowdBehavior_WaitInQueue extends GameCrowdAgentBehavior
    native;

var bool bStoppingBehavior;
var GameCrowdDestinationQueuePoint QueuePosition;

// Export UGameCrowdBehavior_WaitInQueue::execHandleMovement(FFrame&, void* const)
native function bool HandleMovement();

function ChangingDestination(GameCrowdDestination NewDest)
{
    if(QueuePosition == none)
    {
        WarnInternal(string(MyAgent) $ " should never have no QueuePosition");
    }
    MyAgent.StopBehavior();
}

function Actor GetDestinationActor()
{
    return QueuePosition;
}

function string GetBehaviorString()
{
    if(QueuePosition != none)
    {
        return (string(self) $ " Waiting in line at ") $ string(QueuePosition);        
    }
    else
    {
        return string(self) $ " Queue Behavior with NO QUEUEPOSITION!";
    }
}

// Export UGameCrowdBehavior_WaitInQueue::execShouldEndIdle(FFrame&, void* const)
native function bool ShouldEndIdle();

function StopBehavior()
{
    if(!bStoppingBehavior)
    {
        bStoppingBehavior = true;
        super.StopBehavior();
        if(QueuePosition != none)
        {
            QueuePosition.ClearQueue(MyAgent);
        }
        QueuePosition = none;
        MyAgent.StopIdleAnimation();
        bStoppingBehavior = false;
    }
}

defaultproperties
{
    bIdleBehavior=true
}