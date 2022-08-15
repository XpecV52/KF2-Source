/*******************************************************************************
 * KFAIController_ZedSiren generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFAIController_ZedSiren extends KFAIController_Monster
    config(AI)
    hidecategories(Navigation);

function PreMoveToEnemy()
{
    Class'AICommand_Siren_Scream'.static.Scream(self);
}

function NotifyMeleeAttackFinished()
{
    if(MyKFPawn != none)
    {
        MyKFPawn.NotifyMeleeAttackFinished();
    }
}

defaultproperties
{
    bIsProbingMeleeRangeEvents=true
    SprintWithinEnemyRange=(X=600,Y=1200)
}