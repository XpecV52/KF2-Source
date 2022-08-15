//=============================================================================
// KFDT_Piercing_KatanaStab
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Piercing_KatanaStab extends KFDT_Piercing
	abstract
	hidedropdown;

`include(KFGame\KFMatchStats.uci);

defaultproperties
{
	KDamageImpulse=200
	KDeathUpKick=250

	
	StumblePower=45
	LegStumblePower=45
	MeleeHitPower=80

	AARWeaponID=`AAR_Katana
}
