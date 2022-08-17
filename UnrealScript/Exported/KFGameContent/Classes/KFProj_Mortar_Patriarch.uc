//=============================================================================
// KFProj_Mortar_Patriarch
//=============================================================================
// High explosive seeking arcing mortar fired from Patriarch weapons platform.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFProj_Mortar_Patriarch extends KFProj_Missile_Patriarch
	hidedropdown;

function InitEx( vector AimDir, float CurlForceMultiplier, vector TargetLoc, float InitialMissileSpeed,
				float NewSeekDelay, float NewSeekForce, float NewGravForce, float NewDistToApplyGravitySQ )
{
	super.InitEx( AimDir, CurlForceMultiplier, TargetLoc, InitialMissileSpeed, NewSeekDelay, NewSeekForce, NewGravForce, NewDistToApplyGravitySQ );

	Velocity.X *= 0.2f;
	Velocity.Y *= 0.2f;
	Velocity.Z *= 1.3f;
}

defaultproperties
{
   Begin Object Class=PointLightComponent Name=FlightPointLight Archetype=PointLightComponent'kfgamecontent.Default__KFProj_Missile_Patriarch:FlightPointLight'
      Radius=120.000000
      FalloffExponent=10.000000
      Brightness=1.500000
      LightColor=(B=150,G=205,R=255,A=255)
      CastShadows=False
      CastStaticShadows=False
      CastDynamicShadows=False
      LightingChannels=(Outdoor=True)
      Name="FlightPointLight"
      ObjectArchetype=PointLightComponent'kfgamecontent.Default__KFProj_Missile_Patriarch:FlightPointLight'
   End Object
   FlightLight=FlightPointLight
   Begin Object Class=KFGameExplosion Name=ExploTemplate0 Archetype=KFGameExplosion'kfgamecontent.Default__KFProj_Missile_Patriarch:ExploTemplate0'
      ExplosionEffects=KFImpactEffectInfo'WEP_Patriarch_ARCH.Missile_Explosion'
      Damage=70.000000
      DamageRadius=620.000000
      DamageFalloffExponent=2.000000
      MyDamageType=Class'kfgamecontent.KFDT_Explosive_PatMortar'
      ExplosionSound=AkEvent'WW_WEP_SA_RPG7.Play_WEP_SA_RPG7_Explosion'
      ExploLight=PointLightComponent'kfgamecontent.Default__KFProj_Mortar_Patriarch:ExplosionPointLight'
      ExploLightFadeOutTime=0.500000
      CamShake=KFCameraShake'FX_CameraShake_Arch.Grenades.Default_Grenade'
      CamShakeInnerRadius=200.000000
      CamShakeOuterRadius=700.000000
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'kfgamecontent.Default__KFProj_Missile_Patriarch:ExploTemplate0'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_Mortar_Patriarch:ExploTemplate0'
   AmbientSoundPlayEvent=AkEvent'WW_ZED_Patriarch.Play_Mini_Rocket_LP_Beep'
   AmbientSoundStopEvent=AkEvent'WW_ZED_Patriarch.Stop_Mini_Rocket_LP_Beep'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'kfgamecontent.Default__KFProj_Missile_Patriarch:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.100000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFProj_Missile_Patriarch:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   MyDamageType=Class'kfgamecontent.KFDT_Explosive_PatMortar'
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'kfgamecontent.Default__KFProj_Missile_Patriarch:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockNonZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'kfgamecontent.Default__KFProj_Missile_Patriarch:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=FlightPointLight
   Components(2)=AmbientAkSoundComponent
   Physics=PHYS_Falling
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_Mortar_Patriarch"
   ObjectArchetype=KFProj_Missile_Patriarch'kfgamecontent.Default__KFProj_Missile_Patriarch'
}
