//=============================================================================
// KFDT_Explosive_Pulverizer
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFDT_Explosive_Pulverizer extends KFDT_Explosive
	abstract
	hidedropdown; // remove to edit archetype

`include(KFGame\KFMatchStats.uci);

DefaultProperties
{

	KnockdownPower=42
	StunPower=42
	StumblePower=66
	LegStumblePower=66
	GunHitPower=129
	MeleeHitPower=130

	bCanObliterate=false

	WeaponDef=class'KFWeapDef_Pulverizer'

	ModifierPerkList(0)=class'KFPerk_Berserker'

	GoreDamageGroup=DGT_Obliteration
}
