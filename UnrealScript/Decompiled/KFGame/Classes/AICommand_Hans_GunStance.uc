/*******************************************************************************
 * AICommand_Hans_GunStance generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AICommand_Hans_GunStance extends AICommand_SpecialMove within KFAIController_Hans;

var byte StanceType;

static function bool SetGunStance(KFAIController_Hans AI, byte StanceChangeType)
{
    local AICommand_Hans_GunStance Cmd;

    if(AI != none)
    {
        Cmd = new (AI) default.Class;
        if(Cmd != none)
        {
            AI.PushCommand(Cmd);
            Cmd.StanceType = StanceChangeType;
            AI.LastStanceChangeTime = AI.WorldInfo.TimeSeconds;
            if((KFPawn(AI.Pawn) != none) && KFPawn(AI.Pawn).bIsSprinting)
            {
                KFPawn(AI.Pawn).SetSprinting(false);
            }
            return true;
        }
    }
    return false;
}

function Pushed()
{
    super.Pushed();
    if(Outer.bUsePluginsForMovement && Outer.MovementPlugin != none)
    {
        Outer.MovementPlugin.DisablePlugin();
    }
    Outer.DisableMeleeRangeEventProbing();
}

function Popped()
{
    if(Outer.bUsePluginsForMovement && Outer.MovementPlugin != none)
    {
        Outer.MovementPlugin.EnablePlugin();
    }
    super.Popped();
    Outer.EnableMeleeRangeEventProbing();
}

state Command_SpecialMove
{
    function KFPawn.ESpecialMove GetSpecialMove()
    {
        return 33;
    }

    function bool ExecuteSpecialMove()
    {
        SpecialMove = GetSpecialMove();
        if(!Class'Engine'.static.GetEngine().bDisableAILogging)
        {
            Outer.AILog_Internal(string(GetFuncName()) @ string(SpecialMove), 'AICommand_Hans_GunStance');
        }
        if((SpecialMove != 0) && !bShouldCheckSpecialMove || Outer.MyKFPawn.CanDoSpecialMove(SpecialMove))
        {
            Outer.MyKFPawn.DoSpecialMove(SpecialMove, true, GetInteractionPawn(), StanceType);
            return true;            
        }
        else
        {
            return false;
        }
    }
    stop;    
}

defaultproperties
{
    bShouldCheckSpecialMove=true
    bIgnoreNotifies=true
}