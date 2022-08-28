//=============================================================================
// KFProj_HansNerveGasGrenade_Halloween
//=============================================================================
// Halloween variant of Hans' nerve gas grenade
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFProj_HansNerveGasGrenade_Halloween extends KFProj_HansNerveGasGrenade;

defaultproperties
{
   Begin Object Class=KFGameExplosion Name=ExploTemplate0 Archetype=KFGameExplosion'kfgamecontent.Default__KFProj_HansNerveGasGrenade:ExploTemplate0'
      ExplosionEffects=KFImpactEffectInfo'ZED_Hans_EMIT.NerveGasGrenade_Explosion'
      Damage=7.000000
      DamageRadius=450.000000
      DamageFalloffExponent=0.000000
      MyDamageType=Class'kfgamecontent.KFDT_Toxic_HansGrenade'
      KnockDownStrength=0.000000
      MomentumTransferScale=0.000000
      ExplosionSound=AkEvent'WW_ZED_Hans.ZED_Hans_SFX_Grenade_Poison'
      ExploLight=PointLightComponent'kfgamecontent.Default__KFProj_HansNerveGasGrenade:ExplosionPointLight'
      ExploLightFadeOutTime=1.000000
      ExploLightStartFadeOutTime=7.000000
      ExploLightFlickerIntensity=5.000000
      ExploLightFlickerInterpSpeed=15.000000
      FractureMeshRadius=0.000000
      FracturePartVel=0.000000
      CamShake=KFCameraShake'FX_CameraShake_Arch.Grenades.Default_Grenade'
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'kfgamecontent.Default__KFProj_HansNerveGasGrenade:ExploTemplate0'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_HansNerveGasGrenade_Halloween:ExploTemplate0'
   ProjFlightTemplate=ParticleSystem'Halloween_ZED_Hans_EMIT.FX_HHans_Grenade_Explosive_Proj_01'
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'kfgamecontent.Default__KFProj_HansNerveGasGrenade:CollisionCylinder'
      CollisionHeight=10.000000
      CollisionRadius=10.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockNonZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'kfgamecontent.Default__KFProj_HansNerveGasGrenade:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_HansNerveGasGrenade_Halloween"
   ObjectArchetype=KFProj_HansNerveGasGrenade'kfgamecontent.Default__KFProj_HansNerveGasGrenade'
}
