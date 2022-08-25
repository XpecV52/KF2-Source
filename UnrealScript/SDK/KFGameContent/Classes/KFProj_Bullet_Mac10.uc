//=============================================================================
// KFProj_Bullet_Mac10
//=============================================================================
// Bullet projectile for Mac10.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================

class KFProj_Bullet_Mac10 extends KFProj_Bullet_AssaultRifle
	hidedropdown;


/** Last hit normal from Touch() or HitWall() */
var vector LastHitNormal;

var float GroundFireChance;


simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
	LastHitNormal = HitNormal;
	Super.ProcessTouch(Other, HitLocation, HitNormal);
}

/**
* Explode this Projectile
*/
simulated function TriggerExplosion(Vector HitLocation, Vector HitNormal, Actor HitActor)
{
	LastHitNormal = HitNormal;
	Super.TriggerExplosion(HitLocation, HitNormal, HitActor);
}


simulated protected function StopSimulating()
{
	local vector FlameSpawnVel;
	
	if (Role == ROLE_Authority  && FRand() < GroundFireChance)
	{
		//SpawnGroundFire();
		FlameSpawnVel = 0.25f * CalculateResidualFlameVelocity(LastHitNormal, Normal(Velocity), VSize(Velocity));
		SpawnResidualFlame(class'KFProj_Mac10Splash', Location + (LastHitNormal * 10.f), FlameSpawnVel);
	}

	super.StopSimulating();
}


defaultproperties
{
	GroundFireChance = 0.1f

	//ProjFlightTemplate = ParticleSystem'WEP_DragonsBreath_EMIT.Tracer.FX_DragonsBreath_Tracer'
	ProjFlightTemplate = ParticleSystem'FX_Projectile_EMIT.FX_Tracer_9MM_ZEDTime'
	ImpactEffects = KFImpactEffectInfo'WEP_MAC10_ARCH.Mac10_bullet_impact'

	AmbientSoundPlayEvent = AkEvent'WW_WEP_SA_DragonsBreath.Play_SA_DragonsBreath_Projectile_Loop'
	AmbientSoundStopEvent = AkEvent'WW_WEP_SA_DragonsBreath.Stop_SA_DragonsBreath_Projectile_Loop'
}
