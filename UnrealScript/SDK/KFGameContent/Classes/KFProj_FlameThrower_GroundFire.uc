//=============================================================================
// KFProj_FlameThrower_GroundFire 
//=============================================================================
// Projectile class for ground fire from flamethrowers, etc
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================

class KFProj_FlameThrower_GroundFire extends KFProj_GroundFire;

defaultproperties
{
	bWarnAIWhenFired=true

	// explosion
	Begin Object Class=KFGameExplosion Name=ExploTemplate0
		Damage=10
		DamageRadius=100.0
		DamageFalloffExponent=1.f
		DamageDelay=0.f
		MyDamageType=class'KFDT_Fire_Ground_FlameThrower'
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
}
