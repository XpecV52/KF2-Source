/*******************************************************************************
 * KFExplosion_AirborneAgent generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFExplosion_AirborneAgent extends KFExplosionActorReplicated
    config(Weapon)
    hidecategories(Navigation);

var() class<KFDamageType> HealingDamageType;
var() float HealingAmount;
var AkEvent LoopStartEvent;
var AkEvent LoopStopEvent;
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
var KFPerk CachedInstigatorPerk;
var() ParticleSystem LoopingParticleEffect;
var export editinline transient ParticleSystemComponent LoopingPSC;
var private const string AAHealingDamageTypePath;
var export editinline transient ParticleSystemComponent PSC;
var Pawn MyPawn;

replication
{
     if(bNetInitial)
        MyPawn;
}

simulated event ReplicatedEvent(name VarName)
{
    if((Instigator == none) && MyPawn != none)
    {
        Instigator = MyPawn;
        InstigatorController = MyPawn.Controller;
        Attachee = MyPawn;
        SetPhysics(0);
        SetBase(MyPawn,, MyPawn.Mesh);
    }
    super.ReplicatedEvent(VarName);
}

protected simulated function AffectsPawn(Pawn Victim, float DamageScale)
{
    local KFPawn_Human HumanVictim;
    local KFPawn_Monster MonsterVictim;

    if(HealingDamageType == none)
    {
        HealingDamageType = class<KFDamageType>(DynamicLoadObject(default.AAHealingDamageTypePath, Class'Class'));
    }
    if((Victim != none) && Victim.IsAliveAndWell())
    {
        MonsterVictim = KFPawn_Monster(Victim);
        if(MonsterVictim != none)
        {
            if((bWasFadedOut || bDeleteMe) || bPendingDelete)
            {
                return;
            }
            Victim.TakeRadiusDamage(InstigatorController, ExplosionTemplate.Damage * DamageScale, ExplosionTemplate.DamageRadius, ExplosionTemplate.MyDamageType, ExplosionTemplate.MomentumTransferScale, Location, bDoFullDamage, ((Owner != none) ? Owner : self), ExplosionTemplate.DamageFalloffExponent);            
        }
        else
        {
            HumanVictim = KFPawn_Human(Victim);
            if((HumanVictim != none) && HumanVictim.GetExposureTo(Location) > float(0))
            {
                HumanVictim.HealDamage(int(HealingAmount), InstigatorController, HealingDamageType);
            }
        }
    }
}

simulated function SpawnExplosionParticleSystem(ParticleSystem Template)
{
    local KFPawn_Human KFPH;

    if(WorldInfo.NetMode == NM_DedicatedServer)
    {
        return;
    }
    if(!ExplosionTemplate.bAllowPerMaterialFX && Template == none)
    {
        Template = KFGameExplosion(ExplosionTemplate).ExplosionEffects.DefaultImpactEffect.ParticleTemplate;
    }
    KFPH = KFPawn_Human(Instigator);
    if(KFPH != none)
    {
        KFPH.PerkFXEmitterPool.SpawnEmitter(Template, Location, rotator(vect(0, 0, 0)), Instigator);
    }
}

simulated function Explode(GameExplosion NewExplosionTemplate, optional Vector Direction)
{
    local KFPawn KFP;

    super.Explode(NewExplosionTemplate, Direction);
    LifeSpan = maxTime;
    if(Role == ROLE_Authority)
    {
        SetTimer(interval, true, 'DelayedExplosionDamage', self);
    }
    if(Instigator != none)
    {
        KFP = KFPawn(Instigator);
        if(KFP != none)
        {
            CachedInstigatorPerk = KFP.GetPerk();
        }
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
    }
}

simulated function StartLoopingParticleEffect()
{
    LoopingPSC = new (self) Class'ParticleSystemComponent';
    LoopingPSC.SetTemplate(LoopingParticleEffect);
    AttachComponent(LoopingPSC);
    SetTimer(float(Max(int(maxTime - 0.5), int(0.1))), false, 'StopLoopingParticleEffect', self);
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
        SetTimer(2, false, 'Destroy');
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
    return super(KFExplosionActor).DoExplosionDamage(bCauseDamage, bCauseEffects);
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

defaultproperties
{
    HealingAmount=5
    LoopStartEvent=AkEvent'WW_WEP_EXP_Grenade_Medic.Play_WEP_EXP_Grenade_Medic_Smoke_Loop'
    LoopStopEvent=AkEvent'WW_WEP_EXP_Grenade_Medic.Stop_WEP_EXP_Grenade_Medic_Smoke_Loop'
    interval=1
    maxTime=8
    bOnlyDamagePawns=true
    bSkipLineCheckForPawns=true
    bDoFullDamage=true
    AAHealingDamageTypePath="KFGameContent.KFDT_Healing_MedicGrenade"
    bExplodeMoreThanOnce=true
}