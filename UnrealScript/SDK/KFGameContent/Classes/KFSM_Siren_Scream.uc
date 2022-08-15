//=============================================================================
// KFSM_SirenScream
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFSM_Siren_Scream extends KFSM_PlaySingleAnim;

var float			ScreamDamageFrequency;

/** The number of times damage has been dealt by a single scream */
var byte 			ScreamCount;

/** Maximum number of times a scream can deal damage */
const DAMAGE_COUNT_PER_SCREAM = 4;

/** Temp reference to the explosion template, used for delayed damage */
var GameExplosion ExplosionTemplate;

var const class<GameExplosionActor> ExplosionActorClass;

/** The explosion actor to store when this projectile is created */
var GameExplosionActor ExplosionActor;

/** Debugging Siren Sonic Wave */
var bool            bDrawWaveRadius;
var bool			bDrawProjectileShield;

var KFTrigger_SirenProjectileShield ProjectileShield;

/**
 * Can a new special move override this one before it is finished?
 * This is only if CanDoSpecialMove() == TRUE && !bForce when starting it.
 */
function bool CanOverrideMoveWith( Name NewMove )
{
	if ( bCanBeInterrupted && (NewMove == 'KFSM_Stunned' || NewMove == 'KFSM_Stumble' || NewMove == 'Knockdown') )
	{
		return TRUE;
	}
	return FALSE;
}

function SpecialMoveStarted( bool bForced, name PrevMove )
{
	local float ShieldDestroyTime;

	super.SpecialMoveStarted( bForced, PrevMove );	

	ShieldDestroyTime = KFSkeletalMeshComponent(KFPOwner.Mesh).GetAnimInterruptTime( AnimName );
	KFPOwner.SetTimer( ShieldDestroyTime, false, nameof(Timer_DestroyProjectileShield), self );
	
	if( AIOwner != none )
	{
		`AILog_Ext( KFPOwner@"started for"@AIOwner, 'Siren', AIOwner );
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
}

/** Set up the sirens ExplosionActor when she screams */
function InitializeSirenExplosion()
{
	if (ExplosionTemplate != None)
	{
		ExplosionActor = KFPOwner.Spawn(ExplosionActorClass, KFPOwner,, KFPOwner.Location, KFPOwner.Rotation);
		if (ExplosionActor != None)
		{
			ExplosionActor.Instigator = KFPOwner;
			ExplosionActor.InstigatorController = KFPOwner.Controller;

			// Deal explosion damage instantly and over time
			ScreamExplosion();
    		KFPOwner.SetTimer(ScreamDamageFrequency, True, nameof(ScreamExplosion), self);
		}
	}
}

/** Called on a timer to deal damage in a radius */
function ScreamExplosion()
{
	if( !KFPOwner.IsAliveAndWell() || KFPawn_Monster(KFPOwner).IsImpaired() )
	{
		KFPOwner.EndSpecialMove();
		return;
	}

	ExplosionActor.Explode(ExplosionTemplate);		// go bewm

	ScreamCount++;
	if( ScreamCount >= DAMAGE_COUNT_PER_SCREAM )
	{
		KFPOwner.EndSpecialMove();
	}
}

function SpecialMoveEnded(Name PrevMove, Name NextMove)
{
	super.SpecialMoveEnded( PrevMove, NextMove );
	
	KFPOwner.ClearTimer(nameof(ScreamExplosion), self);
	ScreamCount = 0;

	DestroyProjectileShield();

	if( AIOwner != none )
	{
		`AILog_Ext( KFPOwner@"ended for"@AIOwner, 'Siren', AIOwner );
	}
}

DefaultProperties
{
	// SpecialMove
	AnimName=Atk_Combo1_V1
	Handle=KFSM_SirenScream
	bDisableSteering=false
	bDisableMovement=false
   	AnimStance=EAS_UpperBody
   	bCanBeInterrupted=true

	ScreamDamageFrequency=1.0f

   	bDrawProjectileShield=false
	bDrawWaveRadius=false

	ExplosionActorClass=class'KFExplosion_SirenScream'

	// explosion
	Begin Object Class=KFGameExplosion Name=ExploTemplate0
		Damage=18	// Taking Radial Damage will round this down to 5 when you are as close as possible
		DamageRadius=800
		DamageFalloffExponent=1f
		DamageDelay=0.f

		MomentumTransferScale=0//-100000 Reactivate this to add siren pull

		ActorClassToIgnoreForDamage=class'KFPawn_Monster'

		// Damage Effects
		MyDamageType=class'KFDT_Sonic'
		KnockDownStrength=0
		FractureMeshRadius=200.0
		FracturePartVel=500.0
		ExplosionEffects=none
		ExplosionSound=none

		// Camera Shake
		CamShake=CameraShake'FX_CameraShake_Arch.Misc_Explosions.SirenScream'
		CamShakeInnerRadius=450
		CamShakeOuterRadius=900
		CamShakeFalloff=1.f
		bOrientCameraShakeTowardsEpicenter=true
	End Object
	ExplosionTemplate=ExploTemplate0
}
