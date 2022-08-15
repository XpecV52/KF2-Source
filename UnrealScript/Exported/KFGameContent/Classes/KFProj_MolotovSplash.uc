//=============================================================================
// KFProj_MolotovSplash
//=============================================================================
// Projectile class for molotov "splash" residual flames. This projectile's explosion
// is smaller and dimmer than KFProj_MolotoveGrenade, but it lingers.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Jeff Robinson
//=============================================================================

class KFProj_MolotovSplash extends KFProjectile;

/** Alternate lifespan for Flarotov */
var float MaxTimeFlarotov;

/** Blow up on impact */
simulated event HitWall(vector HitNormal, Actor Wall, PrimitiveComponent WallComp)
{
	if( StaticMeshComponent(WallComp) != none && StaticMeshComponent(WallComp).CanBecomeDynamic() )
	{
		// pass through meshes that can move
		return;
	}

	Explode( Location, HitNormal );
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

		Explode( Location, HitNormal );
	}
}

/** Overridden to adjust particle system for different surface orientations (wall, ceiling)
  * and nudge location
  */
simulated protected function PrepareExplosionActor(GameExplosionActor GEA)
{
	local KFExplosion_Molotov KFEM;
	local vector ExplosionDir;
	local KFPawn KFPInstigator;

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

		KFPInstigator = KFPawn(Instigator);
		if( KFPInstigator != None && KFPInstigator.GetPerk() != None )
		{
			if( KFPInstigator.GetPerk().IsFlarotovActive() )
			{
			    KFEM.MaxTime = MaxTimeFlarotov;
			}
		}
	}
}

/**
 * Force the fire not to burn the instigator, since setting it in the default props is not working for some reason - Ramm
 */
simulated protected function PrepareExplosionTemplate()
{
	ExplosionTemplate.bIgnoreInstigator=true;

    super.PrepareExplosionTemplate();
}

defaultproperties
{
   MaxTimeFlarotov=10.000000
   bAlwaysReplicateExplosion=True
   bAutoStartAmbientSound=True
   AlwaysRelevantDistanceSquared=6250000.000000
   ExplosionActorClass=Class'kfgamecontent.KFExplosion_Molotov'
   Begin Object Class=KFGameExplosion Name=ExploTemplate0
      ExplosionEffects=KFImpactEffectInfo'wep_molotov_arch.Molotov_GroundFire'
      bDirectionalExplosion=True
      Damage=10.000000
      DamageRadius=150.000000
      MyDamageType=Class'kfgamecontent.KFDT_Fire_MolotovGrenade'
      KnockDownStrength=0.000000
      MomentumTransferScale=0.000000
      ExploLight=PointLightComponent'kfgamecontent.Default__KFProj_MolotovSplash:FlamePointLight'
      ExploLightFadeOutTime=0.300000
      ExploLightStartFadeOutTime=4.200000
      FractureMeshRadius=0.000000
      CamShake=None
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'KFGame.Default__KFGameExplosion'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_MolotovSplash:ExploTemplate0'
   ProjFlightTemplate=ParticleSystem'WEP_3P_Molotov_EMIT.FX_Molotov_Grenade_Spread_01'
   AmbientSoundPlayEvent=AkEvent'WW_WEP_SA_Flamethrower.Play_WEP_SA_Flamethrower_Residual_Fire_Loop'
   AmbientSoundStopEvent=AkEvent'WW_WEP_SA_Flamethrower.Stop_WEP_SA_Flamethrower_Residual_Fire_Loop'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.250000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'AkAudio.Default__AkComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   AssociatedPerkClass=Class'KFGame.KFPerk_Firebug'
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
   Components(1)=AmbientAkSoundComponent
   Physics=PHYS_Falling
   bNetTemporary=False
   bCollideComplex=True
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_MolotovSplash"
   ObjectArchetype=KFProjectile'KFGame.Default__KFProjectile'
}
