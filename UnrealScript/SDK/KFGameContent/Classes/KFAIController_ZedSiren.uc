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
	if( MyKFPawn == none || !MyKFPawn.IsAliveAndWell() || MyKFPawn.IsImpaired() || MyKFPawn.IsIncapacitated() )
	{
		return;
	}

	if( MyKFPawn.SpecialMove == SM_None || MyKFPawn.SpecialMove == SM_SonicAttack )
	{
		class'AICommand_Siren_Scream'.static.Scream( self );
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

	if( MyKFPawn == none || !MyKFPawn.IsAliveAndWell() || MyKFPawn.IsImpaired() || MyKFPawn.IsIncapacitated() || IsTimerActive(nameOf(DoScream)) )
	{
		return;
	}

	// Get a new enemy if needed
	if( Enemy == none )
	{
		BestTarget = MyKFPawn.GetBestAggroEnemy();
		if( BestTarget == none )
		{
			BestTarget = GetClosestEnemy();
		}
		if( BestTarget != none )
		{
			ChangeEnemy( BestTarget, true );
		}
	}

	if( bStartScreamTimer )
	{
		SetTimer( 1.f, false, nameOf(DoScream) );
	}
}

/** If an incap special move just started, abort our scream command */
function NotifySpecialMoveStarted( KFSpecialMove SM )
{
	local AICommand_Siren_Scream ScreamCommand;

	if( MyKFPawn == none || !MyKFPawn.IsAliveAndWell() )
	{
		return;
	}

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
	local GameAICommand ActiveCommand;
	local AICommand_Siren_Scream ScreamCommand;

	ActiveCommand = GetActiveCommand();
	if( ActiveCommand != none && AICommand_PanicWander(ActiveCommand) != none )
	{
		return;
	}

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

DefaultProperties
{
	// AI / Navigation
	SprintWithinEnemyRange=(X=600.f,Y=1200.f)
	MeleeCommandClass=class'AICommand_Base_Zed'
	DefaultCommandClass=class'AICommand_Base_Zed'
	bIsProbingMeleeRangeEvents=true
	LowIntensityAttackCooldown=7.0
	bCanTeleportCloser=false

	//DefaultBehavior="SirenMain"
	//UsedETQQueries[ENQ_EnemySelection]="BaseZedEnemySelection"
}
