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






































	















#linenumber 15;

/** Allows the damage type to customize exactly which hit zones it can dismember */
static function bool CanApplyDamageOverTime( out int InDamage, out class<KFDamageType> KFDT, optional Controller InstigatedBy ) 
{
	return class'KFDT_Ballistic_Assault_Medic'.static.CheckMedicBleed(InDamage, KFDT, InstigatedBy);
}

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_MedicPistol'
   LegStumblePower=105
   GunHitPower=103
   ModifierPerkList(0)=Class'KFGame.KFPerk_FieldMedic'
   KDamageImpulse=900.000000
   KDeathVel=100.000000
   KDeathUpKick=-300.000000
   Name="Default__KFDT_Ballistic_Pistol_Medic"
   ObjectArchetype=KFDT_Ballistic_Handgun'kfgamecontent.Default__KFDT_Ballistic_Handgun'
}
