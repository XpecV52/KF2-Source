//=============================================================================
// KFProj_FlareGunSplash
//=============================================================================
// Projectile class for flare gun splash.  Handles a few overrides.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================

class KFProj_FlareGunSplash extends KFProj_MolotovSplash;

defaultproperties
{
   Begin Object Class=KFGameExplosion Name=ExploTemplate0 Archetype=KFGameExplosion'kfgamecontent.Default__KFProj_MolotovSplash:ExploTemplate0'
      ExplosionEffects=KFImpactEffectInfo'wep_molotov_arch.Molotov_GroundFire'
      bDirectionalExplosion=True
      Damage=10.000000
      DamageRadius=150.000000
      MyDamageType=Class'kfgamecontent.KFDT_Fire_Ground_FlareGun'
      KnockDownStrength=0.000000
      MomentumTransferScale=1.000000
      ExploLight=PointLightComponent'kfgamecontent.Default__KFProj_FlareGunSplash:FlamePointLight'
      ExploLightFadeOutTime=0.300000
      ExploLightStartFadeOutTime=4.200000
      FractureMeshRadius=0.000000
      CamShake=None
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'kfgamecontent.Default__KFProj_MolotovSplash:ExploTemplate0'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_FlareGunSplash:ExploTemplate0'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'kfgamecontent.Default__KFProj_MolotovSplash:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.250000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFProj_MolotovSplash:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   AssociatedPerkClass=None
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'kfgamecontent.Default__KFProj_MolotovSplash:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'kfgamecontent.Default__KFProj_MolotovSplash:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=AmbientAkSoundComponent
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_FlareGunSplash"
   ObjectArchetype=KFProj_MolotovSplash'kfgamecontent.Default__KFProj_MolotovSplash'
}
