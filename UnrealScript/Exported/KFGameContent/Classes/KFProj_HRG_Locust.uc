//=============================================================================
// KFProj_HRG_Locust
//=============================================================================
// HRG Locust projectile
//=============================================================================
// Killing Floor 2
// Copyright (C) 2022 Tripwire Interactive LLC
//
//=============================================================================
class KFProj_HRG_Locust extends KFProj_BallisticExplosive
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

simulated function bool AllowNuke()
{
    return false;
}

simulated function bool AllowDemolitionistConcussive()
{
	return false;
}

simulated function bool AllowDemolitionistExplosionChangeRadius()
{
	return false;
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
		TargetImpactPos = class'KFWeap_HRG_Locust'.static.GetLockedTargetLoc( LockedTarget );

		// Seek towards target
		Speed = VSize( Velocity );
		DirToTarget = Normal( TargetImpactPos - Location );
		Velocity = Normal( Velocity + (DirToTarget * (SeekStrength * DeltaTime)) ) * Speed;

		// Aim rotation towards velocity every frame
		SetRotation( rotator(Velocity) );
	}
}

simulated protected function PrepareExplosionTemplate()
{
	local Weapon OwnerWeapon;
	local Pawn OwnerPawn;
	local KFPerk_Survivalist Perk;
	
	super(KFProjectile).PrepareExplosionTemplate();

	OwnerWeapon = Weapon(Owner);
	if (OwnerWeapon != none)
	{
		OwnerPawn = Pawn(OwnerWeapon.Owner);
		if (OwnerPawn != none)
		{
			Perk = KFPerk_Survivalist(KFPawn(OwnerPawn).GetPerk());
			if (Perk != none)
			{
				ExplosionTemplate.DamageRadius *= KFPawn(OwnerPawn).GetPerk().GetAoERadiusModifier();
			}
		}
	}
}

defaultproperties
{
   SeekStrength=928000.000000
   bCanDisintegrate=False
   bWarnAIWhenFired=True
   ExplosionActorClass=Class'kfgamecontent.KFExplosion_HRG_Locust'
   Begin Object Class=KFGameExplosion Name=ExploTemplate0
      ExplosionEffects=KFImpactEffectInfo'WEP_HRG_Locust_ARCH.FX_HRG_Locust_Explosion_Concussive_force'
      Damage=60.000000
      DamageRadius=200.000000
      DamageFalloffExponent=0.500000
      MyDamageType=Class'kfgamecontent.KFDT_Explosive_HRG_Locust'
      KnockDownStrength=0.000000
      MomentumTransferScale=1.000000
      ExplosionSound=AkEvent'WW_WEP_Seeker_6.Play_WEP_Seeker_6_Explosion'
      ExploLight=PointLightComponent'kfgamecontent.Default__KFProj_HRG_Locust:ExplosionPointLight'
      ExploLightFadeOutTime=0.200000
      FractureMeshRadius=0.000000
      FracturePartVel=0.000000
      CamShake=KFCameraShake'FX_CameraShake_Arch.Misc_Explosions.Light_Explosion_Rumble'
      CamShakeInnerRadius=0.000000
      CamShakeOuterRadius=500.000000
      CamShakeFalloff=3.000000
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'KFGame.Default__KFGameExplosion'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_HRG_Locust:ExploTemplate0'
   ProjDisintegrateTemplate=ParticleSystem'WEP_HRG_Locust_EMIT.FX_Flying_Bugs_dispersion'
   AltExploEffects=KFImpactEffectInfo'WEP_HRG_Locust_ARCH.FX_HRG_Locust_Explosion_Concussive_force'
   ProjFlightTemplate=ParticleSystem'WEP_HRG_Locust_EMIT.FX_HRG_Locust_Projectile'
   ProjFlightTemplateZedTime=ParticleSystem'WEP_HRG_Locust_EMIT.FX_HRG_Locust_Projectile_ZED_TIME'
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
   Damage=10.000000
   DamageRadius=0.000000
   MomentumTransfer=0.000000
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
   Name="Default__KFProj_HRG_Locust"
   ObjectArchetype=KFProj_BallisticExplosive'KFGame.Default__KFProj_BallisticExplosive'
}
