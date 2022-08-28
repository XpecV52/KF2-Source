//=============================================================================
// KFAIController_ZedDAR_EMP
//=============================================================================
// AI Controller for Evulz EMP DAR
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFAIController_ZedDAR_EMP extends KFAIController_ZedDAR;

var name EMPSocketName;

function StartRangedAttack()
{
	class'AICommand_DAR_EMPAttack'.static.EMPAttack(self);
}

defaultproperties
{
   EMPSocketName="EMP_Blast"
   RangeAttackIntervalNormal=10.000000
   RangeAttackIntervalHard=9.000000
   RangeAttackIntervalSuicidal=8.000000
   RangeAttackIntervalHellOnEarth=7.000000
   Name="Default__KFAIController_ZedDAR_EMP"
   ObjectArchetype=KFAIController_ZedDAR'kfgamecontent.Default__KFAIController_ZedDAR'
}
