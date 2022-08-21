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
   StumblePower=50.000000
   KDamageImpulse=300.000000
   KDeathUpKick=400.000000
   Name="Default__KFDT_Slashing_KnifeHeavy"
   ObjectArchetype=KFDT_Slashing_Knife'kfgamecontent.Default__KFDT_Slashing_Knife'
}
