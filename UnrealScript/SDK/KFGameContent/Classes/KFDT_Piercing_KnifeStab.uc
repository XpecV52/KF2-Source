//=============================================================================
// KFDT_Piercing_KnifeStab
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Piercing_KnifeStab extends KFDT_Piercing
	abstract
	hidedropdown;

`include(KFGame\KFMatchStats.uci);

defaultproperties
{
	KDamageImpulse=200
	KDeathUpKick=250

	// Hit reactions

	
	StumblePower=40
	StunPower=35
	LegStumblePower=40
	MeleeHitPower=30


	WeaponDef=class'KFWeapDef_Knife_Base'
}
