//=============================================================================
// KFDT_Explosive_DynamiteGrenade
//=============================================================================
// Ballistic damage with light impact energy, but stronger hit reactions
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// by Jeff Robinson
//=============================================================================

class KFDT_Explosive_DynamiteGrenade extends KFDT_Explosive
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

	KnockdownPower=50 // knockdown any non-boss zed in one hit
	StumblePower=0
	StunPower=54 // stun any non-boss zed in one hit

	//Perk
	ModifierPerkList(0)=class'KFPerk_Demolitionist'
	
	AARWeaponID=`AAR_DynamiteGrenade
}
