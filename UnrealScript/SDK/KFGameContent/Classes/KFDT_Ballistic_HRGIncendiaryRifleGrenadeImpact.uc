//=============================================================================
// KFDT_Ballistic_HRGIncendiaryRifleGrenadeImpact
//=============================================================================
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

class KFDT_Ballistic_HRGIncendiaryRifleGrenadeImpact extends KFDT_Ballistic_Shell
	abstract
	hidedropdown;

defaultproperties
{
	KDamageImpulse=2000
	KDeathUpKick=750
	KDeathVel=350

	KnockdownPower=125
	StumblePower=340
	GunHitPower=275

	WeaponDef=class'KFWeapDef_HRGIncendiaryRifle'

	ModifierPerkList(0)=class'KFPerk_Firebug'
}
