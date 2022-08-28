//=============================================================================
// KFDT_Slashing_ZweihanderHeavy
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Slashing_ZweihanderHeavy extends KFDT_Slashing_Katana
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
   WeaponDef=Class'KFGame.KFWeapDef_Zweihander'
   StumblePower=250.000000
   KDamageImpulse=1600.000000
   KDeathVel=500.000000
   KDeathUpKick=200.000000
   Name="Default__KFDT_Slashing_ZweihanderHeavy"
   ObjectArchetype=KFDT_Slashing_Katana'kfgamecontent.Default__KFDT_Slashing_Katana'
}
