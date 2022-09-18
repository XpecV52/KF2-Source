//=============================================================================
// KFProj_Bullet_HRG_Boomy
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2021 Tripwire Interactive LLC
//=============================================================================

class KFProj_Bullet_HRG_Stunner_Alt extends KFProj_BallisticExplosive
	hidedropdown;

var protected KFWeapon OwnerWeapon;

/** Initialize the projectile */
function Init( vector Direction )
{
	super.Init( Direction );

	OwnerWeapon = KFWeapon( Owner );
	if( OwnerWeapon != none )
	{
		OwnerWeapon.LastPelletFireTime = WorldInfo.TimeSeconds;
	}
}

/** Don't allow more than one pellet projectile to perform this check in a single frame */
function bool ShouldWarnAIWhenFired()
{
	return super.ShouldWarnAIWhenFired() && OwnerWeapon != none && OwnerWeapon.LastPelletFireTime < WorldInfo.TimeSeconds;
}

simulated protected function PrepareExplosionTemplate()
{
	super.PrepareExplosionTemplate();

	/** Since bIgnoreInstigator is transient, its value must be defined here */
	ExplosionTemplate.bIgnoreInstigator = true;
}

simulated function AdjustCanDisintigrate() {}

/** Can be overridden in subclasses to exclude specific projectiles from nuking */
simulated function bool AllowNuke()
{
    return false;
}

defaultproperties
{
   Begin Object Class=KFGameExplosion Name=ExploTemplate0
      ExplosionEffects=KFImpactEffectInfo'WEP_HRG_Stunner_ARCH.WEB_HRG_Stunner_Impacts'
      Damage=40.000000
      DamageRadius=300.000000
      DamageFalloffExponent=2.000000
      MyDamageType=Class'kfgamecontent.KFDT_Explosive_HRG_Stunner'
      KnockDownStrength=150.000000
      MomentumTransferScale=10000.000000
      ExplosionSound=AkEvent'WW_WEP_HRG_Stunner.Play_WEP_HRG_Stunner_Alt_Fire_Explosion'
      ExploLight=PointLightComponent'kfgamecontent.Default__KFProj_Bullet_HRG_Stunner_Alt:ExplosionPointLight'
      ExploLightFadeOutTime=0.300000
      CamShake=KFCameraShake'FX_CameraShake_Arch.Misc_Explosions.Light_Explosion_Rumble'
      CamShakeInnerRadius=0.000000
      CamShakeOuterRadius=300.000000
      CamShakeFalloff=1.500000
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'KFGame.Default__KFGameExplosion'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_Bullet_HRG_Stunner_Alt:ExploTemplate0'
   ProjDisintegrateTemplate=ParticleSystem'ZED_Siren_EMIT.FX_Siren_grenade_disable_01'
   ProjFlightTemplate=ParticleSystem'WEP_HRG_Stunner_EMIT.FX_HRG_Stunner_ALT_Tracer_ZEDTime'
   ProjFlightTemplateZedTime=ParticleSystem'WEP_HRG_Stunner_EMIT.FX_HRG_Stunner_ALT_Tracer_ZEDTime'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'KFGame.Default__KFProj_BallisticExplosive:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.250000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFProj_BallisticExplosive:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   Speed=22500.000000
   MaxSpeed=22500.000000
   DamageRadius=0.000000
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFProj_BallisticExplosive:CollisionCylinder'
      CollisionHeight=5.000000
      CollisionRadius=5.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockNonZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFProj_BallisticExplosive:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=AmbientAkSoundComponent
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_Bullet_HRG_Stunner_Alt"
   ObjectArchetype=KFProj_BallisticExplosive'KFGame.Default__KFProj_BallisticExplosive'
}
