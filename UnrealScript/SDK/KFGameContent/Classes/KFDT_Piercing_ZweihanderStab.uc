//=============================================================================
// KFDT_Piercing_ZweihanderStab
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Piercing_ZweihanderStab extends KFDT_Piercing
	abstract
	hidedropdown;

`include(KFGame\KFMatchStats.uci);

defaultproperties
{
	KDamageImpulse=200
	KDeathUpKick=250

	KnockdownPower=20
	StunPower=42
	StumblePower=63
	LegStumblePower=63
	MeleeHitPower=80

	AARWeaponID=`AAR_Zweihander
	ModifierPerkList(0)=class'KFPerk_Berserker'
}
