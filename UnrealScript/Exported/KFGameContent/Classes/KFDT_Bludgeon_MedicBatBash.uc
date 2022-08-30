//=============================================================================
// KFDT_Bludgeon_MedicBatBash
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

// Toxic Weapon with added Bludgeon functionality
class KFDT_Bludgeon_MedicBatBash extends KFDT_Bludgeon
	abstract
	hidedropdown;

// Damage type to use for the damage over time effect
var class<KFDamageType> DoTDamageType;

/** Called when damage is dealt to apply additional damage type (e.g. Damage Over Time) */
static function ApplySecondaryDamage(KFPawn Victim, int DamageTaken, optional Controller InstigatedBy)
{
	if (default.DoTDamageType.default.DoT_Type != DOT_None)
	{
		Victim.ApplyDamageOverTime(DamageTaken, InstigatedBy, default.DoTDamageType);
	}
}

defaultproperties
{
   DoTDamageType=Class'kfgamecontent.KFDT_Toxic_MedicBatDoT'
   WeaponDef=Class'KFGame.KFWeapDef_MedicBat'
   bNoFriendlyFire=True
   StumblePower=200.000000
   MeleeHitPower=100.000000
   PoisonPower=10.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_FieldMedic'
   ModifierPerkList(1)=Class'KFGame.KFPerk_Berserker'
   KDamageImpulse=1600.000000
   KDeathVel=500.000000
   Name="Default__KFDT_Bludgeon_MedicBatBash"
   ObjectArchetype=KFDT_Bludgeon'KFGame.Default__KFDT_Bludgeon'
}
