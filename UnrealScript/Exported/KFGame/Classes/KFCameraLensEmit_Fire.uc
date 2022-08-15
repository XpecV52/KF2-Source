//=============================================================================
// KFCameraLensEmit_Fire
//=============================================================================
// Camera effect for being on fire
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFCameraLensEmit_Fire extends EmitterCameraLensEffectBase;

function NotifyRetriggered()
{
	super.NotifyRetriggered();

	// Keep the effect going if we take fire damage again
 	LifeSpan = default.LifeSpan;
}

defaultproperties
{
   PS_CameraEffect=ParticleSystem'FX_Camera_EMIT.FX_Camera_Fire'
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
   Name="Default__KFCameraLensEmit_Fire"
   ObjectArchetype=EmitterCameraLensEffectBase'Engine.Default__EmitterCameraLensEffectBase'
}
