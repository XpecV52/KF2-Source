//=============================================================================
// KFProj_ExplosiveSubmunition_HX25_Nuke
//=============================================================================
// Explosive submunition projectile for the HX25 when the demo's nuke skill is 
// active
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================

class KFProj_ExplosiveSubmunition_HX25_Nuke extends KFProj_ExplosiveSubmunition_HX25
	hidedropdown;

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();

	ExplosionTemplate = class'KFPerk_Demolitionist'.static.GetNukeExplosionTemplate();
	ExplosionActorClass = class'KFPerk_Demolitionist'.static.GetNukeExplosionActorClass();
	ExplosionTemplate.Damage = default.ExplosionTemplate.Damage * class'KFPerk_Demolitionist'.static.GetNukeDamageModifier();
    ExplosionTemplate.DamageRadius = default.ExplosionTemplate.DamageRadius * class'KFPerk_Demolitionist'.static.GetNukeRadiusModifier();
    ExplosionTemplate.DamageFalloffExponent = default.ExplosionTemplate.DamageFalloffExponent;     
}

defaultproperties
{
   Begin Object Class=KFGameExplosion Name=ExploTemplate0 Archetype=KFGameExplosion'KFGameContent.Default__KFProj_ExplosiveSubmunition_HX25:ExploTemplate0'
      ExplosionEffects=KFImpactEffectInfo'WEP_HX25_Pistol_ARCH.HX25_Pistol_Submunition_Explosion'
      Damage=30.000000
      DamageRadius=150.000000
      ActorClassToIgnoreForDamage=Class'KFGameContent.KFProj_ExplosiveSubmunition_HX25'
      MyDamageType=Class'KFGameContent.KFDT_ExplosiveSubmunition_HX25'
      KnockDownStrength=0.000000
      MomentumTransferScale=0.000000
      ExplosionSound=AkEvent'WW_WEP_SA_HX25.Play_WEP_SA_HX25_Mini_Explosion'
      ExploLight=PointLightComponent'KFGameContent.Default__KFProj_ExplosiveSubmunition_HX25:ExplosionPointLight'
      ExploLightFadeOutTime=0.300000
      CamShake=KFCameraShake'FX_CameraShake_Arch.Guns.HX25_Submunition_CameraShake'
      CamShakeInnerRadius=150.000000
      CamShakeOuterRadius=300.000000
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'KFGameContent.Default__KFProj_ExplosiveSubmunition_HX25:ExploTemplate0'
   End Object
   ExplosionTemplate=KFGameExplosion'KFGameContent.Default__KFProj_ExplosiveSubmunition_HX25_Nuke:ExploTemplate0'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'KFGameContent.Default__KFProj_ExplosiveSubmunition_HX25:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.250000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'KFGameContent.Default__KFProj_ExplosiveSubmunition_HX25:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGameContent.Default__KFProj_ExplosiveSubmunition_HX25:CollisionCylinder'
      CollisionHeight=5.000000
      CollisionRadius=5.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockNonZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGameContent.Default__KFProj_ExplosiveSubmunition_HX25:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=AmbientAkSoundComponent
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_ExplosiveSubmunition_HX25_Nuke"
   ObjectArchetype=KFProj_ExplosiveSubmunition_HX25'KFGameContent.Default__KFProj_ExplosiveSubmunition_HX25'
}
