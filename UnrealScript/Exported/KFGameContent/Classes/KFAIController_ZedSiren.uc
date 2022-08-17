//=============================================================================
// KFAIController_ZedSiren
//=============================================================================
// The Siren's NPC controller
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFAIController_ZedSiren extends KFAIController_Monster;

/** Push the sirens scream onto the stack before starting a move */
function PreMoveToEnemy()
{
	// Push the AICommand for sirens scream before SetMoveGoal
	if( MyKFPawn.SpecialMove == SM_SonicAttack || (MyKFPawn.SpecialMove == SM_None && !IsTimerActive(nameOf(DoScream))) )
	{
		DoScream();
	}
}

/** Scream after a stumble */
function NotifySpecialMoveEnded( KFSpecialMove SM )
{
	// Allow a bit of time to blend out of stumble
	if( SM.Handle == 'KFSM_Stumble' )
	{
		SetTimer( 0.4f, false, nameOf(DoScream) );
	}
}

/** Executes a scream */
function DoScream()
{
	if( IsInStumble() )
	{
		return;
	}

	if( MyKFPawn.SpecialMove == SM_None || MyKFPawn.SpecialMove == SM_SonicAttack )
	{
		class'AICommand_Siren_Scream'.static.Scream( self );
	}
}

function NotifyMeleeAttackFinished()
{
	if( MyKFPawn != none )
	{
		MyKFPawn.NotifyMeleeAttackFinished();
	}
}

/** Perform a melee attack AICommand.. InTarget is optional actor to attack (door, etc.) */
/*
function DoMeleeAttack( optional Pawn NewEnemy, optional Actor InTarget, optional byte AttackFlags )
{
	if( MyKFPawn == none || MyKFPawn.bIsHeadless || !IsMeleeRangeEventProbingEnabled() || (MyKFPawn.IsDoingSpecialMove() && !MyKFPawn.IsDoingSpecialMove(SM_ChargeRun)) )
	{
		`AILog( GetFuncName()$"() skipping melee attack because "$Pawn$" is already busy.", 'Command_Attack_Melee' );
		return;
	}

	if( MyKFPawn != none && MyKFPawn.PawnAnimInfo != none )
	{
		// Only Pack flags if 255 was initially passed in
		if( AttackFlags == 255 )
		{
			AttackFlags = ChooseStrikeAnimation();
		}

		if( AttackFlags != 255 )
		{
			class'AICommand_Attack_Melee'.static.Melee( self, InTarget, AttackFlags );
		}
	}
	super.DoMeleeAttack( NewEnemy, InTarget, AttackFlags );
}

	*/

//function EndOfMeleeAttackNotification()
//{
//	class'AICommand_Hide'.static.HideFrom( self, Enemy, false );
//}

function EnterZedVictoryState()
{
	if( IsTimerActive(nameOf(DoScream)) )
	{
		ClearTimer( nameOf(DoScream) );
	}

	super.EnterZedVictoryState();
}

defaultproperties
{
   bIsProbingMeleeRangeEvents=True
   SprintWithinEnemyRange=(X=600.000000,Y=1200.000000)
   LowIntensityAttackCooldown=7.000000
   Name="Default__KFAIController_ZedSiren"
   ObjectArchetype=KFAIController_Monster'KFGame.Default__KFAIController_Monster'
}
