//=============================================================================
// KFDT_Ballistic_Pistol_Medic
//=============================================================================
// Medic Pistol Damage Type
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFDT_Ballistic_Pistol_Medic extends KFDT_Ballistic_Handgun
	abstract
	hidedropdown;

`include(KFGame\KFMatchStats.uci);

/** Allows the damage type to customize exactly which hit zones it can dismember */
static function bool CanApplyDamageOverTime( out int InDamage, out class<KFDamageType> KFDT, optional Controller InstigatedBy ) 
{
	return class'KFDT_Ballistic_Assault_Medic'.static.CheckMedicBleed(InDamage, KFDT, InstigatedBy);
}

defaultproperties
{
	KDamageImpulse=900
	KDeathUpKick=-300
	KDeathVel=100

	StumblePower=10
	LegStumblePower=105
	GunHitPower=103

	AARWeaponID=`AAR_MedicPistol

	//Perk
	ModifierPerkList(0)=class'KFPerk_FieldMedic'
}
