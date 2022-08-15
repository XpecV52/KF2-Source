//=============================================================================
// KFProj_HansSmokeGrenade
//=============================================================================
// Smoke grenade projectile class for boss character Hans
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================

class KFProj_HansSmokeGrenade extends KFProj_Grenade
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

defaultproperties
{
   FuseTime=1.000000
   LandedTranslationOffset=(X=-5.000000,Y=0.000000,Z=0.000000)
   ExplosionActorClass=Class'KFGameContent.KFExplosion_HansSmokeGrenade'
   Begin Object Class=KFGameExplosion Name=ExploTemplate0
      ExplosionEffects=KFImpactEffectInfo'ZED_Hans_EMIT.SmokeGrenade_Explosion'
      Damage=0.000000
      DamageRadius=350.000000
      DamageFalloffExponent=0.000000
      MyDamageType=None
      KnockDownStrength=0.000000
      MomentumTransferScale=0.000000
      ExplosionSound=AkEvent'WW_ZED_Hans.ZED_Hans_SFX_Grenade_Smoke'
      FractureMeshRadius=0.000000
      FracturePartVel=0.000000
      CamShake=KFCameraShake'FX_CameraShake_Arch.Grenades.HansSmoke'
      CamShakeInnerRadius=0.000000
      CamShakeOuterRadius=450.000000
      CamShakeFalloff=2.000000
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'KFGame.Default__KFGameExplosion'
   End Object
   ExplosionTemplate=KFGameExplosion'KFGameContent.Default__KFProj_HansSmokeGrenade:ExploTemplate0'
   ProjDisintegrateTemplate=ParticleSystem'ZED_Siren_EMIT.FX_Siren_grenade_disable_01'
   PostExplosionLifetime=15.000000
   ProjFlightTemplate=ParticleSystem'ZED_Hans_EMIT.FX_Grenade_Smoke_01'
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
   Name="Default__KFProj_HansSmokeGrenade"
   ObjectArchetype=KFProj_Grenade'KFGame.Default__KFProj_Grenade'
}
