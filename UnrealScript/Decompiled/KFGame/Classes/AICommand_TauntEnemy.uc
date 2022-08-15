/*******************************************************************************
 * AICommand_TauntEnemy generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AICommand_TauntEnemy extends AICommand_SpecialMove within KFAIController;

var Pawn TauntTarget;
var byte TauntType;

static function bool Taunt(KFAIController AI, optional Pawn inTauntTarget, optional byte InTauntType)
{
    local AICommand_TauntEnemy Cmd;

    if(AI != none)
    {
        Cmd = new (AI) default.Class;
        if(Cmd != none)
        {
            Cmd.TauntTarget = inTauntTarget;
            Cmd.TauntType = InTauntType;
            AI.PushCommand(Cmd);
            return true;
        }
    }
    return false;
}

function Pushed()
{
    super.Pushed();
    Outer.StopAllLatentMovement();
    Outer.AIZeroMovementVariables();
    if(TauntTarget != none)
    {
        Outer.Focus = TauntTarget;
    }
    Outer.AILog_Internal("Beginning to taunt enemy " $ string(Outer.Enemy), 'Command_Taunt');
    Outer.AIActionStatus = "Starting taunt AICommand";
    if(Outer.Focus != none)
    {
        Outer.SetDesiredRotation(rotator(Outer.Focus.Location - Outer.Pawn.Location));
    }
    if(Outer.bUsePluginsForMovement)
    {
        Outer.MovementPlugin.DisablePlugin();
    }
    Outer.DisableMeleeRangeEventProbing();
}

function Popped()
{
    Outer.AIActionStatus = "Finished taunt AICommand";
    Outer.LastTauntTime = Outer.WorldInfo.TimeSeconds;
    Outer.EnableMeleeRangeEventProbing();
    if(Outer.bUsePluginsForMovement)
    {
        Outer.MovementPlugin.EnablePlugin();
    }
    if((TauntType == 1) || Outer.Enemy == none)
    {
        Outer.FindNewEnemy();
    }
    super.Popped();
}

state Command_SpecialMove
{
    function float GetPreSpecialMoveSleepTime()
    {
        return FRand();
    }

    function bool ExecuteSpecialMove()
    {
        local byte SpecialMoveFlags;

        SpecialMove = GetSpecialMove();
        Outer.AILog_Internal(string(GetFuncName()) @ string(SpecialMove), 'Command_Taunt');
        if((SpecialMove != 0) && Outer.MyKFPawn.CanDoSpecialMove(SpecialMove))
        {
            SpecialMoveFlags = Class'KFSM_Zed_Taunt'.static.PackSMFlags(Outer.MyKFPawn, TauntType);
            if(SpecialMoveFlags != 255)
            {
                Outer.MyKFPawn.DoSpecialMove(SpecialMove, true, GetInteractionPawn(), SpecialMoveFlags);
                return true;                
            }
            else
            {
                return false;
            }            
        }
        else
        {
            return false;
        }
    }

    function KFPawn.ESpecialMove GetSpecialMove()
    {
        return 11;
    }
    stop;    
}

defaultproperties
{
    bShouldCheckSpecialMove=true
    TimeOutDelaySeconds=25
}