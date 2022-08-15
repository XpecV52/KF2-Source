//=============================================================================
// KFDT_Microwave_Blast
//=============================================================================
// Damage caused by the microwave gun alternate fire
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Microwave_Blast extends KFDT_Microwave
	abstract
	hidedropdown;

`include(KFGame\KFMatchStats.uci);

DefaultProperties
{
	// This weapon uses radial impulses
	RadialDamageImpulse=5000
	KDamageImpulse=0
	KDeathUpKick=500.0
	KDeathVel=300

	// unreal physics momentum
	bExtraMomentumZ=True
	
	KnockdownPower=0
	StumblePower=135
	LegStumblePower=135
	GunHitPower=0
	MeleeHitPower=0

	BurnPower=0.25

	EffectGroup=FXG_MicrowaveBlast
	//bCanObliterate=true
	//ObliterationHealthThreshold=-75
	//ObliterationDamageThreshold=100
	bCanGib=true
	GoreDamageGroup=DGT_Obliteration

	AARWeaponID=`AAR_MicrowaveGun
	ModifierPerkList(0)=class'KFPerk_Firebug'
}
