//=============================================================================
// KFSM_EvilDAR_EMPGrapple
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFSM_EvilDAR_EMPGrapple extends KFSM_GrappleVictim;

function SetGrabEffect(KFPlayerController KFPC, bool bValue)
{
	KFPC.SetGrabEffectEMP(bValue, (Leader != none && Leader.IsHumanControlled()));
}

defaultproperties
{
   GrabbedSoundModeStartEvent=AkEvent'WW_ZED_Evil_DAR.Play_ZED_EvilDAR_EMP_PlayerGrabbed_LP'
   GrabbedSoundModeEndEvent=AkEvent'WW_ZED_Evil_DAR.Stop_ZED_EvilDAR_EMP_PlayerGrabbed_LP'
   Name="Default__KFSM_EvilDAR_EMPGrapple"
   ObjectArchetype=KFSM_GrappleVictim'KFGame.Default__KFSM_GrappleVictim'
}
