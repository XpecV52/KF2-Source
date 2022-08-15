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
































































































	















#linenumber 15;

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
   AARWeaponID=22
   StumblePower=10
   LegStumblePower=108
   GunHitPower=106
   KDamageImpulse=900.000000
   KDeathVel=100.000000
   KDeathUpKick=-300.000000
   Name="Default__KFDT_Ballistic_SMG_Medic"
   ObjectArchetype=KFDT_Ballistic_Submachinegun'KFGameContent.Default__KFDT_Ballistic_Submachinegun'
}
