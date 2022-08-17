//=============================================================================
// KFDT_Ballistic_DBShotgun
//=============================================================================
// Ballistic damage with light impact energy, but stronger hit reactions
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFDT_Ballistic_DBShotgun extends KFDT_Ballistic_Shotgun
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
   WeaponDef=Class'KFGame.KFWeapDef_DoubleBarrel'
   StumblePower=42
   LegStumblePower=42
   BloodSpread=0.400000
   BloodScale=0.600000
   KDamageImpulse=600.000000
   KDeathVel=20.000000
   KDeathUpKick=350.000000
   Name="Default__KFDT_Ballistic_DBShotgun"
   ObjectArchetype=KFDT_Ballistic_Shotgun'kfgamecontent.Default__KFDT_Ballistic_Shotgun'
}
