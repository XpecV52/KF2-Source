//=============================================================================
// KFProj_Rocket_SealSqueal
//=============================================================================
// SealSqueal rocket launcher harpoon
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================
class KFProj_Rocket_SealSqueal extends KFProjectile;

var float FuseTime;

/**
 * Set the initial velocity and cook time
 */
simulated event PostBeginPlay()
{
	Super.PostBeginPlay();

	if (Role == ROLE_Authority)
	{
	   SetTimer(FuseTime, false, 'Timer_Detonate');
	}

	AdjustCanDisintigrate();
}

/**
 * Explode after a certain amount of time
 */
function Timer_Detonate()
{
	Detonate();
}

/** Called when the owning instigator controller has left a game */
simulated function OnInstigatorControllerLeft()
{
	if( WorldInfo.NetMode != NM_Client )
	{
		SetTimer( 1.f + Rand(5) + fRand(), false, nameOf(Timer_Detonate) );
	}
}

/**
 * Trace down and get the location to spawn the explosion effects and decal
 */
simulated function GetExplodeEffectLocation(out vector HitLocation, out vector HitRotation, out Actor HitActor)
{
    local vector EffectStartTrace, EffectEndTrace;
	local TraceHitInfo HitInfo;

	EffectStartTrace = Location + vect(0,0,1) * 4.f;
	EffectEndTrace = EffectStartTrace - vect(0,0,1) * 32.f;

    // Find where to put the decal
	HitActor = Trace(HitLocation, HitRotation, EffectEndTrace, EffectStartTrace, false,, HitInfo, TRACEFLAG_Bullet);

	// If the locations are zero (probably because this exploded in the air) set defaults
    if (IsZero(HitLocation))
    {
        HitLocation = Location;
    }

	if (IsZero(HitRotation))
    {
        HitRotation = vect(0,0,1);
    }
}

/** Used to check current status of StuckTo actor (to figure out if we should fall) */
simulated event Tick(float DeltaTime)
{
	super.Tick(DeltaTime);

	StickHelper.Tick(DeltaTime);

	if (!IsZero(Velocity))
	{
		SetRelativeRotation(rotator(Velocity));
	}
}

/** Causes charge to explode */
function Detonate()
{
	local KFWeap_RocketLauncher_SealSqueal SealSquealOwner;
	local vector ExplosionNormal;

	if (Role == ROLE_Authority)
    {
    	SealSquealOwner = KFWeap_RocketLauncher_SealSqueal(Owner);
    	if (SealSquealOwner != none)
    	{
    		SealSquealOwner.RemoveDeployedHarpoon(, self);
    	}
    }

	ExplosionNormal = vect(0,0,1) >> Rotation;
	Explode(Location, ExplosionNormal);
}

simulated function Explode(vector HitLocation, vector HitNormal)
{
	StickHelper.UnPin();
	super.Explode(HitLocation, HitNormal);
}

simulated function Disintegrate( rotator InDisintegrateEffectRotation )
{
	local KFWeap_RocketLauncher_SealSqueal SealSquealOwner;

	if (Role == ROLE_Authority)
    {
    	SealSquealOwner = KFWeap_RocketLauncher_SealSqueal(Owner);
    	if (SealSquealOwner != none)
    	{
    		SealSquealOwner.RemoveDeployedHarpoon(, self);
    	}
    }

    super.Disintegrate(InDisintegrateEffectRotation);
}

// for nukes && concussive force
simulated protected function PrepareExplosionTemplate()
{
	class'KFPerk_Demolitionist'.static.PrepareExplosive(Instigator, self);

	super.PrepareExplosionTemplate();
}

simulated function SyncOriginalLocation()
{
	// IMPORTANT NOTE: We aren't actually syncing to the original location (or calling the super).
	// We just want to receive the original location so we can do a trace between that location and
	// our current location to determine if we hit any zeds between those two locations.
	// KFII-45464

	local Actor HitActor;
	local vector HitLocation, HitNormal;
	local TraceHitInfo HitInfo;

	if (Role < ROLE_Authority && Instigator != none && Instigator.IsLocallyControlled())
	{
		HitActor = Trace(HitLocation, HitNormal, OriginalLocation, Location,,, HitInfo, TRACEFLAG_Bullet);
		if (HitActor != none)
		{
			StickHelper.TryStick(HitNormal, HitLocation, HitActor);
		}
	}
}

defaultproperties
{
   FuseTime=4.000000
   bSyncToOriginalLocation=True
   bSyncToThirdPersonMuzzleLocation=True
   bUseClientSideHitDetection=True
   bAlwaysReplicateExplosion=True
   bCanDisintegrate=True
   bWarnAIWhenFired=True
   bCanStick=True
   bCanPin=True
   GlassShatterType=FMGS_ShatterAll
   TossZ=150.000000
   GravityScale=0.500000
   TerminalVelocity=4000.000000
   ExplosionActorClass=Class'KFGame.KFExplosionActor'
   Begin Object Class=KFGameExplosion Name=ExploTemplate0
      ExplosionEffects=KFImpactEffectInfo'WEP_Seal_Squeal_ARCH.SealSquealHarpoon_Explosion'
      Damage=250.000000
      DamageRadius=600.000000
      MyDamageType=Class'kfgamecontent.KFDT_Explosive_SealSqueal'
      KnockDownStrength=0.000000
      ExplosionSound=AkEvent'WW_WEP_SealSqueal.Play_WEP_SealSqueal_Shoot_Explode'
      ExploLight=PointLightComponent'kfgamecontent.Default__KFProj_Rocket_SealSqueal:ExplosionPointLight'
      ExploLightFadeOutTime=0.200000
      CamShake=KFCameraShake'FX_CameraShake_Arch.Misc_Explosions.Light_Explosion_Rumble'
      CamShakeInnerRadius=200.000000
      CamShakeFalloff=1.500000
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'KFGame.Default__KFGameExplosion'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_Rocket_SealSqueal:ExploTemplate0'
   ProjDisintegrateTemplate=ParticleSystem'ZED_Siren_EMIT.FX_Siren_grenade_disable_01'
   ProjFlightTemplate=ParticleSystem'WEP_Seal_Squeal_EMIT.FX_Harpoon_Projectile'
   Begin Object Class=KFProjectileStickHelper Name=StickHelper0
      Name="StickHelper0"
      ObjectArchetype=KFProjectileStickHelper'KFGame.Default__KFProjectileStickHelper'
   End Object
   StickHelper=KFProjectileStickHelper'kfgamecontent.Default__KFProj_Rocket_SealSqueal:StickHelper0'
   bBlockedByInstigator=False
   bIgnoreFoliageTouch=True
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFProjectile:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockNonZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFProjectile:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Physics=PHYS_Falling
   bNetTemporary=False
   bUpdateSimulatedPosition=True
   bCollideComplex=True
   NetUpdateFrequency=200.000000
   NetPriority=5.000000
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_Rocket_SealSqueal"
   ObjectArchetype=KFProjectile'KFGame.Default__KFProjectile'
}
