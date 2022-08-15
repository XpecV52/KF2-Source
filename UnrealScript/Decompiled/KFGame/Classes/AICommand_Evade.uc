/*******************************************************************************
 * AICommand_Evade generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AICommand_Evade extends AICommand_SpecialMove within KFAIController;

var byte EvadeDirection;
var byte SMFlags;
var float EvadeDelay;
var bool bFrightened;
var bool bTurnToThreat;
var float RepeatDistSq;

static function bool Evade(KFAIController AI, byte Direction, optional float InEvadeDelay, optional bool InFrightened, optional bool InTurnToThreat)
{
    local AICommand_Evade Cmd;

    if(AI != none)
    {
        Cmd = new (AI) Class'AICommand_Evade';
        if(Cmd != none)
        {
            Cmd.EvadeDirection = Direction;
            Cmd.EvadeDelay = InEvadeDelay;
            Cmd.SMFlags = Direction;
            Cmd.bFrightened = InFrightened;
            Cmd.bTurnToThreat = InTurnToThreat;
            AI.PushCommand(Cmd);
            return true;
        }
    }
    return false;
}

event string GetDumpString()
{
    return (super(GameAICommand).GetDumpString() @ "Dir:") @ string(EvadeDirection);
}

function Pushed()
{
    Outer.AIActionStatus = "Evading!";
    super.Pushed();
    Outer.AIZeroMovementVariables();
    Outer.SetDesiredRotation(Outer.Pawn.Rotation);
    Outer.SetFocalPoint(vect(0, 0, 0));
    Outer.Focus = none;
    if(EvadeDelay > 0)
    {
        GotoState('Wait');        
    }
    else
    {
        GotoState('Command_SpecialMove');
    }
}

function Popped()
{
    Outer.AIActionStatus = "Done Evading";
    Outer.AIZeroMovementVariables();
    if(Outer.MyKFPawn != none)
    {
        Outer.MyKFPawn.StopLookingAtPawn();
    }
    Outer.Focus = none;
    super.Popped();
}

function bool CanEvade()
{
    return false;
}

state Wait
{Begin:

    Outer.Sleep(EvadeDelay);
    GotoState('Command_SpecialMove');
    stop;                    
}

state Command_SpecialMove
{
    function KFPawn.ESpecialMove GetSpecialMove()
    {
        if(bFrightened && Outer.MyKFPawn.CanDoSpecialMove(14))
        {
            return 14;            
        }
        else
        {
            return 13;
        }
    }

    function byte GetSpecialMoveFlags(KFPawn.ESpecialMove InSpecialMove)
    {
        return Class'KFSM_Evade'.static.PackAnimFlag(EvadeDirection);
    }

    function bool ShouldFinishRotation()
    {
        return bTurnToThreat;
    }

    function bool ExecuteSpecialMove()
    {
        SpecialMove = GetSpecialMove();
        Outer.AILog_Internal((string(GetFuncName()) $ "()") @ string(SpecialMove), 'Command_SpecialMove');
        if((SpecialMove != 0) && !bShouldCheckSpecialMove || Outer.MyKFPawn.CanDoSpecialMove(SpecialMove))
        {
            Outer.MyKFPawn.DoSpecialMove(SpecialMove, true, GetInteractionPawn(), GetSpecialMoveFlags(GetSpecialMove()));
            Outer.AIActionStatus = "SpecialMove: " $ string(Outer.MyKFPawn.SpecialMoves[SpecialMove]);
            return true;            
        }
        else
        {
            return false;
        }
    }

    function FinishedSpecialMove()
    {
        super.FinishedSpecialMove();
    }
    stop;    
}

defaultproperties
{
    RepeatDistSq=250000
    bShouldCheckSpecialMove=true
}