//=============================================================================
// KFDT_Piercing_ZweihanderStab
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Piercing_ZweihanderStab extends KFDT_Piercing
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_Zweihander'
   StumblePower=50.000000
   MeleeHitPower=100.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Berserker'
   KDamageImpulse=200.000000
   KDeathUpKick=250.000000
   Name="Default__KFDT_Piercing_ZweihanderStab"
   ObjectArchetype=KFDT_Piercing'KFGame.Default__KFDT_Piercing'
}
