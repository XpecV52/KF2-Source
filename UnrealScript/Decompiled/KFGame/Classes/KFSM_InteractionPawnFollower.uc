/*******************************************************************************
 * KFSM_InteractionPawnFollower generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFSM_InteractionPawnFollower extends KFSpecialMove
    abstract;

var KFPawn Leader;
var protected KFPawn.ESpecialMove LeaderSpecialMove;

function SpecialMoveStarted(bool bForced, name PrevMove)
{
    super.SpecialMoveStarted(bForced, PrevMove);
    Leader = KFPOwner.InteractionPawn;
    LeaderSpecialMove = 0;
}

function SpecialMoveEnded(name PrevMove, name NextMove)
{
    local KFSM_InteractionPawnLeader LeaderSM;

    if(((Leader != none) && Leader.Health > 0) && Leader.IsDoingSpecialMove(LeaderSpecialMove))
    {
        LeaderSM = KFSM_InteractionPawnLeader(Leader.SpecialMoves[LeaderSpecialMove]);
        LeaderSM.OnFollowerLeavingSpecialMove();
    }
    Leader = none;
    LeaderSpecialMove = 0;
    super.SpecialMoveEnded(PrevMove, NextMove);
}

function bool MessageEvent(name EventName, Object Sender)
{
    if(EventName == 'InteractionStarted')
    {
        InteractionStarted();
        return true;
    }
    return super(GameSpecialMove).MessageEvent(EventName, Sender);
}

function InteractionStarted()
{
    LeaderSpecialMove = ((Leader != none) ? Leader.SpecialMove : KFPOwner.InteractionPawn.SpecialMove);
}
