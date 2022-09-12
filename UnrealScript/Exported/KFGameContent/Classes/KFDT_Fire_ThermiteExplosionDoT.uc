//=============================================================================
// KFDT_Fire_ThermiteExplosionDoT
//=============================================================================
// Damage caused by burning from being hit by a thermite bore explosion
//=============================================================================
// Killing Floor 2
// Copyright (C) 2021 Tripwire Interactive LLC
//=============================================================================

class KFDT_Fire_ThermiteExplosionDoT extends KFDT_Fire
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
   WeaponDef=Class'KFGame.KFWeapDef_ThermiteBore'
   bNoInstigatorDamage=True
   DoT_Duration=3.000000
   DoT_Interval=0.500000
   DoT_DamageScale=0.200000
   BurnPower=10.000000
   Name="Default__KFDT_Fire_ThermiteExplosionDoT"
   ObjectArchetype=KFDT_Fire'KFGame.Default__KFDT_Fire'
}
