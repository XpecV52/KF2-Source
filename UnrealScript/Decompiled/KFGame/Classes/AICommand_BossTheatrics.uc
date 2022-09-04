/*******************************************************************************
 * AICommand_BossTheatrics generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AICommand_BossTheatrics extends AICommand_SpecialMove within KFAIController;

var byte TheatricType;
var int TheatricDuration;

static function bool DoTheatrics(KFAIController AI, optional byte InTheatricType, optional int InTheatricDuration)
{
    local AICommand_BossTheatrics Cmd;

    if(AI != none)
    {
        Cmd = new (AI) default.Class;
        if(Cmd != none)
        {
            Cmd.TheatricType = InTheatricType;
            Cmd.TheatricDuration = InTheatricDuration;
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
    if(!Class'Engine'.static.GetEngine().bDisableAILogging)
    {
        Outer.AILog_Internal("Beginning boss theatrics" $ string(Outer.Enemy), 'Command_BossTheatrics');
    }
    Outer.AIActionStatus = "Starting BossTheatrics AICommand";
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
    Outer.AIActionStatus = "Finished boss theatrics AICommand";
    Outer.EnableMeleeRangeEventProbing();
    if(Outer.bUsePluginsForMovement)
    {
        Outer.MovementPlugin.EnablePlugin();
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
        if(!Class'Engine'.static.GetEngine().bDisableAILogging)
        {
            Outer.AILog_Internal(string(GetFuncName()) @ string(SpecialMove), 'Command_BossTheatrics');
        }
        if((SpecialMove != 0) && Outer.MyKFPawn.CanDoSpecialMove(SpecialMove))
        {
            SpecialMoveFlags = Class'KFSM_Zed_Boss_Theatrics'.static.PackSMFlags(Outer.MyKFPawn, TheatricType);
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
        return 38;
    }
    stop;    
}

defaultproperties
{
    bShouldCheckSpecialMove=true
    TimeOutDelaySeconds=25
}