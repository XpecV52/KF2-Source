//=============================================================================
// KFProj_Rocket_Seeker6
//=============================================================================
// Seeker6 rocket launcher rocket
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//  - Matt 'Squirrlz' Farber
//=============================================================================
class KFProj_Rocket_Seeker6 extends KFProj_BallisticExplosive
	hidedropdown;

/** Our intended target actor */
var private KFPawn LockedTarget;

/** How much 'stickyness' when seeking toward our target. Determines how accurate rocket is */
var const float SeekStrength;

replication
{
	if( bNetInitial )
		LockedTarget;
}

function SetLockedTarget( KFPawn NewTarget )
{
	LockedTarget = NewTarget;
}

simulated event Tick( float DeltaTime )
{
	local vector TargetImpactPos, DirToTarget;

	super.Tick( DeltaTime );

	// Skip the first frame, then start seeking
	if( !bHasExploded
		&& LockedTarget != none
		&& Physics == PHYS_Projectile
		&& Velocity != vect(0,0,0)
		&& LockedTarget.IsAliveAndWell()
		&& (WorldInfo.TimeSeconds - CreationTime) > 0.03f )
	{
		// Grab our desired relative impact location from the weapon class
		TargetImpactPos = class'KFWeap_RocketLauncher_Seeker6'.static.GetLockedTargetLoc( LockedTarget );

		// Seek towards target
		Speed = VSize( Velocity );
		DirToTarget = Normal( TargetImpactPos - Location );
		Velocity = Normal( Velocity + (DirToTarget * (SeekStrength * DeltaTime)) ) * Speed;

		// Aim rotation towards velocity every frame
		SetRotation( rotator(Velocity) );
	}
}

defaultproperties
{
   SeekStrength=928000.000000
   ArmDistSquared=20000.000000
   ProjDudTemplate=ParticleSystem'WEP_SeekerSix_EMIT.FX_SeekerSix_Projectile_Dud'
   GrenadeBounceEffectInfo=KFImpactEffectInfo'WEP_RPG7_ARCH.RPG7_Projectile_Impacts'
   bWarnAIWhenFired=True
   Begin Object Class=KFGameExplosion Name=ExploTemplate0
      ExplosionEffects=KFImpactEffectInfo'WEP_SeekerSix_ARCH.FX_SeekerSix_Explosion'
      Damage=160.000000
      DamageRadius=350.000000
      DamageFalloffExponent=2.000000
      MyDamageType=Class'kfgamecontent.KFDT_Explosive_Seeker6'
      KnockDownStrength=0.000000
      ExplosionSound=AkEvent'WW_WEP_Seeker_6.Play_WEP_Seeker_6_Explosion'
      ExploLight=PointLightComponent'kfgamecontent.Default__KFProj_Rocket_Seeker6:ExplosionPointLight'
      ExploLightFadeOutTime=0.200000
      CamShake=KFCameraShake'FX_CameraShake_Arch.Misc_Explosions.Light_Explosion_Rumble'
      CamShakeInnerRadius=0.000000
      CamShakeOuterRadius=500.000000
      CamShakeFalloff=3.000000
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'KFGame.Default__KFGameExplosion'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_Rocket_Seeker6:ExploTemplate0'
   ProjDisintegrateTemplate=ParticleSystem'ZED_Siren_EMIT.FX_Siren_grenade_disable_01'
   AltExploEffects=KFImpactEffectInfo'WEP_SeekerSix_ARCH.FX_SeekerSix_Explosion_Concussive_force'
   ProjFlightTemplate=ParticleSystem'WEP_SeekerSix_EMIT.FX_SeekerSix_Projectile'
   ProjFlightTemplateZedTime=ParticleSystem'WEP_SeekerSix_EMIT.FX_SeekerSix_Projectile_ZED_TIME'
   AmbientSoundPlayEvent=AkEvent'WW_WEP_Seeker_6.Play_WEP_Seeker_6_Projectile'
   AmbientSoundStopEvent=AkEvent'WW_WEP_Seeker_6.Stop_WEP_Seeker_6_Projectile'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'KFGame.Default__KFProj_BallisticExplosive:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.250000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFProj_BallisticExplosive:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   Speed=5000.000000
   MaxSpeed=5000.000000
   MomentumTransfer=50000.000000
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
   Name="Default__KFProj_Rocket_Seeker6"
   ObjectArchetype=KFProj_BallisticExplosive'KFGame.Default__KFProj_BallisticExplosive'
}
