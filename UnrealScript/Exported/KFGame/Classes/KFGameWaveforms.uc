//=============================================================================
// KFGameWaveforms
//=============================================================================
// Default force feedback waveforms for camera shake
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFGameWaveforms extends GameWaveForms;

defaultproperties
{
   CameraShakeMediumShort=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.CameraShake.CamShake_MediumShort'
   CameraShakeMediumLong=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.CameraShake.CamShake_MediumLong'
   CameraShakeBigShort=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.CameraShake.CamShake_BigShort'
   CameraShakeBigLong=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.CameraShake.CamShake_BigLong'
   Name="Default__KFGameWaveforms"
   ObjectArchetype=GameWaveForms'GameFramework.Default__GameWaveForms'
}
