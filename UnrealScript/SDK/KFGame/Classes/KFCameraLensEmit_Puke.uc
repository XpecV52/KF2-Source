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
	bAllowMultipleInstances=false
	LifeSpan=10.f
	bDepthTestEnabled=false
}
