//=============================================================================
// KFProj_GroundFire
//=============================================================================
// Projectile class for ground fire from flamethrowers, etc
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================

class KFProj_GroundFire extends KFProjectile;

var() float BurnDamageInterval;

simulated event ReplicatedEvent( name VarName )
{
	if( VarName == nameof( bHasExploded ) )
	{
		return; // This would trigger another explosion, we don't need to do it for the groundfire.
	}
	else
	{
		super.ReplicatedEvent( VarName );
	}
}

/**
 * Set the initial velocity and cook time
 */
simulated function PostBeginPlay()
{
	local KFPlayerReplicationInfo InstigatorPRI;

	// Checks if we want to swap the explosion effects
	InstigatorPRI = KFPlayerReplicationInfo(Instigator.PlayerReplicationInfo);
	if( InstigatorPRI != none )
	{
		bAltExploEffects = InstigatorPRI.bSplashActive;
	}

	TriggerExplosion( Location, vector(Rotation), None );

	Super.PostBeginPlay();
}

/*********************************************************************************************
* Collision
********************************************************************************************* */
simulated event Touch( Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal )
{
	//Super(Projectile).Touch(Other, OtherComp, HitLocation, HitNormal);
}

simulated protected function PrepareExplosionActor(GameExplosionActor GEA)
{
	local KFExplosionActorLingering KFE_GroundFire;

	KFE_GroundFire = KFExplosionActorLingering( GEA );
	if( KFE_GroundFire != none )
	{
		KFE_GroundFire.Interval = BurnDamageInterval;
	}
}

/**
 * Force the fire not to burn the instigator, since setting it in the default props is not working for some reason - Ramm
 */
simulated protected function PrepareExplosionTemplate()
{
	ExplosionTemplate.bIgnoreInstigator=true;

	// Swap the ExplosionTemplate's effect if necessary
	if( bAltExploEffects )
	{
		ExplosionTemplate.ExplosionEffects = AltExploEffects;
	}
}

defaultproperties
{
	PostExplosionLifetime=2.5

	bStopAmbientSoundOnExplode=false
    bAutoStartAmbientSound=true
    bAmbientSoundZedTimeOnly=false


    Begin Object Class=AkComponent name=AmbientAkSoundComponent
    	bStopWhenOwnerDestroyed=true
    	bForceOcclusionUpdateInterval=true
        OcclusionUpdateInterval=0.25;
    End Object
    AmbientComponent=AmbientAkSoundComponent
    Components.Add(AmbientAkSoundComponent)

	ExplosionActorClass=class'KFExplosion_GroundFire'

	AltExploEffects=KFImpactEffectInfo'WEP_Flamethrower_ARCH.GroundFire_Splash_Impacts'

	// pointlight at far end of spray
	Begin Object Class=PointLightComponent Name=FlamePointLight
	    LightColor=(R=245,G=190,B=140,A=255)
		Brightness=4.f
		Radius=500.f
		FalloffExponent=10.f
		CastShadows=False
		CastStaticShadows=FALSE
		CastDynamicShadows=TRUE
		bEnabled=FALSE
		LightingChannels=(Indoor=TRUE,Outdoor=TRUE,bInitialized=TRUE)
	End Object

	// explosion
	Begin Object Class=KFGameExplosion Name=ExploTemplate0
		Damage=15   //10
		DamageRadius=200 //100
		DamageFalloffExponent=1.f
		DamageDelay=0.f
		MyDamageType=class'KFDT_Fire_Ground'
		// Don't burn the guy with the flamethrower
        bIgnoreInstigator=true

        // Dynamic Light
        ExploLight=FlamePointLight
        ExploLightStartFadeOutTime=1.5
        ExploLightFadeOutTime=0.5
        ExploLightFlickerIntensity=5.f
        ExploLightFlickerInterpSpeed=15.f

		// Damage Effects
		KnockDownStrength=0
		KnockDownRadius=0
		FractureMeshRadius=0
		FracturePartVel=0
	    ExplosionEffects=KFImpactEffectInfo'WEP_Flamethrower_ARCH.GroundFire_Impacts'
		ExplosionSound=none
		MomentumTransferScale=0
		bAllowPerMaterialFX=true

		// Camera Shake
		CamShake=none
	End Object
	ExplosionTemplate=ExploTemplate0

	BurnDamageInterval=0.25f

	RemoteRole=ROLE_None
}
