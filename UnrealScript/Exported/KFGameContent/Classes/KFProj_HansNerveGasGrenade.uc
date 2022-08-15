//=============================================================================
// KFProj_HansNerveGasGrenade
//=============================================================================
// Nerve gas grenade projectile class for boss character Hans
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================

class KFProj_HansNerveGasGrenade extends KFProj_Grenade
	hidedropdown;

simulated function PostBeginPlay()
{
	super(KFProjectile).PostBeginPlay();
	SpecialRandSpin(200000);
}

/** Special random spin that gets the grenade flipping more end over end due to its shape */
simulated function SpecialRandSpin(float spinRate)
{
	RotationRate.Yaw = (spinRate * 2 *FRand() - spinRate) * 0.05;
	RotationRate.Pitch = -SpinRate;
	RotationRate.Roll = (spinRate * 2 *FRand() - spinRate) * 0.05;
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

simulated protected function StopFlightEffects();

/**
 * Force the explosion actor not to damage the instigator, since setting it in the default props is not working for some reason - Ramm
 */
simulated protected function PrepareExplosionTemplate()
{
	ExplosionTemplate.bIgnoreInstigator=true;
}

defaultproperties
{
   FuseTime=1.000000
   ExplosionActorClass=Class'KFGameContent.KFExplosion_HansNerveGasGrenade'
   Begin Object Class=KFGameExplosion Name=ExploTemplate0
      ExplosionEffects=KFImpactEffectInfo'ZED_Hans_EMIT.NerveGasGrenade_Explosion'
      Damage=6.000000
      DamageRadius=450.000000
      DamageFalloffExponent=0.000000
      MyDamageType=Class'KFGameContent.KFDT_Toxic_HansGrenade'
      KnockDownStrength=0.000000
      MomentumTransferScale=0.000000
      ExplosionSound=AkEvent'WW_ZED_Hans.ZED_Hans_SFX_Grenade_Poison'
      ExploLight=PointLightComponent'KFGameContent.Default__KFProj_HansNerveGasGrenade:ExplosionPointLight'
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
   ExplosionTemplate=KFGameExplosion'KFGameContent.Default__KFProj_HansNerveGasGrenade:ExploTemplate0'
   ProjDisintegrateTemplate=ParticleSystem'ZED_Siren_EMIT.FX_Siren_grenade_disable_01'
   PostExplosionLifetime=15.000000
   ProjFlightTemplate=ParticleSystem'ZED_Hans_EMIT.FX_Grenade_Nerve_Gas_01'
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
   Name="Default__KFProj_HansNerveGasGrenade"
   ObjectArchetype=KFProj_Grenade'KFGame.Default__KFProj_Grenade'
}
