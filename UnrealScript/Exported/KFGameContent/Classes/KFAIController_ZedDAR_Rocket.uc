//=============================================================================
// KFAIController_ZedDAR_Rocket
//=============================================================================
// AI Controller for Evulz Rocket DAR
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFAIController_ZedDAR_Rocket extends KFAIController_ZedDAR;

function StartRangedAttack()
{
	class'AICommand_DAR_RocketAttack'.static.RocketAttack(self);
}

function vector GetStartFireLocation()
{
	local vector SocketLocation;
	local rotator SocketRotation;

	MyKFPawn.Mesh.GetSocketWorldLocationAndRotation(KFPawn_ZedDAR(MyKFPawn).FiringSocketName, SocketLocation, SocketRotation);
	return SocketLocation;
}

defaultproperties
{
   RangeAttackIntervalNormal=11.000000
   RangeAttackIntervalHard=10.000000
   RangeAttackIntervalSuicidal=9.000000
   RangeAttackIntervalHellOnEarth=8.000000
   Name="Default__KFAIController_ZedDAR_Rocket"
   ObjectArchetype=KFAIController_ZedDAR'kfgamecontent.Default__KFAIController_ZedDAR'
}
