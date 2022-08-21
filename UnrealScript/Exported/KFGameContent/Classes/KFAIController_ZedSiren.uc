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
		DoScream( true );
	}
	else if( !IsTimerActive(nameOf(DoScream)) )
	{
		SetTimer( 1.f, false, nameOf(DoScream) );
	}
}

/** Executes a scream */
function DoScream( optional bool bCalledFromPreMove=false )
{
	if( MyKFPawn.IsImpaired() || MyKFPawn.IsIncapacitated() )
	{
		return;
	}

	if( MyKFPawn.SpecialMove == SM_None || MyKFPawn.SpecialMove == SM_SonicAttack )
	{
		class'AICommand_Siren_Scream'.static.Scream( self );
		MyKFPawn.DisablebOnDeathAchivement();
	}

	// Start moving to enemy
	if( !bCalledFromPreMove )
	{
		SetEnemyMoveGoal( self, true );	
	}
}


/** Gets the best target based on aggro or distance, moves towards them, and then (optionally) screams */
function AcquireEnemyAndScream( optional bool bStartScreamTimer )
{
	local Pawn BestTarget;

	if( MyKFPawn.IsImpaired() || MyKFPawn.IsIncapacitated() )
	{
		return;
	}

	// Get a new enemy		
	BestTarget = MyKFPawn.GetBestAggroEnemy();
	if( BestTarget == none )
	{
		BestTarget = GetClosestEnemy();
	}
	ChangeEnemy( BestTarget, true );

	if( bStartScreamTimer )
	{
		SetTimer( 1.f, false, nameOf(DoScream) );
	}
}

/** If an incap special move just started, abort our scream command */
function NotifySpecialMoveStarted( KFSpecialMove SM )
{
	local AICommand_Siren_Scream ScreamCommand;

	if( MyKFPawn.IsImpaired() || MyKFPawn.IsIncapacitated() )
	{
		ScreamCommand = FindCommandOfClass( class'AICommand_Siren_Scream' );
		if( ScreamCommand != none )
		{
			AbortCommand( ScreamCommand );
		}
	}

	super.NotifySpecialMoveStarted( SM );
}

/** Scream after an incap */
function NotifySpecialMoveEnded( KFSpecialMove SM )
{
	super.NotifySpecialMoveEnded( SM );

	// Allow a bit of time to blend out of incaps
	if( SM.Handle == 'KFSM_Stumble' || SM.Handle == 'KFSM_Stunned' || SM.Handle == 'KFSM_Frozen' || SM.Handle == 'KFSM_RecoverFromRagdoll' )
	{
		AcquireEnemyAndScream( true );
	}
}

/** Notification from KFSM_MeleeAttack that it has completed */
function NotifyMeleeAttackFinished()
{
	super.NotifyMeleeAttackFinished();

	if( MyKFPawn != none )
	{
		MyKFPawn.NotifyMeleeAttackFinished();
	}
}

/** Notification from AICommand::Popped that it has completed */
function NotifyCommandFinished( AICommand FinishedCommand )
{
	// Need to set our scream timer after a panic wander or else Siren will likely never scream again
	if( AICommand_PanicWander(FinishedCommand) != none )
	{
		AcquireEnemyAndScream( true );
	}

	super.NotifyCommandFinished( FinishedCommand );
}

/** If we're in a panic state, kill the scream command */
function DoPanicWander()
{
	local AICommand_Siren_Scream ScreamCommand;

	ScreamCommand = FindCommandOfClass( class'AICommand_Siren_Scream' );
	if( ScreamCommand != none )
	{
		AbortCommand( ScreamCommand );
	}

	super.DoPanicWander();
}

/** Stop screaming in victory state */
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
