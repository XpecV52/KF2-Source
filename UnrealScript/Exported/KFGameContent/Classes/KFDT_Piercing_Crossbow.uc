//=============================================================================
// KFDT_Piercing_Crossbow
//=============================================================================
// Damage type for crossbow
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Piercing_Crossbow extends KFDT_Piercing
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_Crossbow'
   StunPower=90.000000
   KnockdownPower=20.000000
   StumblePower=250.000000
   GunHitPower=100.000000
   MeleeHitPower=40.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Sharpshooter'
   KDamageImpulse=1500.000000
   KDeathVel=150.000000
   KDeathUpKick=250.000000
   Name="Default__KFDT_Piercing_Crossbow"
   ObjectArchetype=KFDT_Piercing'KFGame.Default__KFDT_Piercing'
}
