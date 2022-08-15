//=============================================================================
// KFDT_Bludgeon_Pulverizer
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Bludgeon_PulverizerHeavy extends KFDT_Bludgeon_Pulverizer
	abstract
	hidedropdown;

`include(KFGame\KFMatchStats.uci);

defaultproperties
{
	KDamageImpulse=1600
	KDeathUpKick=0
	KDeathVel=500

	KnockdownPower=40
	StunPower=42
	StumblePower=60
	LegStumblePower=60
	MeleeHitPower=62

	AARWeaponID=`AAR_Pulverizer

	ModifierPerkList(0)=class'KFPerk_Berserker'
}
