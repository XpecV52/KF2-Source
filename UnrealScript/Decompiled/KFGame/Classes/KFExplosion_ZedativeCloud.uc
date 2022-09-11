/*******************************************************************************
 * KFExplosion_ZedativeCloud generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFExplosion_ZedativeCloud extends KFExplosionActorLingering
    config(Weapon)
    hidecategories(Navigation);

var private repnotify transient GameExplosion ReplicatedExploTemplate;
var() class<KFDamageType> HealingDamageType;
var() float HealingAmount;
var AkEvent SmokeLoopStartEvent;
var AkEvent SmokeLoopStopEvent;
var KFPerk CachedInstigatorPerk;
var float ExplosionDelay;
var int ZedativeHealth;
var int ZedativeDamage;
var class<KFDamageType> ZedativeDamageType;
var class<KFDamageType> ZedativeHealingType;
var int ZedativeEffectRadius;

replication
{
     if(bNetInitial)
        ReplicatedExploTemplate;
}

simulated event ReplicatedEvent(name VarName)
{
    if(VarName == 'ReplicatedExploTemplate')
    {
        Explode(ReplicatedExploTemplate, ExplosionDirection);        
    }
    else
    {
        super(Actor).ReplicatedEvent(VarName);
    }
}

simulated function Explode(GameExplosion NewExplosionTemplate, optional Vector Direction)
{
    super.Explode(NewExplosionTemplate, Direction);
    if(Role == ROLE_Authority)
    {
        ExplosionDelay = Class'KFPerk_FieldMedic'.static.GetZedativeExplosionDelay();
        ZedativeHealth = Class'KFPerk_FieldMedic'.static.GetZedativeHealth();
        ZedativeDamage = Class'KFPerk_FieldMedic'.static.GetZedativeDamage();
        ZedativeDamageType = Class'KFPerk_FieldMedic'.static.GetZedativeDamageType();
        ZedativeHealingType = Class'KFPerk_FieldMedic'.static.GetZedativeHealingType();
        ZedativeEffectRadius = int(Class'KFPerk_FieldMedic'.static.GetZedativeEffectRadius());
        SetTimer(ExplosionDelay, false, 'DelayedExplosionDamage', self);
        ReplicatedExploTemplate = NewExplosionTemplate;
    }
}

protected simulated function AffectsPawn(Pawn Victim, float DamageScale)
{
    local KFPawn_Human HumanVictim;
    local KFPawn_Monster MonsterVictim;
    local Box BBox;
    local Vector BBoxCenter;
    local Actor HitActor;
    local bool bDamageBlocked;

    if((Victim != none) && Victim.IsAliveAndWell())
    {
        MonsterVictim = KFPawn_Monster(Victim);
        if(MonsterVictim != none)
        {
            if((bWasFadedOut || bDeleteMe) || bPendingDelete)
            {
                return;
            }
            Victim.GetComponentsBoundingBox(BBox);
            BBoxCenter = (BBox.Min + BBox.Max) * 0.5;
            HitActor = TraceExplosive(BBoxCenter, Location + vect(0, 0, 20));
            bDamageBlocked = (HitActor != none) && HitActor != Victim;
            if(bDamageBlocked && HitActor.IsA('KFDoorActor'))
            {
                bDamageBlocked = false;
            }
            if(!bDamageBlocked)
            {
                Victim.TakeRadiusDamage(InstigatorController, float(ZedativeDamage) * DamageScale, float(ZedativeEffectRadius), ZedativeDamageType, ExplosionTemplate.MomentumTransferScale, Location, bDoFullDamage, ((Owner != none) ? Owner : self), ExplosionTemplate.DamageFalloffExponent);
            }            
        }
        else
        {
            HumanVictim = KFPawn_Human(Victim);
            if((HumanVictim != none) && HumanVictim.GetExposureTo(Location) > float(0))
            {
                HumanVictim.HealDamage(ZedativeHealth, InstigatorController, ZedativeHealingType, false);
            }
        }
    }
}

simulated function SpawnExplosionParticleSystem(ParticleSystem Template)
{
    if(!ExplosionTemplate.bAllowPerMaterialFX && Template == none)
    {
        Template = KFGameExplosion(ExplosionTemplate).ExplosionEffects.DefaultImpactEffect.ParticleTemplate;
    }
    WorldInfo.MyEmitterPool.SpawnEmitter(Template, Location, rotator(ExplosionTemplate.HitNormal));
}

defaultproperties
{
    bSkipLineCheckForPawns=true
    LoopStartEvent=AkEvent'WW_WEP_EXP_Grenade_Medic.Play_WEP_EXP_Grenade_Medic_Smoke_Loop'
    LoopStopEvent=AkEvent'WW_WEP_EXP_Grenade_Medic.Stop_WEP_EXP_Grenade_Medic_Smoke_Loop'
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    bNetTemporary=true
    bAlwaysRelevant=true
    bNetInitialRotation=true
}