/*******************************************************************************
 * KFAIController_ZedBloat generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFAIController_ZedBloat extends KFAIController_Monster
    config(AI)
    hidecategories(Navigation);

defaultproperties
{
    bCanTeleportCloser=false
    bCanStrikeThroughEnemies=true
    bIsProbingMeleeRangeEvents=true
    SprintWithinEnemyRange=(X=520,Y=1200)
    EvadeGrenadeChance=0.6
}