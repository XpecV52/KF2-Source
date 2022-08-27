//=============================================================================
// KFProj_BloatKingPukeMine
//=============================================================================
// Projectile class for bloat king puke mine
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================
class KFProj_BloatKingPukeMine extends KFProj_BloatPukeMine;

defaultproperties
{
   GroundFXTemplate=ParticleSystem'ZED_BloatKing_EMIT.FX_Bloatking_Mine_01'
   Begin Object Class=KFGameExplosion Name=ExploTemplate0 Archetype=KFGameExplosion'kfgamecontent.Default__KFProj_BloatPukeMine:ExploTemplate0'
      ExplosionEffects=KFImpactEffectInfo'ZED_BloatKing_ARCH.Bloatking_Mine_Explosion'
      Damage=18.000000
      DamageRadius=450.000000
      DamageFalloffExponent=0.000000
      MyDamageType=Class'kfgamecontent.KFDT_Toxic_BloatPukeMine'
      KnockDownStrength=0.000000
      MomentumTransferScale=0.000000
      ExplosionSound=AkEvent'WW_ZED_Bloat.Play_Bloat_Mine_Explode'
      FractureMeshRadius=0.000000
      FracturePartVel=0.000000
      CamShake=KFCameraShake'FX_CameraShake_Arch.Grenades.Default_Grenade'
      CamShakeInnerRadius=200.000000
      CamShakeOuterRadius=400.000000
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'kfgamecontent.Default__KFProj_BloatPukeMine:ExploTemplate0'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_BloatKingPukeMine:ExploTemplate0'
   ProjFlightTemplate=ParticleSystem'ZED_BloatKing_EMIT.FX_BloatKing_projectile_01'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'kfgamecontent.Default__KFProj_BloatPukeMine:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.250000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFProj_BloatPukeMine:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'kfgamecontent.Default__KFProj_BloatPukeMine:CollisionCylinder'
      CollisionHeight=10.000000
      CollisionRadius=10.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockNonZeroExtent=False
      PhysMaterialOverride=PhysicalMaterial'ZED_Bloat_EMIT.BloatPukeMine_PM'
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'kfgamecontent.Default__KFProj_BloatPukeMine:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=AmbientAkSoundComponent
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_BloatKingPukeMine"
   ObjectArchetype=KFProj_BloatPukeMine'kfgamecontent.Default__KFProj_BloatPukeMine'
}