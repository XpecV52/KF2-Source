//=============================================================================
// KFProj_MolotovGrenade_mini
//=============================================================================
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
// - Zane Gholson
//=============================================================================

class KFProj_MolotovGrenade_Mini extends KFProj_MolotovGrenade
	hidedropdown;

/** Blow up on impact */
simulated event HitWall(vector HitNormal, Actor Wall, PrimitiveComponent WallComp)
{
	if( StaticMeshComponent(WallComp) != none && StaticMeshComponent(WallComp).CanBecomeDynamic() )
	{
		// pass through meshes that can move (like those little coffee tables in biotics)
		return;
	}

	Explode( Location, HitNormal );
}

defaultproperties
{
   TossZ=150.000000
   TerminalVelocity=4000.000000
   Begin Object Class=KFGameExplosion Name=ExploTemplate0
      ExplosionEffects=KFImpactEffectInfo'wep_molotov_arch.Molotov_Explosion'
      Damage=60.000000
      DamageRadius=250.000000
      MyDamageType=Class'kfgamecontent.KFDT_Fire_MolotovGrenade'
      KnockDownStrength=0.000000
      MomentumTransferScale=0.000000
      ExplosionSound=AkEvent'WW_WEP_EXP_MOLOTOV.Play_WEP_EXP_Molotov_Explosion'
      ExploLight=PointLightComponent'kfgamecontent.Default__KFProj_MolotovGrenade_Mini:FlamePointLight'
      ExploLightFadeOutTime=0.200000
      ExploLightStartFadeOutTime=0.400000
      FractureMeshRadius=0.000000
      CamShake=KFCameraShake'FX_CameraShake_Arch.Grenades.Molotov'
      CamShakeInnerRadius=125.000000
      CamShakeOuterRadius=200.000000
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'KFGame.Default__KFGameExplosion'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_MolotovGrenade_Mini:ExploTemplate0'
   ProjFlightTemplate=ParticleSystem'WEP_3P_M79_EMIT.FX_M79_40mm_Projectile'
   ProjFlightTemplateZedTime=ParticleSystem'WEP_3P_M79_EMIT.FX_M79_40mm_Projectile_ZEDTIME'
   Speed=4000.000000
   MaxSpeed=4000.000000
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'kfgamecontent.Default__KFProj_MolotovGrenade:CollisionCylinder'
      CollisionHeight=10.000000
      CollisionRadius=10.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockNonZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'kfgamecontent.Default__KFProj_MolotovGrenade:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Begin Object Class=PointLightComponent Name=FlightPointLight Archetype=PointLightComponent'kfgamecontent.Default__KFProj_MolotovGrenade:FlightPointLight'
      Radius=300.000000
      FalloffExponent=10.000000
      Brightness=2.000000
      LightColor=(B=140,G=190,R=245,A=255)
      CastShadows=False
      CastStaticShadows=False
      CastDynamicShadows=False
      bCastPerObjectShadows=False
      LightingChannels=(Outdoor=True)
      Name="FlightPointLight"
      ObjectArchetype=PointLightComponent'kfgamecontent.Default__KFProj_MolotovGrenade:FlightPointLight'
   End Object
   Components(1)=FlightPointLight
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_MolotovGrenade_Mini"
   ObjectArchetype=KFProj_MolotovGrenade'kfgamecontent.Default__KFProj_MolotovGrenade'
}
