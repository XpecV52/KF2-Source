//=============================================================================
// KFDT_Ballistic_M79Impact
//=============================================================================
// Shell impact damage type for the M79 Grenade launcher
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFDT_Ballistic_M79Impact extends KFDT_Ballistic
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
	KDamageImpulse=2000
	KDeathUpKick=750
	KDeathVel=350
	
	GoreDamageGroup=DGT_Handgun
	EffectGroup=FXG_UnexplodedGrenade

	KnockdownPower=45
	StumblePower=42
	LegStumblePower=42
	GunHitPower=129

	//Perk
	ModifierPerkList(0)=class'KFPerk_Demolitionist'
	
	AARWeaponID=`AAR_M79
}
