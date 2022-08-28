//=============================================================================
// KFDT_EMPTrap
//=============================================================================
// Damage caused by EMP Traps
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
// Zane Gholson
//=============================================================================

class KFDT_EMPTrap extends KFDamageType;

defaultproperties
{
   bIsTrapDamage=True
   GoreDamageGroup=DGT_EMP
   EMPPower=100.000000
   CameraLensEffectTemplate=Class'KFGame.KFCameraLensEmit_EMP'
   bArmorStops=False
   KDamageImpulse=150.000000
   Name="Default__KFDT_EMPTrap"
   ObjectArchetype=KFDamageType'KFGame.Default__KFDamageType'
}
