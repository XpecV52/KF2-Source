/*******************************************************************************
 * AICommand_HuskFireBallAttack generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AICommand_HuskFireBallAttack extends AICommand_SpecialMove within KFAIController_ZedHusk;

var Vector LastKnownEnemyLocation;
var float LastEnemyLocationCheckTime;

static function bool FireBallAttack(KFAIController_ZedHusk AI)
{
    local AICommand_HuskFireBallAttack Cmd;

    if(AI != none)
    {
        Cmd = new (AI) default.Class;
        if(Cmd != none)
        {
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
    if(Outer.Enemy != none)
    {
        Outer.Focus = Outer.Enemy;
    }
    Outer.AILog_Internal("Beginning fireball " $ string(Outer.Enemy), 'Command_FireBall');
    Outer.AIActionStatus = "Starting fireball AICommand";
    if(Outer.Focus != none)
    {
        Outer.SetDesiredRotation(rotator(Outer.Focus.Location - Outer.Pawn.Location));
    }
    Outer.DisableMeleeRangeEventProbing();
}

function Popped()
{
    Outer.AIActionStatus = "Finished fireball AICommand";
    Outer.LastFireBallTime = Outer.WorldInfo.TimeSeconds;
    Outer.EnableMeleeRangeEventProbing();
    super.Popped();
}

event HandleAICommandSpecialAction()
{
    super(AICommand).HandleAICommandSpecialAction();
    if((Outer.MyKFPawn == none) || Outer.Enemy == none)
    {
        return;
    }
    if((Outer.WorldInfo.TimeSeconds - LastEnemyLocationCheckTime) >= 0.25)
    {
        if(Outer.DirectProjectileFireBehavior.IsThereClearDirectFireAttackLaneFromGivenLoc(Outer.MyKFPawn.Location, Outer.Enemy))
        {
            LastKnownEnemyLocation = Outer.Enemy.Location;
            LastEnemyLocationCheckTime = Outer.WorldInfo.TimeSeconds;
        }
    }
}

state Command_SpecialMove
{
    function float GetPreSpecialMoveSleepTime()
    {
        return FRand();
    }

    function bool ExecuteSpecialMove()
    {
        SpecialMove = GetSpecialMove();
        Outer.AILog_Internal(string(GetFuncName()) @ string(SpecialMove), 'Command_FireBall');
        if((SpecialMove != 0) && Outer.MyKFPawn.CanDoSpecialMove(SpecialMove))
        {
            Outer.MyKFPawn.DoSpecialMove(SpecialMove, true, GetInteractionPawn(), 255);
            return true;            
        }
        else
        {
            return false;
        }
    }

    function KFGame.KFPawn.ESpecialMove GetSpecialMove()
    {
        return 18;
    }
    stop;    
}

defaultproperties
{
    bShouldCheckSpecialMove=true
    TimeOutDelaySeconds=25
    bIgnoreNotifies=true
}