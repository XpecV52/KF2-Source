//=============================================================================
// KFDT_Toxic_MineReconstructorImpact
//=============================================================================
// Toxic damage type for the Mine reconstructor direct hit
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
// fferrando@saber3d
//=============================================================================

class KFDT_Toxic_MineReconstructorImpact extends KFDT_Ballistic_Shell
    abstract
    hidedropdown;




static simulated function bool CanDismemberHitZone( name InHitZoneName )
{
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

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_Mine_Reconstructor'
   bHasToSpawnMicrowaveFire=False
   EffectGroup=FXG_Toxic
   KnockdownPower=12.000000
   StumblePower=150.000000
   GunHitPower=100.000000
   PoisonPower=25.000000
   MicrowavePower=18.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_FieldMedic'
   Name="Default__KFDT_Toxic_MineReconstructorImpact"
   ObjectArchetype=KFDT_Ballistic_Shell'KFGame.Default__KFDT_Ballistic_Shell'
}
