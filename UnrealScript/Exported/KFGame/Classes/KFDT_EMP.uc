//=============================================================================
// KFDT_EMP
//=============================================================================
// Damage caused by EMP weapons
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFDT_EMP extends KFDamageType
	abstract;







































































































































































































































































































































































	




	




	




	














	




	














	












































































#linenumber 14

/** Returns ID of dialog event for killer to speak after killing a zed using this damage type */
static function int GetKillerDialogID()
{
	return 89;
}

/** Returns ID of dialog event for damager to speak after damaging a zed using this damage type */
static function int GetDamagerDialogID()
{
	return 104;
}

defaultproperties
{
   GoreDamageGroup=DGT_EMP
   EMPPower=1.000000
   CameraLensEffectTemplate=Class'KFGame.KFCameraLensEmit_EMP'
   bArmorStops=False
   KDamageImpulse=150.000000
   Name="Default__KFDT_EMP"
   ObjectArchetype=KFDamageType'KFGame.Default__KFDamageType'
}
