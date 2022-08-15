//=============================================================================
// KFProj_EMPGrenade
//=============================================================================
// EMP Grenade projectile class
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================

class KFProj_EMPGrenade extends KFProj_Grenade
	hidedropdown;

defaultproperties
{
	UITexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_EMPGrenade'
    LandedTranslationOffset=(X=2)

	ProjFlightTemplate=ParticleSystem'WEP_3P_EMP_EMIT.FX_EMP_Grenade_Mesh'
	ExplosionActorClass=class'KFExplosionActor'

	// Grenade explosion light
	Begin Object Name=ExplosionPointLight
	    LightColor=(R=128,G=200,B=255,A=255)
		Brightness=4.f
		Radius=1500.f
		FalloffExponent=10.f
		CastShadows=False
		CastStaticShadows=FALSE
		CastDynamicShadows=True
		bEnabled=FALSE
		LightingChannels=(Indoor=TRUE,Outdoor=TRUE,bInitialized=TRUE)
	End Object

	// explosion
	Begin Object Class=KFGameExplosion Name=ExploTemplate0
		Damage=100
		DamageRadius=600
		DamageFalloffExponent=2.f
		DamageDelay=0.f

		// Damage Effects
		MyDamageType=class'KFDT_EMP_EMPGrenade'
		FractureMeshRadius=200.0
		FracturePartVel=500.0
		ExplosionEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Explosions.EMPGrenade_Explosion'
		ExplosionSound=AkEvent'WW_WEP_EXP_Grenade_EMP.Play_WEP_EXP_Grenade_EMP_Explosion'

        // Dynamic Light
        ExploLight=ExplosionPointLight
        ExploLightStartFadeOutTime=0.5
        ExploLightFadeOutTime=0.25
        ExploLightFlickerIntensity=5.f
        ExploLightFlickerInterpSpeed=15.f

		// Camera Shake
		CamShake=CameraShake'FX_CameraShake_Arch.Grenades.Default_Grenade'
		CamShakeInnerRadius=450
		CamShakeOuterRadius=900
		CamShakeFalloff=1.f
		bOrientCameraShakeTowardsEpicenter=true
	End Object
	ExplosionTemplate=ExploTemplate0

	// Temporary effect (5.14.14)
	ProjDisintegrateTemplate=ParticleSystem'ZED_Siren_EMIT.FX_Siren_grenade_disable_01'

	AssociatedPerkClass=class'KFPerk_Berserker'
}


