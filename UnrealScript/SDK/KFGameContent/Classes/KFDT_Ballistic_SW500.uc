//=============================================================================
// KFDT_Ballistic_SW500
//=============================================================================
// SW500 revolver damage type
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Jeff Robinson
//=============================================================================

class KFDT_Ballistic_SW500 extends KFDT_Ballistic_Handgun
	abstract
	hidedropdown;

`include(KFGame\KFMatchStats.uci);

/** Allows the damage type to customize exactly which hit zones it can dismember */
static simulated function bool CanDismemberHitZone( name InHitZoneName )
{
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
	GoreDamageGroup=DGT_Shotgun

	KDamageImpulse=4500
	KDeathUpKick=-700
	KDeathVel=350

   	KnockdownPower=50 
	StumblePower=60
	LegStumblePower=60
	GunHitPower=35

	WeaponDef=class'KFWeapDef_SW500'
	ModifierPerkList(0)=class'KFPerk_Gunslinger'
}
