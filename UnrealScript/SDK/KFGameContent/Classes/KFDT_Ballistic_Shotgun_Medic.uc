//=============================================================================
// KFDT_Ballistic_Shotgun_Medic
//=============================================================================
// Ballistic damage with light impact energy, but stronger hit reactions
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Ballistic_Shotgun_Medic extends KFDT_Ballistic_Shotgun
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

/** Whether this damage type can apply damage over time */
static function bool CanApplyDamageOverTime( out int InDamage, out class<KFDamageType> KFDT, optional Controller InstigatedBy ) 
{
	return class'KFDT_Ballistic_Assault_Medic'.static.CheckMedicToxic( InDamage, KFDT, InstigatedBy );
}


defaultproperties
{
	BloodSpread=0.4
	BloodScale=0.6

	KDamageImpulse=550
	KDeathUpKick=120
	KDeathVel=35

    KnockdownPower=0
	StumblePower=13
	GunHitPower=45

	WeaponDef=class'KFWeapDef_MedicShotgun'

	//Perk
	ModifierPerkList(0)=class'KFPerk_FieldMedic'
}
