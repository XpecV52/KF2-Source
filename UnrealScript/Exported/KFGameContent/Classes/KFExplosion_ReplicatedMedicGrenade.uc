//=============================================================================
// KFExplosion_ReplicatedMedicGrenade
//=============================================================================
// Used by projectiles and kismet to spawn an explosion
// Extends KFExplosion_MedicGrenade and uses functionality from KFExplosionActorReplicated
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================

class KFExplosion_ReplicatedMedicGrenade extends KFExplosion_MedicGrenade;

/** Should be a serializable object, like in the level or something (as is the case for kismet actions). */
var transient private repnotify GameExplosion		ExploTemplateRef;

/** Does a trace to find hitactor, hitlocation, hitnormal for directional explosions */
var bool bTraceForHitActorWhenDirectionalExplosion;

/** If true, spawn particle system at the weapon muzzle even actor location is not */
var bool bSyncParticlesToMuzzle;

/** The actor the explosion should attach to */
var transient repnotify Actor BlastAttachee;

replication
{
	if (bNetDirty)
		ExploTemplateRef, bTraceForHitActorWhenDirectionalExplosion, bSyncParticlesToMuzzle, BlastAttachee;
}

simulated event ReplicatedEvent(Name VarName)
{
	if (VarName == 'ExploTemplateRef')
	{
		Explode(ExploTemplateRef, ExplosionDirection);
	}
	else
	{
		super.ReplicatedEvent(VarName);
	}
}

simulated function Explode(GameExplosion NewExplosionTemplate, optional vector ExploDirection)
{
	local vector MyHitLocation, MyHitNormal;
	local vector TraceStart, TraceDest;
	Local Actor MyHitActor;

	// Trace to find where the directional blast would hit for applying effects
	if (NewExplosionTemplate.bDirectionalExplosion && bTraceForHitActorWhenDirectionalExplosion)
	{
		TraceStart = Location;
		TraceDest = Location + (ExploDirection * NewExplosionTemplate.DamageRadius);

		MyHitActor = Trace(MyHitLocation, MyHitNormal, TraceDest, TraceStart, TRUE, , , TRACEFLAG_Bullet);

		if (MyHitActor != none)
		{
			NewExplosionTemplate.HitLocation = MyHitLocation;
			NewExplosionTemplate.HitNormal = MyHitNormal;
		}
	}

	if (Role == ROLE_Authority)
	{
		BlastAttachee = Attachee;
		ExploTemplateRef = NewExplosionTemplate;
	}

	super.Explode(NewExplosionTemplate, ExploDirection);

	LifeSpan = FMax(LifeSpan, 1.0);
}

/** Use actor rotation instead of HitNormal! */
simulated function SpawnExplosionParticleSystem(ParticleSystem Template)
{
	if (BlastAttachee != none)
	{
		WorldInfo.MyEmitterPool.SpawnEmitter(Template, BlastAttachee.Location, Rotation, BlastAttachee);
	}
	else if (bSyncParticlesToMuzzle)
	{
		WorldInfo.MyEmitterPool.SpawnEmitter(Template, GetMuzzleEffectLocation(), Rotation, None);
	}
	else
	{
		WorldInfo.MyEmitterPool.SpawnEmitter(Template, Location, Rotation, None);
	}
}

simulated function SetSyncToMuzzleLocation(bool bSync)
{
	bSyncParticlesToMuzzle = bSync;
}

/**
 * Get muzzle location for currently equipped weapon
 * This is visual only! Damage is done from ExplosionActor location
 */
simulated function vector GetMuzzleEffectLocation()
{
	local KFPawn KFP;

	if (WorldInfo.NetMode != NM_DedicatedServer && Instigator != None)
	{
		// Try third person attachment
		if (!Instigator.IsFirstPerson())
		{
			KFP = KFPawn(Instigator);
			if (KFP != None && KFP.WeaponAttachment != None)
			{
				return KFP.WeaponAttachment.GetMuzzleLocation(0);
			}
		}
		// Otherwise use first person muzzle
		else if (Instigator.Weapon != None)
		{
			return Instigator.Weapon.GetMuzzleLoc();
		}
	}

	return Location;
}

defaultproperties
{
   RemoteRole=ROLE_SimulatedProxy
   bNetTemporary=True
   bAlwaysRelevant=True
   bNetInitialRotation=True
   Name="Default__KFExplosion_ReplicatedMedicGrenade"
   ObjectArchetype=KFExplosion_MedicGrenade'kfgamecontent.Default__KFExplosion_MedicGrenade'
}
