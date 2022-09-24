//=============================================================================
// KFProj_Pellet_HRG_Dragonbreath
//=============================================================================
//=============================================================================
// Killing Floor 2
// Copyright (C) 2022 Tripwire Interactive LLC
//=============================================================================

class KFProj_Pellet_HRG_Dragonbreath extends KFProj_Bullet_Pellet
	hidedropdown;


/** Last hit normal from Touch() or HitWall() */
var vector LastHitNormal;

var float GroundFireChance;


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


simulated protected function StopSimulating()
{
	local vector FlameSpawnVel;

	if (Role == ROLE_Authority && Physics == PHYS_Falling && FRand() < GroundFireChance)
	{
		//SpawnGroundFire();
		FlameSpawnVel = 0.25f * CalculateResidualFlameVelocity(LastHitNormal, Normal(Velocity), VSize(Velocity));
		SpawnResidualFlame(class'KFProj_HRG_DragonBreath_Splash', Location + (LastHitNormal * 10.f), FlameSpawnVel);
	}

	super.StopSimulating();
}

defaultproperties
{
   GroundFireChance=1.000000
   GravityScale=0.350000
   TerminalVelocity=7000.000000
   ProjFlightTemplate=ParticleSystem'WEP_DragonsBreath_EMIT.Tracer.FX_DragonsBreath_Tracer'
   Begin Object Class=PointLightComponent Name=PointLight0
      Radius=500.000000
      FalloffExponent=10.000000
      Brightness=0.500000
      LightColor=(B=171,G=218,R=252,A=255)
      CastShadows=False
      CastStaticShadows=False
      CastDynamicShadows=False
      bCastPerObjectShadows=False
      LightingChannels=(Outdoor=True)
      Name="PointLight0"
      ObjectArchetype=PointLightComponent'Engine.Default__PointLightComponent'
   End Object
   ProjFlightLight=PointLight0
   ProjFlightTemplateZedTime=ParticleSystem'WEP_DragonsBreath_EMIT.Tracer.FX_DragonsBreath_Tracer_ZEDTime'
   AmbientSoundPlayEvent=AkEvent'WW_WEP_SA_DragonsBreath.Play_SA_DragonsBreath_Projectile_Loop'
   AmbientSoundStopEvent=AkEvent'WW_WEP_SA_DragonsBreath.Stop_SA_DragonsBreath_Projectile_Loop'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'kfgamecontent.Default__KFProj_Bullet_Pellet:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.100000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFProj_Bullet_Pellet:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   ImpactEffects=KFImpactEffectInfo'WEP_DragonsBreath_ARCH.DragonsBreath_bullet_impact'
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'kfgamecontent.Default__KFProj_Bullet_Pellet:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'kfgamecontent.Default__KFProj_Bullet_Pellet:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=AmbientAkSoundComponent
   Physics=PHYS_Falling
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_Pellet_HRG_Dragonbreath"
   ObjectArchetype=KFProj_Bullet_Pellet'kfgamecontent.Default__KFProj_Bullet_Pellet'
}
