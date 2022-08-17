/*******************************************************************************
 * KFAIController_ZedGorefast generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFAIController_ZedGorefast extends KFAIController_Monster
    config(AI)
    hidecategories(Navigation);

var bool bExecutedSprint;

function bool ShouldSprint()
{
    return MyKFPawn.bIsSprinting;
    if((((Enemy != none) && MyKFPawn != none) && !MyKFPawn.IsImpaired()) && (bExecutedSprint || MyKFPawn.Health < MyKFPawn.HealthMax) || VSizeSq(Enemy.Location - Pawn.Location) <= (SprintWithinEnemyRange.Y * SprintWithinEnemyRange.Y))
    {
        bExecutedSprint = true;
        return true;        
    }
    else
    {
        return false;
    }
}

event EnemyNotVisible()
{
    if((MyKFPawn.bIsSprinting && !bForceFrustration) && MyKFGameInfo.MyKFGRI.AIRemaining > FrustrationThreshold)
    {
        MyKFPawn.SetSprinting(false);
    }
    bEnemyIsVisible = false;
    DisableEnemyNotVisible();
    EnableSeePlayer();
}

function UpdateSprintFrustration(optional byte bForceFrustrationState)
{
    bForceFrustrationState = 255;
    if(bForceFrustration)
    {
        bCanSprint = true;
    }
}

function bool IsFrustrated()
{
    if(bForceFrustration)
    {
        return true;
    }
    return false;
}

simulated function Tick(float DeltaTime)
{
    super(KFAIController).Tick(DeltaTime);
    if(bForceFrustration)
    {
        return;
    }
    if(((MyKFPawn != none) && !bHasDebugCommand) && (LastSprintChangeTime == 0) || (WorldInfo.TimeSeconds - LastSprintChangeTime) > 1)
    {
        if(((((!MyKFPawn.bIsHeadless && !MyKFPawn.bEmpPanicked) && Enemy != none) && bEnemyIsVisible) && !MyKFPawn.bIsSprinting) && (MyKFPawn.Health < MyKFPawn.HealthMax) || VSizeSq(Enemy.Location - Pawn.Location) <= (SprintWithinEnemyRange.Y * SprintWithinEnemyRange.Y))
        {
            bExecutedSprint = true;
            MyKFPawn.SetSprinting(true);
            LastSprintChangeTime = WorldInfo.TimeSeconds;
        }
        if((MyKFPawn.bIsSprinting && MyKFGameInfo.MyKFGRI.AIRemaining > FrustrationThreshold) && (Enemy == none) || !bEnemyIsVisible)
        {
            MyKFPawn.SetSprinting(false);
            LastSprintChangeTime = WorldInfo.TimeSeconds;
        }
    }
}

event HearNoise(float Loudness, Actor NoiseMaker, optional name NoiseType);

defaultproperties
{
    bIsProbingMeleeRangeEvents=true
    SprintWithinEnemyRange=(X=0,Y=800)
    StrikeRangePercentage=0.75
    MaxMeleeHeightAngle=0.68
    EvadeGrenadeChance=0.75
    LowIntensityAttackCooldown=3
}