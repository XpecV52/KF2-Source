//=============================================================================
// KFEmoteCamera
//=============================================================================
// Camera for third person emote viewing
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================

class KFEmoteCamera extends KFThirdPersonCamera
	config(Camera);

defaultproperties
{
   ThirdPersonCamDefaultClass=Class'KFGame.KFEmoteCameraMode'
   Name="Default__KFEmoteCamera"
   ObjectArchetype=KFThirdPersonCamera'KFGame.Default__KFThirdPersonCamera'
}
