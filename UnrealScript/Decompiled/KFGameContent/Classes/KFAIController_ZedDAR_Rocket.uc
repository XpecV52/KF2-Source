/*******************************************************************************
 * KFAIController_ZedDAR_Rocket generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFAIController_ZedDAR_Rocket extends KFAIController_ZedDAR
    config(AI)
    hidecategories(Navigation);

function StartRangedAttack()
{
    Class'AICommand_DAR_RocketAttack'.static.RocketAttack(self);
}

function Vector GetStartFireLocation()
{
    local Vector SocketLocation;
    local Rotator SocketRotation;

    MyKFPawn.Mesh.GetSocketWorldLocationAndRotation(KFPawn_ZedDAR(MyKFPawn).FiringSocketName, SocketLocation, SocketRotation);
    return SocketLocation;
}

defaultproperties
{
    RangeAttackIntervalNormal=11
    RangeAttackIntervalHard=10
    RangeAttackIntervalSuicidal=9
    RangeAttackIntervalHellOnEarth=8
}