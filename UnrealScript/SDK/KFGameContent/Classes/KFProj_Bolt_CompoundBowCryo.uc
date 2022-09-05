//=============================================================================
// KFProj_Bolt_CompoundBowCryo
//=============================================================================
// Bullet class for the compound bow cryo arrows
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//	- Tulio Beloqui (Saber Interactive)
//=============================================================================

class KFProj_Bolt_CompoundBowCryo extends KFProj_RicochetBullet
	hidedropdown;

/** Starting Damage radius of the explosion*/
var float StartingDamageRadius;

var repnotify int ChargeLevel;
var float ChargeTrailPerLevel;

replication
{
	if (bNetInitial)
		ChargeLevel;
}

simulated event ReplicatedEvent(name VarName)
{
	if (VarName == nameof(ChargeLevel))
	{
		SpawnFlightEffects();
	}

	Super.ReplicatedEvent(VarName);
}

simulated function PostBeginPlay ()
{
	local KFWeap_Bow_CompoundBow CompoundBow;

	if (Role == ROLE_Authority)
	{
		CompoundBow = KFWeap_Bow_CompoundBow(Owner);
		if (CompoundBow != none)
		{
			ChargeLevel = CompoundBow.GetChargeLevel();
		}
	}

	Super.PostBeginPlay ();
}

simulated function SpawnFlightEffects ()
{
	local float ChargeLevelTrail;

	super.SpawnFlightEffects ();

	if (ProjEffects != none)
	{
		ChargeLevelTrail = float(ChargeLevel) * ChargeTrailPerLevel;
		ProjEffects.SetVectorParameter('ChargeLevelTrail', ChargeLevelTrail * vect(1.f, 1.f, 1.f));
	}
}

simulated event PreBeginPlay()
{
	Super.PreBeginPlay();

	if (ExplosionTemplate != none)
	{
		StartingDamageRadius = ExplosionTemplate.DamageRadius;
	}
}

simulated function Tick( float DeltaTime )
{
	super.Tick(DeltaTime);

	if ( WorldInfo.NetMode != NM_DedicatedServer && Physics != PHYS_None )
	{
		SetRotation( rotator(Velocity) );
	}
}

simulated protected function PrepareExplosionTemplate()
{
	local KFPlayerController KFPC;
	local KFPerk InstigatorPerk;

	ExplosionTemplate.DamageRadius = StartingDamageRadius;

	// Change the radius and damage based on the perk
	if (Instigator != none && Instigator.Controller != none)
	{
		KFPC = KFPlayerController(Instigator.Controller);
		if (KFPC != none)
		{
			InstigatorPerk = KFPC.GetPerk();
			if (InstigatorPerk  != none)
			{
				ExplosionTemplate.DamageRadius = StartingDamageRadius * InstigatorPerk.GetAoERadiusModifier();
			}
		}
	}

	super.PrepareExplosionTemplate ();
}

simulated function TriggerExplosion (Vector HitLocation, Vector HitNormal, Actor HitActor)
{
	super.TriggerExplosion (HitLocation, HitNormal, HitActor);

	if (bHasExploded)
	{
		SetHidden (true);
	}
}

defaultproperties
{
	bWarnAIWhenFired=true

	// Speed is defined by the charge level of the bow:
	MaxSpeed=15000.0
	Speed=15000.0
	TerminalVelocity=15000.0

	bBounce=false
	BouncesLeft=0
	DamageRadius=0

	ChargeLevel=-1
	ChargeTrailPerLevel=0.5

	ProjFlightTemplate=ParticleSystem'WEP_CompoundBow_EMIT.FX_Compound_Bow_Cryo_Projectile'

    LifeSpan=10.0

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

	ImpactEffects=KFImpactEffectInfo'WEP_CompoundBow_ARCH.FX_CompoundBow_Cryo_Projectile_Impact'

    AmbientSoundPlayEvent=AkEvent'WW_WEP_SA_Crossbow.Play_Bolt_Fly_By'
    AmbientSoundStopEvent=AkEvent'WW_WEP_SA_Crossbow.Stop_Bolt_Fly_By'

	ExplosionActorClass=class'KFExplosionActor'

    bCanDisintegrate=true

	// Network
	bAlwaysReplicateDisintegration=true
	bReplicateLocationOnExplosion=true
	bAlwaysReplicateExplosion=true

	// Arrow explosion light
	Begin Object Class=PointLightComponent Name=ExplosionPointLight
	    LightColor=(R=128,G=200,B=255,A=255)
		Brightness=4.f
		Radius=1500.f //1500
		FalloffExponent=10.f
		CastShadows=False
		CastStaticShadows=FALSE
		CastDynamicShadows=True
		bEnabled=FALSE
		LightingChannels=(Indoor=TRUE,Outdoor=TRUE,bInitialized=TRUE)
	End Object

	// Ice explosion
	Begin Object Class=KFGameExplosion Name=ExploTemplate0
		Damage=25
		DamageRadius=200
		DamageFalloffExponent=1.f
		DamageDelay=0.f

		bIgnoreInstigator=false
	
		MomentumTransferScale=1

		// Damage Effects
		MyDamageType=class'KFDT_Freeze_CompoundBowCryExplosion'
		KnockDownStrength=0
		FractureMeshRadius=200.0
		FracturePartVel=500.0
		ExplosionEffects=KFImpactEffectInfo'WEP_CompoundBow_ARCH.FX_CompoundBow_Cryo_Projectile_Explosion'
		ExplosionSound=AkEvent'WW_WEP_SA_CompoundBow.Play_Arrow_Impact_Cryo'

        // Dynamic Light
        ExploLight=ExplosionPointLight
        ExploLightStartFadeOutTime=0.0
        ExploLightFadeOutTime=0.2

		// Camera Shake
        CamShake=None
	End Object
	ExplosionTemplate=ExploTemplate0
}

