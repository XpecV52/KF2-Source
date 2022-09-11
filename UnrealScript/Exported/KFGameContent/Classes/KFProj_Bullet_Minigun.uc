//=============================================================================
// KFProj_Bullet_Minigun
//=============================================================================
// Bullet class for Minigun
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFProj_Bullet_Minigun extends KFProj_Bullet
	hidedropdown;

var ParticleSystem AddedImpactEffect;

simulated static function PlayAddedImpactEffect(Vector HitLocation, Vector HitNormal)
{
	local WorldInfo WI;
	if( default.AddedImpactEffect != none )
	{
		WI = Class'WorldInfo'.static.GetWorldInfo();
		WI.MyEmitterPool.SpawnEmitter(default.AddedImpactEffect, HitLocation, rotator(HitNormal));
	}
}

defaultproperties
{
   AddedImpactEffect=ParticleSystem'WEP_Minigun_EMIT.FX_Minigun_Impact_Extra'
   ProjFlightTemplate=ParticleSystem'WEP_1P_L85A2_EMIT.FX_L85A2_Tracer_ZEDTime'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'KFGame.Default__KFProj_Bullet:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.100000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFProj_Bullet:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   ImpactEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Heavy_bullet_impact'
   Speed=22500.000000
   MaxSpeed=22500.000000
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
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_Bullet_Minigun"
   ObjectArchetype=KFProj_Bullet'KFGame.Default__KFProj_Bullet'
}