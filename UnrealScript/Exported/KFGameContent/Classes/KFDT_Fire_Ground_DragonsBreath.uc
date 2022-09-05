//=============================================================================
// KFDT_Fire_Ground_DragonsBreath
//=============================================================================
// Damage caused by burning from being hit by a dragon's breath ground fire
//=============================================================================
// Killing Floor 2
// Copyright (C) 2020 Tripwire Interactive LLC
// Tulio Beloqui (Saber Interactive)
//=============================================================================

class KFDT_Fire_Ground_DragonsBreath extends KFDT_Fire_Ground
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
   WeaponDef=Class'KFGame.KFWeapDef_DragonsBreath'
   DoT_Duration=2.700000
   DoT_Interval=0.500000
   DoT_DamageScale=0.700000
   BurnPower=10.000000
   Name="Default__KFDT_Fire_Ground_DragonsBreath"
   ObjectArchetype=KFDT_Fire_Ground'KFGame.Default__KFDT_Fire_Ground'
}
