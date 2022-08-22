//=============================================================================
// KFProj_EMPGrenade
//=============================================================================
// EMP Grenade projectile class
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================

class KFProj_EMPGrenade extends KFProj_Grenade
	hidedropdown;

simulated function PostBeginPlay()
{
	super.PostBeginPlay();

	// fuze starts at rest
	ClearTimer(nameof(ExplodeTimer));
}

simulated event GrenadeIsAtRest()
{
	super.GrenadeIsAtRest();

	if (Role == ROLE_Authority)
	{
		SetTimer(FuseTime, false, 'ExplodeTimer');
	}
}

defaultproperties
{
   FuseTime=0.250000
   WeaponSelectTexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_EMPGrenade'
   ExplosionActorClass=Class'KFGame.KFExplosionActor'
   Begin Object Class=KFGameExplosion Name=ExploTemplate0
      ExplosionEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Explosions.EMPGrenade_Explosion'
      Damage=25.000000
      DamageRadius=700.000000
      MyDamageType=Class'kfgamecontent.KFDT_EMP_EMPGrenade'
      ExplosionSound=AkEvent'WW_WEP_EXP_Grenade_EMP.Play_WEP_EXP_Grenade_EMP_Explosion'
      ExploLight=PointLightComponent'kfgamecontent.Default__KFProj_EMPGrenade:ExplosionPointLight'
      ExploLightFadeOutTime=0.250000
      ExploLightStartFadeOutTime=0.500000
      ExploLightFlickerIntensity=5.000000
      ExploLightFlickerInterpSpeed=15.000000
      CamShake=KFCameraShake'FX_CameraShake_Arch.Grenades.Default_Grenade'
      CamShakeInnerRadius=200.000000
      CamShakeFalloff=1.500000
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'KFGame.Default__KFGameExplosion'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_EMPGrenade:ExploTemplate0'
   ProjDisintegrateTemplate=ParticleSystem'ZED_Siren_EMIT.FX_Siren_grenade_disable_01'
   ProjFlightTemplate=ParticleSystem'WEP_3P_EMP_EMIT.FX_EMP_Grenade_Mesh'
   AssociatedPerkClass=Class'KFGame.KFPerk_Berserker'
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
   Name="Default__KFProj_EMPGrenade"
   ObjectArchetype=KFProj_Grenade'KFGame.Default__KFProj_Grenade'
}
