//=============================================================================
// KFProj_Husk_Fireball
//=============================================================================
// Husk's fireball projectile
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFProj_Husk_Fireball extends KFProjectile;

/** How long the ground fire should stick around */
var const protected float BurnDuration;

/** How often, in seconds, we should apply burn */
var const protected float BurnDamageInterval;

/** Explosion actor class to use for ground fire */
var const protected class<KFExplosionActorLingering> GroundFireExplosionActorClass;

/** Determines if the ground fire explosion will spawn */
var bool bSpawnGroundFire;

/** Explosion template to use for ground fire */
var KFGameExplosion GroundFireExplosionTemplate;

replication
{
	if( bNetInitial )
		bSpawnGroundFire;
}

/** Both explosions should ignore the instigator for damage */
simulated protected function PrepareExplosionTemplate()
{
	super.PrepareExplosionTemplate();

	/** Since bIgnoreInstigator is transient, its value must be defined here */
	ExplosionTemplate.bIgnoreInstigator = true;
	GroundFireExplosionTemplate.bIgnoreInstigator = true;
}

/** Spawn our groundfire explosion */
simulated function TriggerExplosion( Vector HitLocation, Vector HitNormal, Actor HitActor )
{
	local KFExplosionActorLingering GFExplosionActor;

	if( bHasDisintegrated )
	{
		return;
	}

	if( !bHasExploded && bSpawnGroundFire )
	{
		// Spawn our explosion and set up its parameters
	    GFExplosionActor = Spawn( GroundFireExplosionActorClass, self,, HitLocation + (HitNormal * 32.f), rotator(HitNormal) );
		if (GFExplosionActor != None)
		{
			GFExplosionActor.Instigator = Instigator;
			GFExplosionActor.InstigatorController = InstigatorController;

			// These are needed for the decal tracing later in GameExplosionActor.Explode()
			GroundFireExplosionTemplate.HitLocation = HitLocation;
			GroundFireExplosionTemplate.HitNormal = HitNormal;

			// Apply explosion direction
			if( GroundFireExplosionTemplate.bDirectionalExplosion )
			{
				HitNormal = GetExplosionDirection( HitNormal );
			}

			// Set our duration
			GFExplosionActor.MaxTime = BurnDuration;

			// Set our burn interval
			GFExplosionActor.Interval = BurnDamageInterval;

			// Boom
			GFExplosionActor.Explode( GroundFireExplosionTemplate, HitNormal );
		}
	}

	super.TriggerExplosion( HitLocation, HitNormal, HitActor );
}

defaultproperties
{
   BurnDuration=4.000000
   BurnDamageInterval=0.500000
   GroundFireExplosionActorClass=Class'kfgamecontent.KFExplosion_HuskFireballGroundFire'
   GroundFireExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_Husk_Fireball:ExploTemplate1'
   bAutoStartAmbientSound=True
   bStopAmbientSoundOnExplode=True
   ExplosionActorClass=Class'KFGame.KFExplosionActor'
   Begin Object Class=KFGameExplosion Name=ExploTemplate0
      ExplosionEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Explosions.HuskProjectile_Explosion'
      Damage=25.000000
      DamageRadius=300.000000
      MyDamageType=Class'kfgamecontent.KFDT_Fire_HuskFireball'
      MomentumTransferScale=60000.000000
      ExplosionSound=AkEvent'WW_ZED_Husk.ZED_Husk_SFX_Ranged_Shot_Impact'
      ExploLight=PointLightComponent'kfgamecontent.Default__KFProj_Husk_Fireball:ExplosionPointLight'
      ExploLightFadeOutTime=0.500000
      CamShake=KFCameraShake'FX_CameraShake_Arch.Misc_Explosions.HuskFireball'
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'KFGame.Default__KFGameExplosion'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_Husk_Fireball:ExploTemplate0'
   ProjFlightTemplate=ParticleSystem'ZED_Husk_EMIT.FX_Husk_projectile_01'
   AmbientSoundPlayEvent=AkEvent'WW_ZED_Husk.ZED_Husk_SFX_Ranged_Shot_LP'
   AmbientSoundStopEvent=AkEvent'WW_ZED_Husk.ZED_Husk_SFX_Ranged_Shot_LP_Stop'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.100000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'AkAudio.Default__AkComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   Speed=1800.000000
   MaxSpeed=1800.000000
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
   bCollideComplex=True
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_Husk_Fireball"
   ObjectArchetype=KFProjectile'KFGame.Default__KFProjectile'
}
