//=============================================================================
// KFExplosionActorLingering
//=============================================================================
// Explosion actor class for ground fire
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Greg Felber
//=============================================================================

class KFExplosionActorLingering extends KFExplosionActor;

/** How often to do burn damage */
var() float Interval;
/** How long to burn for */
var() float MaxTime;
/** Use an AllPawns check rather than CollidingActors */
var() bool bOnlyDamagePawns;
/** If using bOnlyDamagePawns, controls whether or not to perform a world geometry trace */
var() bool bSkipLineCheckForPawns;
/** if true, damage will ignore fall off */
var() bool bDoFullDamage;

var AkEvent LoopStartEvent;
var AkEvent LoopStopEvent;

var() ParticleSystem					LoopingParticleEffect;
var	transient ParticleSystemComponent	LoopingPSC;

/*
 * @param Direction     For bDirectionalExplosion=true explosions, this is the forward direction of the blast.
 * Overridden to add the ability to spawn fragments from the explosion
 **/
simulated function Explode(GameExplosion NewExplosionTemplate, optional vector Direction)
{
	super.Explode(NewExplosionTemplate, Direction);

	LifeSpan = MaxTime;
	if (Role == Role_Authority)
	{
		//DelayedExplosionDamage();
		SetTimer(Interval, true, nameof(DelayedExplosionDamage), self);
	}

	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		if( LoopStartEvent != none )
		{
			PlaySoundBase( LoopStartEvent, true );
		}

		if( LoopingParticleEffect != none )
		{
			StartLoopingParticleEffect();
		}
	}
}

simulated function StartLoopingParticleEffect()
{
	LoopingPSC = new(self) class'ParticleSystemComponent';
	LoopingPSC.SetTemplate( LoopingParticleEffect );
	AttachComponent(LoopingPSC);

	SetTimer( Max(MaxTime - 0.5f, 0.1f), false, nameof(StopLoopingParticleEffect), self);
}

event Destroyed()
{
	if( WorldInfo.NetMode != NM_DedicatedServer && LoopStopEvent != none )
	{
		PlaySoundBase( LoopStopEvent, true );
	}

	StopLoopingParticleEffect();

	super.Destroyed();
}

simulated function StopLoopingParticleEffect()
{
	if( WorldInfo.NetMode != NM_DedicatedServer && LoopingPSC != none )
	{
        LoopingPSC.DeactivateSystem();
	}
}

/**
  * Does damage modeling and application for explosions
  * @PARAM bCauseDamage if true cause damage to actors within damage radius
  * @PARAM bCauseEffects if true apply other affects to actors within appropriate radii
  * @RETURN TRUE if at least one Pawn victim got hurt. (This is only valid if bCauseDamage == TRUE)
  */
protected simulated function bool DoExplosionDamage(bool bCauseDamage, bool bCauseEffects)
{
	if(bOnlyDamagePawns)
	{
		return ExplodePawns();
	}
		
	return super.DoExplosionDamage(bCauseDamage, bCauseEffects);
}

/** Stripped down and optimized version of DoExplosionDamage that only checks for pawns */
protected simulated function bool ExplodePawns()
{
	local Pawn 		Victim;
	local float 	CheckRadius;
	local bool		bDamageBlocked, bHitPawn;
	local Actor		HitActor;
	local vector	BBoxCenter;
	local float 	DamageScale;
	local Box BBox;	

	// determine radius to check
	CheckRadius = GetEffectCheckRadius(true, false, false);
	if ( CheckRadius > 0.0 )
	{
		foreach WorldInfo.AllPawns(class'Pawn', Victim, Location, CheckRadius)
		{
			if ( (!Victim.bWorldGeometry || Victim.bCanBeDamaged)
				&& Victim != ExplosionTemplate.ActorToIgnoreForDamage
				&& (!ExplosionTemplate.bIgnoreInstigator || Victim != Instigator)
				&& !ClassIsChildOf(Victim.Class, ExplosionTemplate.ActorClassToIgnoreForDamage) )
			{
				if ( bSkipLineCheckForPawns )
				{
					bDamageBlocked = false;
				}
				else
				{
					Victim.GetComponentsBoundingBox(BBox);
					BBoxCenter = (BBox.Min + BBox.Max) * 0.5f;
					HitActor = TraceExplosive(BBoxCenter, Location + vect(0, 0, 20));
					bDamageBlocked = (HitActor != None && HitActor != Victim);
				}

				if( !bDamageBlocked )
				{
					DamageScale = (DamageScalePerStack < 1.f) ? CalcStackingDamageScale(KFPawn(Victim), Interval) : 1.f;
					if ( DamageScale > 0.f )
					{
						AffectsPawn(Victim, DamageScale);
						bHitPawn = true;
					}
				}
			}
		}
	}

	return bHitPawn;
}

protected simulated function AffectsPawn(Pawn Victim, float DamageScale)
{

	Victim.TakeRadiusDamage(InstigatorController, ExplosionTemplate.Damage * DamageScale, ExplosionTemplate.DamageRadius,
		ExplosionTemplate.MyDamageType, ExplosionTemplate.MomentumTransferScale, Location, bDoFullDamage,
		(Owner != None) ? Owner : self, ExplosionTemplate.DamageFalloffExponent);
}

DefaultProperties
{
	Interval=0.25
	MaxTime=2.0

	bExplodeMoreThanOnce=true
	bDoFullDamage=false
	bOnlyDamagePawns=true
}
