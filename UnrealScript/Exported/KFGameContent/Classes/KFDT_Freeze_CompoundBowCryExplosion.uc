//=============================================================================
// KFDT_Ice_CompoundBowCryExplosion
//=============================================================================
// Damage type for the cryo arrow explosion of the Compound Bow.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//	- Tulio Beloqui (Saber Interactive)
//=============================================================================

class KFDT_Freeze_CompoundBowCryExplosion extends KFDT_Freeze;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_CompoundBow'
   FreezePower=100.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Sharpshooter'
   KDamageImpulse=1500.000000
   KDeathVel=150.000000
   KDeathUpKick=250.000000
   Name="Default__KFDT_Freeze_CompoundBowCryExplosion"
   ObjectArchetype=KFDT_Freeze'KFGame.Default__KFDT_Freeze'
}
