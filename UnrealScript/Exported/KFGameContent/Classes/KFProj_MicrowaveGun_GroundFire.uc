//=============================================================================
// KFProj_MicrowaveGun_GroundFire 
//=============================================================================
// Projectile class for ground fire from flamethrowers, etc
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFProj_MicrowaveGun_GroundFire extends KFProj_GroundFire;

defaultproperties
{
   bWarnAIWhenFired=True
   Begin Object Class=KFGameExplosion Name=ExploTemplate0
      ExplosionEffects=KFImpactEffectInfo'WEP_Flamethrower_ARCH.GroundFire_Impacts'
      bAllowPerMaterialFX=True
      Damage=5.000000
      DamageRadius=100.000000
      MyDamageType=Class'kfgamecontent.KFDT_Fire_Ground_MicrowaveGun'
      KnockDownStrength=0.000000
      MomentumTransferScale=0.000000
      ExploLight=PointLightComponent'kfgamecontent.Default__KFProj_MicrowaveGun_GroundFire:FlamePointLight'
      ExploLightFadeOutTime=0.500000
      ExploLightStartFadeOutTime=1.500000
      ExploLightFlickerIntensity=5.000000
      ExploLightFlickerInterpSpeed=15.000000
      FractureMeshRadius=0.000000
      FracturePartVel=0.000000
      CamShake=None
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'KFGame.Default__KFGameExplosion'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_MicrowaveGun_GroundFire:ExploTemplate0'
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
   Name="Default__KFProj_MicrowaveGun_GroundFire"
   ObjectArchetype=KFProj_GroundFire'kfgamecontent.Default__KFProj_GroundFire'
}
