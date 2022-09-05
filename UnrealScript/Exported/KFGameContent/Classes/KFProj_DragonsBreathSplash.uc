//=============================================================================
// KFProj_DragonsBreathSplash
//=============================================================================
// Projectile class for trench gun splash.  Handles a few overrides.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================

class KFProj_DragonsBreathSplash extends KFProj_FlareGunSplash;

defaultproperties
{
   ExplosionActorClass=Class'kfgamecontent.KFExplosion_GroundFire'
   Begin Object Class=KFGameExplosion Name=ExploTemplate0 Archetype=KFGameExplosion'kfgamecontent.Default__KFProj_FlareGunSplash:ExploTemplate0'
      ExplosionEffects=KFImpactEffectInfo'WEP_Flamethrower_ARCH.GroundFire_Impacts'
      bDirectionalExplosion=True
      Damage=8.000000
      DamageRadius=150.000000
      MyDamageType=Class'kfgamecontent.KFDT_Fire_Ground_DragonsBreath'
      KnockDownStrength=0.000000
      MomentumTransferScale=1.000000
      ExploLight=PointLightComponent'kfgamecontent.Default__KFProj_DragonsBreathSplash:FlamePointLight'
      ExploLightFadeOutTime=0.300000
      ExploLightStartFadeOutTime=4.200000
      FractureMeshRadius=0.000000
      CamShake=None
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'kfgamecontent.Default__KFProj_FlareGunSplash:ExploTemplate0'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_DragonsBreathSplash:ExploTemplate0'
   PostExplosionLifetime=2.500000
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'kfgamecontent.Default__KFProj_FlareGunSplash:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.250000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFProj_FlareGunSplash:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'kfgamecontent.Default__KFProj_FlareGunSplash:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'kfgamecontent.Default__KFProj_FlareGunSplash:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=AmbientAkSoundComponent
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_DragonsBreathSplash"
   ObjectArchetype=KFProj_FlareGunSplash'kfgamecontent.Default__KFProj_FlareGunSplash'
}
