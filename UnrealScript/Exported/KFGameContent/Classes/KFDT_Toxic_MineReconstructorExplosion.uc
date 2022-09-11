//=============================================================================
// KFDT_Toxic_MedicGrenade
//=============================================================================
// Toxic Dart DamageType
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Greg Felber
//=============================================================================

class KFDT_Toxic_MineReconstructorExplosion extends KFDT_Toxic
	abstract
	hidedropdown;

/** Called when damage is dealt to apply additional damage type (e.g. Damage Over Time) */
static function ApplySecondaryDamage( KFPawn Victim, int DamageTaken, optional Controller InstigatedBy )
{	
	// Overriden to specific a different damage type 
    if ( class'KFDT_Mine_Reconstructor_BileExplosionDoT'.default.DoT_Type != DOT_None )
    {
        Victim.ApplyDamageOverTime(DamageTaken, InstigatedBy, class'KFDT_Mine_Reconstructor_BileExplosionDoT');
    }
}

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_Mine_Reconstructor'
   bHasToSpawnMicrowaveFire=False
   DoT_Duration=4.000000
   KnockdownPower=50.000000
   StumblePower=200.000000
   PoisonPower=60.000000
   MicrowavePower=50.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_FieldMedic'
   Name="Default__KFDT_Toxic_MineReconstructorExplosion"
   ObjectArchetype=KFDT_Toxic'KFGame.Default__KFDT_Toxic'
}
