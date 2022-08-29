//=============================================================================
// KFDT_Bludgeon_FireAxeBash
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================

class KFDT_Bludgeon_FireAxeBash extends KFDT_Bludgeon
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_FireAxe'
   StumblePower=150.000000
   MeleeHitPower=100.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Berserker'
   KDamageImpulse=1600.000000
   KDeathVel=500.000000
   Name="Default__KFDT_Bludgeon_FireAxeBash"
   ObjectArchetype=KFDT_Bludgeon'KFGame.Default__KFDT_Bludgeon'
}
