//=============================================================================
// KFDT_Toxic_ZedativeCloud
//=============================================================================
// Toxic Cloud DamageType
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Toxic_ZedativeCloud extends KFDT_Toxic
	abstract
	hidedropdown;

defaultproperties
{
   DoT_Duration=1.000000
   PoisonPower=60.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_FieldMedic'
   Name="Default__KFDT_Toxic_ZedativeCloud"
   ObjectArchetype=KFDT_Toxic'KFGame.Default__KFDT_Toxic'
}
