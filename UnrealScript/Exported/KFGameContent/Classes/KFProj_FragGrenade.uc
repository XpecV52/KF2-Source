//=============================================================================
// KFProj_FragGrenade
//=============================================================================
// Frag Grenade projectile class
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================

class KFProj_FragGrenade extends KFProj_Grenade
	hidedropdown;

defaultproperties
{
   ExplosionActorClass=Class'KFGame.KFExplosionActor'
   Begin Object Class=KFGameExplosion Name=ExploTemplate0
      ShardClass=Class'kfgamecontent.KFProj_GrenadeShard'
      NumShards=10
      ExplosionEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Explosions.FragGrenade_Explosion'
      Damage=225.000000
      DamageRadius=800.000000
      MyDamageType=Class'kfgamecontent.KFDT_Explosive_FragGrenade'
      KnockDownStrength=0.000000
      ExplosionSound=AkEvent'WW_WEP_EXP_Grenade_Frag.Play_WEP_EXP_Grenade_Frag_Explosion'
      ExploLight=PointLightComponent'kfgamecontent.Default__KFProj_FragGrenade:ExplosionPointLight'
      ExploLightFadeOutTime=0.200000
      CamShake=KFCameraShake'FX_CameraShake_Arch.Grenades.Default_Grenade'
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'KFGame.Default__KFGameExplosion'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_FragGrenade:ExploTemplate0'
   ProjDisintegrateTemplate=ParticleSystem'ZED_Siren_EMIT.FX_Siren_grenade_disable_01'
   ProjFlightTemplate=ParticleSystem'WEP_3P_MKII_EMIT.FX_MKII_Grenade_Mesh'
   AssociatedPerkClass=Class'KFGame.KFPerk_Support'
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFProj_Grenade:CollisionCylinder'
      CollisionHeight=10.000000
      CollisionRadius=10.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockNonZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFProj_Grenade:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_FragGrenade"
   ObjectArchetype=KFProj_Grenade'KFGame.Default__KFProj_Grenade'
}
