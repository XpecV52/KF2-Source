//=============================================================================
// KFAIController_ZedClot
//=============================================================================
// Base controller for the Alpha, Slasher, and Cyst Clots
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFAIController_ZedClot extends KFAIController_Monster
	abstract
	native(AI);

cpptext
{
	/** Overridden to allow grab attack check */
	virtual UBOOL TickMeleeCombatDecision( FLOAT DeltaTime );
}

/*********************************************************************************************
* Notifications & Events
********************************************************************************************* */

/** Notification I'm about to be run into by a Zed which has bUseRunOverWarning set to true */
event RunOverWarning( KFPawn IncomingKFP, float IncomingSpeed, vector IncomingDir )
{
	if( CanEvade() )
	{
		DoEvade( GetBestEvadeDir( IncomingKFP.Location, IncomingKFP, true ),,, true );
	}
}

/*********************************************************************************************
* Movement Methods
********************************************************************************************* */

/*function UpdateSprintFrustration( optional byte bForceFrustration=255 )
{
	local name AttackTag;

	if( MyKFPawn != none && MyKFPawn.IsAliveAndWell() && Enemy != none && Enemy.IsAliveAndWell() )
	{
		// Sprint if we've reached the frustration threshold (and not in melee range)
		if( bForceFrustration == 1 || (IsFrustrated() && bForceFrustration != 0) )
		{
			if( Enemy.Velocity dot (Pawn.Location - Enemy.Location) < 0.f )
			{
				if( !MyKFPawn.InAnyAttackTagRange(Enemy.Location, AttackTag) )
				{
					super.UpdateSprintFrustration(1);
				}
			}
			else if( !MyKFPawn.InAnyAttackTagRange(Enemy.Location, AttackTag) )
			{
				super.UpdateSprintFrustration(1);
			}
			else
			{
				MyKFPawn.bCanSprint = false;
				MyKFPawn.bCanSprintWhenDamaged = MyKFPawn.default.bCanSprintWhenDamaged;
			}
		}
		else
		{
			super.UpdateSprintFrustration(0);
		}		
	}
}

function bool ShouldSprint()
{
	local name AttackTag;

	if( MyKFPawn != none && MyKFPawn.IsAliveAndWell() && Enemy != none && Enemy.IsAliveAndWell() )
	{
		// Sprint if we've reached the frustration threshold (and not in melee range)
		if( IsFrustrated() )
		{
			if( Enemy.Velocity dot ( Pawn.Location - Enemy.Location ) < 0.f )
			{
				if( !MyKFPawn.InAnyAttackTagRange(Enemy.Location, AttackTag) )
				{
					return true;
				}
			}
			else if( !MyKFPawn.InAnyAttackTagRange(Enemy.Location, AttackTag) )
			{
				return true;
			}
		}
		else if( MyKFPawn.bCanSprint || (MyKFPawn.bCanSprintWhenDamaged && MyKFPawn.Health < MyKFPawn.HealthMax) )
		{
			return true;
		}
	}

	return false;
}*/

/** Timer function called during latent moves that determines whether NPC should sprint or stop sprinting */
function bool ShouldSprint()
{
	if( MyKFPawn != none && MyKFPawn.IsAliveAndWell() && Enemy != none && Enemy.IsAliveAndWell() )
	{
		if( bCanSprint || (bCanSprintWhenDamaged && MyKFPawn.Health < MyKFPawn.HealthMax) )
		{
			return true;
		}
	}

	return false;
}

/*********************************************************************************************
* Combat
**********************************************************************************************/

function bool CanDoStrike()
{
	// Prioritize a grab over doing a strike
	if( CanGrabAttack() )
	{
		return false;
	}

	return super.CanDoStrike();
}

/** Launch a grab attack */
event DoGrabAttack( optional Pawn NewEnemy, optional Actor InTarget, optional float InPostSpecialMoveSleepTime=0.f )
{
	if( CommandList == None || AICommand(CommandList).bAllowedToAttack )
	{
		if (NewEnemy != None)
		{
			SetEnemy( NewEnemy );
		}
		ClearMovementInfo( true, "Aborted For GrabAttack" );
		`AILog( GetFuncName()$"() Init AICommand_Attack_Grab", 'InitAICommand' );
		class'AICommand_Attack_Grab'.static.Grab( self, KFPawn(InTarget), InPostSpecialMoveSleepTime );
	}
	else if( CommandList != none && !AICommand(CommandList).bAllowedToAttack )
	{
		`AILog( GetFuncName()$"() not doing grab attack because current command ("$CommandList$") will not allow it", 'GrabAttack' );
	}
}


/*
function DoMeleeAttack( optional Pawn NewEnemy, optional Actor InTarget, optional byte AttackFlags )
{
	local float DistSq;

	if( CommandList == None || AICommand(CommandList).bAllowedToAttack )
	{
		DistSq = VSizeSq( Enemy.Location - Pawn.Location );

		if( DistSq < 32400.f || DistSq > 10000.f )
		{
			if( CanGrabAttack() )
			{
			//	DumpCommandStack();
				DoGrabAttack();
				return;
			}
		}
	}
	//super.NewDoMeleeAttack( NewEnemy, inTarget, AttackFlags );
	super.DoMeleeAttack( NewEnemy, inTarget, AttackFlags );
}
*/

DefaultProperties
{
	// ---------------------------------------------
	// Combat
	MeleeCommandClass=class'AICommand_Base_Zed'
	DefaultCommandClass=class'AICommand_Base_Zed'
	bIsProbingMeleeRangeEvents=true
	// ---------------------------------------------
	// AI / Navigation
	SprintWithinEnemyRange=(X=600.f,Y=1200.f)
	// To be enabled!
	//bPathAroundDestructiblesICantBreak=true
}

