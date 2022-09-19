//=============================================================================
// KFProj_ShrinkRay
//=============================================================================
// Projectile class for ground fire from Shrink ray, etc
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================

class KFProj_ShrinkRay extends KFProj_GroundFire;

defaultproperties
{
   bWarnAIWhenFired=True
   Begin Object Class=KFGameExplosion Name=ExploTemplate0
      ExplosionEffects=KFImpactEffectInfo'WEP_ShrinkRay_Gun_ARCH.Beam_Impacts'
      Damage=0.000000
      DamageRadius=0.000000
      MyDamageType=None
      KnockDownStrength=0.000000
      MomentumTransferScale=1.000000
      ExploLight=PointLightComponent'kfgamecontent.Default__KFProj_ShrinkRay:FlamePointLight'
      ExploLightFadeOutTime=0.100000
      ExploLightStartFadeOutTime=0.300000
      ExploLightFlickerIntensity=1.000000
      ExploLightFlickerInterpSpeed=50.000000
      FractureMeshRadius=0.000000
      FracturePartVel=0.000000
      CamShake=None
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'KFGame.Default__KFGameExplosion'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_ShrinkRay:ExploTemplate0'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'kfgamecontent.Default__KFProj_GroundFire:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.250000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFProj_GroundFire:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'kfgamecontent.Default__KFProj_GroundFire:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'kfgamecontent.Default__KFProj_GroundFire:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=AmbientAkSoundComponent
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_ShrinkRay"
   ObjectArchetype=KFProj_GroundFire'kfgamecontent.Default__KFProj_GroundFire'
}
