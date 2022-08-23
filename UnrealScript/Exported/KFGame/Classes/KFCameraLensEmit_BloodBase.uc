//=============================================================================
// KFCameraLensEmit_BloodBase
//=============================================================================
// Generic blood spray emitter (Lens effect)
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Sakib Saikia 10/31/2013
//=============================================================================

class KFCameraLensEmit_BloodBase extends KFEmit_CameraEffect;

defaultproperties
{
   PS_CameraEffect=ParticleSystem'FX_Camera_EMIT.FX_Camera_Blood'
   bAllowMultipleInstances=True
   Begin Object Class=ParticleSystemComponent Name=ParticleSystemComponent0 Archetype=ParticleSystemComponent'KFGame.Default__KFEmit_CameraEffect:ParticleSystemComponent0'
      SecondsBeforeInactive=0.000000
      ReplacementPrimitive=None
      bOnlyOwnerSee=True
      Name="ParticleSystemComponent0"
      ObjectArchetype=ParticleSystemComponent'KFGame.Default__KFEmit_CameraEffect:ParticleSystemComponent0'
   End Object
   ParticleSystemComponent=ParticleSystemComponent0
   Components(0)=ParticleSystemComponent0
   LifeSpan=1.500000
   Name="Default__KFCameraLensEmit_BloodBase"
   ObjectArchetype=KFEmit_CameraEffect'KFGame.Default__KFEmit_CameraEffect'
}
