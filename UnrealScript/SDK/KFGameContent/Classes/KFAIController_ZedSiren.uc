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

/** If an incap special move just started, abort our scream command */
function NotifySpecialMoveStarted( KFSpecialMove SM )
{
	if( IsInStumble() || MyKFPawn.IsIncapacitated() )
	{
		AbortCommand( FindCommandOfClass( class'AICommand_Siren_Scream') );
	}
}

/** Executes a scream */
function DoScream()
{
	if( IsInStumble() || MyKFPawn.IsIncapacitated() )
	{
		return;
	}

	if( MyKFPawn.SpecialMove == SM_None || MyKFPawn.SpecialMove == SM_SonicAttack )
	{
		class'AICommand_Siren_Scream'.static.Scream( self );
		MyKFPawn.DisablebOnDeathAchivement();
	}
}

/** Scream after an incap */
function NotifySpecialMoveEnded( KFSpecialMove SM )
{
	local Pawn BestTarget;

	// Allow a bit of time to blend out of incaps
	if( SM.Handle == 'KFSM_Stumble' || SM.Handle == 'KFSM_Stunned' || SM.Handle == 'KFSM_Frozen' || SM.Handle == 'KFSM_RecoverFromRagdoll' )
	{
		// Get a new enemy		
		BestTarget = MyKFPawn.GetBestAggroEnemy();
		if( BestTarget != none )
		{
			BestTarget = GetClosestEnemy();
		}
		ChangeEnemy( BestTarget, true );

		// Start moving to enemy
		SetEnemyMoveGoal( self, true );

		// Wait 1 second, and then try to scream again
		SetTimer( 1.f, false, nameOf(DoScream) );
	}
}

/** Notification from KFSM_MeleeAttack that it has completed */
function NotifyMeleeAttackFinished()
{
	if( MyKFPawn != none )
	{
		MyKFPawn.NotifyMeleeAttackFinished();
	}
}

/** Notification from AICommand::Popped that it has completed */
function NotifyCommandFinished( AICommand FinishedCommand )
{
	// Need to set our scream timer after a panic wander or else Siren will likely never scream again
	if( ClassIsChildOf(FinishedCommand.class, class'AICommand_PanicWander') )
	{
		SetTimer( 1.f, false, nameOf(DoScream) );
	}

	super.NotifyCommandFinished( FinishedCommand );
}

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

	//DefaultBehavior="SirenMain"
	//UsedETQQueries[ENQ_EnemySelection]="BaseZedEnemySelection"
}
