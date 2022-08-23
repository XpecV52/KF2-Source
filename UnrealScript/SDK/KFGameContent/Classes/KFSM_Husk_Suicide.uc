//=============================================================================
// KFSM_Husk_Suicide
//=============================================================================
// Play a suicide attack animation sequence
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFSM_Husk_Suicide extends KFSM_PlaySingleAnim;

/** If TRUE, play the explosion (Husk was not killed before animation ended) */
var protected bool bSuicideAnimFinished;

protected function bool InternalCanDoSpecialMove()
{
	if( KFPOwner.IsHumanControlled() )
	{
		return KFPOwner.IsAliveAndWell() && !KFPOwner.IsImpaired() && !KFPOwner.IsIncapacitated(); // allow headless suicides
	}

	if( AIOwner == none || AIOwner.MyKFPawn == none || AIOwner.Enemy == none )
	{
		return false;
	}

	if( !KFPOwner.IsCombatCapable() )
	{
		return false;
	}

	return super.InternalCanDoSpecialMove();
}

function SpecialMoveStarted(bool bForced, Name PrevMove)
{
	bSuicideAnimFinished = false;

	Super.SpecialMoveStarted(bForced, PrevMove);
}

/**  When the animation finishes playing end this move */
function AnimEndNotify(AnimNodeSequence SeqNode, float PlayedTime, float ExcessTime)
{
	bSuicideAnimFinished = true;
	
	super.AnimEndNotify( SeqNode, PlayedTime, ExcessTime );
}

simulated function SpecialMoveEnded( name PrevMove, name NextMove )
{
	`log( self$" SpecialMoveEnded", KFPOwner.bLogSpecialMove );

	if ( bSuicideAnimFinished && !bPendingStopFire )
	{
		KFPawn_ZedHusk(PawnOwner).TriggerExplosion();
	}

	super.SpecialMoveEnded( PrevMove, NextMove );
}

DefaultProperties
{
	// ---------------------------------------------
	// SpecialMove
	Handle=KFSM_HuskSuicide
	bPawnRotationLocked=true
	bShouldDeferToPostTick=true

	// ---------------------------------------------
	// Animations
	AnimName=Atk_Suicide_V1
	AnimStance=EAS_FullBody
	bUseRootMotion=true
}
