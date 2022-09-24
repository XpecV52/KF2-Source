//=============================================================================
// KFDT_Fire_HRG_DragonsBreathDoT
//=============================================================================
// Damage caused by burning from being hit by an HRG dragon's breath round
//=============================================================================
// Killing Floor 2
// Copyright (C) 2022 Tripwire Interactive LLC
//
//=============================================================================

class KFDT_Fire_HRG_DragonsBreathDoT extends KFDT_Fire
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
   WeaponDef=Class'KFGame.KFWeapDef_HRG_Dragonbreath'
   DoT_Duration=2.700000
   DoT_Interval=0.500000
   DoT_DamageScale=0.700000
   BurnPower=10.000000
   Name="Default__KFDT_Fire_HRG_DragonsBreathDoT"
   ObjectArchetype=KFDT_Fire'KFGame.Default__KFDT_Fire'
}
