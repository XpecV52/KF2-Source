//=============================================================================
// KFProj_DynamiteGrenade
//=============================================================================
// Dynamite projectile class
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson and Jeff Robinson
//=============================================================================

class KFProj_DynamiteGrenade_Mini extends KFProj_DynamiteGrenade
	hidedropdown;

defaultproperties
{
   Begin Object Class=PointLightComponent Name=FusePointLight Archetype=PointLightComponent'kfgamecontent.Default__KFProj_DynamiteGrenade:FusePointLight'
      Radius=300.000000
      FalloffExponent=10.000000
      Translation=(X=0.000000,Y=0.000000,Z=6.000000)
      LightColor=(B=63,G=200,R=255,A=255)
      CastShadows=False
      CastStaticShadows=False
      CastDynamicShadows=False
      bCastPerObjectShadows=False
      LightingChannels=(Outdoor=True)
      MaxBrightness=1.500000
      MinBrightness=0.500000
      AnimationType=1
      AnimationFrequency=2.000000
      Name="FusePointLight"
      ObjectArchetype=PointLightComponent'kfgamecontent.Default__KFProj_DynamiteGrenade:FusePointLight'
   End Object
   FuseLight=FusePointLight
   TossZ=150.000000
   TerminalVelocity=4000.000000
   Begin Object Class=KFGameExplosion Name=ExploTemplate0
      ExplosionEffects=KFImpactEffectInfo'WEP_Dynamite_ARCH.Dynamite_Explosion'
      Damage=150.000000
      DamageRadius=200.000000
      DamageFalloffExponent=2.000000
      MyDamageType=Class'kfgamecontent.KFDT_Explosive_DynamiteGrenade'
      KnockDownStrength=0.000000
      ExplosionSound=AkEvent'WW_WEP_EXP_Dynamite.Play_WEP_EXP_Dynamite_Explosion'
      ExploLight=PointLightComponent'kfgamecontent.Default__KFProj_DynamiteGrenade_Mini:ExplosionPointLight'
      ExploLightFadeOutTime=0.200000
      CamShake=KFCameraShake'FX_CameraShake_Arch.Grenades.Default_Grenade'
      CamShakeInnerRadius=100.000000
      CamShakeOuterRadius=450.000000
      CamShakeFalloff=1.500000
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'KFGame.Default__KFGameExplosion'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_DynamiteGrenade_Mini:ExploTemplate0'
   ProjFlightTemplate=ParticleSystem'WEP_3P_M79_EMIT.FX_M79_40mm_Projectile'
   ProjFlightTemplateZedTime=ParticleSystem'WEP_3P_M79_EMIT.FX_M79_40mm_Projectile_ZEDTIME'
   Speed=4000.000000
   MaxSpeed=4000.000000
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'kfgamecontent.Default__KFProj_DynamiteGrenade:CollisionCylinder'
      CollisionHeight=10.000000
      CollisionRadius=10.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockNonZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'kfgamecontent.Default__KFProj_DynamiteGrenade:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=FusePointLight
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_DynamiteGrenade_Mini"
   ObjectArchetype=KFProj_DynamiteGrenade'kfgamecontent.Default__KFProj_DynamiteGrenade'
}
