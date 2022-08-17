//=============================================================================
// KFDT_Ballistic_Deagle
//=============================================================================
// Pistol damage type for the desert eagle pistol
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFDT_Ballistic_Deagle extends KFDT_Ballistic_Handgun
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
   WeaponDef=Class'KFGame.KFWeapDef_Deagle'
   KnockdownPower=40
   StumblePower=45
   LegStumblePower=45
   GunHitPower=20
   ModifierPerkList(0)=Class'KFGame.KFPerk_Gunslinger'
   KDamageImpulse=2500.000000
   KDeathVel=250.000000
   KDeathUpKick=-500.000000
   Name="Default__KFDT_Ballistic_Deagle"
   ObjectArchetype=KFDT_Ballistic_Handgun'kfgamecontent.Default__KFDT_Ballistic_Handgun'
}
