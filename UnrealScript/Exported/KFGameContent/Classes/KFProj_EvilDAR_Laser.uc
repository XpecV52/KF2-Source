//=============================================================================
// KFProj_EvilDAR_Laser
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFProj_EvilDAR_Laser extends KFProjectile;

defaultproperties
{
   bAutoStartAmbientSound=True
   bStopAmbientSoundOnExplode=True
   ExplosionActorClass=Class'KFGame.KFExplosionActor'
   Begin Object Class=KFGameExplosion Name=ExploTemplate0
      ExplosionEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Explosions.EDar_Laser_Explosion'
      Damage=7.000000
      DamageRadius=75.000000
      MyDamageType=Class'kfgamecontent.KFDT_EvilDAR_Laser'
      MomentumTransferScale=60.000000
      ExplosionSound=AkEvent'WW_ZED_Evil_DAR.Play_ZED_EvilDAR_SFX_Laser_Impact'
      ExploLight=PointLightComponent'kfgamecontent.Default__KFProj_EvilDAR_Laser:ExplosionPointLight'
      ExploLightFadeOutTime=0.500000
      CamShake=KFCameraShake'FX_CameraShake_Arch.Misc_Explosions.HuskFireball'
      CamShakeInnerRadius=50.000000
      CamShakeOuterRadius=75.000000
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'KFGame.Default__KFGameExplosion'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_EvilDAR_Laser:ExploTemplate0'
   ProjFlightTemplate=ParticleSystem'ZED_EvilDAR_EMIT.FX_EvilDar_Laser_Projectile'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.100000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'AkAudio.Default__AkComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   Speed=3800.000000
   MaxSpeed=3800.000000
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
   Name="Default__KFProj_EvilDAR_Laser"
   ObjectArchetype=KFProjectile'KFGame.Default__KFProjectile'
}
