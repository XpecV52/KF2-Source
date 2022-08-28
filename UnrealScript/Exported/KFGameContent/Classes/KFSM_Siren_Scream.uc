//=============================================================================
// KFSM_Siren_Scream
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFSM_Siren_Scream extends KFSM_PlaySingleAnim;

/** Cached pawn reference */
var KFPawn_ZedSiren MySirenPawn;

/** The frequency to do scream damage at */
var float			ScreamDamageFrequency;

/** The number of times damage has been dealt by a single scream */
var byte 			ScreamCount;

/** Last time a scream was executed */
var float 			LastScreamTime;

/** Maximum number of times a scream can deal damage */
const DAMAGE_COUNT_PER_SCREAM = 4;

/** How much base damage a scream does */
var protected const int ScreamDamage;

/** Temp reference to the explosion template, used for delayed damage */
var GameExplosion ExplosionTemplate;

var const class<GameExplosionActor> ExplosionActorClass;

/** Set to TRUE when the scream ends on its own (not interrupted) */
var bool bEndedNormally;

/** Stop event played when this scream was interrupted too early */
var AkEvent ScreamInterruptSound;

/** The explosion actor to store when this projectile is created */
var GameExplosionActor ExplosionActor;

/** Debugging Siren Sonic Wave */
var bool            bDrawWaveRadius;
var bool			bDrawProjectileShield;

var KFTrigger_SirenProjectileShield ProjectileShield;
var const	float	ProjectileShieldLifetime;

/**
 * Can a new special move override this one before it is finished?
 * This is only if CanDoSpecialMove() == TRUE && !bForce when starting it.
 */
function bool CanOverrideMoveWith( Name NewMove )
{
	if ( bCanBeInterrupted && (NewMove == 'KFSM_Stunned' || NewMove == 'KFSM_Stumble' || NewMove == 'KFSM_Knockdown' || NewMove == 'KFSM_Frozen') )
	{
		return TRUE;
	}
	return FALSE;
}

/**
 * Can the special move be chained after the current one finishes?
 */
function bool CanChainMove( Name NextMove )
{
	if( NextMove == 'KFSM_MeleeAttack' )
	{
		return true;
	}

	return super.CanChainMove( NextMove );
}

function SpecialMoveStarted( bool bForced, name PrevMove )
{
	super.SpecialMoveStarted( bForced, PrevMove );

	bEndedNormally = false;

	if( MySirenPawn == none )
	{
		MySirenPawn = KFPawn_ZedSiren( KFPOwner );
	}

	LastScreamTime = MySirenPawn.WorldInfo.TimeSeconds;

	//ShieldDestroyTime = KFSkeletalMeshComponent(KFPOwner.Mesh).GetAnimInterruptTime( AnimName );
	KFPOwner.SetTimer( ProjectileShieldLifetime, false, nameof(Timer_DestroyProjectileShield), self );

	if( AIOwner != none )
	{
		if( !class'Engine'.static.GetEngine().bDIsableAILogging && AIOwner!= None ) { AIOwner.AILog_Internal(KFPOwner@"started for"@AIOwner,'Siren'); };
	}
}

/** Triggers the start of the Siren's scream attack */
function ScreamBegan()
{
	if( bDrawWaveRadius || bDrawProjectileShield )
	{
	   KFPOwner.FlushPersistentDebugLines();
	}

	SpawnProjectileShield();
	InitializeSirenExplosion();
}

/** Create and initialize projectile shield */
function SpawnProjectileShield()
{
	local vector vExtent;

	if( KFPOwner.Role == ROLE_Authority && ProjectileShield == none )
	{
		// Spawn projectile shield, which can stop projectiles before hitting the Siren
		ProjectileShield = KFPOwner.Spawn( class'KFTrigger_SirenProjectileShield', KFPOwner,, KFPOwner.Location, KFPOwner.Rotation );
		ProjectileShield.SetBase( KFPOwner );
		ProjectileShield.SetRelativeLocation( vect(0,0,0) );
		vExtent = vect( 0,0,1 ) * ProjectileShield.CylinderComponent.CollisionHeight;
		// Renders the projectile shield's collision cylinder
		if( bDrawProjectileShield )
		{
			KFPOwner.DrawDebugCylinder( ProjectileShield.Location - vExtent, ProjectileShield.Location + vExtent, ProjectileShield.CylinderComponent.CollisionRadius, 10, 255, 0, 0, true );
		}
	}

	// Flicker neck light as a visual cue
	if( MySirenPawn != none )
	{
		MySirenPawn.EnableScreamFlicker( true );
	}	
}

/** Destroys the projectile shield based on position in animation */
function Timer_DestroyProjectileShield()
{
	DestroyProjectileShield();
}

/** Destroy and clear proectile shield */
function DestroyProjectileShield()
{
	if( ProjectileShield != none )
	{
		ProjectileShield.Destroy();
		ProjectileShield = none;

		if( bDrawProjectileShield )
		{
			// Clear debug rendering of projectile shield
			KFPOwner.FlushPersistentDebugLines();
		}
	}

	// Yurn off flicker when projectile shield goes down
	if( MySirenPawn != none )
	{
		MySirenPawn.EnableScreamFlicker( false );
	}	
}

/** Set up the sirens ExplosionActor when she screams */
function InitializeSirenExplosion()
{
	if( KFPOwner.Role == ROLE_Authority && ExplosionTemplate != None )
	{
		ExplosionActor = KFPOwner.Spawn(ExplosionActorClass, KFPOwner,, KFPOwner.Location, KFPOwner.Rotation);
		if (ExplosionActor != None)
		{
			ExplosionActor.Instigator = KFPOwner;
			ExplosionActor.InstigatorController = KFPOwner.Controller;
			ExplosionActor.SetBase(KFPOwner);

			// Deal explosion damage instantly and over time
			ScreamExplosion();
    		KFPOwner.SetTimer(ScreamDamageFrequency, True, nameof(ScreamExplosion), self);
		}
	}
}

/** Called on a timer to deal damage in a radius */
function ScreamExplosion()
{
	if( !KFPOwner.IsCombatCapable() )
	{
		KFPOwner.EndSpecialMove();
		return;
	}

	LastScreamTime = KFPOwner.WorldInfo.TimeSeconds;

	ExplosionTemplate.Damage = KFPawn_Monster(KFPOwner).GetRallyBoostDamage( ScreamDamage );
	ExplosionActor.Explode(ExplosionTemplate);		// go bewm

	ScreamCount++;
	if( ScreamCount >= DAMAGE_COUNT_PER_SCREAM )
	{
		bEndedNormally = true;
		KFPOwner.EndSpecialMove();
	}
}

function CheckIfScreamWasInterrupted()
{
	if( !bEndedNormally && LastScreamTime > 0.f && KFPOwner.WorldInfo.TimeSeconds - LastScreamTime < 1.0f )
	{
		KFPOwner.PlayAkevent( ScreamInterruptSound, false, true );
	}
}

function SpecialMoveEnded(Name PrevMove, Name NextMove)
{
	super.SpecialMoveEnded( PrevMove, NextMove );

	CheckIfScreamWasInterrupted();

	KFPOwner.ClearTimer(nameof(ScreamExplosion), self);
	ScreamCount = 0;

	DestroyProjectileShield();

	if (ExplosionActor != none)
	{
		ExplosionActor.Destroy();
		ExplosionActor = none;
	}

	if( AIOwner != none )
	{
		if( !class'Engine'.static.GetEngine().bDIsableAILogging && AIOwner!= None ) { AIOwner.AILog_Internal(KFPOwner@"ended for"@AIOwner,'Siren'); };
	}
}

defaultproperties
{
   ScreamDamageFrequency=0.500000
   ScreamDamage=15
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFSM_Siren_Scream:ExploTemplate0'
   ExplosionActorClass=Class'kfgamecontent.KFExplosion_SirenScream'
   ScreamInterruptSound=AkEvent'WW_ZED_Siren.Stop_Siren_Scream'
   ProjectileShieldLifetime=2.200000
   AnimName="Atk_Combo1_V1"
   AnimStance=EAS_UpperBody
   bCanBeInterrupted=True
   bDisableSteering=False
   Handle="KFSM_Siren_Scream"
   Name="Default__KFSM_Siren_Scream"
   ObjectArchetype=KFSM_PlaySingleAnim'KFGame.Default__KFSM_PlaySingleAnim'
}
