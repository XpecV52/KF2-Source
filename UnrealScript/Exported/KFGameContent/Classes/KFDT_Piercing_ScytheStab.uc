//=============================================================================
// KFDT_Piercing_ScytheStab
//=============================================================================
// Killing Floor 2
// Copyright (C) 2022 Tripwire Interactive LLC
//=============================================================================

class KFDT_Piercing_ScytheStab extends KFDT_Piercing
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_Scythe'
   StumblePower=50.000000
   MeleeHitPower=100.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Berserker'
   KDamageImpulse=200.000000
   KDeathUpKick=250.000000
   Name="Default__KFDT_Piercing_ScytheStab"
   ObjectArchetype=KFDT_Piercing'KFGame.Default__KFDT_Piercing'
}
