/*******************************************************************************
 * KFProj_Bolt_CompoundBowCryo generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFProj_Bolt_CompoundBowCryo extends KFProj_RicochetBullet
    hidecategories(Navigation);

var float StartingDamageRadius;
var repnotify int ChargeLevel;
var bool bHasChargeLevel;
var bool bHasExplodedReplicated;

replication
{
     if(bNetInitial)
        ChargeLevel;
}

simulated event ReplicatedEvent(name VarName)
{
    if(VarName == 'ChargeLevel')
    {
        bHasChargeLevel = true;
        SpawnFlightEffects();
        if(bHasExploded && bHasExplodedReplicated)
        {
            bHasExploded = false;
        }        
    }
    else
    {
        if(VarName == 'bHasExploded')
        {
            bHasExplodedReplicated = true;
            if(!bHasChargeLevel)
            {
                return;
            }
        }
    }
    super(KFProjectile).ReplicatedEvent(VarName);
}

simulated function PostBeginPlay()
{
    local KFWeap_Bow_CompoundBow CompoundBow;

    if(Role == ROLE_Authority)
    {
        CompoundBow = KFWeap_Bow_CompoundBow(Owner);
        if(CompoundBow != none)
        {
            ChargeLevel = CompoundBow.GetChargeLevel();
            bHasChargeLevel = true;
        }
    }
    super(KFProjectile).PostBeginPlay();
}

simulated function float GetChargeLevelTrail()
{
    if(ChargeLevel >= 2)
    {
        return 1;
    }
    if(ChargeLevel == 1)
    {
        if(WorldInfo.NetMode == NM_Client)
        {
            return 0.8;
        }
        return 0.5;
    }
    if(WorldInfo.NetMode == NM_Client)
    {
        return 0.5;
    }
    return 0;
}

simulated function SpawnFlightEffects()
{
    if((!bHasChargeLevel || bHasExploded) || bHasDisintegrated)
    {
        return;
    }
    super(KFProjectile).SpawnFlightEffects();
    if(ProjEffects != none)
    {
        ProjEffects.SetVectorParameter('ChargeLevelTrail', (GetChargeLevelTrail()) * vect(1, 1, 1));
    }
}

simulated event PreBeginPlay()
{
    super(KFProjectile).PreBeginPlay();
    if(ExplosionTemplate != none)
    {
        StartingDamageRadius = ExplosionTemplate.DamageRadius;
    }
}

simulated function Tick(float DeltaTime)
{
    super(Actor).Tick(DeltaTime);
    if((WorldInfo.NetMode != NM_DedicatedServer) && Physics != 0)
    {
        SetRotation(rotator(Velocity));
    }
}

protected simulated function PrepareExplosionTemplate()
{
    local KFPlayerController KFPC;
    local KFPerk InstigatorPerk;

    ExplosionTemplate.DamageRadius = StartingDamageRadius;
    if((Instigator != none) && Instigator.Controller != none)
    {
        KFPC = KFPlayerController(Instigator.Controller);
        if(KFPC != none)
        {
            InstigatorPerk = KFPC.GetPerk();
            if(InstigatorPerk != none)
            {
                ExplosionTemplate.DamageRadius = StartingDamageRadius * InstigatorPerk.GetAoERadiusModifier();
            }
        }
    }
    super(KFProjectile).PrepareExplosionTemplate();
}

simulated function TriggerExplosion(Vector HitLocation, Vector HitNormal, Actor HitActor)
{
    local editinline ParticleSystemComponent ComponentIt;

    super(KFProj_Bullet).TriggerExplosion(HitLocation, HitNormal, HitActor);
    if(bHasExploded)
    {
        foreach ComponentList(Class'ParticleSystemComponent', ComponentIt)
        {
            ComponentIt.DeactivateSystem();            
        }        
    }
}

defaultproperties
{
    ChargeLevel=-1
    BouncesLeft=0
    bNoReplicationToInstigator=false
    bReplicateLocationOnExplosion=true
    bValidateExplosionNormalOnClient=true
    bAlwaysReplicateDisintegration=true
    bAlwaysReplicateExplosion=true
    bCanDisintegrate=true
    bWarnAIWhenFired=true
    TerminalVelocity=15000
    ExplosionActorClass=Class'KFGame.KFExplosionActor'
    begin object name=ExploTemplate0 class=KFGameExplosion
        ExplosionEffects=KFImpactEffectInfo'WEP_CompoundBow_ARCH.FX_CompoundBow_Cryo_Projectile_Explosion'
        Damage=75
        DamageRadius=250
        DamageFalloffExponent=0.5
        MyDamageType=Class'KFDT_Freeze_CompoundBowCryExplosion'
        KnockDownStrength=0
        MomentumTransferScale=1
        ExplosionSound=AkEvent'WW_WEP_SA_CompoundBow.Play_Arrow_Impact_Cryo'
        ExploLight=PointLightComponent'Default__KFProj_Bolt_CompoundBowCryo.ExplosionPointLight'
        ExploLightFadeOutTime=0.2
        CamShake=none
    object end
    // Reference: KFGameExplosion'Default__KFProj_Bolt_CompoundBowCryo.ExploTemplate0'
    ExplosionTemplate=ExploTemplate0
    ProjFlightTemplate=ParticleSystem'WEP_CompoundBow_EMIT.FX_Compound_Bow_Cryo_Projectile'
    AmbientSoundPlayEvent=AkEvent'WW_WEP_SA_Crossbow.Play_Bolt_Fly_By'
    AmbientSoundStopEvent=AkEvent'WW_WEP_SA_Crossbow.Stop_Bolt_Fly_By'
    AmbientComponent=AkComponent'Default__KFProj_Bolt_CompoundBowCryo.AmbientAkSoundComponent'
    ImpactEffects=KFImpactEffectInfo'WEP_CompoundBow_ARCH.FX_CompoundBow_Cryo_Projectile_Impact'
    Speed=15000
    MaxSpeed=15000
    bBlockedByInstigator=false
    bRotationFollowsVelocity=false
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Bolt_CompoundBowCryo.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Bolt_CompoundBowCryo.CollisionCylinder'
    Components(0)=CollisionCylinder
    Components(1)=AkComponent'Default__KFProj_Bolt_CompoundBowCryo.AmbientAkSoundComponent'
    bNetTemporary=false
    bNoEncroachCheck=true
    bBounce=false
    LifeSpan=10
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Bolt_CompoundBowCryo.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}