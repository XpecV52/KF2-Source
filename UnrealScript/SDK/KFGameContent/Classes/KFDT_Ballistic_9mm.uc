//=============================================================================
// KFDT_Ballistic_9mm
//=============================================================================
// Base pistol damage type
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFDT_Ballistic_9mm extends KFDT_Ballistic_Handgun
	abstract
	hidedropdown;

`include(KFGame\KFMatchStats.uci);

defaultproperties
{
	KDamageImpulse=900
	KDeathUpKick=-300
	KDeathVel=100

	StumblePower=10
	LegStumblePower=20
	GunHitPower=15

	AARWeaponID=`AAR_9mm
}
