//=============================================================================
// KFSM_PlayerGorefast_Block
//=============================================================================
// Player-controlled gorefast block move
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFSM_PlayerGorefast_Block extends KFSM_PlayerZedBlockBase;

defaultproperties
{
   AnimName="Block_Idle"
   bUseCustomThirdPersonViewOffset=True
   CustomThirdPersonViewOffset=(OffsetHigh=(X=-175.000000,Y=50.000000,Z=25.000000),OffsetMid=(X=-140.000000,Y=50.000000,Z=-10.000000),OffsetLow=(X=-220.000000,Y=50.000000,Z=50.000000))
   ViewOffsetInterpTime=0.300000
   CustomCameraFOV=64.000000
   CameraFOVTransitionTime=0.300000
   Name="Default__KFSM_PlayerGorefast_Block"
   ObjectArchetype=KFSM_PlayerZedBlockBase'kfgamecontent.Default__KFSM_PlayerZedBlockBase'
}
