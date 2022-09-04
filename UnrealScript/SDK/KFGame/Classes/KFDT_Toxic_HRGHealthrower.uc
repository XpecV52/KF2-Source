//=============================================================================
// KFDT_Toxic_HRGHealthrower
//=============================================================================
// HRG Healthrower gas damage type
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

class KFDT_Toxic_HRGHealthrower extends KFDT_Toxic
	abstract;

defaultproperties
{

	//DoT
	DoT_Duration=2
	DoT_Interval=0.5
	DoT_DamageScale=0.8

	//Afflictions
	PoisonPower=15
	StumblePower=20

	bNoInstigatorDamage=true

	WeaponDef=class'KFWeapDef_Healthrower_HRG'

	ModifierPerkList(0)=class'KFPerk_FieldMedic'
}
