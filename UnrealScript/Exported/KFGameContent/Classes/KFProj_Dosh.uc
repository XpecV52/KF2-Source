//=============================================================================
// KFProj_Dosh
//=============================================================================
// Projectile for the doshinegun
//=============================================================================
// Killing Floor 2
// Copyright (C) 2021 Tripwire Interactive LLC
//=============================================================================

class KFProj_Dosh extends KFProj_RicochetBullet
	hidedropdown;



var PrimitiveComponent DroppedPickupMesh;

/** Dampen amount for every bounce */
var() float DampenFactor;

/** Dampen amount for parallel angle to velocity */
var() float DampenFactorParallel;

var transient Vector PreviousLocations [20];
var transient rotator PreviousRotations [20];

// Make sure that last location always exists.
simulated event PostBeginPlay()
{
    Super.PostBeginPlay();
}

event Tick( float DeltaTime )
{
	local int i;
	for (i = 20- 1; i > 0; --i)
	{
		PreviousLocations[i] = PreviousLocations[i-1];
		PreviousRotations[i] = PreviousRotations[i-1];
	}

	if (20> 0)
	{
		PreviousLocations[0] = Location;
		PreviousRotations[0] = Rotation; 
	}
}

/**
 * Give a little bounce
 */
simulated event HitWall(vector HitNormal, Actor Wall, PrimitiveComponent WallComp)
{
	local TraceHitInfo HitInfo;

	// check to make sure we didn't hit a pawn
	if( Pawn(Wall) == none )
	{
		if (!Wall.bStatic && Wall.bCanBeDamaged && (DamageRadius == 0 || bDamageDestructiblesOnTouch) && !CheckRepeatingTouch(Wall) )
		{
			HitInfo.HitComponent = WallComp;
			HitInfo.Item = INDEX_None;
			Wall.TakeDamage( Damage, InstigatorController, Location, MomentumTransfer * Normal(Velocity), MyDamageType, HitInfo, self);
		}
	}

    Bounce( HitNormal, Wall );
}

/** Adjusts movement/physics of projectile.
  * Returns true if projectile actually bounced / was allowed to bounce */
simulated function bool Bounce( vector HitNormal, Actor BouncedOff)
{
	Velocity = DampingFactor * (Velocity - 2.0*HitNormal*(Velocity dot HitNormal));
	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		// do the impact effects
		KFImpactEffectManager(WorldInfo.MyImpactEffectManager).PlayImpactEffects(Location, Instigator, HitNormal, ImpactEffects );
	}

	// also done from ProcessDestructibleTouchOnBounce. update LastBounced to solve problem with bouncing rapidly between world/non-world geometry
	LastBounced.Actor = BouncedOff;
	LastBounced.Time = WorldInfo.TimeSeconds;

	SpawnDosh(BouncedOff);
	Destroy();

	return true;
}

function SpawnDosh(Actor BouncedOff)
{
	local KFDroppedPickup_Cash P;
	local int i;

	if ( WorldInfo.NetMode == NM_Client )
		return;

	if (Pawn(BouncedOff) == none)
	{
		P = Spawn(class'KFDroppedPickup_Cash',,, Location, Rotation,, false);

		if (P == none)
		{
			for (i = 0; i < 20; ++i)
			{
				P = Spawn(class'KFDroppedPickup_Cash',,, PreviousLocations[i], PreviousRotations[i],, false);
				if (P != none)
				{
					break;
				}
			}
		}
	}
	else
	{
		P = Spawn(class'KFDroppedPickup_Cash',,, Location, Rotation,, true);
	}

	if( P == None )
	{
		Destroy();
	}
	else
	{
		P.SetPhysics(PHYS_Falling);
		P.InventoryClass = class'KFInventory_Money';
		P.Inventory = Instigator.CreateInventory(P.InventoryClass);
		P.Velocity = Velocity;
		P.Instigator = Instigator;
		P.SetPickupMesh(DroppedPickupMesh);
		P.SetPickupParticles(none);
		P.CashAmount = class'KFWeap_AssaultRifle_Doshinegun'.default.DoshCost;
	}

}

//==============
// Touching
// Overridden to get bouncing off of destructible meshes
simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
	local KFPawn KFP;
	local KFPawn_Human KFPH;
	local KFPlayerReplicationInfo KFPRI;

	KFPH = KFPawn_Human(Other); 
	if ( KFPH != none && KFPH != Instigator)
	{
		KFPRI = KFPlayerReplicationInfo(KFPH.PlayerReplicationInfo);
		if (KFPRI != none)
		{
			KFPRI.AddDosh(class'KFWeap_AssaultRifle_Doshinegun'.default.DoshCost);
			Destroy();
			return;
		}
	}
	else if ( Other != Instigator && Other.bCanBeDamaged && (!Other.bWorldGeometry || !Other.bStatic) )
	{
		KFP = KFPawn( Other );
		if ( KFP != None )
		{
			// check/ignore repeat touch events
			if( CheckRepeatingTouch(Other) )
			{
				return;
			}

			ProcessBulletTouch(Other, HitLocation, HitNormal);

			Bounce(HitNormal, Other);
			return;
		}
		else
		{
			ProcessDestructibleTouchOnBounce( Other, HitLocation, HitNormal );
			return;
		}
	}

	super.ProcessTouch(Other, HitLocation, HitNormal);
}

simulated function SyncOriginalLocation()
{
	local Actor HitActor;
	local vector HitLocation, HitNormal;
	local TraceHitInfo HitInfo;

	if (Role < ROLE_Authority && Instigator != none && Instigator.IsLocallyControlled())
	{
		HitActor = Trace(HitLocation, HitNormal, OriginalLocation, Location,,, HitInfo, TRACEFLAG_Bullet);
		if (HitActor != none)
		{
			Bounce(HitNormal, HitActor);
		}
	}

    Super.SyncOriginalLocation();
}

defaultproperties
{
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh0
      SkeletalMesh=SkeletalMesh'GP_Mesh.dosh_SM'
      PhysicsAsset=PhysicsAsset'GP_Mesh.dosh_SM_Physics'
      ReplacementPrimitive=None
      CastShadow=False
      Name="PickupMesh0"
      ObjectArchetype=SkeletalMeshComponent'Engine.Default__SkeletalMeshComponent'
   End Object
   DroppedPickupMesh=PickupMesh0
   DampenFactor=0.250000
   DampenFactorParallel=0.400000
   BouncesLeft=1
   DampingFactor=0.100000
   bWarnAIWhenFired=True
   TossZ=100.000000
   GravityScale=0.570000
   ProjFlightTemplate=ParticleSystem'WEP_Doshinegun_EMIT.PS_Trail'
   ProjFlightTemplateZedTime=ParticleSystem'WEP_Doshinegun_EMIT.PS_Trail'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'KFGame.Default__KFProj_RicochetBullet:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.100000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFProj_RicochetBullet:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   ImpactEffects=KFImpactEffectInfo'WEP_Doshinegun_ARCH.Dosh_Impact'
   Speed=7500.000000
   MaxSpeed=7500.000000
   MomentumTransfer=50000.000000
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFProj_RicochetBullet:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFProj_RicochetBullet:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=AmbientAkSoundComponent
   Physics=PHYS_Falling
   bNetTemporary=False
   NetUpdateFrequency=200.000000
   NetPriority=5.000000
   LifeSpan=120.000000
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_Dosh"
   ObjectArchetype=KFProj_RicochetBullet'KFGame.Default__KFProj_RicochetBullet'
}
