//=============================================================================
// KFCameraShake
//=============================================================================
// Extends CameraShake to add an associated ForceFeedbackWaveform
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFCameraShake extends CameraShake
	hidecategories(Object);

var() ForceFeedbackWaveform FFWaveform;

defaultproperties
{
   Name="Default__KFCameraShake"
   ObjectArchetype=CameraShake'Engine.Default__CameraShake'
}
