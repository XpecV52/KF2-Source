//=============================================================================
// KFDT_Toxic
//=============================================================================
// Any bio-chemical substance that burns or causes cell damage
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Toxic extends KFDamageType
	abstract;







































































































































































































































































































































































































































































































































































































































































#linenumber 13

/** Returns ID of dialog event for killer to speak after killing a zed using this damage type */
static function int GetKillerDialogID()
{
	return 90;
}

/** Returns ID of dialog event for damager to speak after damaging a zed using this damage type */
static function int GetDamagerDialogID()
{
	return 105;
}

/** Returns ID of dialog event for damagee to speak after getting damaged by a zed using this damage type */
static function int GetDamageeDialogID()
{
	return 119;
}

defaultproperties
{
   DoT_Type=DOT_Toxic
   EffectGroup=FXG_Toxic
   DoT_Duration=10.000000
   DoT_Interval=1.000000
   DoT_DamageScale=0.100000
   PoisonPower=33.000000
   ScreenMaterialName="Effect_Puke"
   CameraLensEffectTemplate=Class'KFGame.KFCameraLensEmit_Puke'
   AltCameraLensEffectTemplate=Class'KFGame.KFCameraLensEmit_Puke_Light'
   KDamageImpulse=0.000000
   Name="Default__KFDT_Toxic"
   ObjectArchetype=KFDamageType'KFGame.Default__KFDamageType'
}
