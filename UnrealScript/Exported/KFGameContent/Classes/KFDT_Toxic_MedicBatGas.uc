//=============================================================================
// KFDT_Toxic_MedicBatGas
//=============================================================================
// Medic Gas Explosion Damage Type
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

class KFDT_Toxic_MedicBatGas extends KFDT_Toxic
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_MedicBat'
   bNoInstigatorDamage=True
   DoT_Duration=5.000000
   DoT_DamageScale=0.400000
   StumblePower=300.000000
   MeleeHitPower=100.000000
   PoisonPower=300.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_FieldMedic'
   ModifierPerkList(1)=Class'KFGame.KFPerk_Berserker'
   Name="Default__KFDT_Toxic_MedicBatGas"
   ObjectArchetype=KFDT_Toxic'KFGame.Default__KFDT_Toxic'
}
