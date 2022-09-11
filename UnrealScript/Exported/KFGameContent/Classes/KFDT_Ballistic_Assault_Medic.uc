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

/** Called when damage is dealt to apply additional damage type (e.g. Damage Over Time) */
static function ApplySecondaryDamage( KFPawn Victim, int DamageTaken, optional Controller InstigatedBy )
{
    local class<KFDamageType> ToxicDT;

    ToxicDT = class'KFDT_Ballistic_Assault_Medic'.static.GetMedicToxicDmgType( DamageTaken, InstigatedBy );
    if ( ToxicDT != None )
    {
        Victim.ApplyDamageOverTime(DamageTaken, InstigatedBy, ToxicDT);
    }
}

/**
 * Allows medic perk to add poison damage 
 * @return: None if toxic skill is not available
 */
static function class<KFDamageType> GetMedicToxicDmgType( out int out_Damage, optional Controller InstigatedBy ) 
{
	local KFPerk InstigatorPerk;

	InstigatorPerk = KFPlayerController(InstigatedBy).GetPerk();
	if( InstigatorPerk == none || (!InstigatorPerk.IsToxicDmgActive() && !InstigatorPerk.IsZedativeActive()) )
	{
		return None;
	}	

	InstigatorPerk.ModifyToxicDmg( out_Damage );
	return InstigatorPerk.GetToxicDmgTypeClass();
}

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_MedicRifle'
   StumblePower=25.000000
   GunHitPower=45.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_FieldMedic'
   ModifierPerkList(1)=Class'KFGame.KFPerk_Commando'
   KDamageImpulse=1000.000000
   KDeathVel=135.000000
   KDeathUpKick=-200.000000
   Name="Default__KFDT_Ballistic_Assault_Medic"
   ObjectArchetype=KFDT_Ballistic_AssaultRifle'kfgamecontent.Default__KFDT_Ballistic_AssaultRifle'
}
