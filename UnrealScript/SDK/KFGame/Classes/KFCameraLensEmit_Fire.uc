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
	bAllowMultipleInstances=false
	LifeSpan=1.5f
	bDepthTestEnabled=false
}
