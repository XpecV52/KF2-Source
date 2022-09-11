//=============================================================================
// KFDT_Piercing_HRG_Vampire_CrystalSpike
//=============================================================================
// Damage type for crystal spike (alternate fire) of HRG Vampire
//=============================================================================
// Killing Floor 2
// Copyright (C) 2020 Tripwire Interactive LLC
//=============================================================================

class KFDT_Piercing_HRG_Vampire_CrystalSpike extends KFDT_Piercing
	abstract
	hidedropdown;

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

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_HRG_Vampire'
   StumblePower=250.000000
   GunHitPower=100.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_FieldMedic'
   KDamageImpulse=1500.000000
   KDeathVel=150.000000
   KDeathUpKick=250.000000
   Name="Default__KFDT_Piercing_HRG_Vampire_CrystalSpike"
   ObjectArchetype=KFDT_Piercing'KFGame.Default__KFDT_Piercing'
}
