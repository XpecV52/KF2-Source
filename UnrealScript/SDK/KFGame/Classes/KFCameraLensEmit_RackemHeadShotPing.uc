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
	bAllowMultipleInstances=false
	LifeSpan=0.5f
	bDepthTestEnabled=false
}