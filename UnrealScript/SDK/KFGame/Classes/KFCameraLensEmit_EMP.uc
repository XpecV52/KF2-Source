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
	bAllowMultipleInstances=false
	LifeSpan=5f
	bDepthTestEnabled=false
}
