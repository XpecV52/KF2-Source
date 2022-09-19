//=============================================================================
// KFProj_Bolt_HRG_Crossboom
//=============================================================================
// Bullet class for the HRG Crossboom
//=============================================================================
// Killing Floor 2
// Copyright (C) 2022 Tripwire Interactive LLC
//=============================================================================

class KFProj_Bolt_HRG_Crossboom extends KFProjectile;

var() float SecondsBeforeDetonation;
var() bool bIsProjActive;
/**
 * Set the initial velocity and cook time
 */
simulated event PostBeginPlay()
{
	Super.PostBeginPlay();

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
		SetTimer( 1.f + Rand(5) + fRand(), false, nameOf(Destroy) );
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

    if (bIsProjActive)
    {
	    StickHelper.Tick(DeltaTime);
    }

	if (!IsZero(Velocity))
	{
		SetRelativeRotation(rotator(Velocity));
	}
}

/** Causes charge to explode */
function Detonate()
{
	local vector ExplosionNormal;

	ExplosionNormal = vect(0,0,1) >> Rotation;
	Explode(Location, ExplosionNormal);
}

simulated function Explode(vector HitLocation, vector HitNormal)
{   
    if (bIsProjActive)
    {
	    StickHelper.UnPin();
	    super.Explode(HitLocation, HitNormal);
    }
}

// for nukes && concussive force
simulated protected function PrepareExplosionTemplate()
{
	class'KFPerk_Demolitionist'.static.PrepareExplosive(Instigator, self);

	super.PrepareExplosionTemplate();
}

simulated protected function SetExplosionActorClass()
{
   local KFPlayerReplicationInfo InstigatorPRI;

    if( WorldInfo.TimeDilation < 1.f && Instigator != none )
    {
       InstigatorPRI = KFPlayerReplicationInfo(Instigator.PlayerReplicationInfo);
        if( InstigatorPRI != none )
        {
            if( InstigatorPRI.bNukeActive && class'KFPerk_Demolitionist'.static.ProjectileShouldNuke( self ) )
            {
                ExplosionActorClass = class'KFPerk_Demolitionist'.static.GetNukeExplosionActorClass();
            }
        }
    }

    super.SetExplosionActorClass();
}

simulated function SyncOriginalLocation()
{
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

simulated function NotifyStick()
{
    SetTimer(SecondsBeforeDetonation, false, nameof(Timer_Detonate));
}

simulated function NotifyBounce()
{
    ClearTimer(nameof(Timer_Detonate), self);
    ClearTimer(nameOf(Destroy));
    bIsProjActive=false;
}

unreliable server function OnCollectibleHit(Actor Collectible)
{
	Collectible.TakeDamage(Damage, InstigatorController, Location, MomentumTransfer * Normal(Velocity), MyDamageType,, Owner);
}

defaultproperties
{
   SecondsBeforeDetonation=0.500000
   bIsProjActive=True
   bSyncToOriginalLocation=True
   bUseClientSideHitDetection=True
   bAlwaysReplicateExplosion=True
   bCanDisintegrate=True
   bWarnAIWhenFired=True
   bCanStick=True
   ExplosionActorClass=Class'KFGame.KFExplosionActor'
   Begin Object Class=KFGameExplosion Name=ExploTemplate0
      ExplosionEffects=KFImpactEffectInfo'WEP_HRG_Crossboom_ARCH.Wep_HRG_Crossboom_Explosion'
      Damage=350.000000
      DamageRadius=200.000000
      MyDamageType=Class'kfgamecontent.KFDT_Explosive_HRG_Crossboom'
      KnockDownStrength=0.000000
      ExplosionSound=AkEvent'WW_WEP_HRG_Crossboom.Play_WEP_HRG_Crossboom_Impact_Explosion'
      ExploLight=PointLightComponent'kfgamecontent.Default__KFProj_Bolt_HRG_Crossboom:ExplosionPointLight'
      ExploLightFadeOutTime=0.200000
      CamShake=KFCameraShake'FX_CameraShake_Arch.Misc_Explosions.Light_Explosion_Rumble'
      CamShakeInnerRadius=200.000000
      CamShakeFalloff=1.500000
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'KFGame.Default__KFGameExplosion'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_Bolt_HRG_Crossboom:ExploTemplate0'
   ProjDisintegrateTemplate=ParticleSystem'ZED_Siren_EMIT.FX_Siren_grenade_disable_01'
   ProjFlightTemplate=ParticleSystem'WEP_HRG_Crossboom_EMIT.FX_Crossboom_Projectile'
   AmbientSoundPlayEvent=AkEvent'WW_WEP_HRG_Crossboom.Play_WEP_HRG_Crossboom_Bolt_Fly_By'
   AmbientSoundStopEvent=AkEvent'WW_WEP_HRG_Crossboom.Stop_WEP_HRG_Crossboom_Bolt_Fly_By'
   ImpactEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Crossbow_impact'
   Begin Object Class=KFProjectileStickHelper_HRG_Crossboom Name=StickHelper0
      Name="StickHelper0"
      ObjectArchetype=KFProjectileStickHelper_HRG_Crossboom'kfgamecontent.Default__KFProjectileStickHelper_HRG_Crossboom'
   End Object
   StickHelper=KFProjectileStickHelper_HRG_Crossboom'kfgamecontent.Default__KFProj_Bolt_HRG_Crossboom:StickHelper0'
   Speed=15000.000000
   MaxSpeed=15000.000000
   bBlockedByInstigator=False
   DamageRadius=0.000000
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFProjectile:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFProjectile:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   bNetTemporary=False
   bCollideComplex=True
   bNoEncroachCheck=True
   LifeSpan=20.000000
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_Bolt_HRG_Crossboom"
   ObjectArchetype=KFProjectile'KFGame.Default__KFProjectile'
}
