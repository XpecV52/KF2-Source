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
	return class'KFDT_Ballistic_Assault_Medic'.static.CheckMedicToxic( InDamage, KFDT, InstigatedBy );
}

defaultproperties
{
	ModifierPerkList(0)=class'KFPerk_FieldMedic'
}