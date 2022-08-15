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
































































































	















#linenumber 15;

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
   AARWeaponID=24
   StumblePower=20
   LegStumblePower=117
   GunHitPower=116
   ModifierPerkList(0)=Class'KFGame.KFPerk_FieldMedic'
   KDamageImpulse=1000.000000
   KDeathVel=135.000000
   KDeathUpKick=-200.000000
   Name="Default__KFDT_Ballistic_Assault_Medic"
   ObjectArchetype=KFDT_Ballistic_AssaultRifle'KFGameContent.Default__KFDT_Ballistic_AssaultRifle'
}
