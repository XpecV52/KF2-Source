//=============================================================================
// KFProj_Husk_Fireball
//=============================================================================
// Husk's fireball projectile
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFProj_Husk_Fireball extends KFProjectile;

simulated protected function PrepareExplosionTemplate()
{
	super.PrepareExplosionTemplate();
	
	/** Since bIgnoreInstigator is transient, its value must be defined here */
	ExplosionTemplate.bIgnoreInstigator = true;
}

DefaultProperties
{
	Physics=PHYS_Projectile
	// Speeds below are overridden by KFPawn_ZedHusk FireballSpeed property
	Speed=1800
	MaxSpeed=1800
	//MyDamageType=class'KFDT_Explosive_FragGrenade'
	ProjFlightTemplate=ParticleSystem'ZED_Husk_EMIT.FX_Husk_projectile_01'
	ExplosionActorClass=class'KFExplosionActor'

	// Grenade explosion light
	Begin Object Class=PointLightComponent Name=ExplosionPointLight
	    LightColor=(R=245,G=190,B=140,A=255)
		Brightness=4.f
		Radius=2000.f
		FalloffExponent=10.f
		CastShadows=False
		CastStaticShadows=FALSE
		CastDynamicShadows=False
		bEnabled=FALSE
		LightingChannels=(Indoor=TRUE,Outdoor=TRUE,bInitialized=TRUE)
	End Object

	// explosion
	Begin Object Class=KFGameExplosion Name=ExploTemplate0
		Damage=25
		DamageRadius=300
		DamageFalloffExponent=1.f
		DamageDelay=0.f

		// Damage Effects
		MyDamageType=class'KFDT_Fire_HuskFireball'
		KnockDownStrength=100
		FractureMeshRadius=200.0
		FracturePartVel=500.0
		ExplosionEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Explosions.HuskProjectile_Explosion'
		ExplosionSound=AkEvent'WW_ZED_Husk.ZED_Husk_SFX_Ranged_Shot_Impact'

        // Dynamic Light
        ExploLight=ExplosionPointLight
        ExploLightStartFadeOutTime=0.0
        ExploLightFadeOutTime=0.5

		// Camera Shake
		CamShake=CameraShake'FX_CameraShake_Arch.Misc_Explosions.HuskFireball'
		CamShakeInnerRadius=450
		CamShakeOuterRadius=900
		CamShakeFalloff=1.f
		bOrientCameraShakeTowardsEpicenter=true
	End Object
	ExplosionTemplate=ExploTemplate0

	Begin Object Class=AkComponent name=AmbientAkSoundComponent
		bStopWhenOwnerDestroyed=true
        bForceOcclusionUpdateInterval=true
        OcclusionUpdateInterval=0.1f
    End Object
    AmbientComponent=AmbientAkSoundComponent
    Components.Add(AmbientAkSoundComponent)

	bAutoStartAmbientSound=true
	bStopAmbientSoundOnExplode=true
	AmbientSoundPlayEvent=AkEvent'WW_ZED_Husk.ZED_Husk_SFX_Ranged_Shot_LP'
    AmbientSoundStopEvent=AkEvent'WW_ZED_Husk.ZED_Husk_SFX_Ranged_Shot_LP_Stop'
}
