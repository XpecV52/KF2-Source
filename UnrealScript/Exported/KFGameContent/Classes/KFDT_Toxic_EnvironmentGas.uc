//=============================================================================
// KFDT_Toxic_EnvironmentGas
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================
class KFDT_Toxic_EnvironmentGas extends KFDT_Toxic
	abstract;

defaultproperties
{
   bNoInstigatorDamage=True
   bConsideredIndirectOrAoE=True
   DoT_Type=DOT_None
   PoisonPower=1.000000
   CameraLensEffectTemplate=Class'KFGame.KFCameraLensEmit_Puke_Light'
   Name="Default__KFDT_Toxic_EnvironmentGas"
   ObjectArchetype=KFDT_Toxic'KFGame.Default__KFDT_Toxic'
}
