//=============================================================================
// KFDT_Fire_FlareGunDoT
//=============================================================================
// Damage caused by burning from being hit by a dragon's breath round
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//  - John "Ramm-Jaeger" Gibson
//=============================================================================
class KFDT_Fire_FlareGunDoT extends KFDT_Fire
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
   WeaponDef=Class'KFGame.KFWeapDef_FlareGun'
   DoT_Duration=1.700000
   DoT_Interval=0.400000
   DoT_DamageScale=0.800000
   BurnPower=12.000000
   ModifierPerkList(1)=Class'KFGame.KFPerk_Gunslinger'
   ModifierPerkList(2)=Class'KFGame.KFPerk_Sharpshooter'
   Name="Default__KFDT_Fire_FlareGunDoT"
   ObjectArchetype=KFDT_Fire'KFGame.Default__KFDT_Fire'
}
