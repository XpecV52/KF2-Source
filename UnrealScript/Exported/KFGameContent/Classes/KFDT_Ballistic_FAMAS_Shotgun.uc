//=============================================================================
// KFDT_Ballistic_FAMAS_Shotgun
//=============================================================================
// Damage type class for the FAMAS shotgun alt fire
//=============================================================================
// Killing Floor 2
// Copyright (C) 2021 Tripwire Interactive LLC
//=============================================================================

class KFDT_Ballistic_FAMAS_Shotgun extends KFDT_Ballistic_Shotgun
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
		case 'chest':
		case 'heart':
	 		return true;
	}

	return false;
}

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_FAMAS'
   StumblePower=10.000000
   GunHitPower=15.000000
   BloodSpread=0.400000
   BloodScale=0.600000
   KDamageImpulse=900.000000
   KDeathVel=350.000000
   KDeathUpKick=500.000000
   Name="Default__KFDT_Ballistic_FAMAS_Shotgun"
   ObjectArchetype=KFDT_Ballistic_Shotgun'kfgamecontent.Default__KFDT_Ballistic_Shotgun'
}
