//=============================================================================
// KFDT_Fire_IonThrusterDoT
//=============================================================================
// Damage caused by burning from being hit by a dragon's breath round
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - John "Ramm-Jaeger" Gibson
//=============================================================================

class KFDT_Fire_IonThrusterDoT extends KFDT_Fire
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
   WeaponDef=Class'KFGame.KFWeapDef_IonThruster'
   DoT_Duration=3.000000
   DoT_Interval=0.500000
   DoT_DamageScale=0.200000
   BurnPower=15.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Berserker'
   Name="Default__KFDT_Fire_IonThrusterDoT"
   ObjectArchetype=KFDT_Fire'KFGame.Default__KFDT_Fire'
}
