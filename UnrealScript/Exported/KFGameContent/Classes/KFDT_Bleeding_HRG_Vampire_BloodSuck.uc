//=============================================================================
// KFDT_Bleeding_HRG_Vampire_BloodSuck
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2020 Tripwire Interactive LLC
//=============================================================================

class KFDT_Bleeding_HRG_Vampire_BloodSuck extends KFDT_Bleeding
	abstract;

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
   bStackDoT=True
   DoT_Duration=0.500000
   DoT_Interval=0.500000
   DoT_DamageScale=0.100000
   GunHitPower=5.000000
   BleedPower=50.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_FieldMedic'
   KDeathVel=350.000000
   KDeathUpKick=350.000000
   Name="Default__KFDT_Bleeding_HRG_Vampire_BloodSuck"
   ObjectArchetype=KFDT_Bleeding'KFGame.Default__KFDT_Bleeding'
}
