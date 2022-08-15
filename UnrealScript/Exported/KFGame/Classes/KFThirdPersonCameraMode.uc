//=============================================================================
// KFThirdPersonCameraMode
//=============================================================================
// Camera mode for third person
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFThirdPersonCameraMode extends GameThirdPersonCameraMode_Default
	config(Camera);

defaultproperties
{
   ViewOffset=(OffsetHigh=(X=-96.000000,Y=56.000000,Z=16.000000),OffsetMid=(X=-120.000000,Y=48.000000,Z=0.000000),OffsetLow=(X=-120.000000,Y=48.000000,Z=16.000000))
   Name="Default__KFThirdPersonCameraMode"
   ObjectArchetype=GameThirdPersonCameraMode_Default'GameFramework.Default__GameThirdPersonCameraMode_Default'
}
