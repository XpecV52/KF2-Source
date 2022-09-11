//=============================================================================
// KFDT_EMP_ArcGeneratorSphereImpact
//=============================================================================
// EMP Damage for KFDT_EMP_ArcGenerator_Beam direct hit
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
// fferrando@saber3d
//=============================================================================

class KFDT_EMP_ArcGeneratorSphereImpact extends KFDT_EMP
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_HRG_EMP_ArcGenerator'
   EffectGroup=FXG_Electricity
   StumblePower=300.000000
   GunHitPower=150.000000
   EMPPower=50.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Survivalist'
   KDamageImpulse=900.000000
   KDeathVel=100.000000
   KDeathUpKick=-300.000000
   Name="Default__KFDT_EMP_ArcGeneratorSphereImpact"
   ObjectArchetype=KFDT_EMP'KFGame.Default__KFDT_EMP'
}
