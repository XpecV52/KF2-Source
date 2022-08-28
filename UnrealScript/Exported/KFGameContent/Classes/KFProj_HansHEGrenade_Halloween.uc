//=============================================================================
// KFProj_HansHEGrenade_Halloween
//=============================================================================
// Halloween variant of Hans' explosive grenade
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFProj_HansHEGrenade_Halloween extends KFProj_HansHEGrenade;

defaultproperties
{
   Begin Object Class=KFGameExplosion Name=ExploTemplate0 Archetype=KFGameExplosion'kfgamecontent.Default__KFProj_HansHEGrenade:ExploTemplate0'
      ExplosionEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Explosions.Ghost_Grenade_Explosion'
      Damage=95.000000
      DamageRadius=800.000000
      DamageFalloffExponent=2.000000
      MyDamageType=Class'kfgamecontent.KFDT_Explosive_HansHEGrenade'
      KnockDownStrength=0.000000
      ExplosionSound=AkEvent'WW_ZED_Hans.ZED_Hans_SFX_Grenade_Frag'
      ExploLight=PointLightComponent'kfgamecontent.Default__KFProj_HansHEGrenade_Halloween:ExplosionPointLight'
      ExploLightFadeOutTime=0.200000
      CamShake=KFCameraShake'FX_CameraShake_Arch.Grenades.Default_Grenade'
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'kfgamecontent.Default__KFProj_HansHEGrenade:ExploTemplate0'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_HansHEGrenade_Halloween:ExploTemplate0'
   ProjFlightTemplate=ParticleSystem'Halloween_ZED_Hans_EMIT.FX_HHans_Grenade_Explosive_Proj_01'
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'kfgamecontent.Default__KFProj_HansHEGrenade:CollisionCylinder'
      CollisionHeight=10.000000
      CollisionRadius=10.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockNonZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'kfgamecontent.Default__KFProj_HansHEGrenade:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_HansHEGrenade_Halloween"
   ObjectArchetype=KFProj_HansHEGrenade'kfgamecontent.Default__KFProj_HansHEGrenade'
}
