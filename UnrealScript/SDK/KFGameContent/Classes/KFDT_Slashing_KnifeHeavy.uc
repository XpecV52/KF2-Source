 //=============================================================================
// KFDT_Slashing_KnifeHeavy
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 4/14/2014
//=============================================================================

class KFDT_Slashing_KnifeHeavy extends KFDT_Slashing_Knife
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
 
 
 	KnockdownPower=21
	StunPower=31
 	StumblePower=45
	LegStumblePower=45
	MeleeHitPower=113
	
	
	KDamageImpulse=300
	KDeathUpKick=400
	WeaponDef=class'KFWeapDef_Knife_Base'
}
