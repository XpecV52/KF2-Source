//=============================================================================
// KFProj_Bolt_CompoundBowSharp
//=============================================================================
// Bullet class for the Compound Bow Sharp Arrows
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//	- Tulio Beloqui (Saber Interactive)
//=============================================================================

class KFProj_Bolt_CompoundBowSharp extends KFProj_RicochetStickBullet
	hidedropdown;

var repnotify int ChargeLevel;

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

simulated function float GetChargeLevelTrail ()
{
	if (ChargeLevel >= 2)
	{
		if (WorldInfo.NetMode == NM_Client)
		{
			return 1.0;
		}

		return 0.73;
	}

	if (ChargeLevel == 1)
	{
		if (WorldInfo.NetMode == NM_Client)
		{
			return 0.825;
		}

		return 0.365;
	}

	// For level 0, no charge on the arrow:
	if (WorldInfo.NetMode == NM_Client)
	{
		return 0.66;
	}

	return 0;
}

simulated function SpawnFlightEffects ()
{
	if (ChargeLevel < 0)
	{
		// we need ChargeLevel to be replicated to Spawn the projectile!
		return;
	}

	super.SpawnFlightEffects ();

	if (ProjEffects != none)
	{
		ProjEffects.SetVectorParameter('ChargeLevelTrail', GetChargeLevelTrail() * vect(1.f, 1.f, 1.f));
	}
}

// Last location needs to be correct, even on first tick.
simulated function SyncOriginalLocation()
{
    LastLocation = OriginalLocation;

    Super.SyncOriginalLocation();
}

defaultproperties
{
   ChargeLevel=-1
   WeaponClassName="KFWeap_Bow_CompoundBow"
   AmmoPickupSound=AkEvent'WW_WEP_SA_Crossbow.Play_Crossbow_Bolt_Pickup'
   ProjPickupTemplate=ParticleSystem'WEP_Crossbow_EMIT.FX_Crossbow_Projectile_Pickup'
   LifeSpanAfterStick=180.000000
   BouncesLeft=0
   bNoReplicationToInstigator=False
   bWarnAIWhenFired=True
   TerminalVelocity=15000.000000
   ProjFlightTemplate=ParticleSystem'WEP_CompoundBow_EMIT.FX_Compound_Bow_Sharp_Projectile'
   AmbientSoundPlayEvent=AkEvent'WW_WEP_SA_Crossbow.Play_Bolt_Fly_By'
   AmbientSoundStopEvent=AkEvent'WW_WEP_SA_Crossbow.Stop_Bolt_Fly_By'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'KFGame.Default__KFProj_RicochetStickBullet:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.100000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFProj_RicochetStickBullet:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   ImpactEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Crossbow_impact'
   Speed=15000.000000
   MaxSpeed=15000.000000
   bBlockedByInstigator=False
   bRotationFollowsVelocity=False
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFProj_RicochetStickBullet:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFProj_RicochetStickBullet:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=AmbientAkSoundComponent
   bNetTemporary=False
   bNoEncroachCheck=True
   LifeSpan=10.000000
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_Bolt_CompoundBowSharp"
   ObjectArchetype=KFProj_RicochetStickBullet'KFGame.Default__KFProj_RicochetStickBullet'
}
