//=============================================================================
// KFDT_Piercing_MosinNagant
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

class KFDT_Piercing_MosinNagant extends KFDT_Piercing
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_MosinNagant'
   MeleeHitPower=150.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Sharpshooter'
   KDeathUpKick=300.000000
   Name="Default__KFDT_Piercing_MosinNagant"
   ObjectArchetype=KFDT_Piercing'KFGame.Default__KFDT_Piercing'
}
