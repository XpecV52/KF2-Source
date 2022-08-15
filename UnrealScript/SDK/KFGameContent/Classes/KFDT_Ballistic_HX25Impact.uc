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

`include(KFGame\KFMatchStats.uci);

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
	KDamageImpulse=1500
	KDeathUpKick=500
	KDeathVel=250
	
	GoreDamageGroup=DGT_Handgun
	EffectGroup=FXG_UnexplodedGrenade

	KnockdownPower=30
	StumblePower=36
	LegStumblePower=36
	GunHitPower=100

	//Perk
	ModifierPerkList(0)=class'KFPerk_Demolitionist'

	WeaponDef=class'KFWeapDef_Hx25'
}
