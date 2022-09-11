//=============================================================================
// KFDT_Ballistic_Minigun
//=============================================================================
// Container class for the Minigun damage types
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Ballistic_Minigun extends KFDT_Ballistic
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_Minigun'
   GoreDamageGroup=DGT_AssaultRifle
   StumblePower=10.000000
   LegStumblePower=20.000000
   GunHitPower=10.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Commando'
   Name="Default__KFDT_Ballistic_Minigun"
   ObjectArchetype=KFDT_Ballistic'KFGame.Default__KFDT_Ballistic'
}