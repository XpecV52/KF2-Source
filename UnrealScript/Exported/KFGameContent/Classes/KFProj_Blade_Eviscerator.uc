//=============================================================================
// KFProj_Blade_Eviscerator
//=============================================================================
// Blade class for the Eviscerator
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFProj_Blade_Eviscerator extends KFProj_RicochetStickBullet
	hidedropdown;

// Make sure that last location always exists.
simulated event PostBeginPlay()
{
    Super.PostBeginPlay();

    LastLocation = Location;
}

simulated function bool ShouldProcessBulletTouch()
{
	return BouncesLeft > 0 && GravityScale == default.GravityScale;
}

defaultproperties
{
   PickupRadius=250.000000
   WeaponClassName="KFWeap_Eviscerator"
   AmmoPickupSound=AkEvent'WW_WEP_SA_SawBlade.Play_WEP_SA_Sawblade_Projectile_Pickup'
   ProjPickupTemplate=ParticleSystem'WEP_SawBlade_EMIT.FX_Sawblade_pickup_01'
   LifeSpanAfterStick=180.000000
   BouncesLeft=5
   DampingFactor=0.950000
   RicochetEffects=KFImpactEffectInfo'WEP_Sawblade_ARCH.SawbladeImpacts'
   bNoReplicationToInstigator=False
   bAmbientSoundZedTimeOnly=False
   bWarnAIWhenFired=True
   GravityScale=0.750000
   ExtraLineCollisionOffsets(0)=(X=0.000000,Y=-8.000000,Z=0.000000)
   ExtraLineCollisionOffsets(1)=(X=0.000000,Y=8.000000,Z=0.000000)
   ExtraLineCollisionOffsets(2)=()
   ProjFlightTemplate=ParticleSystem'WEP_SawBlade_EMIT.FX_Sawblade_projectile_01'
   ProjFlightTemplateZedTime=ParticleSystem'WEP_SawBlade_EMIT.FX_Sawblade_projectile_01'
   AmbientSoundPlayEvent=AkEvent'WW_WEP_SA_SawBlade.Play_WEP_SA_Sawblade_Projectile_Loop'
   AmbientSoundStopEvent=AkEvent'WW_WEP_SA_SawBlade.Stop_WEP_SA_Sawblade_Projectile_Loop'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'KFGame.Default__KFProj_RicochetStickBullet:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.100000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFProj_RicochetStickBullet:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   ImpactEffects=KFImpactEffectInfo'WEP_Sawblade_ARCH.SawbladeEmbedFX'
   Speed=2500.000000
   MaxSpeed=2500.000000
   bRotationFollowsVelocity=False
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFProj_RicochetStickBullet:CollisionCylinder'
      CollisionHeight=2.000000
      CollisionRadius=6.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFProj_RicochetStickBullet:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=AmbientAkSoundComponent
   bNetTemporary=False
   bUpdateSimulatedPosition=True
   LifeSpan=8.000000
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_Blade_Eviscerator"
   ObjectArchetype=KFProj_RicochetStickBullet'KFGame.Default__KFProj_RicochetStickBullet'
}
