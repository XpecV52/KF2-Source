//=============================================================================
// AICommand_Base_Zed
//=============================================================================
// Base AI command for Zeds. Zeds don't wander (yet?) - they simply choose a
// valid enemy and use this command to begin moving to their enemy and to
// start melee attacks if they happen to be in range once the move to enemy
// command pops and this command resumes.
//
// Zeds who need special handling can subclass this.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class AICommand_Base_Zed extends AICommand_Base_Combat
	within KFAIController_Monster
	implements(LatentActionObserver)
	native(AI);

var name	CachedAttackTag;
var byte	AttackFlags;
var bool	bFailedPathfind;

var bool    bWaitingOnMovementPlugIn;

/*********************************************************************************************
* Initialization
********************************************************************************************* */

function Pushed()
{
	Super.Pushed();
	EnableSeePlayer();
	AILog_Internal(self$" "$GetFuncName()$"() using AttackRange of "$AttackRange,'Command_Base',);
	GotoState( DefaultStateName );
}

function Paused( GameAICommand NewCommand )
{
	AILog_Internal(self$" "$GetFuncName()$"() Paused for "$NewCommand,'Command_Base',);
	Super.Paused( NewCommand );
}

function Resumed( name OldCommandName )
{
	AILog_Internal(self$" "$GetFuncName()$"() (OldCommandName: "$OldCommandName$")",'Command_Base',);
	Super.Resumed( OldCommandName );
	EnableProbingMeleeRangeEvents( true );
}

/*********************************************************************************************
* Movement & Pathing
********************************************************************************************* */

native function OnLatentFinished(BaseAIController Observer, Object Action, byte FinishResult);

function bool NotifyBump( Actor Other, Vector HitNormal )
{
// To be enabled
	if( CachedChildCommand != None )
	{
		AILog_Internal(GetFuncName()$"() Other: "$Other$" HitNormal: "$HitNormal$" notifying "$CachedChildCommand$" and letting it handle the event.",'SeePlayer',);
		return CachedChildCommand.NotifyBump( Other, HitNormal );
	}
	return false;
}

function NotifyEnemyChanged( optional Pawn OldEnemy )
{
	super.NotifyEnemyChanged( OldEnemy );
	GotoState( DefaultStateName );
}

/*********************************************************************************************
* Combat
********************************************************************************************* */

function bool NotifyPlayerBecameVisible( Pawn VisiblePlayer )
{
	if( CachedChildCommand != None )
	{
		AILog_Internal(GetFuncName()$"() Seen: "$VisiblePlayer$" notifying "$CachedChildCommand$" and letting it handle the event.",'SeePlayer',);
		return CachedChildCommand.NotifyPlayerBecameVisible( VisiblePlayer );
	}
	AILog_Internal(GetFuncName()$"() : "$VisiblePlayer$" ignoring this event",'SeePlayer',);
	//DisableSeePlayer();
	return false;
}

function bool ShouldAttackWhileMoving()
{
	AILog_Internal(self$" ShouldAttackWhileMoving() returning true",'Command_Base',);
	return true;
}

function bool ShouldSelectTarget()
{
	if( Enemy == none || !Enemy.IsAliveAndWell() )
	{
		AILog_Internal(self$" "$GetFuncName()$"() returning TRUE",'Command_Base',);
		return true;
	}

	return false;
}

/*********************************************************************************************
* Base Zed Command State
********************************************************************************************* */

state ZedBaseCommand extends DEBUGSTATE
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

	// Handle special case if I'm supposed to be attacking a door
	if( DoorEnemy != none && DoorEnemy.Health > 0 && VSizeSq( DoorEnemy.Location - Pawn.Location ) < (DoorMeleeDistance * DoorMeleeDistance) ) //200UU
	{
		AILog_Internal(self$" DoorEnemy: "$DoorEnemy$" starting melee attack",'Command_Base',);
		UpdateHistoryString( "[Attacking : "$DoorEnemy$" at "$WorldInfo.TimeSeconds$"]" );
		class'AICommand_Attack_Melee'.static.Melee( Outer, DoorEnemy );
	}

	if( IsValidAttackTarget(KFPawn(Enemy)) )
	{
		AILog_Internal("Calling SetEnemyMoveGoal [Dist:"$VSize(Enemy.Location - Pawn.Location)$"] using offset of "$AttackRange$", because IsWithinBasicMeleeRange() returned false ",'Command_Base',);
		bWaitingOnMovementPlugIn = true;
		SetEnemyMoveGoal(self, true,,, ShouldAttackWhileMoving() );

		while( bWaitingOnMovementPlugIn && bUsePluginsForMovement )
		{
			Sleep(0.03);
		}
		AILog_Internal("Back from waiting for the movement plug in!!!",,);

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
	}
	else
	{
		Sleep(0.f);
	}
	Goto('Begin');
}

defaultproperties
{
   DefaultStateName="ZedBaseCommand"
   bDisableMovementPluginOnPushed=False
   Name="Default__AICommand_Base_Zed"
   ObjectArchetype=AICommand_Base_Combat'KFGame.Default__AICommand_Base_Combat'
}
