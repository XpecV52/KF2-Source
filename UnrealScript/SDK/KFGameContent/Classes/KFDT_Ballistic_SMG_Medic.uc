//=============================================================================
// KFDT_Ballistic_SMG_Medic
//=============================================================================
// Damage class for the medic SMG
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFDT_Ballistic_SMG_Medic extends KFDT_Ballistic_Submachinegun
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
    KDamageImpulse=900
	KDeathUpKick=-300
	KDeathVel=100

	StumblePower=0
	GunHitPower=45

	WeaponDef=class'KFWeapDef_MedicSMG'

    ModifierPerkList(0)=class'KFPerk_Swat'
}
