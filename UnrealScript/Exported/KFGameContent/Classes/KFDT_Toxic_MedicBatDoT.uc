//=============================================================================
// KFDT_Toxic_MedicBatDoT
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

// Toxic Weapon with added Bludgeon functionality
class KFDT_Toxic_MedicBatDoT extends KFDT_Toxic
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_MedicBat'
   DoT_Duration=5.000000
   DoT_DamageScale=0.200000
   PoisonPower=5.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_FieldMedic'
   Name="Default__KFDT_Toxic_MedicBatDoT"
   ObjectArchetype=KFDT_Toxic'KFGame.Default__KFDT_Toxic'
}
