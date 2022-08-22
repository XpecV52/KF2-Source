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
	PS_CameraEffect=ParticleSystem'FX_Camera_EMIT.FX_Rackem_Headshot_01'
	bAllowMultipleInstances=true
	LifeSpan=0.5f
	bDepthTestEnabled=false

    FOVCurve=(Points=((InVal=0.70f, OutVal=47.0f),(InVal=0.75f, OutVal=54.5f),(InVal=0.84f, OutVal=72.5f),(InVal=0.9f, OutVal=74.5f),(InVal=1.0f,OutVal=96.25f),(InVal=1.31f,OutVal=126.5f)))

	Begin Object Class=KFParticleSystemComponent Name=ParticleSystemComponent1
		bOnlyOwnerSee=TRUE
		SecondsBeforeInactive=0.0
	End Object
	ParticleSystemComponent=ParticleSystemComponent1
	Components.Remove(ParticleSystemComponent0)
	Components.Add(ParticleSystemComponent1)
}