//=============================================================================
// Projectile.
//
// A delayed-hit projectile that moves around for some time after it is created.
// Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
//=============================================================================
class Projectile extends Actor
	abstract
	native
	notplaceable;

//-----------------------------------------------------------------------------
// Projectile variables.

// Motion information.
/** Initial speed of projectile. */
var(Projectile)		float   Speed;
/** Limit on speed of projectile (0 means no limit). */
var(Projectile)		float   MaxSpeed;

/** If collisionextent nonzero, and hit actor with bBlockNonZeroExtents=0, switch to zero extent collision. */
var		bool	bSwitchToZeroCollision;
/** The actor that the switch to zero collision occurred on (WorldInfo in the case of BSP). */
var		Actor	ZeroCollider;
/** The component that the switch to zero collision occurred on (NULL in the case of BSP). */
var		PrimitiveComponent	ZeroColliderComponent;

/** If false, instigator does not collide with this projectile */
var bool bBlockedByInstigator;

var		bool	bBegunPlay;

// Damage parameters
/** Damage done by the projectile */
var(Projectile)		float	Damage;
/** Radius of effect in which damage is applied. */
var(Projectile)		float	DamageRadius;
/** Momentum magnitude imparted by impacting projectile. */
var(Projectile)		float	MomentumTransfer;
var	class<DamageType>	   MyDamageType;

// Projectile sound effects
/** Sound made when projectile is spawned. */
var(Projectile)		SoundCue	SpawnSound;
/** Sound made when projectile hits something. */
var(Projectile)		SoundCue	ImpactSound;

// explosion effects
var Controller	InstigatorController;
var Actor ImpactedActor;		// Actor hit or touched by this projectile.  Gets full damage, even if radius effect projectile, and then ignored in HurtRadius

// network culling
var float NetCullDistanceSquared;	// Projectile not relevant to client if further from viewer than this

var	CylinderComponent		CylinderComponent;

/** If true, this projectile will have its rotation updated each frame to match its velocity */
var bool bRotationFollowsVelocity;

/** If true, ignore foliage entirely */
var bool bIgnoreFoliageTouch;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

//==============
// Encroachment
event bool EncroachingOn( actor Other )
{
	if ( Brush(Other) != None )
		return true;

	return false;
}

event PreBeginPlay()
{
	if (Instigator != None)
	{
		InstigatorController = Instigator.Controller;
	}

	Super.PreBeginPlay();

	if (!bDeleteMe && InstigatorController != None && InstigatorController.ShotTarget != None && InstigatorController.ShotTarget.Controller != None)
	{
		InstigatorController.ShotTarget.Controller.ReceiveProjectileWarning( Self );
	}
}

simulated event PostBeginPlay()
{
	bBegunPlay = true;
}

/* Init()
initialize velocity and rotation of projectile
*/
native function Init( Vector Direction );

/*
 * Queries the Instigator and returns his current team index.
 */
simulated native function byte GetTeamNum();

simulated function bool CanSplash()
{
	return bBegunPlay;
}

function Reset()
{
	Destroy();
}

/**
 * Adjusts HurtOrigin up to avoid world geometry, so more traces to actors around explosion will succeed
 */
simulated function bool ProjectileHurtRadius( vector HurtOrigin, vector HitNormal)
{
	local vector AltOrigin, TraceHitLocation, TraceHitNormal;
	local Actor TraceHitActor;

	// early out if already in the middle of hurt radius
	if ( bHurtEntry )
		return false;

	AltOrigin = HurtOrigin;

	if ( (ImpactedActor != None) && ImpactedActor.bWorldGeometry )
	{
		// try to adjust hit position out from hit location if hit world geometry
		AltOrigin = HurtOrigin + 2.0 * class'Pawn'.Default.MaxStepHeight * HitNormal;
		TraceHitActor = Trace(TraceHitLocation, TraceHitNormal, AltOrigin, HurtOrigin, false,,,TRACEFLAG_Bullet);
		if ( TraceHitActor == None )
		{
			// go half way if hit nothing
			AltOrigin = HurtOrigin + class'Pawn'.Default.MaxStepHeight * HitNormal;
		}
		else
		{
			AltOrigin = HurtOrigin + 0.5*(TraceHitLocation - HurtOrigin);
		}
	}

	return HurtRadius(Damage, DamageRadius, MyDamageType, MomentumTransfer, AltOrigin);
}

/**
 * HurtRadius()
 * Hurt locally authoritative actors within the radius.
 */
simulated function bool HurtRadius( float DamageAmount,
								    float InDamageRadius,
				    class<DamageType> DamageType,
									float Momentum,
									vector HurtOrigin,
									optional actor IgnoredActor,
									optional Controller InstigatedByController = Instigator != None ? Instigator.Controller : None,
									optional bool bDoFullDamage
									)
{
	local bool bCausedDamage, bResult;

	if ( bHurtEntry )
		return false;

	bCausedDamage = false;
	if (InstigatedByController == None)
	{
		InstigatedByController = InstigatorController;
	}

	// if ImpactedActor is set, we actually want to give it full damage, and then let him be ignored by super.HurtRadius()
	if ( (ImpactedActor != None) && (ImpactedActor != self)  )
	{
		ImpactedActor.TakeRadiusDamage(InstigatedByController, DamageAmount, InDamageRadius, DamageType, Momentum, HurtOrigin, true, self);
		bCausedDamage = ImpactedActor.bProjTarget;
	}

	bResult = Super.HurtRadius(DamageAmount, InDamageRadius, DamageType, Momentum, HurtOrigin, ImpactedActor, InstigatedByController, bDoFullDamage);
	return ( bResult || bCausedDamage );
}

//==============
// Touching
simulated singular event Touch( Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal )
{
	if ( (Other == None) || Other.bDeleteMe ) // Other just got destroyed in its touch?
		return;

	if (bIgnoreFoliageTouch && InteractiveFoliageActor(Other) != None ) // Ignore foliage if desired
		return;

	// don't allow projectiles to explode while spawning on clients
	// because if that were accurate, the projectile would've been destroyed immediately on the server
	// and therefore it wouldn't have been replicated to the client
	if ( Other.StopsProjectile(self) && (Role == ROLE_Authority || bBegunPlay) && (bBlockedByInstigator || (Other != Instigator)) )
	{
		ImpactedActor = Other;
		ProcessTouch(Other, HitLocation, HitNormal);
		ImpactedActor = None;
	}
}

simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
	if (Other != Instigator)
	{
		if (!Other.bStatic && DamageRadius == 0.0)
		{
			Other.TakeDamage(Damage, InstigatorController, Location, MomentumTransfer * Normal(Velocity), MyDamageType,, self);
		}
		Explode(HitLocation, HitNormal);
	}
}

simulated singular event HitWall(vector HitNormal, actor Wall, PrimitiveComponent WallComp)
{
	local KActorFromStatic NewKActor;
	local StaticMeshComponent HitStaticMesh;

	Super.HitWall(HitNormal, Wall, WallComp);

	if ( Wall.bWorldGeometry )
	{
		HitStaticMesh = StaticMeshComponent(WallComp);
		if ( (HitStaticMesh != None) && HitStaticMesh.CanBecomeDynamic() )
		{
			NewKActor = class'KActorFromStatic'.Static.MakeDynamic(HitStaticMesh);
			if ( NewKActor != None )
			{
				Wall = NewKActor;
			}
		}
	}
	ImpactedActor = Wall;
	if ( !Wall.bStatic && (DamageRadius == 0) )
	{
		Wall.TakeDamage( Damage, InstigatorController, Location, MomentumTransfer * Normal(Velocity), MyDamageType,, self);
	}

	Explode(Location, HitNormal);
	ImpactedActor = None;
}

simulated event EncroachedBy(Actor Other)
{
	HitWall(Normal(Location - Other.Location), Other, None);
}

simulated function Explode(vector HitLocation, vector HitNormal)
{
	if (Damage > 0 && DamageRadius > 0)
	{
		if ( Role == ROLE_Authority )
		{
			MakeNoise(1.0);
		}
		ProjectileHurtRadius(HitLocation, HitNormal);
	}
	Destroy();
}

simulated final function RandSpin(float spinRate)
{
	RotationRate.Yaw = spinRate * 2 *FRand() - spinRate;
	RotationRate.Pitch = spinRate * 2 *FRand() - spinRate;
	RotationRate.Roll = spinRate * 2 *FRand() - spinRate;
}

function bool IsStationary()
{
	return false;
}

simulated event FellOutOfWorld(class<DamageType> dmgType)
{
	Explode(Location, vect(0,0,1));
}

/** returns the amount of time it would take the projectile to get to the specified location */
simulated function float GetTimeToLocation(vector TargetLoc)
{
	return (VSize(TargetLoc - Location) / Speed);
}

/** static version of GetTimeToLocation() */
static simulated function float StaticGetTimeToLocation(vector TargetLoc, vector StartLoc, Controller RequestedBy)
{
	return (VSize(TargetLoc - StartLoc) / default.Speed);
}

/** returns the maximum distance this projectile can travel */
simulated static function float GetRange()
{
	if (default.LifeSpan == 0.0)
	{
		return 15000.0;
	}
	else
	{
		return (default.MaxSpeed * default.LifeSpan);
	}
}


/** Called when this actor touches a fluid surface */
simulated function ApplyFluidSurfaceImpact( FluidSurfaceActor Fluid, vector HitLocation)
{
	Super.ApplyFluidSurfaceImpact(Fluid, HitLocation);

	if ( CanSplash() )
	{
		if ( WorldInfo.NetMode != NM_DedicatedServer &&
			(Instigator != None) &&
			Instigator.IsPlayerPawn() &&
			Instigator.IsLocallyControlled() )
		{
			WorldInfo.MyEmitterPool.SpawnEmitter(Fluid.ProjectileEntryEffect, HitLocation, rotator(vect(0,0,1)), self);
		}
	}
}

defaultproperties
{
   Speed=2000.000000
   MaxSpeed=2000.000000
   bBlockedByInstigator=True
   DamageRadius=220.000000
   MyDamageType=Class'Engine.DamageType'
   NetCullDistanceSquared=400000000.000000
   Begin Object Class=CylinderComponent Name=CollisionCylinder
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'Engine.Default__CylinderComponent'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Physics=PHYS_Projectile
   RemoteRole=ROLE_SimulatedProxy
   CollisionType=COLLIDE_CustomDefault
   bNetTemporary=True
   bReplicateInstigator=True
   bGameRelevant=True
   bCanBeDamaged=True
   bCollideActors=True
   bCollideWorld=True
   NetPriority=2.500000
   LifeSpan=14.000000
   CollisionComponent=CollisionCylinder
   Name="Default__Projectile"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
