//=============================================================================
// KFCameraLensEmit_RackemHeadShotPing
//=============================================================================
// Rack 'Em Up headshot effect
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFCameraLensEmit_RackemHeadShotPing extends KFCameraLensEmit_RackemHeadShot;

defaultproperties
{
   PS_CameraEffect=ParticleSystem'FX_Camera_EMIT.FX_Rackem_Headshot_Ping_01'
   bAllowMultipleInstances=False
   Begin Object Class=KFParticleSystemComponent Name=ParticleSystemComponent1 Archetype=KFParticleSystemComponent'KFGame.Default__KFCameraLensEmit_RackemHeadShot:ParticleSystemComponent1'
      SecondsBeforeInactive=0.000000
      ReplacementPrimitive=None
      bOnlyOwnerSee=True
      Name="ParticleSystemComponent1"
      ObjectArchetype=KFParticleSystemComponent'KFGame.Default__KFCameraLensEmit_RackemHeadShot:ParticleSystemComponent1'
   End Object
   ParticleSystemComponent=ParticleSystemComponent1
   Components(0)=ParticleSystemComponent1
   Name="Default__KFCameraLensEmit_RackemHeadShotPing"
   ObjectArchetype=KFCameraLensEmit_RackemHeadShot'KFGame.Default__KFCameraLensEmit_RackemHeadShot'
}
