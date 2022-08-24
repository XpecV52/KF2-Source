//=============================================================================
// KFCameraLensEmit_BloodGorge
//=============================================================================
// Generic blood spray emitter for BK Gorge (Lens effect)
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================

class KFCameraLensEmit_BloodGorge extends KFCameraLensEmit_BloodBase;

defaultproperties
{
   PS_CameraEffect=ParticleSystem'FX_Camera_EMIT.FX_Camera_Blood_Gorge'
   Begin Object Class=ParticleSystemComponent Name=ParticleSystemComponent0 Archetype=ParticleSystemComponent'KFGame.Default__KFCameraLensEmit_BloodBase:ParticleSystemComponent0'
      SecondsBeforeInactive=0.000000
      ReplacementPrimitive=None
      bOnlyOwnerSee=True
      Name="ParticleSystemComponent0"
      ObjectArchetype=ParticleSystemComponent'KFGame.Default__KFCameraLensEmit_BloodBase:ParticleSystemComponent0'
   End Object
   ParticleSystemComponent=ParticleSystemComponent0
   Components(0)=ParticleSystemComponent0
   Name="Default__KFCameraLensEmit_BloodGorge"
   ObjectArchetype=KFCameraLensEmit_BloodBase'KFGame.Default__KFCameraLensEmit_BloodBase'
}
