//=============================================================================
// KFProj_EvilDAR_Rocket
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFProj_EvilDAR_Rocket extends KFProjectile;

defaultproperties
{
   bAutoStartAmbientSound=True
   bStopAmbientSoundOnExplode=True
   ExplosionActorClass=Class'KFGame.KFExplosionActor'
   Begin Object Class=KFGameExplosion Name=ExploTemplate0
      ExplosionEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Explosions.HuskProjectile_Explosion'
      Damage=10.000000
      DamageRadius=300.000000
      MyDamageType=Class'kfgamecontent.KFDT_EvilDAR_Rocket'
      MomentumTransferScale=30000.000000
      ExplosionSound=AkEvent'WW_ZED_Evil_DAR.Play_ZED_EvilDAR_SFX_Missle_Impact'
      ExploLight=PointLightComponent'kfgamecontent.Default__KFProj_EvilDAR_Rocket:ExplosionPointLight'
      ExploLightFadeOutTime=0.500000
      CamShake=KFCameraShake'FX_CameraShake_Arch.Misc_Explosions.HuskFireball'
      CamShakeInnerRadius=150.000000
      CamShakeOuterRadius=325.000000
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'KFGame.Default__KFGameExplosion'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_EvilDAR_Rocket:ExploTemplate0'
   ProjFlightTemplate=ParticleSystem'ZED_EvilDAR_EMIT.FX_EvilDar_RPG7_Projectile'
   AmbientSoundPlayEvent=AkEvent'WW_ZED_Evil_DAR.Play_ZED_EvilDAR_SFX_Missle_Passby'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.100000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'AkAudio.Default__AkComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   Speed=1800.000000
   MaxSpeed=3200.000000
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
   Name="Default__KFProj_EvilDAR_Rocket"
   ObjectArchetype=KFProjectile'KFGame.Default__KFProjectile'
}
