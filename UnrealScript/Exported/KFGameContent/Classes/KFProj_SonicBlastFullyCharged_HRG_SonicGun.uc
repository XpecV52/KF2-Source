//=============================================================================
// KFProj_SonicBlastFullyCharged_HRG_SonicGun
//=============================================================================
// HRG Sonic Gun sonic projectile for default fire
//=============================================================================
// Killing Floor 2
// Copyright (C) 2020 Tripwire Interactive LLC
//=============================================================================
class KFProj_SonicBlastFullyCharged_HRG_SonicGun extends KFProj_Bullet;

/**
 * Initialize the Projectile
 */
function Init(vector Direction)
{
    super(KFProjectile).Init( Direction );
}

simulated function SpawnFlightEffects()
{
	super.SpawnFlightEffects();
	//TODO: Remove. Temporal to see change in FX
	ProjEffects.SetScale( 1.0 );
}

simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
	super.ProcessTouch(Other, HitLocation, HitNormal);
	if (PenetrationPower <= 0)
	{
		Shutdown();
	}
}

defaultproperties
{
   bWarnAIWhenFired=True
   GravityScale=0.000000
   TerminalVelocity=12000.000000
   ProjDisintegrateTemplate=ParticleSystem'ZED_Siren_EMIT.FX_Siren_grenade_disable_01'
   ProjFlightTemplate=ParticleSystem'WEP_HRG_SonicGun_EMIT.FX_Projectile_AltFire'
   ProjFlightTemplateZedTime=ParticleSystem'WEP_HRG_SonicGun_EMIT.FX_Projectile_AltFire'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'KFGame.Default__KFProj_Bullet:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.100000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFProj_Bullet:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   ImpactEffects=KFImpactEffectInfo'WEP_HRG_SonicGun_ARCH.HRG_SonicGun_Projectile_AltFire_Impacts'
   AssociatedPerkClass=Class'KFGame.KFPerk_Sharpshooter'
   Speed=12000.000000
   MaxSpeed=12000.000000
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFProj_Bullet:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFProj_Bullet:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=AmbientAkSoundComponent
   LifeSpan=10.000000
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_SonicBlastFullyCharged_HRG_SonicGun"
   ObjectArchetype=KFProj_Bullet'KFGame.Default__KFProj_Bullet'
}
