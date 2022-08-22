//=============================================================================
// KFProj_Bullet_DragonsBreath
//=============================================================================
// Shotgun pellet class for the the Mossberg 500
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFProj_Bullet_DragonsBreath extends KFProj_Bullet
	hidedropdown;

var PointLightComponent ProjLight;

simulated function TriggerExplosion(Vector HitLocation, Vector HitNormal, Actor HitActor)
{
	super.TriggerExplosion(HitLocation, HitNormal, HitActor);
	ProjLight.SetEnabled(false);
}

defaultproperties
{
	Physics=PHYS_Falling

	MaxSpeed=7000.0
	Speed=7000.0
	TerminalVelocity=7000.0

	bWarnAIWhenFired=true

	DamageRadius=0
	GravityScale=0.35
	TossZ=0

	Begin Object Class=PointLightComponent Name=ProjPointLight
	    LightColor=(R=252,G=218,B=171,A=255)
		Brightness=0.5f
		Radius=500.f
		FalloffExponent=10.f
		CastShadows=False
		CastStaticShadows=FALSE
		CastDynamicShadows=False
		bEnabled=true
		LightingChannels=(Indoor=TRUE,Outdoor=TRUE,bInitialized=TRUE)
	End Object
	Components.Add(ProjPointLight)
	ProjLight = ProjPointLight

	ImpactEffects=KFImpactEffectInfo'WEP_DragonsBreath_ARCH.DragonsBreath_bullet_impact'
	ProjFlightTemplate=ParticleSystem'WEP_DragonsBreath_EMIT.Tracer.FX_DragonsBreath_Tracer'
	ProjFlightTemplateZedTime=ParticleSystem'WEP_DragonsBreath_EMIT.Tracer.FX_DragonsBreath_Tracer_ZEDTime'

    AmbientSoundPlayEvent=AkEvent'WW_WEP_SA_DragonsBreath.Play_SA_DragonsBreath_Projectile_Loop'
    AmbientSoundStopEvent=AkEvent'WW_WEP_SA_DragonsBreath.Stop_SA_DragonsBreath_Projectile_Loop'
}

