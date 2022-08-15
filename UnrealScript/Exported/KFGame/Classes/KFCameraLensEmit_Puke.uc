//=============================================================================
// KFCameraLensEmit_Puke
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 3/13/2014
//=============================================================================

class KFCameraLensEmit_Puke extends EmitterCameraLensEffectBase;

defaultproperties
{
   PS_CameraEffect=ParticleSystem'FX_Camera_EMIT.FX_Puke_screen_01'
   Begin Object Class=ParticleSystemComponent Name=ParticleSystemComponent0 Archetype=ParticleSystemComponent'Engine.Default__EmitterCameraLensEffectBase:ParticleSystemComponent0'
      SecondsBeforeInactive=0.000000
      ReplacementPrimitive=None
      bOnlyOwnerSee=True
      Name="ParticleSystemComponent0"
      ObjectArchetype=ParticleSystemComponent'Engine.Default__EmitterCameraLensEffectBase:ParticleSystemComponent0'
   End Object
   ParticleSystemComponent=ParticleSystemComponent0
   Components(0)=ParticleSystemComponent0
   Name="Default__KFCameraLensEmit_Puke"
   ObjectArchetype=EmitterCameraLensEffectBase'Engine.Default__EmitterCameraLensEffectBase'
}
