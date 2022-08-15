//=============================================================================
// KFAIController_Monster.uc
//=============================================================================
// Base AIController for KF2's Zeds
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFAIController_Monster extends KFAIController
	dependson(KFAIController)
	abstract
	native(AI);







	







	 



		
		
	







 
















 
































































































































































































































#linenumber 70;

#linenumber 15;

/** Zeds who can grab prefer to use a grab as their initial attack - if true, they've already done this */
var bool		bCompletedInitialGrabAttack;
/** Clot won't perform grab until closer than this distance. TODO: If we keep this, change it to a % scale of MaxGrabDistance in KFSM_Clot_Grab */
var float		MinDistanceToPerformGrabAttack;
/** Time frequency for grab attacks */
var float		MinTimeBetweenGrabAttacks;
/** Last time a grab attack was performed */
var float		LastAttackTime_Grab;
var bool		bPathAroundDestructiblesICantBreak;

/** The amount to scale this Zed's damage based on difficulty */
var(Combat) float	DifficultyDamageMod;

/*********************************************************************************************
* RunOverWarning (warns Zeds nearby that my pawn's about to run into them)
********************************************************************************************* */
/** Zed will transmit ReceiveRunOverWarning events to other Zeds if its about to run them over */
var bool		bUseRunOverWarning;
/** Speed must be greater than this to transmit run over warning (if bUseRunOverWarning=true) */
var float		MinRunOverSpeed;
/** Last time checked for pawns to transmit RunOverWarning to (if bUseRunOverWarning=true) */
var	float		LastRunOverWarningTime;
/** Minimum angle to victim required to transmit RunOverWarning (if bUseRunOverWarning=true) */
var	float		MinRunOverWarningAim;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/*********************************************************************************************
* Initialization, Pawn Possession, and Destruction
********************************************************************************************* */

/** Only spawning a PRI for gameplayevents! */
function InitPlayerReplicationInfo()
{
	local KFGameInfo KFGI;
	local string NPCName;

	KFGI = KFGameInfo(WorldInfo.Game);
	if( KFGI != none && KFGI.bEnableGameAnalytics )
	{
		PlayerReplicationInfo = Spawn(class'KFDummyReplicationInfo', self,, vect(0,0,0),rot(0,0,0));
		if ( Pawn != none )
		{
			NPCName = string(Pawn.name);
			NPCName = Repl(NPCName,"KFPawn_Zed","",false);
		}
		else
		{
			NPCName = string(self.name);
			NPCName = Repl(NPCName,"KFAIController_Zed","",false);
		}

		PlayerReplicationInfo.PlayerName = NPCName;

		/* __TW_ANALYTICS_ */
		if(WorldInfo.Game != None && KFGameInfo(WorldInfo.Game).GameplayEventsWriter != None && KFGameInfo(WorldInfo.Game).GameplayEventsWriter.IsSessionInProgress()){KFGameInfo(WorldInfo.Game).GameplayEventsWriter.LogPlayerIntEvent(class'KFGameplayEventsWriter'.const.GAMEEVENT_ZED_SPAWNED,self,0);};
		// don't call SetPlayerName() as that will broadcast entry messages but the GameInfo hasn't had a chance
		// to potentionally apply a player/bot name yet
		//PlayerReplicationInfo.PlayerName = class'GameInfo'.default.DefaultPlayerName;
	}
}

/** Set MyKFPawn to avoid casting */
event Possess( Pawn inPawn, bool bVehicleTransition )
{
	if( KFPawn_Monster(inPawn) != none )
	{
		MyKFPawn = KFPawn_Monster( inPawn );
	}
	else
	{
		WarnInternal(GetFuncName()$"() attempting to possess "$inPawn$", but it's not a KFPawn_Monster class! MyKFPawn variable will not be valid.");
	}

	super.Possess( inPawn, bVehicleTransition );

	if ( MyKFPawn != None )
	{
		// store difficulty based sprint status for frustration mechanic
		bDefaultCanSprint = MyKFPawn.bCanSprint;
	}
}

/*********************************************************************************************
* Notifications & Events
********************************************************************************************* */

/** Re-Enables notifications from TickMeleeCombatDecision() */
function Timer_EnableMeleeRangeEventProbing()
{
	if( !MyKFPawn.IsDoingSpecialMove() )
	{
		EnableMeleeRangeEventProbing();
	}
	else
	{
		// Re-Enable timer once at a time (added 7/2014)
		SetTimer( 0.12f, false, nameof(Timer_EnableMeleeRangeEventProbing), self );
	}
}

/** Notification that enemy is now within Charge attack range, called from TickMeleeCombatDecision() */
event EnemyInMeleeRange()
{
	if( MyKFPawn == none || MyKFPawn.Physics == PHYS_Falling || MyKFPawn.Physics == PHYS_None )
	{
		return;
	}

	if( !IsMeleeRangeEventProbingEnabled() || MyKFPawn.IsDoingSpecialMove() ) // || (MyKFPawn.IsDoingSpecialMove() && !MyKFPawn.IsDoingSpecialMove(SM_ChargeRun)) )
	{
		AILog_Internal(GetFuncName()$"() skipping melee attack because "$Pawn$" is already busy.",'Command_Attack_Melee',);
		return;
	}

	if( (WorldInfo.TimeSeconds - LastGetStrikeTime >= MaxGetStrikeTime || PendingAnimStrikeIndex == 255) && CanDoStrike() )
	{
		UpdatePendingStrike();
		LastGetStrikeTime = WorldInfo.TimeSeconds;

		if( PendingAnimStrikeIndex != 255 )
		{
			DoStrike();
		}
	}
}

/*********************************************************************************************
* Pathfinding
********************************************************************************************* */

/** Set up path constraints and attempt to build a path to Goal actor. Distance is an optional offset. */
event Actor GeneratePathTo( Actor Goal, optional float Distance, optional bool bAllowPartialPath )
{
	local actor PathResult;
	local int i;

	if( bDisablePartialPaths )
	{
		bAllowPartialPath = false;
	}

	AddBasePathConstraints();

	class'Path_TowardGoal'.static.TowardGoal( Pawn, Goal );

	if( bPathAroundDestructiblesICantBreak )
	{
		/** NPC will build path around destructible objects not configured to accept bump damage */
		class'Path_AroundDestructibles'.static.AvoidDestructibles( Pawn, true, true );
		class'Goal_Null'.static.GoUntilBust( Pawn, 2024 );
	}
	else
	{
		class'Goal_AtActor'.static.AtActor( Pawn, Goal, Distance, bAllowPartialPath );
	}
	// Attempt to build the path.
	PathResult = FindPathToward( Goal );
	Pawn.ClearConstraints();

	if( PathResult == None )
	{
		AILog_Internal(GetFuncName()$"() failed to build a path to "$Goal$", offset distance was "$Distance$", bAllowPartialPath was "$bAllowPartialPath,'PathWarning',);
	}

	if( bShowMovePointsDebugInfo )
	{
		for( i = 0; i < RouteCache.Length; i++ )
		{
			DrawDebugStar( RouteCache[i].Location, PathNodeShowRouteCacheCrossSize, PathNodeShowRouteCacheColor.R, PathNodeShowRouteCacheColor.G, PathNodeShowRouteCacheColor.B, true);
			DrawDebugString( RouteCache[i].Location + vect(0,0,5), string(i), , PathNodeShowRouteCacheColor, PathNodeShowRouteCacheNumberLabelDuration);

			if( i > 0 )
			{
				DrawDebugLine( RouteCache[i].Location, RouteCache[i-1].Location, PathNodeShowRouteCacheColor.R, PathNodeShowRouteCacheColor.G, PathNodeShowRouteCacheColor.B, true);
			}
		}
	}

	return PathResult;
}

/*********************************************************************************************
* Combat
**********************************************************************************************/

/** Can this pawn perform a grab attack? */
event bool CanGrabAttack()
{
	local KFPawn_Human KFPH;
	local KFPerk EnemyPerk;
	local KFPawn KFPawnEnemy;
	local float DistSq;
	local vector HitLocation, HitNormal;
	local Actor HitActor;

	// If I'm dead, incapable of grabbing, or have no enemy, or my enemy is a player, or I'm busy doing a melee attack, refuse.
	if( (MyKFPawn == none || !MyKFPawn.bCanGrabAttack || MyKFPawn.Health <= 0) || (Enemy == none) || (Enemy != none && Pawn.IsSameTeam(Enemy)) )
	{
		return false;
	}

	if( IsInState('ZedVictory') )
	{
		return false;
	}

	KFPawnEnemy = KFPawn( Enemy );
	if( KFPawnEnemy == none || !KFPawnEnemy.CanBeGrabbed(MyKFPawn) )
	{
		return false;
	}

	// If I'm crippled, falling, busy doing an attack, or incapacitated, refuse.
	if( MyKFPawn.bIsHeadless || (MyKFPawn.Physics == PHYS_Falling) || IsDoingAttackSpecialMove() || IsInStumble() )
	{
		return false;
	}

	// Check for fakeout perk
	KFPH = KFPawn_Human(Enemy);
	if ( KFPH != none )
	{
		EnemyPerk = KFPH.GetPerk();
		if ( EnemyPerk != none && EnemyPerk.CanNotBeGrabbed() )
		{
			return false;
		}
	}

	if( !bCompletedInitialGrabAttack || (LastAttackTime_Grab == 0.f || ((WorldInfo.TimeSeconds - LastAttackTime_Grab) > MinTimeBetweenGrabAttacks)) )
	{
        // Make sure the enemy's center of mass (location) is within my collision cylinder
		if( Abs(Enemy.Location.Z - Pawn.Location.Z) > Pawn.CylinderComponent.CollisionHeight )
		{
			return false;
		}

		DistSq = VSizeSq(Enemy.Location - Pawn.Location);
		if( DistSq > MinDistanceToPerformGrabAttack * MinDistanceToPerformGrabAttack || MyKFPawn.IsPawnMovingAwayFromMe(Enemy, 300.f) )
		{
			return false;
		}
        // Do the same kind of trace we do in KFSM_GrappleStart
		HitActor = Trace(HitLocation, HitNormal, Enemy.Location, Pawn.Location, true);
		if ( HitActor != None && HitActor != Enemy )
		{
            return false;
		}
		if( !CanTargetBeGrabbed(KFPawnEnemy) )
		{
			return false;
		}
		/** Makes Zed have high desire to grab as initial attack */
		if( !MyKFPawn.IsDoingMeleeAttack() && (!bCompletedInitialGrabAttack || (FRand() < MyKFPawn.GrabAttackFrequency)) ) //&& !MyKFPawn.IsPawnMovingAwayFromMe(Enemy, 250.f) )
		{
			return true;
		}
	}
	AILog_Internal(GetFuncName()$"() returning FALSE",'GrabAttack',);
	return false;
}

function bool CanDoStrike()
{
	local AICommand AIC;
	local actor HitActor;
	local vector TraceStepLocation;
	local vector HitLocation, HitNormal;

	// Used by KFPawnAnimInfo to determine if an attack can be performed if legs are blocked (lunges, etc)
	bIsBodyBlocked = false;

	if( MyKFPawn == none || Enemy == none || IsInState('ZedVictory') )
	{
		return false;
	}

	if( (!MyKFPawn.bIsHeadless && !MyKFPawn.bEmpPanicked && !IsMeleeRangeEventProbingEnabled()) || (MyKFPawn.IsDoingSpecialMove()) )
	{
		AILog_Internal(GetFuncName()$"() skipping melee attack because "$Pawn$" is already busy.",'Command_Attack_Melee',);
		return false;
	}
	AIC = AICommand( GetActiveCommand() );
	if( AIC != none )
	{
		if ( !AIC.bAllowedToAttack )
		{
			AILog_Internal(GetFuncName()$"() refusing to do melee attack because "$AIC$" bAllowedToAttack is FALSE",'Command_Attack_Melee',);
			return false;
		}
		if( AICommand_Pause(AIC) != none )
		{
			return false;
		}
		if( AICommand_TauntEnemy(AIC) != none )
		{
			return false;
		}
	}

	// Check if a wall or another Zed is blocking my pawn from performing a melee attack, ignore zed collision if bCanStrikeThroughEnemies is true, 
	TraceStepLocation = Pawn.Location + (vect(0,0,-1) * (Pawn.CylinderComponent.CollisionHeight * 0.5f));
	HitActor = Pawn.Trace( HitLocation, HitNormal, Enemy.Location, TraceStepLocation, !bCanStrikeThroughEnemies);
	if ( HitActor != None )
	{
		if ( HitActor.bWorldGeometry )
		{
			// Set the body blocked flag so the anim info can check it
			bIsBodyBlocked = true;

			// try again at eyeheight
			HitActor = Pawn.Trace( HitLocation, HitNormal, Enemy.Location + vect(0,0,1) * (Enemy.BaseEyeHeight), Pawn.Location + vect(0,0,1) * (Pawn.BaseEyeHeight), !bCanStrikeThroughEnemies);
		}

		if( HitActor != Enemy )
		{
			// @todo: need to find another path to our enemy!
			return false;
		}
	}

	return true;
}

function DoStrike()
{
	local byte StrikeFlags;

	if( MyKFPawn != none && MyKFPawn.PawnAnimInfo != none )
	{
		StrikeFlags = MyKFPawn.PawnAnimInfo.GetStrikeFlags(PendingAnimStrikeIndex);
		if( StrikeFlags != 255 )
		{
			AILog_Internal(GetFuncName()$"() "$VSize(MyKFPawn.Location - Enemy.Location)$" units from enemy and I DO HAVE AN available attack!",'Command_Attack_Melee',);
			class'AICommand_Attack_Melee'.static.Melee( self, Enemy, StrikeFlags );

			MyKFPawn.PawnAnimInfo.UpdateAttackCooldown(self, PendingAnimStrikeIndex);

			UpdatePendingStrike();
		}
		else
		{
			AILog_Internal(GetFuncName()$"() "$VSize(MyKFPawn.Location - Enemy.Location)$" units from enemy and I have no available attack!",'Command_Attack_Melee',);
		}
	}
}

/** Perform a melee attack AICommand.. InTarget is optional actor to attack (door, etc.) */
function DoMeleeAttack( optional Pawn NewEnemy, optional Actor InTarget, optional byte AttackFlags )
{
	/*
	local AICommand AIC;

	if( MyKFPawn != none && (!MyKFPawn.bIsHeadless && !MyKFPawn.bEmpPanicked && !IsMeleeRangeEventProbingEnabled()) || (MyKFPawn.IsDoingSpecialMove() && !MyKFPawn.IsDoingSpecialMove(SM_ChargeRun)) )
	{
		`AILog( GetFuncName()$"() skipping melee attack because "$Pawn$" is already busy.", 'Command_Attack_Melee' );
		return;
	}
	AIC = AICommand( GetActiveCommand() );
	if( AIC != none )
	{
		if( !AIC.bAllowedToAttack )
		{
			`AILog( GetFuncName()$"() refusing to do melee attack because "$AIC$" bAllowedToAttack is FALSE", 'Command_Attack_Melee' );
			return;
		}
		if( AICommand_Pause(AIC) != none )
		{
			return;
		}
		if( AICommand_TauntEnemy(AIC) != none )
		{
			return;
		}
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
			`AILog( GetFuncName()$"() Aborting movement commands and starting melee attack command", 'Command_Attack_Melee' );
			class'AICommand_Attack_Melee'.static.Melee( self, InTarget, AttackFlags );
		}
		return;
	}

	if( !AICommand(CommandList).bAllowedToAttack )
	{
		`AILog( GetFuncName()$"() refusing to do melee attack because "$CommandList$" bAllowedToAttack is FALSE", 'Command_Attack_Melee' );
	}
	*/
}

/** Called when in melee range but enemy is blocked from me, probably by another Zed */
function bool HandleZedBlockedPath()
{
	local actor HitActor;
	local vector HitLocation, HitNormal;
	local KFPawn_Monster HitMonster;

	HitActor = MyKFPawn.Trace( HitLocation, HitNormal, Enemy.Location + vect(0,0,1) * (Enemy.BaseEyeHeight * 0.5f), MyKFPawn.Location + vect(0,0,1) * (MyKFPawn.BaseEyeHeight * 0.5f), true, MyKFPawn.GetCollisionExtent() * vect(0.2f,0.2f,0.2f) );
	if( HitActor == none || HitActor == Enemy )
	{
		return false;
	}

	// If we hit a monster check HandleEnemyBlocked, otherwise we're good to strike
	HitMonster = KFPawn_Monster(HitActor);
	if( HitMonster != none && HitMonster.Health > 0 )
	{
		if( MyKFPawn == none || MyKFPawn.Health <= 0 || MyKFPawn.IsDoingSpecialMove() )
		{
			return true;
		}

		AILog_Internal(GetFuncName()$" ENEMY IS BLOCKED",'ReachedEnemy',);
		DisableMeleeRangeEventProbing();
		SetTimer( 1.5f + (2.f*FRand()), false, nameof(Timer_EnableMeleeRangeEventProbing), self );
		if( FindNewEnemy() )
		{
			ForcePauseAndRepath();
			return true;
		}

		if( VSize(Enemy.Location - Pawn.Location) < AttackRange && bDirectMoveToGoal )
		{
			if( MyKFPawn.CanDoSpecialMove(SM_Taunt) && FRand() < 0.32 && (WorldInfo.TimeSeconds - LastTauntTime) > 2.f )
			{
				AILog_Internal(GetFuncName()$" starting taunt command",'ReachedEnemy',);
				class'AICommand_TauntEnemy'.static.Taunt( self, KFPawn(Enemy), TAUNT_Standard );
			}
 			else
 			{
				AILog_Internal(GetFuncName()$" starting pauseAI command",'ReachedEnemy',);
				DoPauseAI( 1.f + (3.f * FRand()), true );
			}
			return true;
		}
	}
	return false;
}

defaultproperties
{
   MinDistanceToPerformGrabAttack=188.000000
   MinTimeBetweenGrabAttacks=5.000000
   DifficultyDamageMod=1.000000
   DefaultCommandClass=Class'KFGame.AICommand_Base_Zed'
   bIsPlayer=False
   SightCounterInterval=0.350000
   Name="Default__KFAIController_Monster"
   ObjectArchetype=KFAIController'KFGame.Default__KFAIController'
}
