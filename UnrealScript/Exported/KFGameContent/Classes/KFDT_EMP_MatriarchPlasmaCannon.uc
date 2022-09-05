//=============================================================================
// KFDT_EMP_MatriarchPlasmaCannon
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================
class KFDT_EMP_MatriarchPlasmaCannon extends KFDT_Fire
	abstract
	hidedropdown;

defaultproperties
{
   bAllowAIDoorDestruction=True
   DoT_Duration=0.000000
   DoT_Interval=0.000000
   DoT_DamageScale=0.000000
   BurnPower=11.000000
   DeathMaterialEffectParamName="Scalar_Burnt"
   DeathMaterialEffectDuration=2.000000
   KDeathVel=300.000000
   KDeathUpKick=500.000000
   RadialDamageImpulse=2000.000000
   Name="Default__KFDT_EMP_MatriarchPlasmaCannon"
   ObjectArchetype=KFDT_Fire'KFGame.Default__KFDT_Fire'
}
