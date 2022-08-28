/*******************************************************************************
 * KFExplosionActorLingering generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFExplosionActorLingering extends KFExplosionActor
    config(Weapon)
    hidecategories(Navigation);

/** How often to do damage */
var() float interval;
/** How long to do damage for total */
var() float maxTime;
/** Use an AllPawns check rather than CollidingActors */
var() bool bOnlyDamagePawns;
/** If using bOnlyDamagePawns, controls whether or not to perform a world geometry trace */
var() bool bSkipLineCheckForPawns;
/** if true, damage will ignore fall off */
var() bool bDoFullDamage;
var bool bWasFadedOut;
var float FadeOutTime;
var AkEvent LoopStartEvent;
var AkEvent LoopStopEvent;
var() ParticleSystem LoopingParticleEffect;
var export editinline transient ParticleSystemComponent LoopingPSC;

simulated function Explode(GameExplosion NewExplosionTemplate, optional Vector Direction)
{
    super.Explode(NewExplosionTemplate, Direction);
    LifeSpan = maxTime;
    if(Role == ROLE_Authority)
    {
        SetTimer(interval, true, 'DelayedExplosionDamage', self);
    }
    if(WorldInfo.NetMode != NM_DedicatedServer)
    {
        if(LoopStartEvent != none)
        {
            PlaySoundBase(LoopStartEvent, true);
        }
        if(LoopingParticleEffect != none)
        {
            StartLoopingParticleEffect();
        }
        SetTimer(float(Max(int(maxTime - FadeOutTime), int(0.1))), false, 'FadeOut');
    }
}

simulated function StartLoopingParticleEffect()
{
    LoopingPSC = new (self) Class'ParticleSystemComponent';
    LoopingPSC.SetTemplate(LoopingParticleEffect);
    AttachComponent(LoopingPSC);
}

simulated function FadeOut(optional bool bDestroyImmediately)
{
    if(bWasFadedOut)
    {
        return;
    }
    bWasFadedOut = true;
    if((WorldInfo.NetMode != NM_DedicatedServer) && LoopStopEvent != none)
    {
        PlaySoundBase(LoopStopEvent, true);
    }
    StopLoopingParticleEffect();
    if(!bDeleteMe && !bPendingDelete)
    {
        SetTimer(FadeOutTime, false, 'Destroy');
    }
}

simulated event Destroyed()
{
    FadeOut();
    super(Actor).Destroyed();
}

simulated function StopLoopingParticleEffect()
{
    if((WorldInfo.NetMode != NM_DedicatedServer) && LoopingPSC != none)
    {
        LoopingPSC.DeactivateSystem();
    }
}

protected simulated function bool DoExplosionDamage(bool bCauseDamage, bool bCauseEffects)
{
    if((bWasFadedOut || bDeleteMe) || bPendingDelete)
    {
        return false;
    }
    if(bOnlyDamagePawns)
    {
        return ExplodePawns();
    }
    return super.DoExplosionDamage(bCauseDamage, bCauseEffects);
}

protected simulated function bool ExplodePawns()
{
    local Pawn Victim;
    local float CheckRadius;
    local bool bDamageBlocked, bHitPawn;
    local Actor HitActor;
    local Vector BBoxCenter;
    local float DamageScale;
    local Box BBox;

    if((bWasFadedOut || bDeleteMe) || bPendingDelete)
    {
        return false;
    }
    CheckRadius = GetEffectCheckRadius(true, false, false);
    if(CheckRadius > 0)
    {
        foreach WorldInfo.AllPawns(Class'Pawn', Victim, Location, CheckRadius)
        {
            if((((!Victim.bWorldGeometry || Victim.bCanBeDamaged) && Victim != ExplosionTemplate.ActorToIgnoreForDamage) && !ExplosionTemplate.bIgnoreInstigator || Victim != Instigator) && !ClassIsChildOf(Victim.Class, ExplosionTemplate.ActorClassToIgnoreForDamage))
            {
                if(bSkipLineCheckForPawns)
                {
                    bDamageBlocked = false;                    
                }
                else
                {
                    Victim.GetComponentsBoundingBox(BBox);
                    BBoxCenter = (BBox.Min + BBox.Max) * 0.5;
                    HitActor = TraceExplosive(BBoxCenter, Location + vect(0, 0, 20));
                    bDamageBlocked = (HitActor != none) && HitActor != Victim;
                }
                if(!bDamageBlocked)
                {
                    DamageScale = ((DamageScalePerStack < 1) ? CalcStackingDamageScale(KFPawn(Victim), interval) : 1);
                    if(DamageScale > 0)
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
    if((bWasFadedOut || bDeleteMe) || bPendingDelete)
    {
        return;
    }
    Victim.TakeRadiusDamage(InstigatorController, ExplosionTemplate.Damage * DamageScale, ExplosionTemplate.DamageRadius, ExplosionTemplate.MyDamageType, ExplosionTemplate.MomentumTransferScale, Location, bDoFullDamage, ((Owner != none) ? Owner : self), ExplosionTemplate.DamageFalloffExponent);
}

defaultproperties
{
    interval=0.25
    maxTime=2
    bOnlyDamagePawns=true
    FadeOutTime=0.5
    bExplodeMoreThanOnce=true
}