//=============================================================================
// KFSM_PlayerScrake_Block
//=============================================================================
// Player-controlled scrake block move
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFSM_PlayerScrake_Block extends KFSM_PlayerZedBlockBase;

defaultproperties
{
   AnimName="Block_Idle"
   bUseCustomThirdPersonViewOffset=True
   CustomThirdPersonViewOffset=(OffsetHigh=(X=-175.000000,Y=60.000000,Z=60.000000),OffsetMid=(X=-160.000000,Y=50.000000,Z=0.000000),OffsetLow=(X=-220.000000,Y=100.000000,Z=50.000000))
   ViewOffsetInterpTime=0.300000
   CustomCameraFOV=64.000000
   CameraFOVTransitionTime=0.300000
   Name="Default__KFSM_PlayerScrake_Block"
   ObjectArchetype=KFSM_PlayerZedBlockBase'kfgamecontent.Default__KFSM_PlayerZedBlockBase'
}
