//=============================================================================
// KFDT_Ballistic_AK12
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 10/30/2013
//=============================================================================

class KFDT_Ballistic_AK12 extends KFDT_Ballistic_AssaultRifle
	abstract
	hidedropdown;

`include(KFGame\KFMatchStats.uci);

/** Allows the damage type to customize exactly which hit zones it can dismember */
static simulated function bool CanDismemberHitZone( name InHitZoneName )
{
	if( super.CanDismemberHitZone( InHitZoneName ) )
	{
		return true;
	}

	switch ( InHitZoneName )
	{
		case 'lupperarm':
		case 'rupperarm':
	 		return true;
	}

	return false;
}

defaultproperties
{
	KDamageImpulse=1000
	KDeathUpKick=-200
	KDeathVel=135
	
	StumblePower=39
	LegStumblePower=39
	GunHitPower=25

	AARWeaponID=`AAR_Ak12

	//Perk
	ModifierPerkList(0)=class'KFPerk_Commando'
}
