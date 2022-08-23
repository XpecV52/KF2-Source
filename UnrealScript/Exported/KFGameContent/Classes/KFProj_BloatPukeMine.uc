//=============================================================================
// KFProj_BloatPukeMine
//=============================================================================
// Projectile class for bloat puke mine
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFProj_BloatPukeMine extends KFProjectile;

/** Steepest a slope can be for the mine to stick */
const MINMINEFLOORZ = 0.8f;

/** Ground FX template */
var ParticleSystem GroundFXTemplate;

/** Burst FX template */
var ParticleSystem BurstFXTemplate;

/** Cached team number, because players can switch teams */
var byte TeamNum;

/** How much damage the mine can take before exploding */
var int Health;

/** Dampen amount for every bounce */
var float DampenFactor;

/** Dampen amount for parallel angle to velocity */
var float DampenFactorParallel;

/** How much to offset the mine when spawning inside of collision */
var float SpawnCollisionOffsetAmt;

/** Vector to offset the ground FX particle system by when landing */
var vector LandedFXOffset;

/** Armed mine collision settings */
var float ExplodeTriggerRadius, ExplodeTriggerHeight;

/** Sound mine makes when it hits something and bounces off */
var AkEvent BounceAkEvent;

/** Sound mine makes when it hits something and comes to rest */
var AkEvent ImpactAkEvent;

/** Decal settings */
var MaterialInterface ImpactDecalMaterial;
var float ImpactDecalWidth;
var float ImpactDecalHeight;
var float ImpactDecalThickness;

/** How long the mine can exist before exploding */
var float FuseDuration;

/** Tells clients to trigger an explosion */
var repnotify bool bClientExplode;

/** Whether we've triggered a fade out */
var bool bFadingOut;

/** How long it should take to fade out this mine */
var float FadeOutTime;

/** Maximum number of times this mine can bounce */
var const int MaxBounces;
var int NumBounces;

replication
{
	if( bNetDirty )
		bClientExplode;
}

simulated event ReplicatedEvent( name VarName )
{
	if( VarName == nameOf(bClientExplode) )
	{
		TriggerExplosion( Location, vect(0,0,1), none );
	}
	else
	{
		super.ReplicatedEvent( VarName );
	}
}

/** Adds our puke mine to the pool */
simulated event PostBeginPlay()
{
	local vector Hitlocation, HitNormal;

	// Cache team num
	TeamNum = GetTeamNum();

	super.PostBeginPlay();

	if( WorldInfo.NetMode != NM_Client )
	{		
		if( InstigatorController != none || IsAIProjectile() )
		{
			class'KFGameplayPoolManager'.static.GetPoolManager().AddProjectileToPool( self, PPT_PukeMine );
		}
		else
		{
			Destroy();
			return;
		}
	}

	if( Role == ROLE_Authority )
	{
		// If we're spawning in collision for some reason, offset it towards the instigator to keep it in play
		Instigator.Trace( HitLocation, HitNormal, Location, Instigator.Location, false,,, TRACEFLAG_Bullet );
		if( !IsZero(HitLocation) )
		{
			SetLocation( HitLocation + HitNormal*SpawnCollisionOffsetAmt );
		}

		SetTimer( FuseDuration, false, nameOf(Timer_Explode) );
	}
}

/** Overridden to do nothing */
simulated function Shutdown() {}
simulated protected function StopSimulating() {}
simulated function Explode( vector HitLocation, vector HitNormal ) {}

/** Give a little bounce */
simulated event HitWall( vector HitNormal, Actor Wall, PrimitiveComponent WallComp )
{
	// Don't collide with other puke mines
	if( Wall.class == class )
	{
		return;
	}

	if( CanStick(Wall, HitNormal) )
	{
		Stick( Location, HitNormal );
	}
	else
	{
		Bounce( HitNormal, Wall );
	}
}

simulated protected function bool CanStick( Actor HitActor, out vector HitNormal )
{
	// Basic slope check
	if( HitNormal.Z < MINMINEFLOORZ )
	{
		return false;
	}

	return true;
}

simulated event Bump( Actor Other, PrimitiveComponent OtherComp, Vector HitNormal )
{
	if( Other.bWorldGeometry || Other.bStatic )
	{
		HitWall( HitNormal, Other, OtherComp );
	}
}

/** Adjusts movement/physics of projectile.
  * Returns true if projectile actually bounced / was allowed to bounce */
simulated function bool Bounce( vector HitNormal, Actor BouncedOff )
{
	local vector VNorm;

	// Avoid crazy bouncing
	if( LastBounced.Actor != none && BouncedOff != none && BouncedOff == LastBounced.Actor && (WorldInfo.TimeSeconds - LastBounced.Time) < 0.1f )
	{
		return false;
	}

    // Reflect off BouncedOff w/damping
    VNorm = (Velocity dot HitNormal) * HitNormal;
    Velocity = -VNorm * DampenFactor + (Velocity - VNorm) * DampenFactorParallel;
    Speed = VSize(Velocity);

	if( Speed < 40 )
	{
		Stick( Location, HitNormal );
		return false;
	}

	// also done from ProcessDestructibleTouchOnBounce. update LastBounced to solve problem with bouncing rapidly between world/non-world geometry
	LastBounced.Actor = BouncedOff;
	LastBounced.Time = WorldInfo.TimeSeconds;

	// Play a sound
	PlayImpactSound();

	return true;
}

/** Called once the mine has finished moving */
simulated function Stick( vector StuckLocation, vector StuckNormal )
{
	local vector HitLocation, HitNormal;
	local rotator StuckRotation;
	local KFProj_BloatPukeMine PukeMine;
	local rotator RandRot;

	SetPhysics( PHYS_None );
	RotationRate = rot(0,0,0);

    // Modify the collision so it can be detonated by the player
    CylinderComponent.SetTraceBlocking( true, true );
	SetCollisionSize( ExplodeTriggerRadius, ExplodeTriggerHeight );
	CylinderComponent.SetActorCollision( true, false );
	bCollideComplex = false;
	bBounce = false;

	// Optimize for network 
	NetUpdateFrequency = 0.25f;
	bOnlyDirtyReplication = true;
	bForceNetUpdate = true;

	// Set rotation
	Trace( HitLocation, HitNormal, Location - vect(0,0,50), Location + vect(0,0,5), false,,, TRACEFLAG_Bullet );
	if( !IsZero(HitLocation) )
	{
		StuckRotation = rotator( HitNormal );
	}
	else
	{
		StuckRotation = rotator( StuckNormal );
	}

	// Destroy any overlapping mines
	if( Role == ROLE_Authority )
	{
		foreach TouchingActors( class'KFProj_BloatPukeMine', PukeMine )
		{
			PukeMine.TriggerExplosion( PukeMine.Location, vect(0,0,1), none );
		}
	}
	SetRotation( StuckRotation );

	// Apply some random yaw
	RandRot.Yaw = Rand( 65535 );
	SetRelativeRotation( RandRot );

	// Swap to ground FX
	SwapToGroundFX( StuckRotation );

	// Play a sound
	PlayImpactSound( true );

	// Spawn an impact decal
	SpawnImpactDecal( StuckLocation, StuckNormal );

	// Go to armed state
	GotoState( 'Armed' );
}

/** Switch to ground fx */
simulated function SwapToGroundFX( rotator GroundRotation )
{
	// Replace the flying effects with ground FX
	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		StopFlightEffects();
		ProjFlightTemplate = GroundFXTemplate;
		ProjFlightTemplateZedTime = GroundFXTemplate;
		bAutoStartAmbientSound = true;
		SpawnFlightEffects();
		ProjEffects.SetAbsolute( true, true, false );
		ProjEffects.SetTranslation( Location + LandedFXOffset );
		ProjEffects.SetRotation( GroundRotation );
	}
}

/** Plays a sound on impact */
simulated function PlayImpactSound( optional bool bIsAtRest )
{
	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		if( bIsAtRest )
		{
			PostAkEvent( ImpactAkEvent, true, true, false );
		}
		else
		{
			PostAkEvent( BounceAkEvent, true, true, false );
		}
	}	
}

/** Spawns a decal at the impact location */
simulated function SpawnImpactDecal( vector HitLocation, vector HitNormal )
{
 	if( WorldInfo.MyDecalManager != none && !WorldInfo.bDropDetail )
 	{
		WorldInfo.MyDecalManager.SpawnDecal( ImpactDecalMaterial, HitLocation, rotator(-HitNormal), ImpactDecalWidth, ImpactDecalHeight, ImpactDecalThickness, true );
	}
}

/** Validates a touch */
simulated function bool ValidTouch( Pawn Other )
{
	// Make sure only enemies detonate
	if( Other.GetTeamNum() == TeamNum || !Other.IsAliveAndWell() )
	{
		return false;
	}

	// Make sure not touching through wall
	return FastTrace( Other.Location, Location,, true );
}

/** When touched by an actor */
simulated event Touch( Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal )
{
	local Pawn P;

	// If touched by an enemy pawn, explode
	P = Pawn( Other );
	if( P != None )
	{
		if( (WorldInfo.TimeSeconds - CreationTime) >= 0.1f && ValidTouch(P) )
		{
			TriggerExplosion( Location, vect(0,0,1), P );
		}
	}
	else if( bBounce )
	{
		super.Touch( Other, OtherComp, HitLocation, HitNormal );
	}
}

/** Capture damage so that human players can destroy the mine */
singular event TakeDamage( int inDamage, Controller InstigatedBy, vector HitLocation, vector Momentum, class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser )
{
	// Don't blow up when fading out and don't let mines blow each other up, no matter what team
	if( bFadingOut || DamageCauser.class == class || DamageType == ExplosionTemplate.MyDamageType || Physics != PHYS_None )
	{
		return;
	}

	if( Health > 0 && inDamage > 0 && InstigatedBy != none && InstigatedBy.GetTeamNum() != TeamNum )
	{
		Health -= inDamage;

		if( Health <= 0 )
		{
			TriggerExplosion( Location, vect(0,0,1), none );
		}
	}
}

/** Blows up mine immediately */
function Detonate()
{
	TriggerExplosion( Location, vect(0,0,1), none );
}

/** Blows up on a timer */
function Timer_Explode()
{
	Detonate();
}

/** Explode this mine */
simulated function TriggerExplosion(Vector HitLocation, Vector HitNormal, Actor HitActor)
{
	// If we're fading out, don't explode
	if( bFadingOut )
	{
		return;
	}

	super.TriggerExplosion( HitLocation, HitNormal, HitActor );

	SetHidden( true );

	/** Tell clients to explode */
	if( Role == ROLE_Authority )
	{
		bClientExplode = true;
		bForceNetUpdate = true;
	}
}

/** If bFadingOut, shrinks mine and destroys it */
simulated event Tick( float DeltaTime )
{
	local float FadeOutSize;

	super.Tick( DeltaTime );

	if( bFadingOut )
	{
		FadeOutSize = ( FadeOutTime - WorldInfo.TimeSeconds ) / default.FadeOutTime;

		// Spawn a burst effect and destroy when we've shrunk small enough
		if( FadeOutSize <= 0.25f )
		{
			bFadingOut = false;
			SpawnBurstEffect();
			Destroy();
			return;
		}

		// Shrink visuals
		if( ProjEffects != none )
		{
			ProjEffects.SetScale( FadeOutSize );
		}
	}
}

/** Tells clients to start fading out */
simulated event TornOff()
{
	FadeOut();
}

/** Fades this mine out and destroys it */
simulated function FadeOut()
{
	// If we're in midair, just destroy
	if( Physics == PHYS_Falling )
	{
		Destroy();
		return;
	}

	// Already fading, early out
	if( bFadingOut || bDeleteMe || (WorldInfo.NetMode == NM_DedicatedServer && bTearOff) )
	{
		return;
	}

	// Remove ownership
	SetOwner( none );

	// Turn off collision
	SetCollision( false, false );

	// Dedicated server doesn't need to fade
	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		// Set initial fade values
		bFadingOut = true;
		FadeOutTime = WorldInfo.TimeSeconds + default.FadeOutTime;		
	}
	else
	{
		// Delay destruction slightly
		SetTimer( 0.2f, false, nameOf(Destroy) );
	}

	// Tell clients to tear off and fade out on their own
	if( WorldInfo.NetMode != NM_Client )
	{
		bTearOff = true;
		bNetDirty = true;
		bForceNetUpdate = true;
	}
}

/** Spawns a small burst effect when the mine has finished shrinking */
simulated function SpawnBurstEffect()
{
	if( WorldInfo.NetMode == NM_DedicatedServer || WorldInfo.MyEmitterPool == none || ProjEffects == none )
	{
		return;
	}

	WorldInfo.MyEmitterPool.SpawnEmitter( BurstFXTemplate, ProjEffects.GetPosition(), rotator(vect(0,0,1)) );
}

/** Removes our puke mine from the pool */
simulated event Destroyed()
{
	if( WorldInfo.NetMode != NM_Client )
	{
		if( InstigatorController != none )
		{
			class'KFGameplayPoolManager'.static.GetPoolManager().RemoveProjectileFromPool( self, PPT_PukeMine );
		}
	}

	super.Destroyed();
}

/**
 * State where this mine is waiting to detonate
 */
simulated state Armed
{
	/** Make sure no pawn already touching */
	simulated function CheckTouching()
	{
		local Pawn P;

		foreach TouchingActors( class'Pawn', P )
		{
			Touch( P, None, Location, Normal(Location - P.Location) );
		}
	}

	/** Adjust collision */
	simulated function BeginState( Name PreviousStateName )
	{
		CheckTouching();
	}
}

/** Controller left, explode after a short time */
simulated function OnInstigatorControllerLeft()
{
	if( WorldInfo.NetMode != NM_Client )
	{
		SetTimer( 1.f + Rand(5) + fRand(), false, nameOf(Timer_Explode) );
	}
}

defaultproperties
{
   GroundFXTemplate=ParticleSystem'ZED_Bloat_EMIT.FX_Bloat_Mine_01'
   BurstFXTemplate=ParticleSystem'ZED_Bloat_EMIT.FX_Bloat_Mine_Hit_01'
   Health=100
   DampenFactor=0.125000
   DampenFactorParallel=0.175000
   SpawnCollisionOffsetAmt=28.000000
   LandedFXOffset=(X=0.000000,Y=0.000000,Z=2.000000)
   ExplodeTriggerRadius=60.000000
   ExplodeTriggerHeight=22.000000
   BounceAkEvent=AkEvent'WW_ZED_Bloat.Play_Bloat_Mine_Bounce'
   ImpactAkEvent=AkEvent'WW_ZED_Bloat.Play_Bloat_Mine_Hit'
   ImpactDecalMaterial=DecalMaterial'FX_Mat_Lib.FX_Puke_Mine_Splatter_DM'
   ImpactDecalWidth=178.000000
   ImpactDecalHeight=178.000000
   ImpactDecalThickness=28.000000
   FuseDuration=300.000000
   FadeOutTime=1.750000
   bStopAmbientSoundOnExplode=True
   GlassShatterType=FMGS_ShatterAll
   ExplosionActorClass=Class'kfgamecontent.KFExplosion_PlayerBloatPukeMine'
   Begin Object Class=KFGameExplosion Name=ExploTemplate0
      ExplosionEffects=KFImpactEffectInfo'ZED_Bloat_ARCH.Bloat_Mine_Explosion'
      Damage=15.000000
      DamageRadius=450.000000
      DamageFalloffExponent=0.000000
      MyDamageType=Class'kfgamecontent.KFDT_Toxic_BloatPukeMine'
      KnockDownStrength=0.000000
      MomentumTransferScale=0.000000
      ExplosionSound=AkEvent'WW_ZED_Bloat.Play_Bloat_Mine_Explode'
      FractureMeshRadius=0.000000
      FracturePartVel=0.000000
      CamShake=KFCameraShake'FX_CameraShake_Arch.Grenades.Default_Grenade'
      CamShakeInnerRadius=200.000000
      CamShakeOuterRadius=400.000000
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'KFGame.Default__KFGameExplosion'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_BloatPukeMine:ExploTemplate0'
   ProjFlightTemplate=ParticleSystem'ZED_Bloat_EMIT.FX_Bloat_Mine_projectile_01'
   AmbientSoundPlayEvent=AkEvent'WW_ZED_Bloat.Play_Bloat_Mine_Amb_LP'
   AmbientSoundStopEvent=AkEvent'WW_ZED_Bloat.Stop_Bloat_Mine_Amb_LP'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.250000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'AkAudio.Default__AkComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   Speed=1000.000000
   MaxSpeed=1000.000000
   bBlockedByInstigator=False
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFProjectile:CollisionCylinder'
      CollisionHeight=10.000000
      CollisionRadius=10.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockNonZeroExtent=False
      PhysMaterialOverride=PhysicalMaterial'ZED_Bloat_EMIT.BloatPukeMine_PM'
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFProjectile:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=AmbientAkSoundComponent
   Physics=PHYS_Falling
   bNetTemporary=False
   bAlwaysRelevant=True
   bCollideComplex=True
   bProjTarget=True
   bNoEncroachCheck=True
   bBounce=True
   LifeSpan=0.000000
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_BloatPukeMine"
   ObjectArchetype=KFProjectile'KFGame.Default__KFProjectile'
}
