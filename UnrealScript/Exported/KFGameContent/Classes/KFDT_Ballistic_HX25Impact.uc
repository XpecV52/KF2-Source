//=============================================================================
// KFDT_Ballistic_HX25Impact
//=============================================================================
// Shell impact damage type for the HX25 Grenade pistol
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFDT_Ballistic_HX25Impact extends KFDT_Ballistic
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
		case 'lthigh':
		case 'rthigh':
		case 'chest':
		case 'heart':
	 		return true;
	}
	return false;
}

defaultproperties
{
   AARWeaponID=15
   KnockdownPower=30
   StumblePower=36
   LegStumblePower=36
   GunHitPower=100
   EffectGroup=FXG_UnexplodedGrenade
   ModifierPerkList(0)=Class'KFGame.KFPerk_Demolitionist'
   KDamageImpulse=1500.000000
   KDeathVel=250.000000
   KDeathUpKick=500.000000
   Name="Default__KFDT_Ballistic_HX25Impact"
   ObjectArchetype=KFDT_Ballistic'KFGame.Default__KFDT_Ballistic'
}
