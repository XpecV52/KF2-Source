//=============================================================================
// KFDT_Ballistic_MB500
//=============================================================================
// Ballistic damage with light impact energy, but stronger hit reactions
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Ballistic_MB500 extends KFDT_Ballistic_Shotgun
	abstract
	hidedropdown;
































































































	















#linenumber 14;

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
   AARWeaponID=36
   StumblePower=33
   LegStumblePower=33
   BloodSpread=0.400000
   BloodScale=0.600000
   KDamageImpulse=350.000000
   KDeathVel=10.000000
   KDeathUpKick=120.000000
   Name="Default__KFDT_Ballistic_MB500"
   ObjectArchetype=KFDT_Ballistic_Shotgun'KFGameContent.Default__KFDT_Ballistic_Shotgun'
}
