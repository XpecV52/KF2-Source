//=============================================================================
// KFDT_Ballistic_AF2011
//=============================================================================
// Pistol damage type for the AF2011 pistol
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================

class KFDT_Ballistic_AF2011 extends KFDT_Ballistic_Handgun
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
   WeaponDef=Class'KFGame.KFWeapDef_AF2011'
   KnockdownPower=15.000000
   StumblePower=20.000000
   GunHitPower=100.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Gunslinger'
   KDamageImpulse=1500.000000
   KDeathVel=200.000000
   KDeathUpKick=-450.000000
   Name="Default__KFDT_Ballistic_AF2011"
   ObjectArchetype=KFDT_Ballistic_Handgun'kfgamecontent.Default__KFDT_Ballistic_Handgun'
}
