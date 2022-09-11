//=============================================================================
// KFDT_EMP_ArcGenerator_AltFiremodeZapDamage
//=============================================================================
// EMP Damage for KFDT_EMP_ArcGeneratorSphereImpact zap
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
// fferrando@saber3d
//=============================================================================

class KFDT_EMP_ArcGenerator_AltFiremodeZapDamage extends KFDT_EMP
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_HRG_EMP_ArcGenerator'
   EffectGroup=FXG_Electricity
   GunHitPower=5.000000
   EMPPower=8.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Survivalist'
   KDamageImpulse=900.000000
   KDeathVel=100.000000
   KDeathUpKick=-300.000000
   Name="Default__KFDT_EMP_ArcGenerator_AltFiremodeZapDamage"
   ObjectArchetype=KFDT_EMP'KFGame.Default__KFDT_EMP'
}
