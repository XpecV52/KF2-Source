//=============================================================================
// class KFDT_HuskCannonDot 
//=============================================================================
// Damage caused by burning from being hit by a husk cannon fire ball
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//  - Zane Gholson
//=============================================================================
class KFDT_HuskCannonDot extends KFDT_Fire
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
   WeaponDef=Class'KFGame.KFWeapDef_HuskCannon'
   DoT_Duration=2.500000
   DoT_Interval=0.500000
   DoT_DamageScale=0.100000
   BurnPower=15.500000
   ModifierPerkList(1)=Class'KFGame.KFPerk_Demolitionist'
   Name="Default__KFDT_HuskCannonDot"
   ObjectArchetype=KFDT_Fire'KFGame.Default__KFDT_Fire'
}
