//=============================================================================
// KFDT_Ballistic_SMG_Medic
//=============================================================================
// Damage class for the medic SMG
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFDT_Ballistic_SMG_Medic extends KFDT_Ballistic_Submachinegun
	abstract
	hidedropdown;

`include(KFGame\KFMatchStats.uci);

/** Whether this damage type can apply damage over time */
static function bool CanApplyDamageOverTime( out int InDamage, out class<KFDamageType> KFDT, optional Controller InstigatedBy ) 
{
	return class'KFDT_Ballistic_Assault_Medic'.static.CheckMedicBleed(InDamage, KFDT, InstigatedBy);
}

/** Allows medic perk to add bleed damage to hit */
static function bool CheckMedicBleed( out int InDamage, out class<KFDamageType> KFDT,  optional Controller InstigatedBy ) 
{
	local KFPerk InstigatorPerk;

	InstigatorPerk = KFPlayerController(InstigatedBy).GetPerk();
	if( InstigatorPerk == none || !InstigatorPerk.IsBleedDmgActive() )
	{
		return false;
	}	

	InstigatorPerk.ModifyBleedDmg( InDamage );
	KFDT = InstigatorPerk.GetBleedDmgTypeClass();

	return true;
}

defaultproperties
{
    KDamageImpulse=900
	KDeathUpKick=-300
	KDeathVel=100

	StumblePower=10
	LegStumblePower=108
	GunHitPower=106

	AARWeaponID=`AAR_MedicSMG
}
