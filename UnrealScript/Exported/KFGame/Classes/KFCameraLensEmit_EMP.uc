//=============================================================================
// KFCameraLensEmit_EMP
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Greg Felber 11/3/2014
//=============================================================================

class KFCameraLensEmit_EMP extends EmitterCameraLensEffectBase;

defaultproperties
{
   PS_CameraEffect=ParticleSystem'FX_Camera_EMIT.FX_Camera_EMP'
   Begin Object Class=ParticleSystemComponent Name=ParticleSystemComponent0 Archetype=ParticleSystemComponent'Engine.Default__EmitterCameraLensEffectBase:ParticleSystemComponent0'
      SecondsBeforeInactive=0.000000
      ReplacementPrimitive=None
      bOnlyOwnerSee=True
      Name="ParticleSystemComponent0"
      ObjectArchetype=ParticleSystemComponent'Engine.Default__EmitterCameraLensEffectBase:ParticleSystemComponent0'
   End Object
   ParticleSystemComponent=ParticleSystemComponent0
   Components(0)=ParticleSystemComponent0
   LifeSpan=5.000000
   Name="Default__KFCameraLensEmit_EMP"
   ObjectArchetype=EmitterCameraLensEffectBase'Engine.Default__EmitterCameraLensEffectBase'
}
