//=============================================================================
// KFDT_Fire_DragonsBreathDoT
//=============================================================================
// Damage caused by burning from being hit by a dragon's breath round
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - John "Ramm-Jaeger" Gibson
//=============================================================================

class KFDT_Fire_DragonsBreathDoT extends KFDT_Fire
	abstract
	hidedropdown;






































	














#linenumber 15;

static function int GetKillerDialogID()
{
	return 86;//KILL_Fire
}

static function int GetDamagerDialogID()
{
	return 102;//DAMZ_Fire
}

static function int GetDamageeDialogID()
{
	return 116;//DAMP_Fire
}

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_DragonsBreath'
   DoT_DamageScale=1.000000
   BurnPower=1.250000
   Name="Default__KFDT_Fire_DragonsBreathDoT"
   ObjectArchetype=KFDT_Fire'KFGame.Default__KFDT_Fire'
}
