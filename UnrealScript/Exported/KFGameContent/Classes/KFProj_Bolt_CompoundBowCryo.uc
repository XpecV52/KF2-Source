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
   ChargeLevel=-1
   ChargeTrailPerLevel=0.500000
   BouncesLeft=0
   bNoReplicationToInstigator=False
   bReplicateLocationOnExplosion=True
   bAlwaysReplicateDisintegration=True
   bAlwaysReplicateExplosion=True
   bCanDisintegrate=True
   bWarnAIWhenFired=True
   TerminalVelocity=15000.000000
   ExplosionActorClass=Class'KFGame.KFExplosionActor'
   Begin Object Class=KFGameExplosion Name=ExploTemplate0
      ExplosionEffects=KFImpactEffectInfo'WEP_CompoundBow_ARCH.FX_CompoundBow_Cryo_Projectile_Explosion'
      Damage=25.000000
      DamageRadius=200.000000
      MyDamageType=Class'kfgamecontent.KFDT_Freeze_CompoundBowCryExplosion'
      KnockDownStrength=0.000000
      MomentumTransferScale=1.000000
      ExplosionSound=AkEvent'WW_WEP_SA_CompoundBow.Play_Arrow_Impact_Cryo'
      ExploLight=PointLightComponent'kfgamecontent.Default__KFProj_Bolt_CompoundBowCryo:ExplosionPointLight'
      ExploLightFadeOutTime=0.200000
      CamShake=None
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'KFGame.Default__KFGameExplosion'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_Bolt_CompoundBowCryo:ExploTemplate0'
   ProjFlightTemplate=ParticleSystem'WEP_CompoundBow_EMIT.FX_Compound_Bow_Cryo_Projectile'
   AmbientSoundPlayEvent=AkEvent'WW_WEP_SA_Crossbow.Play_Bolt_Fly_By'
   AmbientSoundStopEvent=AkEvent'WW_WEP_SA_Crossbow.Stop_Bolt_Fly_By'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'KFGame.Default__KFProj_RicochetBullet:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.100000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFProj_RicochetBullet:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   ImpactEffects=KFImpactEffectInfo'WEP_CompoundBow_ARCH.FX_CompoundBow_Cryo_Projectile_Impact'
   Speed=15000.000000
   MaxSpeed=15000.000000
   bBlockedByInstigator=False
   bRotationFollowsVelocity=False
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFProj_RicochetBullet:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFProj_RicochetBullet:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=AmbientAkSoundComponent
   bNetTemporary=False
   bNoEncroachCheck=True
   bBounce=False
   LifeSpan=10.000000
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_Bolt_CompoundBowCryo"
   ObjectArchetype=KFProj_RicochetBullet'KFGame.Default__KFProj_RicochetBullet'
}
