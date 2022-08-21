//=============================================================================
// KFDT_Piercing_KnifeStab_FieldMedic
//=============================================================================
// Stabbing damage type for Medic knife
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Piercing_KnifeStab_FieldMedic extends KFDT_Piercing_KnifeStab
	abstract
	hidedropdown;

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
	ModifierPerkList(0)=class'KFPerk_FieldMedic'
}