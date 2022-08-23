//=============================================================================
// KFCameraLensEmit_Fire
//=============================================================================
// Camera effect for being on fire
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================
class KFCameraLensEmit_Fire extends KFEmit_CameraEffect;

function NotifyRetriggered()
{
	super.NotifyRetriggered();

	// Keep the effect going if we take fire damage again
 	LifeSpan = default.LifeSpan;
}

defaultproperties
{
   PS_CameraEffect=ParticleSystem'FX_Camera_EMIT.FX_Camera_Fire'
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
   Name="Default__KFCameraLensEmit_Fire"
   ObjectArchetype=KFEmit_CameraEffect'KFGame.Default__KFEmit_CameraEffect'
}
