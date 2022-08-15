/*******************************************************************************
 * KFExplosionActorReplicated generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFExplosionActorReplicated extends KFExplosionActor
    config(Weapon)
    hidecategories(Navigation);

var private repnotify transient GameExplosion ExploTemplateRef;
var bool bIgnoreInstigator;
var bool bTraceForHitActorWhenDirectionalExplosion;
var bool bSyncParticlesToMuzzle;

replication
{
     if(bNetDirty)
        ExploTemplateRef, bSyncParticlesToMuzzle, 
        bTraceForHitActorWhenDirectionalExplosion;
}

simulated event ReplicatedEvent(name VarName)
{
    if(VarName == 'ExploTemplateRef')
    {
        Explode(ExploTemplateRef, ExplosionDirection);        
    }
    else
    {
        super(Actor).ReplicatedEvent(VarName);
    }
}

simulated function Explode(GameExplosion NewExplosionTemplate, optional Vector ExploDirection)
{
    local Vector MyHitLocation, MyHitNormal, TraceStart, TraceDest;
    local Actor MyHitActor;

    if(NewExplosionTemplate.bDirectionalExplosion && bTraceForHitActorWhenDirectionalExplosion)
    {
        TraceStart = Location;
        TraceDest = Location + (ExploDirection * NewExplosionTemplate.DamageRadius);
        MyHitActor = Trace(MyHitLocation, MyHitNormal, TraceDest, TraceStart, true,,, 1);
        if(MyHitActor != none)
        {
            NewExplosionTemplate.HitLocation = MyHitLocation;
            NewExplosionTemplate.HitNormal = MyHitNormal;
        }
    }
    if(Role == ROLE_Authority)
    {
        ExploTemplateRef = NewExplosionTemplate;
    }
    if(bIgnoreInstigator)
    {
        NewExplosionTemplate.bIgnoreInstigator = true;
    }
    super.Explode(NewExplosionTemplate, ExploDirection);
    LifeSpan = FMax(LifeSpan, 1);
}

simulated function SpawnExplosionParticleSystem(ParticleSystem Template)
{
    if(bSyncParticlesToMuzzle)
    {
        WorldInfo.MyEmitterPool.SpawnEmitter(Template, GetMuzzleEffectLocation(), Rotation, none);        
    }
    else
    {
        WorldInfo.MyEmitterPool.SpawnEmitter(Template, Location, Rotation, none);
    }
}

simulated function Vector GetMuzzleEffectLocation()
{
    local KFPawn KFP;

    if((WorldInfo.NetMode != NM_DedicatedServer) && Instigator != none)
    {
        if(!Instigator.IsFirstPerson())
        {
            KFP = KFPawn(Instigator);
            if((KFP != none) && KFP.WeaponAttachment != none)
            {
                return KFP.WeaponAttachment.GetMuzzleLocation(0);
            }            
        }
        else
        {
            if(Instigator.Weapon != none)
            {
                return Instigator.Weapon.GetMuzzleLoc();
            }
        }
    }
    return Location;
}

defaultproperties
{
    bIgnoreInstigator=true
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    bNetTemporary=true
    bAlwaysRelevant=true
    bNetInitialRotation=true
}