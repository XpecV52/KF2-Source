/*******************************************************************************
 * AICommand_ThrowGrenade generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AICommand_ThrowGrenade extends AICommand_SpecialMove within KFAIController_Hans;

var int GrenadeBarrage;
var bool bHuntAndHeal;

static function bool ThrowGrenade(KFAIController_Hans AI, optional int inGrenadeBarrage, optional bool bIsHuntAndHeal)
{
    local AICommand_ThrowGrenade Cmd;

    Cmd = new (AI) default.Class;
    if(Cmd != none)
    {
        Cmd.GrenadeBarrage = inGrenadeBarrage;
        Cmd.bHuntAndHeal = bIsHuntAndHeal;
        AI.PushCommand(Cmd);
        return true;
    }
    return false;
}

function Pushed()
{
    Outer.AIActionStatus = "Attempting to throw grenade";
    Outer.DisableMeleeRangeEventProbing();
    Outer.SetFocalPoint(vect(0, 0, 0));
    Outer.Focus = Outer.Enemy;
    super.Pushed();
}

function LockdownAI()
{
    if(Outer.MyHansPawn.CanMoveWhileThrowingGrenades())
    {
        return;
    }
    super.LockdownAI();
}

function Popped()
{
    Outer.Focus = none;
    Outer.EnableMeleeRangeEventProbing();
    super.Popped();
}

state Command_SpecialMove
{
    function bool ShouldFinishRotation()
    {
        return true;
    }

    function bool ExecuteSpecialMove()
    {
        if(super.ExecuteSpecialMove())
        {
            if(KFPawn_ZedHansBase(Outer.MyKFPawn) != none)
            {
                KFPawn_ZedHansBase(Outer.MyKFPawn).bPendingSmokeGrenadeBarrage = false;
            }
            return true;            
        }
        else
        {
            if(((GrenadeBarrage > 0) && bHuntAndHeal) && KFPawn_ZedHansBase(Outer.MyKFPawn) != none)
            {
                KFPawn_ZedHansBase(Outer.MyKFPawn).bPendingSmokeGrenadeBarrage = true;
            }
            return false;
        }
    }

    function KFPawn.ESpecialMove GetSpecialMove()
    {
        if(GrenadeBarrage == 0)
        {
            return 35;            
        }
        else
        {
            if(GrenadeBarrage == 1)
            {
                return 36;                
            }
            else
            {
                return 37;
            }
        }
    }
    stop;    
}

defaultproperties
{
    bShouldCheckSpecialMove=true
    TimeOutDelaySeconds=25
}