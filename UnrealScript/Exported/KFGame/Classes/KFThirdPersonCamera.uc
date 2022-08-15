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

defaultproperties
{
   ThirdPersonCamDefaultClass=Class'KFGame.KFThirdPersonCameraMode'
   Name="Default__KFThirdPersonCamera"
   ObjectArchetype=GameThirdPersonCamera'GameFramework.Default__GameThirdPersonCamera'
}
