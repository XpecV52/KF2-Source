/*******************************************************************************
 * AICommand_Siren_Scream generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AICommand_Siren_Scream extends AICommand_SpecialMove within KFAIController_ZedSiren;

var int MinScreamRangeSQ;
var int MaxScreamRangeSQ;

static function bool Scream(KFAIController_ZedSiren AI)
{
    local AICommand_Siren_Scream Cmd;

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

function LockdownAI();

function Pushed()
{
    Outer.AIActionStatus = "Screaming!";
    super.Pushed();
}

function Popped()
{
    super.Popped();
    Outer.EnableMeleeRangeEventProbing();
}

state Command_SpecialMove
{
    event HandleAICommandSpecialAction()
    {
        super(AICommand).HandleAICommandSpecialAction();
        if(CanScream())
        {
            Outer.MyKFPawn.DoSpecialMove(SpecialMove, true, GetInteractionPawn(), GetSpecialMoveFlags(SpecialMove));
        }
    }

    function KFGame.KFPawn.ESpecialMove GetSpecialMove()
    {
        return default.SpecialMove;
    }

    function bool CanScream()
    {
        local Vector EnemyLocation, MyEyeLocation;
        local float RangeToEnemySQ;
        local KFGameInfo KFGI;

        if((((((((Outer.Enemy != none) && Outer.WorldInfo.TimeSeconds > Outer.ScreamDelayTime) && (Outer.DoorEnemy == none) || Outer.DoorEnemy.IsCompletelyOpen()) && !bShouldCheckSpecialMove || Outer.MyKFPawn.CanDoSpecialMove(SpecialMove)) && (Outer.LastScreamTime == 0) || (Outer.WorldInfo.TimeSeconds - Outer.LastScreamTime) > Outer.ScreamCooldown) && Outer.CheckOverallCooldownTimer()) && Outer.MyKFPawn.IsCombatCapable()) && !Outer.GetIsInZedVictoryState())
        {
            EnemyLocation = Outer.Enemy.Location + (vect(0, 0, 1) * Outer.Enemy.BaseEyeHeight);
            MyEyeLocation = Outer.MyKFPawn.Location + (vect(0, 0, 1) * Outer.MyKFPawn.BaseEyeHeight);
            RangeToEnemySQ = VSizeSq(EnemyLocation - MyEyeLocation);
            if(((RangeToEnemySQ < float(MaxScreamRangeSQ)) && RangeToEnemySQ > float(MinScreamRangeSQ)) && Class'KFGameEngine'.static.FastTrace_PhysX(EnemyLocation, MyEyeLocation))
            {
                Outer.LastScreamTime = Outer.WorldInfo.TimeSeconds;
                KFGI = KFGameInfo(Outer.WorldInfo.Game);
                if((KFGI != none) && KFGI.GameConductor != none)
                {
                    KFGI.GameConductor.UpdateOverallAttackCoolDowns(Outer);
                }
                return true;
            }
        }
        return false;
    }
    stop;    
}

defaultproperties
{
    MinScreamRangeSQ=17000
    MaxScreamRangeSQ=810000
    SpecialMove=ESpecialMove.SM_SonicAttack
    bIgnoreNotifies=true
}