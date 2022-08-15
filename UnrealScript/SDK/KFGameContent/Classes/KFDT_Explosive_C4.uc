//=============================================================================
// KFDT_Explosive_C4
//=============================================================================
// Explosive damage type for C4
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Jeff Robinson
//=============================================================================

class KFDT_Explosive_C4 extends KFDT_Explosive
	abstract
	hidedropdown;

`include(KFGame\KFMatchStats.uci);


defaultproperties
{
	bShouldSpawnPersistentBlood=true

	// physics impact
	RadialDamageImpulse=3000
	KDeathUpKick=800
	KDeathVel=300
	KDamageImpulse=3000

	KnockdownPower=40
	StumblePower=38
	LegStumblePower=38

	// DOT
	DoT_Type=DOT_Fire
	DoT_Duration=3.0
	DoT_Interval=1.0
	DoT_DamageScale=0.0 // don't want it to do any actual damage, because dying from DOT or taking DOT after death will cause obliteration, which looks weird

	BurnPower=0.2
	EffectGroup=FXG_Fire

	WeaponDef=class'KFWeapDef_C4'
	//Perk
	ModifierPerkList(0)=class'KFPerk_Demolitionist'

	ObliterationHealthThreshold=-400
	ObliterationDamageThreshold=400
}
