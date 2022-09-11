//=============================================================================
// KFDT_HellishRageCost
//=============================================================================
// Damage caused by hellish rage power up
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================
class KFDT_HellishRageCost extends KFDamageType
	abstract;

defaultproperties
{
   bNonLethalDamage=True
   bIgnoreSelfInflictedScale=True
   EffectGroup=FXG_Bludgeon
   CameraLensEffectTemplate=Class'KFGame.KFCameraLensEmit_BloodBase'
   bArmorStops=False
   KDamageImpulse=0.000000
   Name="Default__KFDT_HellishRageCost"
   ObjectArchetype=KFDamageType'KFGame.Default__KFDamageType'
}
