//=============================================================================
// KFDT_Fire_Ground_HRGScorcher
//=============================================================================
// Damage caused by burning from being hit by a HRG Scorcher ground fire
//=============================================================================
// Killing Floor 2
// Copyright (C) 2020 Tripwire Interactive LLC
// Roberto Moreno (Saber Interactive)
//=============================================================================

class KFDT_Fire_Ground_HRGScorcher extends KFDT_Fire_Ground
	abstract;

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
   WeaponDef=Class'KFGame.KFWeapDef_HRGScorcher'
   DoT_Duration=2.000000
   DoT_Interval=0.500000
   DoT_DamageScale=0.200000
   BurnPower=8.000000
   Name="Default__KFDT_Fire_Ground_HRGScorcher"
   ObjectArchetype=KFDT_Fire_Ground'KFGame.Default__KFDT_Fire_Ground'
}
