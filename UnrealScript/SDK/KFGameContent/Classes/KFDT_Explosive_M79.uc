//=============================================================================
// KFDT_Explosive_M79
//=============================================================================
// Explosive damage type for the M79 Grenade launcher grenade
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFDT_Explosive_M79 extends KFDT_Explosive
	abstract
	hidedropdown;

`include(KFGame\KFMatchStats.uci);


defaultproperties
{
	bShouldSpawnPersistentBlood=true

	// physics impact
	RadialDamageImpulse=3000
	KDeathUpKick=1000
	KDeathVel=300

	KnockdownPower=45
	StumblePower=42
	LegStumblePower=42

	//Perk
	ModifierPerkList(0)=class'KFPerk_Demolitionist'
	
	AARWeaponID=`AAR_M79
}
