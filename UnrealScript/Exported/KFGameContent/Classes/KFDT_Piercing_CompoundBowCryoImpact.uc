//=============================================================================
// KFDT_Piercing_CompoundBowCryoImpact
//=============================================================================
// Damage class for the compound bow cryo arrows impact
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//	- Tulio Beloqui (Saber Interactive)
//=============================================================================

class KFDT_Piercing_CompoundBowCryoImpact extends KFDT_Piercing
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_CompoundBow'
   GunHitPower=100.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Sharpshooter'
   KDamageImpulse=1500.000000
   KDeathVel=150.000000
   KDeathUpKick=250.000000
   Name="Default__KFDT_Piercing_CompoundBowCryoImpact"
   ObjectArchetype=KFDT_Piercing'KFGame.Default__KFDT_Piercing'
}
