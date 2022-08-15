//=============================================================================
// KFDT_Ballistic_AR15
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 10/30/2013
//=============================================================================

class KFDT_Ballistic_AR15 extends KFDT_Ballistic_AssaultRifle
	abstract
	hidedropdown;

`include(KFGame\KFMatchStats.uci);

defaultproperties
{
	KDamageImpulse=900
	KDeathUpKick=-300
	KDeathVel=100
	
	StumblePower=35
	LegStumblePower=35
	GunHitPower=15

	AARWeaponID=`AAR_AR15

	//Perk
	ModifierPerkList(0)=class'KFPerk_Commando'
}
