/*******************************************************************************
 * KFAIController_ZedClot_Slasher generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFAIController_ZedClot_Slasher extends KFAIController_ZedClot
    config(AI)
    hidecategories(Navigation);

function bool ShouldSprint()
{
    if(MyKFPawn.bCanSprint || MyKFPawn.bCanSprintWhenDamaged && MyKFPawn.Health < MyKFPawn.HealthMax)
    {
        return true;        
    }
    else
    {
        return false;
    }
}

defaultproperties
{
    SprintWithinEnemyRange=(X=120,Y=700)
    EvadeGrenadeChance=0.6
}