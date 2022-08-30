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

	//DoT
	DoT_Duration=5.0
	DoT_Interval=1.0
	DoT_DamageScale=0.4

	//Afflictions
	PoisonPower=300
	StumblePower=300
	MeleeHitPower=100

	bNoInstigatorDamage=true

	WeaponDef=class'KFWeapDef_MedicBat'

	ModifierPerkList(0)=class'KFPerk_FieldMedic'
	ModifierPerkList(1)=class'KFPerk_Berserker'
}
