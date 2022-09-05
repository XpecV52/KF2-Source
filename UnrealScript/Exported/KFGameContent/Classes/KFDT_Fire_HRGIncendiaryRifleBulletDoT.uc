//=============================================================================
// KFDT_Fire_HRGIncendiaryRifleBulletDoT
//=============================================================================
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

class KFDT_Fire_HRGIncendiaryRifleBulletDoT extends KFDT_Fire
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
   WeaponDef=Class'KFGame.KFWeapDef_HRGIncendiaryRifle'
   DoT_Duration=2.000000
   DoT_Interval=0.500000
   DoT_DamageScale=0.300000
   BurnPower=8.000000
   Name="Default__KFDT_Fire_HRGIncendiaryRifleBulletDoT"
   ObjectArchetype=KFDT_Fire'KFGame.Default__KFDT_Fire'
}
