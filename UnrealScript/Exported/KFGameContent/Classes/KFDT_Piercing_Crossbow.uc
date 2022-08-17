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
   StunPower=70
   StumblePower=10
   LegStumblePower=15
   GunHitPower=30
   MeleeHitPower=25
   ModifierPerkList(0)=None
   KDamageImpulse=1500.000000
   KDeathVel=150.000000
   KDeathUpKick=250.000000
   Name="Default__KFDT_Piercing_Crossbow"
   ObjectArchetype=KFDT_Piercing'KFGame.Default__KFDT_Piercing'
}
