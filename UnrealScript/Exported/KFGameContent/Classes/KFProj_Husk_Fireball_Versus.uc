//=============================================================================
// KFProj_Husk_Fireball_Versus
//=============================================================================
// Versus version of the husk fireball
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFProj_Husk_Fireball_Versus extends KFProj_Husk_Fireball;

defaultproperties
{
   BurnDamageInterval=0.250000
   bSpawnGroundFire=True
   GroundFireExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_Husk_Fireball_Versus:ExploTemplate1'
   Begin Object Class=KFGameExplosion Name=ExploTemplate0 Archetype=KFGameExplosion'kfgamecontent.Default__KFProj_Husk_Fireball:ExploTemplate0'
      ExplosionEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Explosions.HuskProjectile_Explosion'
      Damage=23.000000
      DamageRadius=450.000000
      MyDamageType=Class'kfgamecontent.KFDT_Fire_HuskFireball'
      MomentumTransferScale=60000.000000
      ExplosionEmitterScale=2.000000
      ExplosionSound=AkEvent'WW_ZED_Husk.ZED_Husk_SFX_Ranged_Shot_Impact'
      ExploLight=PointLightComponent'kfgamecontent.Default__KFProj_Husk_Fireball_Versus:ExplosionPointLight'
      ExploLightFadeOutTime=0.500000
      CamShake=KFCameraShake'FX_CameraShake_Arch.Misc_Explosions.HuskFireball'
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'kfgamecontent.Default__KFProj_Husk_Fireball:ExploTemplate0'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_Husk_Fireball_Versus:ExploTemplate0'
   ProjFlightTemplate=ParticleSystem'ZED_Patriarch_EMIT.FX_Patriarch_Rocket_Projectile'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'kfgamecontent.Default__KFProj_Husk_Fireball:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.100000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFProj_Husk_Fireball:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'kfgamecontent.Default__KFProj_Husk_Fireball:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'kfgamecontent.Default__KFProj_Husk_Fireball:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=AmbientAkSoundComponent
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_Husk_Fireball_Versus"
   ObjectArchetype=KFProj_Husk_Fireball'kfgamecontent.Default__KFProj_Husk_Fireball'
}
