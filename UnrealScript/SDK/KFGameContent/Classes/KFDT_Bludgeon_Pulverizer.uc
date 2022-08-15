//=============================================================================
// KFDT_Bludgeon_Pulverizer
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Bludgeon_Pulverizer extends KFDT_Bludgeon
	abstract
	hidedropdown;

`include(KFGame\KFMatchStats.uci);

defaultproperties
{
	KDamageImpulse=1500
	KDeathUpKick=0
	KDeathVel=375

	
	KnockdownPower=30
	StunPower=42
	StumblePower=56
	LegStumblePower=56
	MeleeHitPower=50

	WeaponDef=class'KFWeapDef_Pulverizer'

	ModifierPerkList(0)=class'KFPerk_Berserker'
}
