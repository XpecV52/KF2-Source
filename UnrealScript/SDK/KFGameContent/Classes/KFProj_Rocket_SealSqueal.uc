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
	ProjFlightTemplate=ParticleSystem'WEP_Seal_Squeal_EMIT.FX_Harpoon_Projectile'

	bWarnAIWhenFired=true

	MaxSpeed=4000.0
	Speed=4000.0
	TerminalVelocity=4000

	Physics=PHYS_Falling

	TossZ=150
    GravityScale=0.5//0.7

	GlassShatterType=FMGS_ShatterAll

	bCollideComplex=true

	bIgnoreFoliageTouch=true

	bBlockedByInstigator=false
	bAlwaysReplicateExplosion=true

	FuseTime=4.0

	bNetTemporary=false
	NetPriority=5
	NetUpdateFrequency=200

	bNoReplicationToInstigator=false
	bUseClientSideHitDetection=true
	bUpdateSimulatedPosition=true
	bSyncToOriginalLocation=true
	bSyncToThirdPersonMuzzleLocation=true

	PinBoneIdx=INDEX_None

	bCanBeDamaged=true
	bCanDisintegrate=true
	Begin Object Name=CollisionCylinder
		BlockNonZeroExtent=false
		// for siren scream
		CollideActors=true
	End Object

	// explosion light
	Begin Object Class=PointLightComponent Name=ExplosionPointLight
	    LightColor=(R=252,G=218,B=171,A=255)
		Brightness=4.f
		Radius=2000.f
		FalloffExponent=10.f
		CastShadows=False
		CastStaticShadows=FALSE
		CastDynamicShadows=False
		bCastPerObjectShadows=false
		bEnabled=FALSE
		LightingChannels=(Indoor=TRUE,Outdoor=TRUE,bInitialized=TRUE)
	End Object

	// explosion
	Begin Object Class=KFGameExplosion Name=ExploTemplate0 // @todo: change me
		Damage=250
	    DamageRadius=600
		DamageFalloffExponent=1.f
		DamageDelay=0.f

		// Damage Effects
		MyDamageType=class'KFDT_Explosive_SealSqueal'
		KnockDownStrength=0
		FractureMeshRadius=200.0
		FracturePartVel=500.0
		ExplosionEffects=KFImpactEffectInfo'WEP_Seal_Squeal_ARCH.SealSquealHarpoon_Explosion'
		ExplosionSound=AkEvent'WW_WEP_SealSqueal.Play_WEP_SealSqueal_Shoot_Explode'

        // Dynamic Light
        ExploLight=ExplosionPointLight
        ExploLightStartFadeOutTime=0.0
        ExploLightFadeOutTime=0.2

		// Camera Shake
		CamShake=CameraShake'FX_CameraShake_Arch.Misc_Explosions.Light_Explosion_Rumble'
		CamShakeInnerRadius=200
		CamShakeOuterRadius=900
		CamShakeFalloff=1.5f
		bOrientCameraShakeTowardsEpicenter=true
	End Object
	ExplosionTemplate=ExploTemplate0

	ExplosionActorClass=class'KFExplosionActor'

	bCanStick=true
	bCanPin=true
	Begin Object Class=KFProjectileStickHelper Name=StickHelper0
	End Object
	StickHelper=StickHelper0

	ProjDisintegrateTemplate=ParticleSystem'ZED_Siren_EMIT.FX_Siren_grenade_disable_01'
}