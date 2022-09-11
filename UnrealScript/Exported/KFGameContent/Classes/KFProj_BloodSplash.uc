//=============================================================================
// KFProj_Blood Splash
//=============================================================================
// Projectile class for blood splashes that can leave decals.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2020 Tripwire Interactive LLC
//=============================================================================

class KFProj_BloodSplash extends KFProjectile;


var DecalMaterial ImpactDecalMaterial;
var float ImpactDecalMaxSize;
var float ImpactDecalMinSize;
var float ImpactDecalThickness;

var KFPawn BloodOriginPawn;

/** Blow up on impact */
simulated event HitWall(vector HitNormal, Actor Wall, PrimitiveComponent WallComp)
{
	if( StaticMeshComponent(WallComp) != none && StaticMeshComponent(WallComp).CanBecomeDynamic() )
	{
		// pass through meshes that can move
		return;
	}

    SpawnBloodDecal(Location, HitNormal);

	//Explode( Location, HitNormal );
}

/** Blow up on impact */
simulated function ProcessTouch( Actor Other, Vector HitLocation, Vector HitNormal )
{
	if( Other.bBlockActors )
	{
		// don't hit pawns because we don't want to see floating flames when the victim pawn dies
		if ( Pawn(Other) != None )
		{
           return;
		}

		// don't hit client-side destructible actors
		// @todo: maybe don't hit any destructibles for the same reason we don't hit pawns (floating flames when destroyed)?
		if( KFDestructibleActor(Other) != none && KFDestructibleActor(Other).ReplicationMode == RT_ClientSide )
		{
			return;
		}

		//Explode( Location, HitNormal );
        SpawnBloodDecal(Location, HitNormal);

	}
}

/** Overridden to adjust particle system for different surface orientations (wall, ceiling)
  * and nudge location
  */
simulated protected function PrepareExplosionActor(GameExplosionActor GEA)
{
	/*
    local KFExplosion_Molotov KFEM;
	local vector ExplosionDir;

	super.PrepareExplosionActor( GEA );

	// KFProjectile::Explode gives GEA a "nudged" location of 32 units, but it's too much, so use a smaller nudge
	GEA.SetLocation( Location + vector(GEA.Rotation) * 10 );

	KFEM = KFExplosion_Molotov( GEA );
	if( KFEM != none )
	{
		ExplosionDir = vector( KFEM.Rotation );

		if( ExplosionDir.Z < -0.95 )
		{
			// ceiling
			KFEM.LoopingParticleEffect = KFEM.default.LoopingParticleEffectCeiling;
		}
		else if( ExplosionDir.Z < 0.05 )
		{
			// wall
			KFEM.LoopingParticleEffect = KFEM.default.LoopingParticleEffectWall;
		}
		// else floor
	}
    */
}

simulated function SpawnBloodDecal(vector HitLocation, vector HitNormal )
{
	local KFGoreManager GoreManager;

	// Grab the gore manager
	GoreManager = KFGoreManager(WorldInfo.MyGoreEffectManager);

	if (GoreManager == none || BloodOriginPawn == none)
	{
		return;
	}

	GoreManager.LeaveABloodSplatterDecal(BloodOriginPawn, HitLocation, Normal(Velocity));

	//GoreManager. LeaveAPersistentBloodSplat(HitLocation, HitNormal, 1.0);

	if (KFPawn_Monster(BloodOriginPawn) != none)
	{
		GoreManager.CausePersistentBlood(KFPawn_Monster(BloodOriginPawn), class'KFDamageType', HitLocation, Normal(Velocity), 0, false, false);
	}
}
/** 
* Use alternative explosion effects when Ground Fire Perk is active
*/
simulated function PostBeginPlay()
{
	/*
    local KFPlayerReplicationInfo InstigatorPRI;

	if( AltExploEffects != none && Instigator != none )
	{
		InstigatorPRI = KFPlayerReplicationInfo(Instigator.PlayerReplicationInfo);
		if( InstigatorPRI != none )
		{
			bAltExploEffects = InstigatorPRI.bSplashActive;
		}
	}
	else
	{
		bAltExploEffects = false;
	}

	super.PostBeginPlay();
    */
}

/**
 * Force the fire not to burn the instigator, since setting it in the default props is not working for some reason - Ramm
 * Use the alternative FX for the Ground Fire Perk Skill - Tulio
 */
simulated protected function PrepareExplosionTemplate()
{
	/*
    ExplosionTemplate.bIgnoreInstigator=true;
    super.PrepareExplosionTemplate();
	
	if( bAltExploEffects )
	{
		ExplosionTemplate.ExplosionEffects = AltExploEffects;
	}
    */
}

defaultproperties
{
   ImpactDecalMaterial=DecalMaterial'FX_Mat_Lib.FX_CH_BloodSplatter_DM'
   ImpactDecalMaxSize=125.000000
   ImpactDecalMinSize=75.000000
   ImpactDecalThickness=12.000000
   bAlwaysReplicateExplosion=True
   AlwaysRelevantDistanceSquared=6250000.000000
   bBlockedByInstigator=False
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFProjectile:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFProjectile:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Physics=PHYS_Falling
   bNetTemporary=False
   bCollideComplex=True
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_BloodSplash"
   ObjectArchetype=KFProjectile'KFGame.Default__KFProjectile'
}
