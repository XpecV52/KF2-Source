//=============================================================================
// KFProj_Bullet_DragonsBreath
//=============================================================================
// Shotgun pellet class for the the Mossberg 500
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFProj_FlareGun extends KFProj_Bullet
	hidedropdown;

/** Time before particle system parameter is set */
var float FlameDisperalDelay;
/** Last hit normal from Touch() or HitWall() */
var vector LastHitNormal;
/** Residual / splash flame chance */
var float ResidualFlameChance;

/**
 * Spawns any effects needed for the flight of this projectile
 */
simulated function SpawnFlightEffects()
{
	Super.SpawnFlightEffects();

	if ( WorldInfo.NetMode != NM_DedicatedServer && WorldInfo.GetDetailMode() > DM_Low  )
	{
		SetTimer(FlameDisperalDelay, false, nameof(MidFlightFXTimer));
	}
}

simulated function MidFlightFXTimer()
{
	if (ProjEffects!=None)
	{
		ProjEffects.SetFloatParameter('Spread', 1.0);
	}
}

simulated protected function StopFlightEffects()
{
	Super.StopFlightEffects();
	ClearTimer(nameof(MidFlightFXTimer));
}

simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
	LastHitNormal = HitNormal;
	Super.ProcessTouch(Other, HitLocation, HitNormal);
}

/**
 * Explode this Projectile
 */
simulated function TriggerExplosion(Vector HitLocation, Vector HitNormal, Actor HitActor)
{
	LastHitNormal = HitNormal;
	Super.TriggerExplosion(HitLocation, HitNormal, HitActor);
}

/** 
 * Chance of spawning splash flames.  Need to use StopSimulating,
 * because TriggerExplosion() is not always called for this projectile.
 *
 * @note: Normally, we would just do this in TriggerExplosion, but bullets don't call TriggerExplosion
 * when ExplosionTemplate==None.  This is highly odd because code was added to TriggerExplosion() that runs
 * even when ExplosionTemplate==None.  Instead of trying to untangle things... here is a workaround
 */
simulated protected function StopSimulating()
{
	local vector FlameSpawnVel;

	// Can use physics mode as a way of doing this only once
	if ( Role == ROLE_Authority && Physics == PHYS_Falling && FRand() < ResidualFlameChance )
	{
		FlameSpawnVel = 0.25f * CalculateResidualFlameVelocity( LastHitNormal, Normal( Velocity ), VSize( Velocity ) );
		SpawnResidualFlame( class'KFProj_MolotovSplash', Location + (LastHitNormal * 10.f), FlameSpawnVel );
	}

	Super.StopSimulating();
}

defaultproperties
{
   FlameDisperalDelay=0.250000
   ResidualFlameChance=0.330000
   bAmbientSoundZedTimeOnly=False
   bWarnAIWhenFired=True
   ProjFlightLightPriority=LPP_High
   GravityScale=0.050000
   TerminalVelocity=5000.000000
   ProjFlightTemplate=ParticleSystem'WEP_Flaregun_EMIT.FX_Flaregun_Projectile_01'
   Begin Object Class=PointLightComponent Name=PointLight0
      Radius=350.000000
      FalloffExponent=3.000000
      Brightness=1.500000
      LightColor=(B=100,G=160,R=250,A=255)
      CastShadows=False
      CastStaticShadows=False
      CastDynamicShadows=False
      LightingChannels=(Outdoor=True)
      Name="PointLight0"
      ObjectArchetype=PointLightComponent'Engine.Default__PointLightComponent'
   End Object
   ProjFlightLight=PointLight0
   AmbientSoundPlayEvent=AkEvent'WW_WEP_Flare_Gun.Play_WEP_Flare_Gun_Whistle'
   AmbientSoundStopEvent=AkEvent'WW_WEP_Flare_Gun.Stop_WEP_Flare_Gun_Whistle'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'KFGame.Default__KFProj_Bullet:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.100000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFProj_Bullet:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   ImpactEffects=KFImpactEffectInfo'WEP_FlareGun_ARCH.Wep_Flaregun_bullet_impact'
   Speed=5000.000000
   MaxSpeed=5000.000000
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFProj_Bullet:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFProj_Bullet:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=AmbientAkSoundComponent
   Physics=PHYS_Falling
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_FlareGun"
   ObjectArchetype=KFProj_Bullet'KFGame.Default__KFProj_Bullet'
}
