//=============================================================================
// KFProj_NanoGasGrenade
//=============================================================================
// Nano gas player healing/zed hurting projectile class
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibso
//=============================================================================

class KFProj_MedicGrenade extends KFProj_Grenade
	hidedropdown;

var array<KFPawn> HealedPawns; 

simulated function PostBeginPlay()
{
	super(KFProjectile).PostBeginPlay();
	RandSpin(100000);
}

simulated event GrenadeIsAtRest()
{
	super.GrenadeIsAtRest();

	if (Role == ROLE_Authority)
	{
		ProjEffectsFadeOutDuration=PostExplosionLifetime;
		SetTimer(FuseTime, false, 'ExplodeTimer');
	}
}

simulated function Destroyed()
{
	HealedPawns.Remove( 0, HealedPawns.Length );

	super.Destroyed();
}


simulated protected function StopFlightEffects();

defaultproperties
{
   FuseTime=1.000000
   bAllowTossDuringZedGrabRotation=True
   ExplosionActorClass=Class'kfgamecontent.KFExplosion_MedicGrenade'
   Begin Object Class=KFGameExplosion Name=ExploTemplate0
      ExplosionEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Explosions.MedicGrenade_Explosion'
      Damage=50.000000
      DamageRadius=350.000000
      DamageFalloffExponent=0.000000
      MyDamageType=Class'kfgamecontent.KFDT_Toxic_MedicGrenade'
      KnockDownStrength=0.000000
      MomentumTransferScale=0.000000
      ExplosionSound=AkEvent'WW_WEP_EXP_Grenade_Medic.Play_WEP_EXP_Grenade_Medic_Explosion'
      ExploLight=PointLightComponent'kfgamecontent.Default__KFProj_MedicGrenade:ExplosionPointLight'
      ExploLightFadeOutTime=1.000000
      ExploLightStartFadeOutTime=7.000000
      ExploLightFlickerIntensity=5.000000
      ExploLightFlickerInterpSpeed=15.000000
      FractureMeshRadius=0.000000
      FracturePartVel=0.000000
      CamShake=KFCameraShake'FX_CameraShake_Arch.Grenades.Default_Grenade'
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'KFGame.Default__KFGameExplosion'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_MedicGrenade:ExploTemplate0'
   ProjDisintegrateTemplate=ParticleSystem'ZED_Siren_EMIT.FX_Siren_grenade_disable_01'
   PostExplosionLifetime=15.000000
   ProjFlightTemplate=ParticleSystem'WEP_3P_Medic_Grenade_EMIT.FX_Medic_Grenade_Mesh'
   AssociatedPerkClass=Class'KFGame.KFPerk_FieldMedic'
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
   Name="Default__KFProj_MedicGrenade"
   ObjectArchetype=KFProj_Grenade'KFGame.Default__KFProj_Grenade'
}
