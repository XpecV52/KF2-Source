//=============================================================================
// KFSM_PlayerPatriarch_MissileAttack
//=============================================================================
// Player-controlled Patriarch's missile attack
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFSM_PlayerPatriarch_MissileAttack extends KFSM_Patriarch_MissileAttack;

defaultproperties
{
   LoadAnimNames(0)="Rocket_TO_LoadP"
   bUseCustomThirdPersonViewOffset=True
   CustomThirdPersonViewOffset=(OffsetHigh=(X=-140.000000,Y=90.000000,Z=45.000000),OffsetMid=(X=-125.000000,Y=110.000000,Z=45.000000),OffsetLow=(X=-160.000000,Y=130.000000,Z=55.000000))
   ViewOffsetInterpTime=0.400000
   CustomCameraFOV=60.000000
   CameraFOVTransitionTime=0.500000
   Name="Default__KFSM_PlayerPatriarch_MissileAttack"
   ObjectArchetype=KFSM_Patriarch_MissileAttack'kfgamecontent.Default__KFSM_Patriarch_MissileAttack'
}
