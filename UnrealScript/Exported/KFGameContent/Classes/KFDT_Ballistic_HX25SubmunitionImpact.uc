//=============================================================================
// KFDT_Ballistic_HX25SubmunitionImpact
//=============================================================================
// Submunition impact damage type for the HX25 Grenade pistol
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibso
//=============================================================================

class KFDT_Ballistic_HX25SubmunitionImpact extends KFDT_Ballistic_Shotgun
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
   WeaponDef=Class'KFGame.KFWeapDef_HX25'
   StumblePower=36
   LegStumblePower=36
   GunHitPower=30
   EffectGroup=FXG_UnexplodedGrenade
   ModifierPerkList(0)=Class'KFGame.KFPerk_Demolitionist'
   BloodSpread=0.400000
   BloodScale=0.600000
   KDamageImpulse=350.000000
   KDeathVel=10.000000
   KDeathUpKick=120.000000
   Name="Default__KFDT_Ballistic_HX25SubmunitionImpact"
   ObjectArchetype=KFDT_Ballistic_Shotgun'kfgamecontent.Default__KFDT_Ballistic_Shotgun'
}
