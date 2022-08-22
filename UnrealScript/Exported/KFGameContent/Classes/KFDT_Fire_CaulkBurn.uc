//=============================================================================
// KFDT_Fire_CaulkBurn
//=============================================================================
// Damage caused by heat and combustion
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Fire_CaulkBurn extends KFDT_Fire
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
   WeaponDef=Class'KFGame.KFWeapDef_CaulkBurn'
   DoT_Duration=1.700000
   DoT_Interval=0.400000
   DoT_DamageScale=0.800000
   StumblePower=20.000000
   BurnPower=10.500000
   Name="Default__KFDT_Fire_CaulkBurn"
   ObjectArchetype=KFDT_Fire'KFGame.Default__KFDT_Fire'
}
