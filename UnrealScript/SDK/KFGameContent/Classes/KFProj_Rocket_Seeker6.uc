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
		&& `TimeSince(CreationTime) > 0.03f )
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
	Physics=PHYS_Projectile
	Speed=5000 //6000
	MaxSpeed=5000  //6000
	TossZ=0
	GravityScale=1.0
    MomentumTransfer=50000.0f
    ArmDistSquared=110000.0f // 4 meters 150000.0
    
    SeekStrength=928000.0f  // 128000.0f

	bWarnAIWhenFired=true

	ProjFlightTemplate=ParticleSystem'WEP_SeekerSix_EMIT.FX_SeekerSix_Projectile'
	ProjFlightTemplateZedTime=ParticleSystem'WEP_SeekerSix_EMIT.FX_SeekerSix_Projectile_ZED_TIME'
	ProjDudTemplate=ParticleSystem'WEP_SeekerSix_EMIT.FX_SeekerSix_Projectile_Dud'
	GrenadeBounceEffectInfo=KFImpactEffectInfo'WEP_RPG7_ARCH.RPG7_Projectile_Impacts'
    ProjDisintegrateTemplate=ParticleSystem'ZED_Siren_EMIT.FX_Siren_grenade_disable_01'

	AmbientSoundPlayEvent=AkEvent'WW_WEP_Seeker_6.Play_WEP_Seeker_6_Projectile'
  	AmbientSoundStopEvent=AkEvent'WW_WEP_Seeker_6.Stop_WEP_Seeker_6_Projectile'

  	AltExploEffects=KFImpactEffectInfo'WEP_SeekerSix_ARCH.FX_SeekerSix_Explosion_Concussive_force'

	// Grenade explosion light
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
	Begin Object Class=KFGameExplosion Name=ExploTemplate0
		Damage=85 //125
		DamageRadius=250    //1000 //250
		DamageFalloffExponent=2  //3
		DamageDelay=0.f

		// Damage Effects
		MyDamageType=class'KFDT_Explosive_Seeker6'
		KnockDownStrength=0
		FractureMeshRadius=200.0
		FracturePartVel=500.0
		ExplosionEffects=KFImpactEffectInfo'WEP_SeekerSix_ARCH.FX_SeekerSix_Explosion'
		ExplosionSound=AkEvent'WW_WEP_Seeker_6.Play_WEP_Seeker_6_Explosion'

        // Dynamic Light
        ExploLight=ExplosionPointLight
        ExploLightStartFadeOutTime=0.0
        ExploLightFadeOutTime=0.2

		// Camera Shake
		CamShake=CameraShake'FX_CameraShake_Arch.Misc_Explosions.Seeker6'
		CamShakeInnerRadius=180
		CamShakeOuterRadius=500
		CamShakeFalloff=1.5f
		bOrientCameraShakeTowardsEpicenter=true
	End Object
	ExplosionTemplate=ExploTemplate0
}
