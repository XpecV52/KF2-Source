//=============================================================================
// KFDT_Slashing_IonThrusterHeavy
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================

class KFDT_Slashing_IonThrusterHeavy extends KFDT_Slashing_IonThruster
	abstract;

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
   StumblePower=100.000000
   MeleeHitPower=125.000000
   BurnPower=50.000000
   KDamageImpulse=1600.000000
   KDeathVel=500.000000
   Name="Default__KFDT_Slashing_IonThrusterHeavy"
   ObjectArchetype=KFDT_Slashing_IonThruster'kfgamecontent.Default__KFDT_Slashing_IonThruster'
}
