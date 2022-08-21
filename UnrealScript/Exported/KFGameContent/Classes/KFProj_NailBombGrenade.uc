//=============================================================================
// KFProj_NailBombGrenade
//=============================================================================
// Nail bomb projectile class
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================

class KFProj_NailBombGrenade extends KFProj_Grenade
	hidedropdown;

defaultproperties
{
   GrenadeBounceEffectInfo=KFImpactEffectInfo'wep_Nailbomb_arch.Nail_Bomb_Grenade_Impacts'
   DampenFactor=0.400000
   DampenFactorParallel=0.600000
   WeaponSelectTexture=Texture2D'wep_ui_nailbomb_tex.UI_WeaponSelect_GunslingerGrenade'
   ExplosionActorClass=Class'KFGame.KFExplosionActor'
   Begin Object Class=KFGameExplosion Name=ExploTemplate0
      ShardClass=Class'kfgamecontent.KFProj_NailShard'
      NumShards=10
      ExplosionEffects=KFImpactEffectInfo'wep_Nailbomb_arch.Nailbomb_Explosion'
      Damage=100.000000
      DamageRadius=1000.000000
      MyDamageType=Class'kfgamecontent.KFDT_Explosive_NailBombGrenade'
      KnockDownStrength=0.000000
      ExplosionSound=AkEvent'WW_EXP_Nail_Bomb.Play_Nail_Bomb_Explode'
      ExploLight=PointLightComponent'kfgamecontent.Default__KFProj_NailBombGrenade:ExplosionPointLight'
      ExploLightFadeOutTime=0.200000
      CamShake=KFCameraShake'FX_CameraShake_Arch.Grenades.Default_Grenade'
      CamShakeInnerRadius=200.000000
      CamShakeFalloff=1.500000
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'KFGame.Default__KFGameExplosion'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_NailBombGrenade:ExploTemplate0'
   ProjDisintegrateTemplate=ParticleSystem'ZED_Siren_EMIT.FX_Siren_grenade_disable_01'
   ProjFlightTemplate=ParticleSystem'WEP_Nailbomb_EMIT.FX_Nailbomb_Mesh'
   AssociatedPerkClass=Class'KFGame.KFPerk_Gunslinger'
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
   Name="Default__KFProj_NailBombGrenade"
   ObjectArchetype=KFProj_Grenade'KFGame.Default__KFProj_Grenade'
}
