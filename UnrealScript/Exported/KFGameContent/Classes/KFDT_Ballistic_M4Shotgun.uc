//=============================================================================
// KFDT_Ballistic_M4Shotgun
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 4/9/2014
//=============================================================================

class KFDT_Ballistic_M4Shotgun extends KFDT_Ballistic_Shotgun
	abstract
	hidedropdown;

































































































	















#linenumber 15;

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
		case 'chest':
		case 'heart':
	 		return true;
	}

	return false;
}

defaultproperties
{
   AARWeaponID=38
   StumblePower=42
   LegStumblePower=42
   BloodSpread=0.400000
   BloodScale=0.600000
   KDamageImpulse=350.000000
   KDeathVel=10.000000
   KDeathUpKick=120.000000
   Name="Default__KFDT_Ballistic_M4Shotgun"
   ObjectArchetype=KFDT_Ballistic_Shotgun'KFGameContent.Default__KFDT_Ballistic_Shotgun'
}
