//=============================================================================
// KFAIController_ZedFleshpound
//=============================================================================
// Base controller for the Fleshpound
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFAIController_ZedFleshpound extends KFAIController_Monster
	native(AI);

/*********************************************************************************************
* Charge Related, this is mostly temporary - only Location & directcharge might be
* necessary
**********************************************************************************************/

/** Last time			charge actor/location was updated */
var float				LastChargeStuckCheckTime;
var vector				LastChargeStuckCheckLocation;
var float				ChargeStuckCheckInterval;
var int					ChargeStuckCount;
var float				ChargeStuckCheckDistance;
var bool				bReadyToBecomeEnraged;
var float				LastKickClotTime;

/*********************************************************************************************
* Combat Related
********************************************************************************************* */

/** Set to true when seeing assigned enemy for the first time - starts frustration timer */
var bool	bSawEnemy;

var instanced KFAIPluginRage_Fleshpound RagePlugin;
var class<KFAIPluginRage_Fleshpound> RagePluginClass;

/*********************************************************************************************
* Debug
********************************************************************************************* */

var bool	bDebugLeaveTargetAngleThreshold;
/** Location of charge actor when info was gathered */
var Vector ChargePivot;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/*********************************************************************************************
* Base
**********************************************************************************************/

native function CleanUp(optional bool bBeingDestroyed);

/** Override to tick plugins */
simulated function Tick( FLOAT DeltaTime )
{
	Super.Tick(DeltaTime);

	if( RagePlugin != none )
	{
		RagePlugin.TickRage();
	}
}

function bool AmIAllowedToSuicideWhenStuck()
{
	return false;
}

/*********************************************************************************************
* Movement
**********************************************************************************************/

/**
 * Testing mostly duplicated from KFAICMC, with additional check for charge. Was going to change this more to make other
 * FleshPound specific considerations
 */
event bool FindNewEnemy()
{
	local Pawn BestEnemy;
	local float BestDist, NewDist;
	local Controller         C;
	local Pawn PotentialEnemy;

	foreach WorldInfo.AllControllers( class'Controller', C )
	{
		if( C.Pawn == none || !C.Pawn.IsAliveAndWell() || Pawn.IsSameTeam( C.Pawn ) ||
            !C.Pawn.CanAITargetThisPawn(self) )
		{
			continue;
		}

		PotentialEnemy = C.Pawn;
		NewDist = VSizeSq( PotentialEnemy.Location - Pawn.Location );

		if( BestEnemy == none )
		{
			BestEnemy = PotentialEnemy;
			BestDist = NewDist;
		}

		else if( BestEnemy != none )
		{
			if( (BestDist > NewDist) || (NumberOfZedsTargetingPawn( PotentialEnemy ) < NumberOfZedsTargetingPawn( BestEnemy )) )
			{
				BestEnemy = PotentialEnemy;
				BestDist = NewDist;
			}
		}
	}

	if( Enemy != none && BestEnemy != none && BestEnemy == Enemy )
	{
		return false;
	}

	if( BestEnemy != none )
	{
		ChangeEnemy( BestEnemy );

		return HasValidEnemy();;
	}

	return false;
}

/** End rage if we hit a target with our attack */
function NotifyMeleeDamageDealt()
{
	super.NotifyMeleeDamageDealt();

	// Don't end rage mode if in wave frustration mode. RAGE FOREVER ROWR!
	if( !IsFrustrated() && RagePlugin != none )
	{
		// unless fp was stumbled (e.g. successful parry), end rage and clear frustration
		if ( MyKFPawn.SpecialMove != SM_Stumble )
		{
			RagePlugin.EndRage();
		}
	}
}

/** Start enrage if we've taken enough damage */
function AddTakenDamage( Controller DamagerController, int Damage, Actor DamageCauser, class<KFDamageType> DamageType )
{
	super.AddTakenDamage( DamagerController, Damage, DamageCauser, DamageType );

	//if( MyBlackBoard != none )
	//{
	//	MyBlackBoard.SetWSPropFloat(WSKP_AccumulatedDamage, MyBlackBoard.GetWSPropFloat(WSKP_AccumulatedDamage) + Damage);
	//}

	if( RagePlugin != none )
	{
		RagePlugin.AccumulatedDOT += Damage;
	}
}

event AttitudeStateChanged( name NewState )
{
	if( MyKFPawn == none )
	{
		return;
	}

	switch( NewState )
	{
		case 'Enraged':
			MyKFPawn.SetEnraged( true );
			break;
		case 'Normal':
			//MyBlackBoard.SetWSPropFloat(WSKP_AccumulatedDamage, 0);
			MyKFPawn.SetEnraged( false );
			break;
	}
}

function bool CanEvadeGrenade()
{
	return !IsEnraged() && super.CanEvadeGrenade();
}

/** True if my KFP is enraged */
simulated event bool IsEnraged()
{
	return( MyKFPawn != none && MyKFPawn.IsEnraged() );
}

/** Fleshpounds only sprint when Enraged */
function bool ShouldSprint()
{
	if( MyKFPawn != none && MyKFPawn.IsEnraged() )
	{
		return true;
	}

	return false;
}

/** Fleshpounds aren't concerned with steering away from other KFPawn_Monster classes */
simulated function StartSteering()
{
}

function RestoreCollisionSize()
{
	Pawn.SetCollisionSize( 36,  Pawn.default.CylinderComponent.CollisionHeight );
}

/*********************************************************************************************
* Sight/Hearing
********************************************************************************************* */

/** Overridden to begin getting frustrated after seeing current enemy */
event SeePlayer( Pawn Seen )
{
	// Start the rage plugin timer (or rage immediately, depending on how long it's been since seeing the player)
	if( !bSawEnemy && Seen == Enemy )
	{
		bSawEnemy = true;
		AILog_Internal(GetFuncName()$" Just saw my enemy for first time, starting RageFrustrationTimer",'SeePlayer',);
		RagePlugin.StartRageTimer(true);
	}

	super.SeePlayer( Seen );
}

/** Overridden to reset frustration when enemy changes */
event bool SetEnemy( Pawn NewEnemy )
{
	local bool bNewEnemySet;

	bNewEnemySet = super.SetEnemy( NewEnemy );

	// If enemy changed, reset frustration related properties
	if( bNewEnemySet )
	{
		AILog_Internal(GetFuncName()$" Just started targeting a new enemy ("$NewEnemy$"), clearing RageFrustrationTimer",'SeePlayer',);
		bSawEnemy = false;
		EnableSeePlayer();
		RagePlugin.StartRageTimer();
	}

	return bNewEnemySet;
}

/*********************************************************************************************
* Combat
**********************************************************************************************/

native function bool CanMeleeAttack();

/*********************************************************************************************
* Enraged!
********************************************************************************************* */

/** Start up the pre-charge Taunt */
function DoRageTauntAt( optional KFPawn Target )
{
	if( Role == ROLE_Authority )
	{
		if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlaySpotEnragedDialog( MyKFPawn );
	}

	AILog_Internal(GetFuncName()$"() at "$Target,'Command_Rage',);
	class'AICommand_TauntEnemy'.static.Taunt( self, Enemy, TAUNT_Enraged );
}

/** Notification that the Fleshpound's enraged mode has changed */
function NotifyEnraged( bool bEnraged )
{
	if( CachedAICommandList != none )
	{
		CachedAICommandList.NotifyCombatBehaviorChange( 'Enraged', bEnraged );
	}
	else
	{
		WarnInternal(Pawn$" became enraged with no AICommand!");
	}
}

/** Frustration mode should not change sprint settings on FP */
function UpdateSprintFrustration( optional byte bForceFrustration=255 )
{
}

/** We only want the FP to never stop raging once it starts in frustration mode */
function bool IsFrustrated()
{
	if( FrustrationThreshold > 0 && MyKFGameInfo.MyKFGRI != None && MyKFGameInfo.MyKFGRI.AIRemaining <= FrustrationThreshold )
	{
		return true;
	}

	return false;
}

defaultproperties
{
   ChargeStuckCheckInterval=0.250000
   ChargeStuckCheckDistance=10.000000
   RagePluginClass=Class'KFGame.KFAIPluginRage_Fleshpound'
   bUseRunOverWarning=True
   MinRunOverSpeed=150.000000
   MinRunOverWarningAim=0.880000
   bCanTeleportCloser=False
   bCanDoHeavyBump=True
   bIsProbingMeleeRangeEvents=True
   DefaultCommandClass=Class'KFGame.AICommand_Base_Fleshpound'
   MeleeCommandClass=Class'KFGame.AICommand_Base_Fleshpound'
   SprintWithinEnemyRange=(X=0.000000,Y=1500.000000)
   TeleportCooldown=10.000000
   HiddenRelocateTeleportThreshold=7.000000
   EvadeGrenadeChance=0.600000
   bNotifyApex=True
   MinHitWall=-0.420000
   Name="Default__KFAIController_ZedFleshpound"
   ObjectArchetype=KFAIController_Monster'KFGame.Default__KFAIController_Monster'
}
