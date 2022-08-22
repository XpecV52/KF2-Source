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
    local KFPlayerController KFPC;
    local KFPerk InstigatorPerk;

	Super.PostBeginPlay();

	ExplosionTemplate = class'KFPerk_Demolitionist'.static.GetNukeExplosionTemplate();
	ExplosionActorClass = class'KFPerk_Demolitionist'.static.GetNukeExplosionActorClass();
	ExplosionTemplate.Damage = default.ExplosionTemplate.Damage * class'KFPerk_Demolitionist'.static.GetNukeDamageModifier();
    ExplosionTemplate.DamageRadius = default.ExplosionTemplate.DamageRadius * class'KFPerk_Demolitionist'.static.GetNukeRadiusModifier();
    ExplosionTemplate.DamageFalloffExponent = default.ExplosionTemplate.DamageFalloffExponent;  

    KFPC = KFPlayerController(Instigator.Controller);
    // Change the radius and damage based on the perk
    if( Instigator.Role == ROLE_Authority && KFPC != none )
    {
        InstigatorPerk = KFPC.GetPerk();
        ExplosionTemplate.DamageRadius *= InstigatorPerk.GetAoERadiusModifier();
    }
}

defaultproperties
{
   Begin Object Class=KFGameExplosion Name=ExploTemplate0 Archetype=KFGameExplosion'kfgamecontent.Default__KFProj_ExplosiveSubmunition_HX25:ExploTemplate0'
      ExplosionEffects=KFImpactEffectInfo'WEP_HX25_Pistol_ARCH.HX25_Pistol_Submunition_Explosion'
      Damage=30.000000
      DamageRadius=150.000000
      ActorClassToIgnoreForDamage=Class'kfgamecontent.KFProj_ExplosiveSubmunition_HX25'
      MyDamageType=Class'kfgamecontent.KFDT_ExplosiveSubmunition_HX25'
      KnockDownStrength=10.000000
      MomentumTransferScale=1.000000
      ExplosionSound=AkEvent'WW_WEP_SA_HX25.Play_WEP_SA_HX25_Mini_Explosion'
      ExploLight=PointLightComponent'kfgamecontent.Default__KFProj_ExplosiveSubmunition_HX25:ExplosionPointLight'
      ExploLightFadeOutTime=0.300000
      CamShake=KFCameraShake'FX_CameraShake_Arch.Guns.HX25_Submunition_CameraShake'
      CamShakeInnerRadius=150.000000
      CamShakeOuterRadius=300.000000
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'kfgamecontent.Default__KFProj_ExplosiveSubmunition_HX25:ExploTemplate0'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_ExplosiveSubmunition_HX25_Nuke:ExploTemplate0'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'kfgamecontent.Default__KFProj_ExplosiveSubmunition_HX25:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.250000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFProj_ExplosiveSubmunition_HX25:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'kfgamecontent.Default__KFProj_ExplosiveSubmunition_HX25:CollisionCylinder'
      CollisionHeight=5.000000
      CollisionRadius=5.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockNonZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'kfgamecontent.Default__KFProj_ExplosiveSubmunition_HX25:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=AmbientAkSoundComponent
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_ExplosiveSubmunition_HX25_Nuke"
   ObjectArchetype=KFProj_ExplosiveSubmunition_HX25'kfgamecontent.Default__KFProj_ExplosiveSubmunition_HX25'
}
