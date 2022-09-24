//=============================================================================
// KFProj_Rocket_RPG7
//=============================================================================
// High explosive rocket launcher rocket for the RPG7
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibso
//=============================================================================

class KFProj_Rocket_RPG7 extends KFProj_BallisticExplosive
	hidedropdown;

defaultproperties
{
   ArmDistSquared=150000.000000
   ProjDudTemplate=ParticleSystem'WEP_RPG7_EMIT.FX_RPG7_Projectile_Dud'
   GrenadeBounceEffectInfo=KFImpactEffectInfo'wep_rpg7_arch.RPG7_Projectile_Impacts'
   bWarnAIWhenFired=True
   Begin Object Class=KFGameExplosion Name=ExploTemplate0
      ExplosionEffects=KFImpactEffectInfo'wep_rpg7_arch.RPG7_Explosion'
      Damage=750.000000
      DamageRadius=400.000000
      DamageFalloffExponent=2.000000
      MyDamageType=Class'kfgamecontent.KFDT_Explosive_RPG7'
      KnockDownStrength=0.000000
      ExplosionSound=AkEvent'WW_WEP_SA_RPG7.Play_WEP_SA_RPG7_Explosion'
      ExploLight=PointLightComponent'kfgamecontent.Default__KFProj_Rocket_RPG7:ExplosionPointLight'
      ExploLightFadeOutTime=0.200000
      CamShake=KFCameraShake'FX_CameraShake_Arch.Misc_Explosions.Light_Explosion_Rumble'
      CamShakeInnerRadius=200.000000
      CamShakeFalloff=1.500000
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'KFGame.Default__KFGameExplosion'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_Rocket_RPG7:ExploTemplate0'
   ProjDisintegrateTemplate=ParticleSystem'ZED_Siren_EMIT.FX_Siren_grenade_disable_01'
   AltExploEffects=KFImpactEffectInfo'wep_rpg7_arch.RPG7_Explosion_Concussive_Force'
   ProjFlightTemplate=ParticleSystem'WEP_RPG7_EMIT.FX_RPG7_Projectile'
   ProjFlightTemplateZedTime=ParticleSystem'WEP_RPG7_EMIT.FX_RPG7_Projectile_ZED_TIME'
   AmbientSoundPlayEvent=AkEvent'WW_WEP_SA_RPG7.Play_WEP_SA_RPG7_Projectile_Loop'
   AmbientSoundStopEvent=AkEvent'WW_WEP_SA_RPG7.Stop_WEP_SA_RPG7_Projectile_Loop'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'KFGame.Default__KFProj_BallisticExplosive:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.250000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFProj_BallisticExplosive:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   Speed=6000.000000
   MaxSpeed=6000.000000
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
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_Rocket_RPG7"
   ObjectArchetype=KFProj_BallisticExplosive'KFGame.Default__KFProj_BallisticExplosive'
}
