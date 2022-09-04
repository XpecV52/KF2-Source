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
   WeaponDef=Class'KFGame.KFWeapDef_Healthrower_HRG'
   bNoInstigatorDamage=True
   DoT_Duration=2.000000
   DoT_Interval=0.500000
   DoT_DamageScale=0.800000
   StumblePower=40.000000
   PoisonPower=15.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_FieldMedic'
   Name="Default__KFDT_Toxic_HRGHealthrower"
   ObjectArchetype=KFDT_Toxic'KFGame.Default__KFDT_Toxic'
}
