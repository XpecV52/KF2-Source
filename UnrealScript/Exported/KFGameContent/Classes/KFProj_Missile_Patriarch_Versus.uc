class KFProj_Missile_Patriarch_Versus extends KFProj_Missile_Patriarch;

defaultproperties
{
   FlockRadius=5.000000
   FlockMaxForce=200.000000
   FlockCurlForce=1200.000000
   WobbleForce=90.000000
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
      DamageRadius=650.000000
      DamageFalloffExponent=2.000000
      MyDamageType=Class'kfgamecontent.KFDT_Explosive_PatMissile'
      ExplosionSound=AkEvent'WW_WEP_SA_RPG7.Play_WEP_SA_RPG7_Explosion'
      ExploLight=PointLightComponent'kfgamecontent.Default__KFProj_Missile_Patriarch_Versus:ExplosionPointLight'
      ExploLightFadeOutTime=0.500000
      CamShake=KFCameraShake'FX_CameraShake_Arch.Grenades.Default_Grenade'
      CamShakeInnerRadius=200.000000
      CamShakeOuterRadius=700.000000
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'kfgamecontent.Default__KFProj_Missile_Patriarch:ExploTemplate0'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_Missile_Patriarch_Versus:ExploTemplate0'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'kfgamecontent.Default__KFProj_Missile_Patriarch:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.100000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFProj_Missile_Patriarch:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   Damage=230.000000
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'kfgamecontent.Default__KFProj_Missile_Patriarch:CollisionCylinder'
      CollisionHeight=5.000000
      CollisionRadius=5.000000
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
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_Missile_Patriarch_Versus"
   ObjectArchetype=KFProj_Missile_Patriarch'kfgamecontent.Default__KFProj_Missile_Patriarch'
}
