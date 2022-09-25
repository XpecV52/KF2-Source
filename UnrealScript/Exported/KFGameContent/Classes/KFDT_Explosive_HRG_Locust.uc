//=============================================================================
// KFDT_Explosive_HRG_Locust
//=============================================================================
// Explosive damage type for the HRG Locust
//=============================================================================
// Killing Floor 2
// Copyright (C) 2022 Tripwire Interactive LLC
//=============================================================================
class KFDT_Explosive_HRG_Locust extends KFDT_Explosive
	abstract
	hidedropdown;

// Damage type to use for the damage over time effect
var class<KFDamageType> DoTDamageType;

/** Called when damage is dealt to apply additional damage type (e.g. Damage Over Time) */
static function ApplySecondaryDamage(KFPawn Victim, int DamageTaken, optional Controller InstigatedBy)
{
    if (Victim.Controller == InstigatedBy)
	{
        return;
	}

	if (default.DoTDamageType.default.DoT_Type != DOT_None)
	{
		Victim.ApplyDamageOverTime(DamageTaken, InstigatedBy, default.DoTDamageType);
	}
}

defaultproperties
{
   DoTDamageType=Class'KFGame.KFDT_Toxic_HRG_Locust'
   WeaponDef=Class'KFGame.KFWeapDef_HRG_Locust'
   bCanPlayDeadHitEffects=False
   ModifierPerkList(0)=Class'KFGame.KFPerk_Survivalist'
   bCausesFracture=False
   Name="Default__KFDT_Explosive_HRG_Locust"
   ObjectArchetype=KFDT_Explosive'KFGame.Default__KFDT_Explosive'
}
