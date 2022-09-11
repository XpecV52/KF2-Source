//=============================================================================
// KFDT_Toxic_HRG_Vampire_BloodBall
//=============================================================================
// Toxic Cloud DamageType
//=============================================================================
// Killing Floor 2
// Copyright (C) 2020 Tripwire Interactive LLC
//=============================================================================

class KFDT_Toxic_HRG_Vampire_BloodBall extends KFDT_Toxic
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_HRG_Vampire'
   DoT_Duration=2.000000
   DoT_Interval=0.500000
   StumblePower=40.000000
   PoisonPower=16.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_FieldMedic'
   Name="Default__KFDT_Toxic_HRG_Vampire_BloodBall"
   ObjectArchetype=KFDT_Toxic'KFGame.Default__KFDT_Toxic'
}
