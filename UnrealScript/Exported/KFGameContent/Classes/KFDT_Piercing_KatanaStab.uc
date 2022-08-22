//=============================================================================
// KFDT_Piercing_KatanaStab
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Piercing_KatanaStab extends KFDT_Piercing
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_Katana'
   MeleeHitPower=100.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Berserker'
   KDamageImpulse=200.000000
   KDeathUpKick=250.000000
   Name="Default__KFDT_Piercing_KatanaStab"
   ObjectArchetype=KFDT_Piercing'KFGame.Default__KFDT_Piercing'
}
