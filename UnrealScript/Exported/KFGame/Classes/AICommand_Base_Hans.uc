//=============================================================================
// AICommand_Base_Hans
//=============================================================================
// Hans's base AICommand
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class AICommand_Base_Hans extends AICommand_Base_Boss
	within KFAIController_Hans;

state ZedBaseCommand
{
	event BeginState( name PreviousStateName )
	{
	}

	event EndState( name NextStateName )
	{
	}

Begin:
	AILog_Internal(self$" "$GetStateName()$" [Begin Label]",'Command_Base',);
	if( Pawn.Physics == PHYS_Falling )
	{
		DisableMeleeRangeEventProbing();
		WaitForLanding();
	}
	EnableMeleeRangeEventProbing();
	// Check for any interrupt transitions
	CheckInterruptCombatTransitions();

	// Select nearest enemy if current enemy is invalid
	if( Enemy == none || Enemy.Health <= 0 || !IsValidAttackTarget(KFPawn(Enemy)) )
	{
		SelectEnemy();
	}

	// If enemy is still invalid or melee range events are disabled, pause and loop back
	if( (Enemy == none && DoorEnemy == none) || !bIsProbingMeleeRangeEvents )
	{
		AILog_Internal(self$" Enemy: "$Enemy$" bIsProbingMeleeRangeEvents: "$bIsProbingMeleeRangeEvents,'Command_Base',);
		Sleep( 0.1f + FRand() * 0.3f );
		Goto( 'Begin' );
	}

	// Just chill if Hans is already throwing a grenade
	if( MyHansPawn != none && MyHansPawn.IsThrowingGrenade() )
	{
		AILog_Internal(self$" Enemy: "$Enemy$" IsThrowingGrenade(): "$MyHansPawn.IsThrowingGrenade(),'Command_Base',);
		Sleep( 0.1f );
		Goto( 'Begin' );
	}

	// Handle special case if I'm supposed to be attacking a door
	if( DoorEnemy != none && DoorEnemy.Health > 0 && VSizeSq( DoorEnemy.Location - Pawn.Location ) < (DoorMeleeDistance * DoorMeleeDistance) ) //200UU
	{
		AILog_Internal(self$" DoorEnemy: "$DoorEnemy$" starting melee attack",'Command_Base',);
		UpdateHistoryString( "[Attacking : "$DoorEnemy$" at "$WorldInfo.TimeSeconds$"]" );
		class'AICommand_Attack_Melee'.static.Melee( Outer, DoorEnemy );
	}

	if( IsValidAttackTarget(KFPawn(Enemy)) )
	{
		if( !IsWithinAttackRange() )
		{
            AILog_Internal("Calling SetEnemyMoveGoal [Dist:"$VSize(Enemy.Location - Pawn.Location)$"] using offset of "$AttackRange$", because IsWithinBasicMeleeRange() returned false ",'Command_Base',);
    		bWaitingOnMovementPlugIn = true;
    		SetEnemyMoveGoal(self, true,,, ShouldAttackWhileMoving() );

    		while( bWaitingOnMovementPlugIn && bUsePluginsForMovement )
    		{
    			Sleep(0.03);
    		}
    		AILog_Internal("Back from waiting for the movement plug in!!!",,);
		}

		if( Enemy == none )
		{
			Sleep( FRand() + 0.1f );
			Goto( 'Begin' );
		}
	}
	else
	{
		AILog_Internal("Enemy is invalid melee target" @ Enemy,'Command_Base',);
		bFailedToMoveToEnemy = true;
	}

	// Check combat transitions
	CheckCombatTransition();
	if( bFailedToMoveToEnemy )
	{
		if( bFailedPathfind )
		{
			bFailedPathfind = false;
			Sleep( 0.f );
		}
		else
		{
			Sleep( 0.f );
		}
		SetEnemy( GetClosestEnemy( Enemy ) );

		// Prevent us getting stuck in an infinite idle loop
		bFailedToMoveToEnemy = false;
	}
	else
	{
		Sleep(0.f);
	}
	Goto('Begin');
}

defaultproperties
{
   Name="Default__AICommand_Base_Hans"
   ObjectArchetype=AICommand_Base_Boss'KFGame.Default__AICommand_Base_Boss'
}
