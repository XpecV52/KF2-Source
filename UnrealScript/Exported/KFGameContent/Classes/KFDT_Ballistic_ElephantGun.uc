//=============================================================================
// KFDT_Ballistic_ElephantGun
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================

class KFDT_Ballistic_ElephantGun extends KFDT_Ballistic_Shotgun
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
   WeaponDef=Class'KFGame.KFWeapDef_ElephantGun'
   StumblePower=55.000000
   GunHitPower=75.000000
   GibImpulseScale=1.000000
   BloodSpread=0.400000
   BloodScale=0.600000
   KDamageImpulse=3500.000000
   KDeathVel=650.000000
   KDeathUpKick=800.000000
   Name="Default__KFDT_Ballistic_ElephantGun"
   ObjectArchetype=KFDT_Ballistic_Shotgun'kfgamecontent.Default__KFDT_Ballistic_Shotgun'
}
