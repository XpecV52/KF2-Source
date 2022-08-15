//=============================================================================
// KFDT_Explosive_Shrapnel
//=============================================================================
// Explosive damage with similar values to frag grenade
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Explosive_Shrapnel extends KFDT_Explosive
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

	KnockdownPower=0
	StumblePower=120

	//AARWeaponID=`AAR_FragGrenade

	ModifierPerkList(0)=class'KFPerk_Firebug'	
}