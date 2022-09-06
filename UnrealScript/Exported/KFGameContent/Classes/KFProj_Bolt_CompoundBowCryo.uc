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

/** Set to true if the ChargeLevel was replicated */
var bool bHasChargeLevel;

/** Set to true if the bHasExploded was replicated */
var bool bHasExplodedReplicated;

replication
{
	if (bNetInitial)
		ChargeLevel;
}

simulated event ReplicatedEvent(name VarName)
{
	if (VarName == nameof(ChargeLevel))
	{
		bHasChargeLevel = true;
		SpawnFlightEffects();

		// Mark the explosion here to trigger it in the client
		if (bHasExploded && bHasExplodedReplicated)
		{
			bHasExploded = false;
		}
	}
	else if (VarName == nameof(bHasExploded))
	{
		bHasExplodedReplicated = true;
		if (!bHasChargeLevel)
		{
			// do not explode if ChargeLevel hasn't been replicated.
			return;
		}
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
			bHasChargeLevel = true;
		}
	}

	Super.PostBeginPlay ();
}

simulated function float GetChargeLevelTrail ()
{
	if (ChargeLevel >= 2)
	{
		return 1.0;
	}

	if (ChargeLevel == 1)
	{
		if (WorldInfo.NetMode == NM_Client)
		{
			return 0.8;
		}

		return 0.5;
	}

	// For level 0, no charge on the arrow:
	if (WorldInfo.NetMode == NM_Client)
	{
		return 0.5;
	}

	return 0;
}

simulated function SpawnFlightEffects ()
{
	if (!bHasChargeLevel || bHasExploded || bHasDisintegrated)
	{
		// we need ChargeLevel to be replicated to Spawn the projectile!
		// and also stop if the projectile already exploded (likely high speed arrows!)
		return;
	}

	super.SpawnFlightEffects ();

	if (ProjEffects != none)
	{
		ProjEffects.SetVectorParameter('ChargeLevelTrail', GetChargeLevelTrail() * vect(1.f, 1.f, 1.f));
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
	local ParticleSystemComponent ComponentIt;
	super.TriggerExplosion (HitLocation, HitNormal, HitActor);
	if (bHasExploded)
	{
		foreach ComponentList(class'ParticleSystemComponent',ComponentIt)
		{
			ComponentIt.DeactivateSystem();
		}
	}
}

defaultproperties
{
   ChargeLevel=-1
   BouncesLeft=0
   bNoReplicationToInstigator=False
   bReplicateLocationOnExplosion=True
   bValidateExplosionNormalOnClient=True
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
