//=============================================================================
// KFDT_Slashing_IonThrusterSpecial
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

class KFDT_Slashing_IonThrusterSpecial extends KFDT_Slashing_IonThruster
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
   KnockdownPower=500.000000
   StumblePower=500.000000
   MeleeHitPower=500.000000
   BurnPower=150.000000
   KDamageImpulse=5000.000000
   KDeathVel=3750.000000
   KDeathUpKick=2000.000000
   Name="Default__KFDT_Slashing_IonThrusterSpecial"
   ObjectArchetype=KFDT_Slashing_IonThruster'kfgamecontent.Default__KFDT_Slashing_IonThruster'
}
