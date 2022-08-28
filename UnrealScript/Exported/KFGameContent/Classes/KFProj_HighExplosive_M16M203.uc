//=============================================================================
// KFProj_HighExplosive_M16M203
//=============================================================================
// High explosive grenade launcher grenade for the M16 M203
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Brooks Butler
//=============================================================================

class KFProj_HighExplosive_M16M203 extends KFProj_BallisticExplosive
    hidedropdown;

defaultproperties
{
   ArmDistSquared=150000.000000
   ProjDudTemplate=ParticleSystem'Wep_M16_M203_EMIT.FX_M16_M203_40mm_Projectile_Dud'
   GrenadeBounceEffectInfo=KFImpactEffectInfo'FX_Impacts_ARCH.DefaultGrenadeImpacts'
   bWarnAIWhenFired=True
   TossZ=150.000000
   GravityScale=0.500000
   TerminalVelocity=4000.000000
   Begin Object Class=KFGameExplosion Name=ExploTemplate0
      ExplosionEffects=KFImpactEffectInfo'Wep_M16_M203_ARCH.M16_M203_Grenade_Explosion'
      Damage=230.000000
      DamageFalloffExponent=3.000000
      MyDamageType=Class'kfgamecontent.KFDT_Explosive_M16M203'
      KnockDownStrength=0.000000
      ExplosionSound=AkEvent'WW_WEP_SA_M79.Play_WEP_SA_M79_Explosion'
      ExploLight=PointLightComponent'kfgamecontent.Default__KFProj_HighExplosive_M16M203:ExplosionPointLight'
      ExploLightFadeOutTime=0.200000
      CamShake=KFCameraShake'FX_CameraShake_Arch.Grenades.Default_Grenade'
      CamShakeInnerRadius=0.000000
      CamShakeOuterRadius=0.000000
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'KFGame.Default__KFGameExplosion'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_HighExplosive_M16M203:ExploTemplate0'
   ProjDisintegrateTemplate=ParticleSystem'ZED_Siren_EMIT.FX_Siren_grenade_disable_01'
   AltExploEffects=KFImpactEffectInfo'WEP_M79_ARCH.M79Grenade_Explosion_Concussive_Force'
   ProjFlightTemplate=ParticleSystem'Wep_M16_M203_EMIT.FX_M16_M203_40mm_Projectile'
   ProjFlightTemplateZedTime=ParticleSystem'Wep_M16_M203_EMIT.FX_M16_M203_40mm_Projectile_ZEDTIME'
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
   LifeSpan=1000.000000
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_HighExplosive_M16M203"
   ObjectArchetype=KFProj_BallisticExplosive'KFGame.Default__KFProj_BallisticExplosive'
}
