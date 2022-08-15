//=============================================================================
// KFProj_HuskGroundFire
//=============================================================================
// Ground fires made by the husks flamethrower
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Greg Felber
//=============================================================================

class KFProj_HuskGroundFire extends KFProj_GroundFire
	hidedropdown;

defaultproperties
{
   Begin Object Class=KFGameExplosion Name=ExploTemplate0 Archetype=KFGameExplosion'KFGameContent.Default__KFProj_GroundFire:ExploTemplate0'
      ExplosionEffects=KFImpactEffectInfo'WEP_Flamethrower_ARCH.GroundFire_Impacts'
      bAllowPerMaterialFX=True
      Damage=6.000000
      DamageRadius=100.000000
      MyDamageType=Class'KFGameContent.KFDT_Fire_ZedGround'
      KnockDownStrength=0.000000
      MomentumTransferScale=0.000000
      ExploLight=PointLightComponent'KFGameContent.Default__KFProj_HuskGroundFire:FlamePointLight'
      ExploLightFadeOutTime=0.500000
      ExploLightStartFadeOutTime=1.500000
      ExploLightFlickerIntensity=5.000000
      ExploLightFlickerInterpSpeed=15.000000
      FractureMeshRadius=0.000000
      FracturePartVel=0.000000
      CamShake=None
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'KFGameContent.Default__KFProj_GroundFire:ExploTemplate0'
   End Object
   ExplosionTemplate=KFGameExplosion'KFGameContent.Default__KFProj_HuskGroundFire:ExploTemplate0'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'KFGameContent.Default__KFProj_GroundFire:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.250000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'KFGameContent.Default__KFProj_GroundFire:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGameContent.Default__KFProj_GroundFire:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGameContent.Default__KFProj_GroundFire:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=AmbientAkSoundComponent
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_HuskGroundFire"
   ObjectArchetype=KFProj_GroundFire'KFGameContent.Default__KFProj_GroundFire'
}
