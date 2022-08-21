//=============================================================================
// KFSM_Husk_Suicide
//=============================================================================
// Play a suicide attack animation sequence
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFSM_Husk_Suicide extends KFSM_PlaySingleAnim;

/** If something goes wrong, this timer will eventually force the suicide regardless of proximity to goal */
// function SuicideTimeout()
// {
// 	if( AIOwner != none && !AIOwner.GetActiveCommand().IsA('AICommand_Husk_Suicide') )
// 	{
// 		class'AICommand_Husk_Suicide'.static.Suicide( KFAIController_ZedHusk(AIOwner) );
// 	}
// }

protected function bool InternalCanDoSpecialMove()
{
	if( KFPOwner.IsHumanControlled() )
	{
		return KFPOwner.IsAliveAndWell();
	}

	if( AIOwner == none || AIOwner.MyKFPawn == none || AIOwner.Enemy == none )
	{
		return false;
	}

	if( AIOwner.MyKFPawn.IsImpaired() )
	{
		return false;
	}

	return super.InternalCanDoSpecialMove();
}

simulated function SpecialMoveEnded( name PrevMove, name NextMove )
{
	if (KFPOwner.bLogSpecialMove) LogInternal(self$" SpecialMoveEnded");

	if ( !bPendingStopFire )
	{
		KFPawn_ZedHusk(PawnOwner).TriggerExplosion();
	}

	super.SpecialMoveEnded( PrevMove, NextMove );
}

defaultproperties
{
   AnimName="Atk_Suicide_V1"
   bUseRootMotion=True
   bPawnRotationLocked=True
   Handle="KFSM_HuskSuicide"
   Name="Default__KFSM_Husk_Suicide"
   ObjectArchetype=KFSM_PlaySingleAnim'KFGame.Default__KFSM_PlaySingleAnim'
}
