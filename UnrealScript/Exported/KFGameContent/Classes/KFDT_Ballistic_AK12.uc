//=============================================================================
// KFDT_Ballistic_AK12
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 10/30/2013
//=============================================================================

class KFDT_Ballistic_AK12 extends KFDT_Ballistic_AssaultRifle
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
	 		return true;
	}

	return false;
}

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_AK12'
   StumblePower=39
   LegStumblePower=39
   GunHitPower=25
   ModifierPerkList(0)=Class'KFGame.KFPerk_Commando'
   KDamageImpulse=1000.000000
   KDeathVel=135.000000
   KDeathUpKick=-200.000000
   Name="Default__KFDT_Ballistic_AK12"
   ObjectArchetype=KFDT_Ballistic_AssaultRifle'kfgamecontent.Default__KFDT_Ballistic_AssaultRifle'
}
