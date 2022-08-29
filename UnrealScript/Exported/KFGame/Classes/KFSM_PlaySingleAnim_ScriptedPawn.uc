//=============================================================================
// KFSM_PlaySingleAnim_ScriptedPawn
//=============================================================================
// Play a single animation on a scripted pawn
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================

class KFSM_PlaySingleAnim_ScriptedPawn extends KFSM_PlaySingleAnim;

function PlayAnimation()
{
	local KFPawn_Scripted KFPS;

	KFPS = KFPawn_Scripted(KFPOwner);
	if (KFPS != none)
	{
		AnimName = KFPS.GetStateTransitionAnim();
		if (AnimName != '')
		{
			PlaySpecialMoveAnim(AnimName, AnimStance, BlendInTime, BlendOutTime, 1.f);
			return;
		}
	}

	KFPOwner.EndSpecialMove();
}

defaultproperties
{
   Name="Default__KFSM_PlaySingleAnim_ScriptedPawn"
   ObjectArchetype=KFSM_PlaySingleAnim'KFGame.Default__KFSM_PlaySingleAnim'
}
