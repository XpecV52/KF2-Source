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
	ViewOffset={(
		OffsetHigh=(X=-96,Y=56,Z=16),
		OffsetLow=(X=-120,Y=48,Z=16),
		OffsetMid=(X=-120,Y=48,Z=0),
		)}
}

