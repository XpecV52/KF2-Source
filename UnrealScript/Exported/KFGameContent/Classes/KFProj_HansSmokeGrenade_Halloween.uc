//=============================================================================
// KFProj_HansSmokeGrenade_Halloween
//=============================================================================
// Halloween variant of Hans' smoke grenade
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFProj_HansSmokeGrenade_Halloween extends KFProj_HansSmokeGrenade;

defaultproperties
{
   Begin Object Class=KFGameExplosion Name=ExploTemplate0 Archetype=KFGameExplosion'kfgamecontent.Default__KFProj_HansSmokeGrenade:ExploTemplate0'
      ExplosionEffects=KFImpactEffectInfo'ZED_Hans_EMIT.SmokeGrenade_Explosion'
      Damage=0.000000
      DamageRadius=350.000000
      DamageFalloffExponent=0.000000
      MyDamageType=None
      KnockDownStrength=0.000000
      MomentumTransferScale=0.000000
      ExplosionSound=AkEvent'WW_ZED_Hans.ZED_Hans_SFX_Grenade_Smoke'
      FractureMeshRadius=0.000000
      FracturePartVel=0.000000
      CamShake=KFCameraShake'FX_CameraShake_Arch.Grenades.HansSmoke'
      CamShakeInnerRadius=0.000000
      CamShakeOuterRadius=450.000000
      CamShakeFalloff=2.000000
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'kfgamecontent.Default__KFProj_HansSmokeGrenade:ExploTemplate0'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_HansSmokeGrenade_Halloween:ExploTemplate0'
   ProjFlightTemplate=ParticleSystem'Halloween_ZED_Hans_EMIT.FX_HHans_Grenade_Explosive_Proj_01'
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'kfgamecontent.Default__KFProj_HansSmokeGrenade:CollisionCylinder'
      CollisionHeight=10.000000
      CollisionRadius=10.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockNonZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'kfgamecontent.Default__KFProj_HansSmokeGrenade:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_HansSmokeGrenade_Halloween"
   ObjectArchetype=KFProj_HansSmokeGrenade'kfgamecontent.Default__KFProj_HansSmokeGrenade'
}
