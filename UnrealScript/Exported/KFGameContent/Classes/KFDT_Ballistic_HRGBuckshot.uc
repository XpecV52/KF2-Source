//=============================================================================
// KFDT_Ballistic_HRGBuckshot
//=============================================================================
// Ballistic damage with light impact energy, but stronger hit reactions
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

class KFDT_Ballistic_HRGBuckshot extends KFDT_Ballistic_Shotgun
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
   WeaponDef=Class'KFGame.KFWeapDef_SW500_HRG'
   StumblePower=15.000000
   GunHitPower=25.000000
   GibImpulseScale=1.000000
   BloodSpread=0.400000
   BloodScale=0.600000
   KDamageImpulse=1250.000000
   KDeathVel=300.000000
   KDeathUpKick=400.000000
   Name="Default__KFDT_Ballistic_HRGBuckshot"
   ObjectArchetype=KFDT_Ballistic_Shotgun'kfgamecontent.Default__KFDT_Ballistic_Shotgun'
}
