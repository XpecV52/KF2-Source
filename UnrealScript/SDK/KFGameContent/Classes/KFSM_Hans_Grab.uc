//=============================================================================
// KFSM_Hans_Grab
//=============================================================================
// Try to grab a player.  On success go to KFSM_GrappleAttack_Hans
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFSM_Hans_Grab extends KFSM_GrappleStart;

function SpecialMoveStarted( bool bForced, Name PrevMove )
{
	local KFPawn_ZedHansBase HansPawn;

	Super.SpecialMoveStarted(bForced, PrevMove);

	HansPawn = KFPawn_ZedHansBase(PawnOwner);
	if( HansPawn != none )
	{
		HansPawn.PlayGrabDialog();
	}
}

defaultproperties
{
	AnimName=Atk_Paralyze_V1
	MaxGrabDistance=500.f
	bCanBeBlocked=false
	bCanBeInterrupted=false
}
