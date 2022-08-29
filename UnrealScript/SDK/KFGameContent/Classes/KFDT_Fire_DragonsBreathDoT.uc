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
	WeaponDef=class'KFWeapDef_DragonsBreath'

	DoT_Type=DOT_Fire
	DoT_Duration=2.7 //5.0 //1.0
	DoT_Interval=0.5
	DoT_DamageScale=0.7 //1.0

	BurnPower=10 //1.0 //18.5
}

