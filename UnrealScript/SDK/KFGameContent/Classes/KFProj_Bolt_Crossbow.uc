//=============================================================================
// KFProj_Bolt_Crossbow
//=============================================================================
// Bullet class for the crossbow
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFProj_Bolt_Crossbow extends KFProj_RicochetStickBullet
	hidedropdown;

// Last location needs to be correct, even on first tick.
simulated function SyncOriginalLocation()
{
    LastLocation = OriginalLocation;

    Super.SyncOriginalLocation();
}

defaultproperties
{
    bCheckRackEmUp=true

	MaxSpeed=15000.0
	Speed=15000.0

	DamageRadius=0

    BouncesLeft=0
	ProjFlightTemplate=ParticleSystem'WEP_Crossbow_EMIT.FX_Crossbow_Projectile'

    LifeSpan=8
    LifeSpanAfterStick=180

    bBlockedByInstigator=false
    bCollideActors=true
    bCollideComplex=true
    bNoEncroachCheck=true
	bNoReplicationToInstigator=false
	bUseClientSideHitDetection=true
	bUpdateSimulatedPosition=false
	bRotationFollowsVelocity=false
	bNetTemporary=false
    bSyncToOriginalLocation=true

	ImpactEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Crossbow_impact'

    AmbientSoundPlayEvent=AkEvent'WW_WEP_SA_Crossbow.Play_Bolt_Fly_By'
    AmbientSoundStopEvent=AkEvent'WW_WEP_SA_Crossbow.Stop_Bolt_Fly_By'

    PickupRadius=200  //100
    PickupHeight=100   //50
	WeaponClass=class'KFWeap_Bow_Crossbow'
	ProjPickupTemplate=ParticleSystem'WEP_Crossbow_EMIT.FX_Crossbow_Projectile_Pickup'
    AmmoPickupSound=AkEvent'WW_WEP_SA_Crossbow.Play_Crossbow_Bolt_Pickup'

    TouchTimeThreshhold=0.15
}
