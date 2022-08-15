//=============================================================================
// KFDT_Explosive_HEGrenade
//=============================================================================
// Explosive damage type for high explosive grenades
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFDT_Explosive_HEGrenade extends KFDT_Explosive
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

	ObliterationHealthThreshold=-250
	ObliterationDamageThreshold=250

	AARWeaponID=`AAR_HEGrenade
}
