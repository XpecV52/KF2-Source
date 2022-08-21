//=============================================================================
// KFDT_Explosive_Pulverizer
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFDT_Explosive_Pulverizer extends KFDT_Explosive
	abstract
	hidedropdown; // remove to edit archetype

DefaultProperties
{
	KnockdownPower=0
	StunPower=0
	StumblePower=340
	GunHitPower=0
	MeleeHitPower=100

	bCanObliterate=false

	WeaponDef=class'KFWeapDef_Pulverizer'

	ModifierPerkList(0)=class'KFPerk_Berserker'

	GoreDamageGroup=DGT_Obliteration
}
