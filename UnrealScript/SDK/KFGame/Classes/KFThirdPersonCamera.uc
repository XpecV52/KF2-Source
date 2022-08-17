//=============================================================================
// KFThirdPersonCamera
//=============================================================================
// Camera for third person
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFThirdPersonCamera extends GameThirdPersonCamera
	config(Camera);

simulated function SetViewOffset( ViewOffsetData NewViewOffset, optional bool bInterpolate, optional float InterpTime )
{
	if( bInterpolate )
	{
		ThirdPersonCamDefault.bInterpViewOffsetOnlyForCamTransition = false;
		ThirdPersonCamDefault.BlendTime = InterpTime;
	}
	else
	{
		ThirdPersonCamDefault.bInterpViewOffsetOnlyForCamTransition = true;
	    ThirdPersonCamDefault.BlendTime = ThirdPersonCamDefault.default.BlendTime;
	}

    ThirdPersonCamDefault.SetViewOffset( NewViewOffset );	
}

defaultproperties
{
	ThirdPersonCamDefaultClass=class'KFThirdPersonCameraMode'
}