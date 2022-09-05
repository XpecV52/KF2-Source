//=============================================================================
// KFProj_Grenade_HRGIncendiaryRifle
//=============================================================================
// High explosive and incendiary grenade that on explosion leaves behind small
// patches of fire, like a molotov grenade.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

class KFProj_Grenade_HRGIncendiaryRifle extends KFProj_HighExplosive_M16M203;

/** Class for spawning residual flames **/
var class<KFProjectile> ResidualFlameProjClass;

/** Number of lingering flames to spawn */
var() int NumResidualFlames;

/** Explosion actor class to use for ground fire */
var const protected class<KFExplosionActorLingering> GroundFireExplosionActorClass;

/** Explosion template to use for ground fire */
var KFGameExplosion GroundFireExplosionTemplate;

/** Allows the projectile to spawn the ground fire **/
var bool bSpawnGroundFire;

var bool bUseAltGroundFireEffect;
var KFImpactEffectInfo AltGroundFireEffect;

/** Last Velocity from Explode() */
var vector LastVelocity;

replication
{
	if( bNetInitial )
		bSpawnGroundFire;
}

simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
	// Onyl spawn the ground fire if the projectile doesn't touch any pawn
	if (ClassIsChildOf(Other.class, class'KFPawn'))
	{
		bSpawnGroundFire = false;
	}

	super.ProcessTouch(Other, HitLocation, HitNormal);
}

/** Spawn several projectiles that explode and linger on impact */
function SpawnResidualFlames (vector HitLocation, vector HitNormal, vector HitVelocity)
{
	local int i;
	local vector HitVelDir;
	local float HitVelMag;
	local vector SpawnLoc, SpawnVel;

	HitVelMag = VSize (HitVelocity);
	HitVelDir = Normal (HitVelocity);

	SpawnLoc = HitLocation + (HitNormal * 10.f);

	// spawn random lingering fires (rather, projectiles that cause little fires)
	for( i = 0; i < NumResidualFlames; ++i )
	{
		SpawnVel = CalculateResidualFlameVelocity( HitNormal, HitVelDir, HitVelMag );
		SpawnResidualFlame( ResidualFlameProjClass, SpawnLoc, SpawnVel );
	}
}

// Based on HuskCannon Ground Fire TriggerExplosion:
simulated function TriggerExplosion(Vector HitLocation, Vector HitNormal, Actor HitActor)
{
	local vector FlameSpawnVel;
	local KFExplosionActorLingering GFExplosionActor;
	local vector GroundExplosionHitNormal;
	local bool bDoExplosion;

	if (bHasDisintegrated)
	{
		return;
	}

	bDoExplosion = !bHasExploded && Role == ROLE_Authority;

	if (bDoExplosion && bSpawnGroundFire)
	{
		if (bUseAltGroundFireEffect && AltGroundFireEffect != none)
		{
			GroundFireExplosionTemplate.ExplosionEffects = AltGroundFireEffect;
		}

		GroundExplosionHitNormal = HitNormal;

		// Spawn our explosion and set up its parameters
		GFExplosionActor = Spawn(GroundFireExplosionActorClass, self, , HitLocation + (HitNormal * 32.f), rotator(HitNormal));
		if (GFExplosionActor != None)
		{
			GFExplosionActor.Instigator = Instigator;
			GFExplosionActor.InstigatorController = InstigatorController;

			// These are needed for the decal tracing later in GameExplosionActor.Explode()
			GroundFireExplosionTemplate.HitLocation = HitLocation;
			GroundFireExplosionTemplate.HitNormal = GroundExplosionHitNormal;

			// Apply explosion direction
			if (GroundFireExplosionTemplate.bDirectionalExplosion)
			{
				GroundExplosionHitNormal = GetExplosionDirection(GroundExplosionHitNormal);
			}

			GFExplosionActor.Explode(GroundFireExplosionTemplate, GroundExplosionHitNormal);
		}
	}

	if (bDoExplosion)
	{
		FlameSpawnVel = 0.25f * CalculateResidualFlameVelocity(HitNormal, Normal(LastVelocity), VSize(LastVelocity));
		SpawnResidualFlames (HitLocation, HitNormal, FlameSpawnVel);
	}

	super.TriggerExplosion(HitLocation, HitNormal, HitActor);
}

simulated function Explode (vector HitLocation, vector HitNormal)
{
	LastVelocity = Velocity;
	super.Explode (HitLocation, HitNormal);
}

simulated function PostBeginPlay()
{
	local KFPlayerReplicationInfo InstigatorPRI;

	if(Instigator != none)
	{
		if (AltGroundFireEffect != none)
		{
			InstigatorPRI = KFPlayerReplicationInfo(Instigator.PlayerReplicationInfo);
			if (InstigatorPRI != none)
			{
				// Use alternative explosion effects when Ground Fire Perk is active:
				bUseAltGroundFireEffect = InstigatorPRI.bSplashActive;
			}
		}
		else
		{
			bUseAltGroundFireEffect = false;
		}
	}

	super.PostBeginPlay();
}

simulated protected function PrepareExplosionTemplate()
{
	// Swap the ExplosionTemplate's effect if necessary
	if( bAltExploEffects )
	{
		ExplosionTemplate.ExplosionEffects = AltExploEffects;
	}
}

defaultproperties
{
   ResidualFlameProjClass=Class'kfgamecontent.KFProj_Flame_HRGIncendiaryRifle'
   NumResidualFlames=4
   GroundFireExplosionActorClass=Class'kfgamecontent.KFExplosion_HRGIncendiaryRifleGroundFire'
   GroundFireExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_Grenade_HRGIncendiaryRifle:ExploTemplate1'
   bSpawnGroundFire=True
   AltGroundFireEffect=KFImpactEffectInfo'WEP_Flamethrower_ARCH.GroundFire_Splash_Impacts'
   Begin Object Class=KFGameExplosion Name=ExploTemplate0 Archetype=KFGameExplosion'kfgamecontent.Default__KFProj_HighExplosive_M16M203:ExploTemplate0'
      ExplosionEffects=KFImpactEffectInfo'wep_molotov_arch.Molotov_Explosion'
      Damage=100.000000
      MyDamageType=Class'kfgamecontent.KFDT_Explosive_HRGIncendiaryRifle'
      KnockDownStrength=0.000000
      MomentumTransferScale=0.000000
      ExplosionSound=AkEvent'WW_WEP_EXP_Grenade_Frag.Play_WEP_EXP_Grenade_Frag_Explosion'
      ExploLight=PointLightComponent'kfgamecontent.Default__KFProj_Grenade_HRGIncendiaryRifle:ExplosionPointLight'
      ExploLightFadeOutTime=0.200000
      CamShake=KFCameraShake'FX_CameraShake_Arch.Misc_Explosions.Light_Explosion_Rumble'
      CamShakeInnerRadius=200.000000
      CamShakeFalloff=1.500000
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'kfgamecontent.Default__KFProj_HighExplosive_M16M203:ExploTemplate0'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_Grenade_HRGIncendiaryRifle:ExploTemplate0'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'kfgamecontent.Default__KFProj_HighExplosive_M16M203:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.250000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFProj_HighExplosive_M16M203:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'kfgamecontent.Default__KFProj_HighExplosive_M16M203:CollisionCylinder'
      CollisionHeight=5.000000
      CollisionRadius=5.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockNonZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'kfgamecontent.Default__KFProj_HighExplosive_M16M203:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=AmbientAkSoundComponent
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_Grenade_HRGIncendiaryRifle"
   ObjectArchetype=KFProj_HighExplosive_M16M203'kfgamecontent.Default__KFProj_HighExplosive_M16M203'
}
