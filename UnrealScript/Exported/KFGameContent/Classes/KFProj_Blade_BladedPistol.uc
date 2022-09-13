//=============================================================================
// KFProj_Blade_BladedPistol
//=============================================================================
// Blade class for the BladedPistol
//=============================================================================
// Killing Floor 2
// Copyright (C) 2021 Tripwire Interactive LLC
//=============================================================================

class KFProj_Blade_BladedPistol extends KFProj_RicochetStickBullet
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
   WeaponClassName="KFWeap_Pistol_Bladed"
   AmmoPickupSound=AkEvent'WW_WEP_BladedPistol.Play_WEP_BladedPistol_Projectile_Pickup'
   ProjPickupTemplate=ParticleSystem'WEP_BladedPistol_EMIT.FX_bladed_pickup_01'
   LifeSpanAfterStick=180.000000
   DampingFactor=0.800000
   RicochetEffects=KFImpactEffectInfo'WEP_BladedPistol_ARCH.BladedImpacts'
   bNoReplicationToInstigator=False
   bAmbientSoundZedTimeOnly=False
   bWarnAIWhenFired=True
   GravityScale=0.800000
   ExtraLineCollisionOffsets(0)=(X=0.000000,Y=-16.000000,Z=0.000000)
   ExtraLineCollisionOffsets(1)=(X=0.000000,Y=16.000000,Z=0.000000)
   ExtraLineCollisionOffsets(2)=(X=0.000000,Y=0.000000,Z=-6.000000)
   ExtraLineCollisionOffsets(3)=(X=0.000000,Y=0.000000,Z=6.000000)
   ExtraLineCollisionOffsets(4)=()
   ProjFlightTemplate=ParticleSystem'WEP_BladedPistol_EMIT.FX_bladed_projectile_01'
   ProjFlightTemplateZedTime=ParticleSystem'WEP_BladedPistol_EMIT.FX_bladed_projectile_01'
   AmbientSoundPlayEvent=AkEvent'WW_WEP_BladedPistol.Play_WEP_BladedPistol_Projectile_Loop'
   AmbientSoundStopEvent=AkEvent'WW_WEP_BladedPistol.Stop_WEP_BladedPistol_Projectile_Loop'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'KFGame.Default__KFProj_RicochetStickBullet:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.100000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFProj_RicochetStickBullet:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   ImpactEffects=KFImpactEffectInfo'WEP_BladedPistol_ARCH.BladedEmbedFX'
   Speed=4000.000000
   MaxSpeed=4000.000000
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
   Name="Default__KFProj_Blade_BladedPistol"
   ObjectArchetype=KFProj_RicochetStickBullet'KFGame.Default__KFProj_RicochetStickBullet'
}
