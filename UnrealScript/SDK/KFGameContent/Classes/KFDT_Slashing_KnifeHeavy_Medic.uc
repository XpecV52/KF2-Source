//=============================================================================
// KFDT_Slashing_KnifeHeavy_Medic
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider 1/8/2015
//=============================================================================

class KFDT_Slashing_KnifeHeavy_Medic extends KFDT_Slashing_KnifeHeavy
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

	MeleeHitPower=113
	WeaponDef=class'KFWeapDef_Knife_Medic'
}
