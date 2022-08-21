/*******************************************************************************
 * AICommand_Siren_Scream generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AICommand_Siren_Scream extends AICommand_SpecialMove within KFAIController_ZedSiren;

var int MinScreamRange;
var int MaxScreamRange;
var float ScreamCooldown;
var float LastScreamTime;

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
        local Vector HitL, HitN, EnemyLocation, MyEyeLocation;
        local float RangeToEnemy;

        if(((Outer.Enemy != none) && SpecialMove != 0) && !bShouldCheckSpecialMove || Outer.MyKFPawn.CanDoSpecialMove(SpecialMove))
        {
            if(((Outer.WorldInfo.TimeSeconds - LastScreamTime) < ScreamCooldown) || !Outer.CheckOverallCooldownTimer())
            {
                return false;
            }
            if(Outer.MyKFPawn.IsImpaired() || Outer.MyKFPawn.IsIncapacitated())
            {
                return false;
            }
            EnemyLocation = Outer.Enemy.Location + (vect(0, 0, 1) * Outer.Enemy.BaseEyeHeight);
            MyEyeLocation = Outer.MyKFPawn.Location + (vect(0, 0, 1) * Outer.MyKFPawn.BaseEyeHeight);
            RangeToEnemy = VSize(EnemyLocation - MyEyeLocation);
            if(((RangeToEnemy < float(MaxScreamRange)) && RangeToEnemy > float(MinScreamRange)) && Outer.Trace(HitL, HitN, EnemyLocation, MyEyeLocation, false,,, Outer.1) == none)
            {
                LastScreamTime = Outer.WorldInfo.TimeSeconds;
                if((KFGameInfo(Outer.WorldInfo.Game) != none) && KFGameInfo(Outer.WorldInfo.Game).GameConductor != none)
                {
                    KFGameInfo(Outer.WorldInfo.Game).GameConductor.UpdateOverallAttackCoolDowns(Outer);
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
    MinScreamRange=130
    MaxScreamRange=920
    ScreamCooldown=5
    SpecialMove=ESpecialMove.SM_SonicAttack
    bIgnoreNotifies=true
}