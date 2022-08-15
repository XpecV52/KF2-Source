//=============================================================================
// KFDT_Fire_HuskFireball
//=============================================================================
// A damage type for KFProj_Husk_Fireball
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Sakib Saikia 11/20/2014
//=============================================================================

class KFDT_Fire_HuskFireball extends KFDT_Fire
	abstract
	hidedropdown;

defaultproperties
{
   StumblePower=150
   DoT_DamageScale=0.200000
   DeathMaterialEffectParamName="Scalar_Burnt"
   DeathMaterialEffectDuration=2.000000
   bExtraMomentumZ=True
   KDamageImpulse=250.000000
   KDeathVel=350.000000
   KDeathUpKick=250.000000
   RadialDamageImpulse=1500.000000
   Name="Default__KFDT_Fire_HuskFireball"
   ObjectArchetype=KFDT_Fire'KFGame.Default__KFDT_Fire'
}
