//=============================================================================
// KFDT_EMP_ArcGenerator_Beam
//=============================================================================
// Damage caused by the HRG_ArcGenerator gun primary fire
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Fernando Ferrando @ saber3d
//=============================================================================

class KFDT_EMP_ArcGenerator_Beam extends KFDT_EMP
	abstract;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_HRG_EMP_ArcGenerator'
   EffectGroup=FXG_Electricity
   StumblePower=30.000000
   GunHitPower=5.000000
   EMPPower=8.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Survivalist'
   KDamageImpulse=2000.000000
   KDeathVel=349.000000
   KDeathUpKick=750.000000
   RadialDamageImpulse=750.000000
   Name="Default__KFDT_EMP_ArcGenerator_Beam"
   ObjectArchetype=KFDT_EMP'KFGame.Default__KFDT_EMP'
}
