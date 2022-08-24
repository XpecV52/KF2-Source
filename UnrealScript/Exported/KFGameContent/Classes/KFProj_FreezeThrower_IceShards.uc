//=============================================================================
// KFProj_FreezeThrower_IceShards
//=============================================================================
// Ice shards projectile class
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================
class KFProj_FreezeThrower_IceShards extends KFProj_Bullet_Pellet
	hidedropdown;

defaultproperties
{
   ProjFlightTemplate=ParticleSystem'WEP_CryoGun_EMIT.FX_Cryogun_Projectile_alt'
   ProjFlightTemplateZedTime=ParticleSystem'WEP_CryoGun_EMIT.FX_Cryogun_Projectile_alt'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'kfgamecontent.Default__KFProj_Bullet_Pellet:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.100000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFProj_Bullet_Pellet:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   ImpactEffects=KFImpactEffectInfo'WEP_CryoGun_ARCH.Cryo_Alt_Impacts'
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
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_FreezeThrower_IceShards"
   ObjectArchetype=KFProj_Bullet_Pellet'kfgamecontent.Default__KFProj_Bullet_Pellet'
}
