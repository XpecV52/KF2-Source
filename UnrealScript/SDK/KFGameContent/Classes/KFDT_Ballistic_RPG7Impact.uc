//=============================================================================
// KFDT_Ballistic_RPG7Impact
//=============================================================================
// Rocket impact damage type for the RPG-7 rocket launcher
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFDT_Ballistic_RPG7Impact extends KFDT_Ballistic
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
	KDamageImpulse=3000
	KDeathUpKick=1000
	KDeathVel=500
	
	GoreDamageGroup=DGT_Handgun
	EffectGroup=FXG_UnexplodedGrenade

	KnockdownPower=55
	StumblePower=48
	LegStumblePower=48
	GunHitPower=129

	//Perk
	ModifierPerkList(0)=class'KFPerk_Demolitionist'
	AARWeaponID=`AAR_RPG7
}
