//=============================================================================
// KFDT_Explosive_HX25
//=============================================================================
// Explosive damage type for the HX25 Grenade launcher grenade
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFDT_Explosive_HX25 extends KFDT_Explosive
	abstract
	hidedropdown;

`include(KFGame\KFMatchStats.uci);

defaultproperties
{
	bShouldSpawnPersistentBlood=true

	// physics impact
	RadialDamageImpulse=1500
	KDeathUpKick=500
	KDeathVel=250

	KnockdownPower=30
	StumblePower=36
	LegStumblePower=36

	//Perk
	ModifierPerkList(0)=class'KFPerk_Demolitionist'
	
	WeaponDef=class'KFWeapDef_HX25'
}
 