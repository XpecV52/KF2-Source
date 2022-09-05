//=============================================================================
// KFDT_Piercing_CompoundBow
//=============================================================================
// Damage type for the compound bow melee knife attack
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//	- Tulio Beloqui (Saber Interactive)
//=============================================================================

class KFDT_Pirecing_CompoundBow extends KFDT_Piercing
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_CompoundBow'
   StumblePower=200.000000
   MeleeHitPower=100.000000
   Name="Default__KFDT_Pirecing_CompoundBow"
   ObjectArchetype=KFDT_Piercing'KFGame.Default__KFDT_Piercing'
}
