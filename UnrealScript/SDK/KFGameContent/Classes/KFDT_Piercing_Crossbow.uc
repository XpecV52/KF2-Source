//=============================================================================
// KFDT_Piercing_Crossbow
//=============================================================================
// Damage type for crossbow
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Piercing_Crossbow extends KFDT_Piercing
	abstract
	hidedropdown;

defaultproperties
{
	KDamageImpulse=1500
	KDeathUpKick=250
	KDeathVel=150

	StunPower=70
	StumblePower=10
	LegStumblePower=15
	GunHitPower=30
	MeleeHitPower=25

	ModifierPerkList(0)=class'KFPerk_Sharpshooter'
	WeaponDef=class'KFWeapDef_Crossbow'
}
