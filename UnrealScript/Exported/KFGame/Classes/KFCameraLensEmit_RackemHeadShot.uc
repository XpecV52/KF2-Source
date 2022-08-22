//=============================================================================
// KFCameraLensEmit_RackemHeadShot
//=============================================================================
// Rack 'Em Up headshot effect
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFCameraLensEmit_RackemHeadShot extends EmitterCameraLensEffectBase;

/** Contains curve intervals for scaling the FOV based on input aspect ratio */
var InterpCurveFloat FOVCurve;

/** This will actually activate the lens Effect.  We want this separated from PostBeginPlay so we can cache these emitters **/
simulated function ActivateLensEffect()
{
	local vector2D ViewportSize;
	local PlayerController LocalPC;
	local LocalPlayer LP;
	local float ScaledFOV;
	local float AspectRatio, AspectRatioScale;

	super.ActivateLensEffect();

	ScaledFOV = 96.25f;

	// Scale FOV by aspect ratio
	LocalPC = GetALocalPlayerController();
	if( LocalPC != none )
	{
		LP = LocalPlayer( LocalPC.Player );
		if( LP != None && LP.ViewportClient != None )
		{
			LP.ViewportClient.GetViewportSize( ViewportSize );

			// Base aspect ratio is 16:9
			AspectRatio = ViewportSize.X / ViewportSize.Y;
			AspectRatioScale = AspectRatio / AspectRatio16x9;

			// @NOTE: This is really just a whole bunch of magic numbers stored in a float curve. The actual
			// rack 'em up UI changes screen locations based on aspect ratio, and it chooses these locations
			// in a different way than we typically do aspect scaling on the Canvas. Since the results of
			// this are unpredictable, I've just plugged in good values for each engine-supported AR. -MattF
			ScaledFOV = EvalInterpCurveFloat( FOVCurve, AspectRatioScale );
		}
	}

	KFParticleSystemComponent(ParticleSystemComponent).SetFOV( ScaledFOV );
}

defaultproperties
{
   FOVCurve=(Points=((InVal=0.700000,OutVal=47.000000),(InVal=0.750000,OutVal=54.500000),(InVal=0.840000,OutVal=72.500000),(InVal=0.900000,OutVal=74.500000),(InVal=1.000000,OutVal=96.250000),(InVal=1.310000,OutVal=126.500000)))
   PS_CameraEffect=ParticleSystem'FX_Camera_EMIT.FX_Rackem_Headshot_01'
   bAllowMultipleInstances=True
   Begin Object Class=KFParticleSystemComponent Name=ParticleSystemComponent1
      SecondsBeforeInactive=0.000000
      ReplacementPrimitive=None
      bOnlyOwnerSee=True
      Name="ParticleSystemComponent1"
      ObjectArchetype=KFParticleSystemComponent'KFGame.Default__KFParticleSystemComponent'
   End Object
   ParticleSystemComponent=ParticleSystemComponent1
   Components(0)=ParticleSystemComponent1
   LifeSpan=0.500000
   Name="Default__KFCameraLensEmit_RackemHeadShot"
   ObjectArchetype=EmitterCameraLensEffectBase'Engine.Default__EmitterCameraLensEffectBase'
}
