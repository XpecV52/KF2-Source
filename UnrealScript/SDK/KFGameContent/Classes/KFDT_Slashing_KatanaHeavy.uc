//=============================================================================
// KFDT_Slashing_KatanaHeavy
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Slashing_KatanaHeavy extends KFDT_Slashing_Katana
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
	KDamageImpulse=300
	KDeathUpKick=400

	StumblePower=50
	LegStumblePower=50
	MeleeHitPower=55

	WeaponDef=class'KFWeapDef_Katana'
}
