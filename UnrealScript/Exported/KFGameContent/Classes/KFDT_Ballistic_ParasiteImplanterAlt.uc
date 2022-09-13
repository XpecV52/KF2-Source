//=============================================================================
// KFDT_Ballistic_ParasiteImplanterAlt
//=============================================================================
//=============================================================================
// Killing Floor 2
// Copyright (C) 2021 Tripwire Interactive LLC
//=============================================================================

class KFDT_Ballistic_ParasiteImplanterAlt extends KFDT_Toxic
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
   WeaponDef=Class'KFGame.KFWeapDef_ParasiteImplanter'
   KnockdownPower=30.000000
   StumblePower=200.000000
   GunHitPower=100.000000
   PoisonPower=0.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_FieldMedic'
   ModifierPerkList(1)=Class'KFGame.KFPerk_Sharpshooter'
   Name="Default__KFDT_Ballistic_ParasiteImplanterAlt"
   ObjectArchetype=KFDT_Toxic'KFGame.Default__KFDT_Toxic'
}
