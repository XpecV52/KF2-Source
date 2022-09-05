//=============================================================================
// KFProj_Explosive_HRGWinterbite
//=============================================================================
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

class KFProj_Explosive_HRGWinterbite extends KFProj_BallisticExplosive;

simulated function AdjustCanDisintigrate() {}

simulated protected function PrepareExplosionTemplate()
{
	// skip KFProj_BallisticExplosive because it applies Demo skills
    super(KFProjectile).PrepareExplosionTemplate();
}

simulated protected function SetExplosionActorClass()
{
	// skip KFProj_BallisticExplosive because it applies Demo skills
    super(KFProjectile).SetExplosionActorClass();
}

defaultproperties
{
   ProjDudTemplate=ParticleSystem'WEP_HRG_Winterbite_EMIT.FX_WinterBite_Projectile_Dud'
   GrenadeBounceEffectInfo=KFImpactEffectInfo'WEP_HRG_Winterbite_ARCH.FX_WinterBite_Projectile_Impacts'
   TossZ=150.000000
   GravityScale=0.250000
   TerminalVelocity=7500.000000
   Begin Object Class=KFGameExplosion Name=ExploTemplate0
      ExplosionEffects=KFImpactEffectInfo'WEP_HRG_Winterbite_ARCH.FX_WinterBite_Projectile_Explosion'
      Damage=20.000000
      DamageRadius=200.000000
      DamageFalloffExponent=0.000000
      MyDamageType=Class'kfgamecontent.KFDT_Explosive_HRGWinterbite'
      KnockDownStrength=0.000000
      ExplosionSound=AkEvent'WW_WEP_Flare_Gun.Play_WEP_Flare_Gun_Explode_Ice'
      ExploLight=PointLightComponent'kfgamecontent.Default__KFProj_Explosive_HRGWinterbite:ExplosionPointLight'
      ExploLightFadeOutTime=0.300000
      CamShake=KFCameraShake'FX_CameraShake_Arch.Misc_Explosions.Light_Explosion_Rumble'
      CamShakeInnerRadius=0.000000
      CamShakeOuterRadius=300.000000
      CamShakeFalloff=1.500000
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'KFGame.Default__KFGameExplosion'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_Explosive_HRGWinterbite:ExploTemplate0'
   ProjDisintegrateTemplate=ParticleSystem'ZED_Siren_EMIT.FX_Siren_grenade_disable_01'
   AltExploEffects=KFImpactEffectInfo'WEP_HRG_Winterbite_ARCH.FX_WinterBite_Projectile_Explosion_Concussive_Force'
   ProjFlightTemplate=ParticleSystem'WEP_HRG_Winterbite_EMIT.FX_WinterBite_Projectile'
   ProjFlightTemplateZedTime=ParticleSystem'WEP_HRG_Winterbite_EMIT.FX_WinterBite_Projectile_ZEDTIME'
   AmbientSoundPlayEvent=AkEvent'WW_WEP_SA_M79.Play_WEP_SA_M79_Projectile_Loop'
   AmbientSoundStopEvent=AkEvent'WW_WEP_SA_M79.Stop_WEP_SA_M79_Projectile_Loop'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'KFGame.Default__KFProj_BallisticExplosive:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.250000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFProj_BallisticExplosive:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   Speed=7500.000000
   MaxSpeed=7500.000000
   MomentumTransfer=50000.000000
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFProj_BallisticExplosive:CollisionCylinder'
      CollisionHeight=5.000000
      CollisionRadius=5.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockNonZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFProj_BallisticExplosive:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=AmbientAkSoundComponent
   Physics=PHYS_Falling
   LifeSpan=10.000000
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_Explosive_HRGWinterbite"
   ObjectArchetype=KFProj_BallisticExplosive'KFGame.Default__KFProj_BallisticExplosive'
}
