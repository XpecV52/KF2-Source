//=============================================================================
// KFEmoteCameraMode
//=============================================================================
// Camera mode for third person emotes
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================

class KFEmoteCameraMode extends KFThirdPersonCameraMode
	config(Camera);

defaultproperties
{
   ViewOffset=(OffsetHigh=(X=-240.000000,Y=56.000000,Z=16.000000),OffsetMid=(X=-240.000000,Y=48.000000,Z=0.000000),OffsetLow=(X=-240.000000,Y=48.000000,Z=16.000000))
   Name="Default__KFEmoteCameraMode"
   ObjectArchetype=KFThirdPersonCameraMode'KFGame.Default__KFThirdPersonCameraMode'
}
