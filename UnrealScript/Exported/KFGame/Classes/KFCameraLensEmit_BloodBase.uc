//=============================================================================
// KFCameraLensEmit_BloodBase
//=============================================================================
// Generic blood spray emitter (Lens effect)
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Sakib Saikia 10/31/2013
//=============================================================================

class KFCameraLensEmit_BloodBase extends EmitterCameraLensEffectBase;

defaultproperties
{
   PS_CameraEffect=ParticleSystem'FX_Camera_EMIT.FX_Camera_Blood'
   bAllowMultipleInstances=True
   Begin Object Class=ParticleSystemComponent Name=ParticleSystemComponent0 Archetype=ParticleSystemComponent'Engine.Default__EmitterCameraLensEffectBase:ParticleSystemComponent0'
      SecondsBeforeInactive=0.000000
      ReplacementPrimitive=None
      bOnlyOwnerSee=True
      Name="ParticleSystemComponent0"
      ObjectArchetype=ParticleSystemComponent'Engine.Default__EmitterCameraLensEffectBase:ParticleSystemComponent0'
   End Object
   ParticleSystemComponent=ParticleSystemComponent0
   Components(0)=ParticleSystemComponent0
   LifeSpan=1.500000
   Name="Default__KFCameraLensEmit_BloodBase"
   ObjectArchetype=EmitterCameraLensEffectBase'Engine.Default__EmitterCameraLensEffectBase'
}
