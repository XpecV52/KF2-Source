//=============================================================================
// KFProj_Mine_Reconstructor
//=============================================================================
// Projectile class for Mine Reconstructor
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFProj_Mine_Reconstructor extends KFProjectile;

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

/** Vector to offset the ground FX particle system by when landing */
var vector LandedFXOffset;

/** Armed mine collision settings */
var float ExplodeTriggerRadius, ExplodeTriggerHeight;

/** Sound mine makes when it hits something and bounces off */
var AkEvent BounceAkEvent;

/** Sound mine makes when it hits something and comes to rest */
var AkEvent ImpactAkEvent;

/** Sound mine makes when it hits something and bounces off */
var AkEvent BounceAkEventHeavy;

/** Sound mine makes when it hits something and comes to rest */
var AkEvent ImpactAkEventHeavy;

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

var float MaxExplodeTriggerRadiusPerPercentage;
var float MinExplodeTriggerRadiusPerPercentage;
var float MaxExplodeTriggerHeightPerPercentage;
var float MinExplodeTriggerHeightPerPercentage;

var float MaxDamageRadiusPerPercentage;
var float MinDamageRadiusPerPercentage;

var float MaxCollisionRadius;
var float MinCollisionRadius;
var float MaxCollisionHeight;
var float MinCollisionHeight;

var float MaxDamagePerPercentage;
var float MinDamagePerPercentage;

var repnotify float InheritedScale;

var repnotify float fChargePercentage;

var float fCachedCylinderWidth, fCachedCylinderHeight;

//EXPERIMENTAL FEATURES
var bool bCantBeTouchedByInstigator;
var bool bManuallyDetonated;
var bool bCantDetonateOnFullHP;
var bool bSticked;
var repnotify bool bArmed;

struct ReplicatedStickInfo
{
	var vector vRepStuckLocation, vRepStuckNormal;
};

var repnotify ReplicatedStickInfo StickInfo;

replication
{
	if( bNetDirty && Role == Role_Authority)
		bClientExplode, InheritedScale, fChargePercentage, StickInfo;

	if(bNetInitial && Role == Role_Authority)
		bArmed;
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
	if( VarName == nameOf(fChargePercentage))
	{
		fCachedCylinderWidth =Lerp(MinCollisionRadius, MaxCollisionRadius, fChargePercentage);
		fCachedCylinderHeight = Lerp(MinCollisionHeight, MaxCollisionHeight, fChargePercentage);
		CylinderComponent(CollisionComponent).SetCylinderSize(fCachedCylinderWidth, fCachedCylinderHeight);
		ExplodeTriggerRadius = Lerp(MinExplodeTriggerRadiusPerPercentage, MaxExplodeTriggerRadiusPerPercentage, fChargePercentage);
		ExplodeTriggerHeight = Lerp(MinExplodeTriggerHeightPerPercentage, MaxExplodeTriggerHeightPerPercentage, fChargePercentage);
		ExplosionTemplate.DamageRadius = Lerp(MinDamageRadiusPerPercentage, MaxDamageRadiusPerPercentage, fChargePercentage);
		ExplosionTemplate.Damage = Lerp(MinDamagePerPercentage, MaxDamagePerPercentage, fChargePercentage);
	}
	if(VarName == nameOf(StickInfo))
	{
		StickInClient(StickInfo.vRepStuckLocation, StickInfo.vRepStuckNormal);
	}

	if( VarName == nameOf(bArmed) )
	{
		if(bArmed)
		{
			SetPhysics( PHYS_Falling );
		}
	}
}

simulated function SetInheritedScale(float Scale, float ChargePercentage)
{
	InheritedScale=Scale;
	fChargePercentage=ChargePercentage;
	fChargePercentage = FMax(0.1, fChargePercentage);

	//ProjEffects.SetScale( InheritedScale );
	CylinderComponent(CollisionComponent).SetCylinderSize(Lerp(MinCollisionRadius, MaxCollisionRadius, fChargePercentage), Lerp(MinCollisionHeight, MaxCollisionHeight, ChargePercentage));
	ExplodeTriggerRadius = Lerp(MinExplodeTriggerRadiusPerPercentage, MaxExplodeTriggerRadiusPerPercentage, fChargePercentage);
	ExplodeTriggerHeight = Lerp(MinExplodeTriggerHeightPerPercentage, MaxExplodeTriggerHeightPerPercentage, fChargePercentage);
	ExplosionTemplate.DamageRadius = Lerp(MinDamageRadiusPerPercentage, MaxDamageRadiusPerPercentage, fChargePercentage);
	ExplosionTemplate.Damage = Lerp(MinDamagePerPercentage, MaxDamagePerPercentage, fChargePercentage);

	ExplodeTriggerRadius = FMax(0.1, ExplodeTriggerRadius);
	ExplodeTriggerHeight = FMax(0.1, ExplodeTriggerHeight);
	ExplosionTemplate.DamageRadius = FMax(0.1, ExplosionTemplate.DamageRadius);
	ExplosionTemplate.Damage = FMax(0.1, ExplosionTemplate.Damage);

	bNetDirty=true;
}

/** Adds our puke mine to the pool */
simulated event PostBeginPlay()
{
	// Cache team num
	TeamNum = GetTeamNum();

	super.PostBeginPlay();

	if( WorldInfo.NetMode != NM_Client )
	{
		if( InstigatorController != none || IsAIProjectile() )
		{
			//class'KFGameplayPoolManager'.static.GetPoolManager().AddProjectileToPool( self, PPT_MineReconstructor );
		}
		else
		{
			//Destroy();
			//return;
		}
	}

	if( Role == ROLE_Authority )
	{
		SetTimer( FuseDuration, false, nameOf(Timer_Explode) );
	}
}

simulated function SpawnFlightEffects()
{
	local vector vec;
	vec.X = fChargePercentage;
	vec.Y = fChargePercentage;
   	vec.Z = fChargePercentage;
	super.SpawnFlightEffects();
	//ProjEffects.SetScale( InheritedScale );
	if(ProjEffects != None)
	{
		ProjEffects.SetVectorParameter( name("BlobCharge"), vec);
		ProjEffects.SetFloatParameter( name("MineFxControlParam"), fChargePercentage);
	}
}

/** Overridden to do nothing */
simulated function Shutdown() {}
simulated protected function StopSimulating() {}
simulated function Explode( vector HitLocation, vector HitNormal ) {

	super.Explode(HitLocation, HitNormal);
}

/** Give a little bounce */
simulated event HitWall( vector HitNormal, Actor Wall, PrimitiveComponent WallComp )
{
	// Don't collide with other puke mines
	if( Wall.class == class )
	{
		return;
	}

	// Stick to static walls and destructible environment objects.
	if( CanStick(Wall, HitNormal) && (Wall.bStatic == true || (Wall.bCanBeDamaged && KFPawn(Wall) == none)) )
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

function RestoreCylinder()
{
	CylinderComponent(CollisionComponent).SetCylinderSize(fCachedCylinderWidth, fCachedCylinderHeight);
}
/** Adjusts movement/physics of projectile.
  * Returns true if projectile actually bounced / was allowed to bounce */
simulated function bool Bounce( vector HitNormal, Actor BouncedOff )
{
	local vector VNorm;

	// Avoid crazy bouncing
	if(CheckRepeatingTouch(BouncedOff))
	{
		CylinderComponent(CollisionComponent).SetCylinderSize(1,1);
		SetTimer(0.06f, false, nameof(RestoreCylinder));
		return false;
	}

	/*if(HitNormal.Z > 0.9f || HitNormal.Z < -0.9f) 
	{	
		HitNormal = -Velocity;
		if(HitNormal.Z > 0)
		{
			HitNormal.Z = -HitNormal.Z;
			HitNormal=Normal(HitNormal);
		}
		else
		{
			HitNormal=Normal(HitNormal);
		}
	}*/
		
    // Reflect off BouncedOff w/damping
    VNorm = (Velocity dot HitNormal) * HitNormal;
    Velocity = -VNorm * DampenFactor + (Velocity - VNorm) * DampenFactorParallel;
    Speed = VSize(Velocity);
	if( Speed < 60 )
	{
		Speed = 200;
		//Stick( Location, HitNormal );
		//return false;
	}

	// Play a sound
	PlayImpactSound();

	return true;
}

simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
	if (Other != Instigator && Other.GetTeamNum() != GetTeamNum() && !IsInState('Armed'))
	{
		ProcessBulletTouch(Other, HitLocation, HitNormal);
	}
	
	if (bCanStick || bCanPin)
	{
		StickHelper.TryStick(HitNormal, HitLocation, Other);
		return;
	}

	if (ExplosionTemplate != None && Role == ROLE_Authority)
    {
    	TriggerExplosion(HitLocation, HitNormal, Other);
    }

	Shutdown();	// cleanup/destroy projectile

}

/** Called once the mine has finished moving */
simulated function Stick( vector StuckLocation, vector StuckNormal )
{
	local vector HitLocation, HitNormal;
	local rotator StuckRotation;
	local KFProj_Mine_Reconstructor PukeMine;
	local rotator RandRot;

	if( Role != ROLE_Authority ) return;

	//we added a scapegoat that fixes the problem of hitwall not calling always in client, so we need to check it in case it comes
	//to not call it twice
	if(bSticked == true) return;
	RotationRate = rot(0,0,0);

    // Modify the collision so it can be detonated by the player
    CylinderComponent.SetTraceBlocking( true, true );
	SetCollisionSize( ExplodeTriggerRadius, ExplodeTriggerHeight );
	CylinderComponent.SetActorCollision( true, false );
	bCollideComplex = false;
	bBounce = false;
	SetPhysics( PHYS_None );
	SetOwner( none );

	// Optimize for network
	NetUpdateFrequency = 10;
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
		foreach TouchingActors( class'KFProj_Mine_Reconstructor', PukeMine )
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

	StickInfo.vRepStuckNormal=StuckNormal;
	StickInfo.vRepStuckLocation=StuckLocation;
	bNetDirty = true;
	bSticked = true;
	bArmed = true;
}

reliable client function StickInClient(vector StuckLocation, vector StuckNormal)
{
	local vector HitLocation, HitNormal;
	local rotator StuckRotation;
	local rotator RandRot;

	//we added a scapegoat that fixes the problem of hitwall not calling always in client, so we need to check it in case it comes
	//to not call it twice
	if(bSticked == true) return;
	RotationRate = rot(0,0,0);
	SetLocation(StuckLocation);
    // Modify the collision so it can be detonated by the player
    CylinderComponent.SetTraceBlocking( true, true );
	SetCollisionSize( ExplodeTriggerRadius, ExplodeTriggerHeight );
	CylinderComponent.SetActorCollision( true, false );
	bCollideComplex = false;
	bBounce = false;
	SetOwner( none );

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

	bSticked = true;
	bArmed = true;
}

/** Switch to ground fx */
simulated function SwapToGroundFX( rotator GroundRotation )
{
	local vector vec;
	// Replace the flying effects with ground FX
	if(/* WorldInfo.NetMode != NM_DedicatedServer  && */!IsInState('Armed') )
	{
		vec.X = fChargePercentage;
   		vec.Y = fChargePercentage;
    	vec.Z = fChargePercentage;
		StopFlightEffects();
		ProjFlightTemplate = GroundFXTemplate;
		ProjFlightTemplateZedTime = GroundFXTemplate;
		bAutoStartAmbientSound = true;
		SpawnFlightEffects();
		if(ProjEffects != None)
		{
			ProjEffects.SetAbsolute( true, true, false );
			ProjEffects.SetTranslation( Location + LandedFXOffset );
			ProjEffects.SetRotation( GroundRotation );
		//ProjEffects.SetScale( InheritedScale );
			ProjEffects.SetVectorParameter( name("BlobCharge"), vec);
			ProjEffects.SetFloatParameter(  name("MineFxControlParam"), fChargePercentage);
		}
		
	}
}

/** Plays a sound on impact */
simulated function PlayImpactSound( optional bool bIsAtRest )
{
	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		if( bIsAtRest )
		{
			if(fChargePercentage < 0.75f)
				PostAkEvent( ImpactAkEvent, true, true, false );
			else
				PostAkEvent( ImpactAkEventHeavy, true, true, false );
		}
		else
		{
			if(fChargePercentage < 0.75f)
				PostAkEvent( BounceAkEvent, true, true, false );
			else
				PostAkEvent( BounceAkEventHeavy, true, true, false );
		}
	}
}

/** Spawns a decal at the impact location */
simulated function SpawnImpactDecal( vector HitLocation, vector HitNormal )
{
 	if( WorldInfo.MyDecalManager != none && !WorldInfo.bDropDetail && !IsInState('Armed'))
 	{
		WorldInfo.MyDecalManager.SpawnDecal( ImpactDecalMaterial, HitLocation, rotator(-HitNormal), ImpactDecalWidth, ImpactDecalHeight, ImpactDecalThickness, true );
	}
}

/** Validates a touch */
simulated function bool ValidTouch( Pawn Other )
{

	// Make sure only enemies detonate
	if(bCantBeTouchedByInstigator == false)
	{
		if( Other.IsAliveAndWell() == false )
		{
			return false;
		}
		if(bCantDetonateOnFullHP)
		{
			if(Other.GetTeamNum() == TeamNum &&  Other.Health >= Other.HealthMax )
			{
				return false;
			}
		}
		// Make sure not touching through wall
		return FastTrace( Other.Location, Location,, true );
	}
	else
	{

		if(bCantDetonateOnFullHP)
		{
			if(Other.GetTeamNum() == TeamNum &&  Other.Health >= Other.HealthMax )
			{
				return false;
			}
		}

		if( Other.IsAliveAndWell() == false || Other == Instigator )
		{
			return false;
		}

		// Make sure not touching through wall
		return FastTrace( Other.Location, Location,, true );
	}
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
		if( ((P != Instigator) || ((WorldInfo.TimeSeconds - CreationTime) >= 0.1f && P == Instigator)) && ValidTouch(P) )
		{
			//super.Touch( Other, OtherComp, HitLocation, HitNormal );
			ImpactedActor = Other;
			ProcessTouch(Other, HitLocation, HitNormal);
			ImpactedActor = none;
		}
	}
	else if( bBounce )
	{
		super.Touch( Other, OtherComp, HitLocation, HitNormal );
	}
}

/** Blows up mine immediately */
function Detonate()
{
	if( Role == ROLE_Authority )
	{
		TriggerExplosion( Location, vect(0,0,1), none );
	}
}

/** Blows up mine immediately */
function ManuallyDetonate()
{
	bManuallyDetonated = true;
	if( Role == ROLE_Authority )
	{
		TriggerExplosion( Location, vect(0,0,1), none );
	}
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

	super.TriggerExplosion( Location,  HitNormal , HitActor );

	SetHidden( true );

	/** Tell clients to explode */
	if( Role == ROLE_Authority )
	{
		bClientExplode = true;
		bForceNetUpdate = true;
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
		bFadingOut = false;
		FadeOutTime = WorldInfo.TimeSeconds + default.FadeOutTime;
	}
	else
	{
		// Delay destruction slightly
		SetTimer( 0.2f, false, nameOf(Timer_Destroy) );
	}

	// Tell clients to tear off and fade out on their own
	if( WorldInfo.NetMode != NM_Client )
	{
		bTearOff = true;
		bNetDirty = true;
		bForceNetUpdate = true;
	}
}

simulated function Timer_Destroy()
{
	Destroy();
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
		if(Role != Role_Authority)
		{
			SetPhysics( PHYS_Falling );
			CheckTouching();
		}
	}
}

simulated protected function PrepareExplosionTemplate()
{

	local Weapon OwnerWeapon;
	local KFWeap_Mine_Reconstructor OwnerMinerec;
	local Pawn OwnerPawn;
	//local vector vec;

	super(KFProjectile).PrepareExplosionTemplate();
	//vec.X = 0;
   	//vec.Y = 0;
    //vec.Z = 0;
	OwnerWeapon = Weapon(Owner);
	if (OwnerWeapon != none)
	{
		OwnerPawn = Pawn(OwnerWeapon.Owner);
		if (OwnerPawn != none)
		{

			//vec.X = fChargePercentage;
   			//vec.Y = fChargePercentage;
    		//vec.Z = fChargePercentage;

			ExplosionTemplate.DamageRadius *= KFPawn(OwnerPawn).GetPerk().GetAoERadiusModifier();
			if(fChargePercentage > 0.51f)
				ExplosionTemplate.ExplosionSound=AkEvent'WW_WEP_MineReconstructor.Play_WEP_Mine_Reconstructor_Mine_Explosion_Heavy';
			//ExplosionTemplate.ExplosionEffects.DefaultImpactEffect.ParticleTemplate.SetVectorParameter( name("BlobCharge"), vec);
			//SetFloatParameter( name("MineFxControlParam"), fChargePercentage);
			OwnerMinerec = KFWeap_Mine_Reconstructor(OwnerWeapon);
			if(OwnerMinerec != none && !bManuallyDetonated)
				OwnerMinerec.RemoveProjectileFromPool(self);
		}
	}
}

simulated protected function PrepareExplosionActor(GameExplosionActor GEA)
{
	KFExplosion_MineReconstructor(GEA).fChargePercentage = fChargePercentage;
	super.PrepareExplosionActor(GEA);
}

/** Controller left, explode after a short time */
/*simulated function OnInstigatorControllerLeft()
{
	if( WorldInfo.NetMode != NM_Client )
	{
		SetTimer( 1.f + Rand(5) + fRand(), false, nameOf(Timer_Explode) );
	}
}*/

defaultproperties
{
   GroundFXTemplate=ParticleSystem'WEP_Mine_Reconstructor_EMIT.FX_Bloat_Mine_01'
   BurstFXTemplate=ParticleSystem'WEP_Mine_Reconstructor_EMIT.FX_Bloat_Mine_Hit_01'
   DampenFactor=0.125000
   DampenFactorParallel=0.175000
   LandedFXOffset=(X=0.000000,Y=0.000000,Z=2.000000)
   ExplodeTriggerRadius=60.000000
   ExplodeTriggerHeight=22.000000
   BounceAkEvent=AkEvent'WW_WEP_MineReconstructor.Play_WEP_Mine_Reconstructor_Mine'
   ImpactAkEvent=AkEvent'WW_WEP_MineReconstructor.Play_WEP_Mine_Reconstructor_Mine'
   BounceAkEventHeavy=AkEvent'WW_WEP_MineReconstructor.Play_WEP_Mine_Reconstructor_Mine_Heavy'
   ImpactAkEventHeavy=AkEvent'WW_WEP_MineReconstructor.Play_WEP_Mine_Reconstructor_Mine_Heavy'
   ImpactDecalWidth=178.000000
   ImpactDecalHeight=178.000000
   ImpactDecalThickness=28.000000
   FuseDuration=300.000000
   bCantBeTouchedByInstigator=True
   bCantDetonateOnFullHP=True
   FadeOutTime=500000.000000
   MaxExplodeTriggerRadiusPerPercentage=60.000000
   MinExplodeTriggerRadiusPerPercentage=30.000000
   MaxExplodeTriggerHeightPerPercentage=22.000000
   MinExplodeTriggerHeightPerPercentage=11.000000
   MaxDamageRadiusPerPercentage=340.000000
   MinDamageRadiusPerPercentage=160.000000
   MaxCollisionRadius=20.000000
   MinCollisionRadius=10.000000
   MaxCollisionHeight=20.000000
   MinCollisionHeight=10.000000
   MaxDamagePerPercentage=400.000000
   MinDamagePerPercentage=40.000000
   InheritedScale=1.000000
   bSyncToOriginalLocation=True
   bSyncToThirdPersonMuzzleLocation=True
   bUseClientSideHitDetection=True
   bReplicateLocationOnExplosion=True
   bStopAmbientSoundOnExplode=True
   GlassShatterType=FMGS_ShatterAll
   TouchTimeThreshhold=0.050000
   TossZ=150.000000
   GravityScale=0.500000
   TerminalVelocity=2000.000000
   ExplosionActorClass=Class'kfgamecontent.KFExplosion_MineReconstructor'
   Begin Object Class=KFGameExplosion Name=ExploTemplate0
      ExplosionEffects=KFImpactEffectInfo'WEP_Mine_Reconstructor_Arch.Mine_Reconstructor_Mine_Explosion'
      Damage=150.000000
      DamageRadius=200.000000
      DamageFalloffExponent=0.500000
      MyDamageType=Class'kfgamecontent.KFDT_Toxic_MineReconstructorExplosion'
      KnockDownStrength=0.000000
      MomentumTransferScale=45000.000000
      ExplosionSound=AkEvent'WW_WEP_MineReconstructor.Play_WEP_Mine_Reconstructor_Mine_Explosion'
      CamShake=KFCameraShake'WEP_Mine_Reconstructor_Arch.Camera_Shake'
      CamShakeInnerRadius=200.000000
      CamShakeOuterRadius=400.000000
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'KFGame.Default__KFGameExplosion'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_Mine_Reconstructor:ExploTemplate0'
   ProjFlightTemplate=ParticleSystem'WEP_Mine_Reconstructor_EMIT.FX_Bloat_Mine_projectile_01'
   AmbientSoundPlayEvent=AkEvent'WW_WEP_MineReconstructor.Play_WEP_Mine_Reconstructor_Mine_Loop'
   AmbientSoundStopEvent=AkEvent'WW_WEP_MineReconstructor.Stop_WEP_Mine_Reconstructor_Mine'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.250000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'AkAudio.Default__AkComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   Speed=2000.000000
   MaxSpeed=2000.000000
   MomentumTransfer=50000.000000
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFProjectile:CollisionCylinder'
      CollisionHeight=10.000000
      CollisionRadius=10.000000
      ReplacementPrimitive=None
      CollideActors=True
      PhysMaterialOverride=PhysicalMaterial'WEP_Mine_Reconstructor_EMIT.BloatPukeMine_PM'
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFProjectile:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=AmbientAkSoundComponent
   Physics=PHYS_Falling
   bPushedByEncroachers=False
   bNetTemporary=False
   bCanBeDamaged=False
   bCollideComplex=True
   bProjTarget=True
   bNoEncroachCheck=True
   bBounce=True
   LifeSpan=300.000000
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_Mine_Reconstructor"
   ObjectArchetype=KFProjectile'KFGame.Default__KFProjectile'
}
