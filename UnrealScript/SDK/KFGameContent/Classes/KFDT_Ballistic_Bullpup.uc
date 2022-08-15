//=============================================================================
// KFDT_Ballistic_Bullpup
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 10/30/2013
//=============================================================================

class KFDT_Ballistic_Bullpup extends KFDT_Ballistic_AssaultRifle
	abstract
	hidedropdown;

`include(KFGame\KFMatchStats.uci);

defaultproperties
{
    KDamageImpulse=900
	KDeathUpKick=-300
	KDeathVel=100
	
	StumblePower=37
	LegStumblePower=37
	GunHitPower=25

	AARWeaponID=`AAR_Bullpup

	//Perk
	ModifierPerkList(0)=class'KFPerk_Commando'
}
