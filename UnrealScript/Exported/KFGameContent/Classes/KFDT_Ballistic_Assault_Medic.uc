//=============================================================================
// KFDT_Ballistic_Assault_Medic
//=============================================================================
// Damage type for the Medic Assault Rifle Bullets
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  John "Ramm-Jaeger" Gibson
//=============================================================================

class KFDT_Ballistic_Assault_Medic extends KFDT_Ballistic_AssaultRifle
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
	 		return true;
	}

	return false;
}

/** Whether this damage type can apply damage over time */
static function bool CanApplyDamageOverTime( out int InDamage, out class<KFDamageType> KFDT, optional Controller InstigatedBy ) 
{
	return class'KFDT_Ballistic_Assault_Medic'.static.CheckMedicToxic( InDamage, KFDT, InstigatedBy );
}

/** Allows medic perk to add poison damage */
static function bool CheckMedicToxic( out int InDamage, out class<KFDamageType> KFDT,  optional Controller InstigatedBy ) 
{
	local KFPerk InstigatorPerk;

	InstigatorPerk = KFPlayerController(InstigatedBy).GetPerk();
	if( InstigatorPerk == none || (!InstigatorPerk.IsToxicDmgActive() && !InstigatorPerk.IsSlugActive()) )
	{
		return false;
	}	

	InstigatorPerk.ModifyToxicDmg( InDamage );
	KFDT = InstigatorPerk.GetToxicDmgTypeClass();

	return true;
}

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_MedicRifle'
   StumblePower=25.000000
   GunHitPower=45.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_FieldMedic'
   KDamageImpulse=1000.000000
   KDeathVel=135.000000
   KDeathUpKick=-200.000000
   Name="Default__KFDT_Ballistic_Assault_Medic"
   ObjectArchetype=KFDT_Ballistic_AssaultRifle'kfgamecontent.Default__KFDT_Ballistic_AssaultRifle'
}
