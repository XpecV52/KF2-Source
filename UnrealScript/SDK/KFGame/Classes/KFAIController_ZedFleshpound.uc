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

cpptext
{
	virtual void Initialize();
	virtual UBOOL Tick(FLOAT DeltaTime, enum ELevelTick TickType);
	virtual UBOOL ShouldIgnoreNavigationBlockingFor(const AActor* Other);
}

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
		`AILog( GetFuncName()$" Just saw my enemy for first time, starting RageFrustrationTimer", 'SeePlayer' );
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
		`AILog( GetFuncName()$" Just started targeting a new enemy ("$NewEnemy$"), clearing RageFrustrationTimer", 'SeePlayer' );
		bSawEnemy = false;
		EnableSeePlayer();
		RagePlugin.StartRageTimer();
	}

	return bNewEnemySet;
}

/*********************************************************************************************
* Combat
**********************************************************************************************/

/*********************************************************************************************
* Enraged!
********************************************************************************************* */

/** Start up the pre-charge Taunt */
function DoRageTauntAt( optional KFPawn Target )
{
	if( Role == ROLE_Authority )
	{
		`SafeDialogManager.PlaySpotEnragedDialog( MyKFPawn );
	}

	`AILog( GetFuncName()$"() at "$Target, 'Command_Rage' );
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
		`warn( Pawn$" became enraged with no AICommand!" );
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

DefaultProperties
{
	// ---------------------------------------------
	// AI / Navigation
    bCanTeleportCloser=false
	RotationRate=(Pitch=50000,Yaw=50000,Roll=50000)
	SprintWithinEnemyRange=(X=0,Y=1500.f)
	//MinHitWall=1.f = no hitwall
	MinHitWall=-0.42
	ChargeStuckCheckDistance=10.0f
	ChargeStuckCheckInterval=0.25f
	bUseRunOverWarning=true
	MinRunOverSpeed=150.f
	MinRunOverWarningAim=0.88f
	EvadeGrenadeChance=0.6f
	FrustrationThreshold=5

	//DefaultBehavior="FleshpoundMain2"
	//UsedETQQueries[ENQ_EnemySelection]="BaseZedEnemySelection"

	// ---------------------------------------------
	// Combat
	DefaultCommandClass=class'AICommand_Base_Fleshpound'
	bIsProbingMeleeRangeEvents=true
	MeleeCommandClass=class'AICommand_Base_Fleshpound'
	bCanDoHeavyBump=true

	RagePluginClass=class'KFAIPluginRage_Fleshpound'

	// ---------------------------------------------
	// Debug
	bDebugLeaveTargetAngleThreshold=false
	bNotifyApex=true

	TeleportCooldown=10.0
	HiddenRelocateTeleportThreshold=7.0
}
