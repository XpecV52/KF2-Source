//=============================================================================
// KFProj_FreezeThrower_GroundIce
//=============================================================================
// Projectile class for ground fire from flamethrowers, etc
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFProj_FreezeThrower_GroundIce extends KFProj_GroundIce;

defaultproperties
{
   bWarnAIWhenFired=True
   Begin Object Class=KFGameExplosion Name=ExploTemplate0 Archetype=KFGameExplosion'kfgamecontent.Default__KFProj_GroundIce:ExploTemplate0'
      ExplosionEffects=KFImpactEffectInfo'WEP_CryoGun_ARCH.GroundCryo_Impacts'
      bAllowPerMaterialFX=True
      Damage=5.000000
      DamageRadius=180.000000
      MyDamageType=Class'kfgamecontent.KFDT_Freeze_Ground_FreezeThrower'
      KnockDownStrength=0.000000
      MomentumTransferScale=0.000000
      FractureMeshRadius=0.000000
      FracturePartVel=0.000000
      CamShake=None
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'kfgamecontent.Default__KFProj_GroundIce:ExploTemplate0'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_FreezeThrower_GroundIce:ExploTemplate0'
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'kfgamecontent.Default__KFProj_GroundIce:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'kfgamecontent.Default__KFProj_GroundIce:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_FreezeThrower_GroundIce"
   ObjectArchetype=KFProj_GroundIce'kfgamecontent.Default__KFProj_GroundIce'
}
