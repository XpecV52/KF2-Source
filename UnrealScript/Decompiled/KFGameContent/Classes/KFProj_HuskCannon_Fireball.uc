/*******************************************************************************
 * KFProj_HuskCannon_Fireball generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFProj_HuskCannon_Fireball extends KFProj_BallisticExplosive
    hidecategories(Navigation)
    implements(KFInterface_DamageCauser);

var float DamageScale;
var float AOEScale;
var float IncapScale;
var repnotify int ChargeLevel;
var const ParticleSystem ExplosionEffectL1;
var const ParticleSystem ExplosionEffectL2;
var const ParticleSystem ExplosionEffectL3;
var const ParticleSystem ProjFlightTemplateL1;
var const ParticleSystem ProjFlightTemplateL2;
var const ParticleSystem ProjFlightTemplateL3;
var const AkBaseSoundObject ExplosionSoundL1;
var const AkBaseSoundObject ExplosionSoundL2;
var const AkBaseSoundObject ExplosionSoundL3;
var const ParticleSystem ConcussiveForceEffectL1;
var const ParticleSystem ConcussiveForceEffectL2;
var const ParticleSystem ConcussiveForceEffectL3;
var protected const class<KFExplosionActorLingering> GroundFireExplosionActorClass;
var KFGameExplosion GroundFireExplosionTemplate;
var protected const float BurnDuration;
var protected const float BurnDamageInterval;
var bool bSpawnGroundFire;
var bool bAltGroundFire;
var KFImpactEffectInfo AltGroundFire;

replication
{
     if(bNetInitial)
        ChargeLevel, bSpawnGroundFire;
}

simulated event ReplicatedEvent(name VarName)
{
    if(VarName == 'ChargeLevel')
    {
        bSpawnGroundFire = ChargeLevel == 3;
        SpawnFlightEffects();
    }
    super(KFProjectile).ReplicatedEvent(VarName);
}

simulated function PostBeginPlay()
{
    local KFWeap_HuskCannon HuskCannon;
    local KFPlayerReplicationInfo InstigatorPRI;

    if(Role == ROLE_Authority)
    {
        HuskCannon = KFWeap_HuskCannon(Owner);
        if(HuskCannon != none)
        {
            ChargeLevel = HuskCannon.GetChargeFXLevel();
            bSpawnGroundFire = ChargeLevel == 3;
        }
    }
    if(Instigator != none)
    {
        if(AltGroundFire != none)
        {
            InstigatorPRI = KFPlayerReplicationInfo(Instigator.PlayerReplicationInfo);
            if(InstigatorPRI != none)
            {
                bAltGroundFire = InstigatorPRI.bSplashActive;
            }            
        }
        else
        {
            bAltGroundFire = false;
        }
    }
    super(KFProjectile).PostBeginPlay();
}

protected simulated function PrepareExplosionActor(GameExplosionActor GEA)
{
    local KFExplosionActor_HuskCannon HuskExplode;

    HuskExplode = KFExplosionActor_HuskCannon(GEA);
    if(HuskExplode != none)
    {
        HuskExplode.DamageScale = DamageScale;
    }
}

simulated function TriggerExplosion(Vector HitLocation, Vector HitNormal, Actor HitActor)
{
    local KFExplosionActorLingering GFExplosionActor;
    local Vector GroundExplosionHitNormal;

    if(bHasDisintegrated)
    {
        return;
    }
    if(!bHasExploded && bSpawnGroundFire)
    {
        if(bAltGroundFire && AltGroundFire != none)
        {
            GroundFireExplosionTemplate.ExplosionEffects = AltGroundFire;
        }
        GroundExplosionHitNormal = HitNormal;
        GFExplosionActor = Spawn(GroundFireExplosionActorClass, self,, HitLocation + (HitNormal * 32), rotator(HitNormal));
        if(GFExplosionActor != none)
        {
            GFExplosionActor.Instigator = Instigator;
            GFExplosionActor.InstigatorController = InstigatorController;
            GroundFireExplosionTemplate.HitLocation = HitLocation;
            GroundFireExplosionTemplate.HitNormal = GroundExplosionHitNormal;
            if(GroundFireExplosionTemplate.bDirectionalExplosion)
            {
                GroundExplosionHitNormal = GetExplosionDirection(GroundExplosionHitNormal);
            }
            GFExplosionActor.maxTime = BurnDuration;
            GFExplosionActor.interval = BurnDamageInterval;
            GFExplosionActor.Explode(GroundFireExplosionTemplate, GroundExplosionHitNormal);
        }
    }
    super(KFProjectile).TriggerExplosion(HitLocation, HitNormal, HitActor);
}

simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
    if(ClassIsChildOf(Other.Class, Class'KFPawn'))
    {
        bSpawnGroundFire = false;
    }
    super.ProcessTouch(Other, HitLocation, HitNormal);
}

protected simulated function PrepareExplosionTemplate()
{
    local bool bUseConcussiveForce;
    local Weapon OwnerWeapon;
    local Pawn OwnerPawn;
    local KFPlayerReplicationInfo PRI;

    super(KFProjectile).PrepareExplosionTemplate();
    bUseConcussiveForce = false;
    OwnerWeapon = Weapon(Owner);
    if(OwnerWeapon != none)
    {
        OwnerPawn = Pawn(OwnerWeapon.Owner);
        if(OwnerPawn != none)
        {
            PRI = KFPlayerReplicationInfo(OwnerPawn.PlayerReplicationInfo);
            if(PRI != none)
            {
                bUseConcussiveForce = PRI.bConcussiveActive;
            }
        }
    }
    switch(ChargeLevel)
    {
        case 1:
            if(bUseConcussiveForce)
            {
                ExplosionTemplate.ExplosionEffects.DefaultImpactEffect.ParticleTemplate = ConcussiveForceEffectL1;
                ExplosionTemplate.ExplosionSound = Class'KFPerk_Demolitionist'.static.GetConcussiveExplosionSound();                
            }
            else
            {
                ExplosionTemplate.ExplosionEffects.DefaultImpactEffect.ParticleTemplate = ExplosionEffectL1;
                ExplosionTemplate.ExplosionSound = ExplosionSoundL1;
            }
            break;
        case 2:
            if(bUseConcussiveForce)
            {
                ExplosionTemplate.ExplosionEffects.DefaultImpactEffect.ParticleTemplate = ConcussiveForceEffectL2;
                ExplosionTemplate.ExplosionSound = Class'KFPerk_Demolitionist'.static.GetConcussiveExplosionSound();                
            }
            else
            {
                ExplosionTemplate.ExplosionEffects.DefaultImpactEffect.ParticleTemplate = ExplosionEffectL2;
                ExplosionTemplate.ExplosionSound = ExplosionSoundL2;
            }
            break;
        case 3:
            if(bUseConcussiveForce)
            {
                ExplosionTemplate.ExplosionEffects.DefaultImpactEffect.ParticleTemplate = ConcussiveForceEffectL3;
                ExplosionTemplate.ExplosionSound = Class'KFPerk_Demolitionist'.static.GetConcussiveExplosionSound();                
            }
            else
            {
                ExplosionTemplate.ExplosionEffects.DefaultImpactEffect.ParticleTemplate = ExplosionEffectL3;
                ExplosionTemplate.ExplosionSound = ExplosionSoundL3;
            }
            break;
        default:
            break;
    }
    Class'KFPerk_Demolitionist'.static.PrepareExplosive(Instigator, self, AOEScale, DamageScale);
}

protected simulated function SetExplosionActorClass()
{
    local KFPlayerReplicationInfo InstigatorPRI;

    if(bWasTimeDilated && Instigator != none)
    {
        InstigatorPRI = KFPlayerReplicationInfo(Instigator.PlayerReplicationInfo);
        if((InstigatorPRI != none) && InstigatorPRI.CurrentPerkClass == Class'KFPerk_Demolitionist')
        {
            if(InstigatorPRI.bNukeActive && Class'KFPerk_Demolitionist'.static.ProjectileShouldNuke(self))
            {
                ExplosionActorClass = Class'KFPerk_Demolitionist'.static.GetNukeExplosionActorClass();
            }
        }
    }
    super.SetExplosionActorClass();
}

function float GetIncapMod()
{
    return IncapScale;
}

simulated function SpawnFlightEffects()
{
    if(ChargeLevel == 0)
    {
        return;
    }
    switch(ChargeLevel)
    {
        case 1:
            ProjFlightTemplate = ParticleSystem'FX_Huskcannon_Projectile_L1';
            break;
        case 2:
            ProjFlightTemplate = ParticleSystem'FX_Huskcannon_Projectile_L2';
            break;
        case 3:
            ProjFlightTemplate = ParticleSystem'FX_Huskcannon_Projectile_L3';
            break;
        default:
            break;
    }
    super(KFProjectile).SpawnFlightEffects();
}

defaultproperties
{
    ExplosionEffectL1=ParticleSystem'WEP_HuskCannon_EMIT.FX_Huskcannon_Impact_L1'
    ExplosionEffectL2=ParticleSystem'WEP_HuskCannon_EMIT.FX_Huskcannon_Impact_L2'
    ExplosionEffectL3=ParticleSystem'WEP_HuskCannon_EMIT.FX_Huskcannon_Impact_L3'
    ProjFlightTemplateL1=ParticleSystem'WEP_HuskCannon_EMIT.FX_Huskcannon_Projectile_L1'
    ProjFlightTemplateL2=ParticleSystem'WEP_HuskCannon_EMIT.FX_Huskcannon_Projectile_L2'
    ProjFlightTemplateL3=ParticleSystem'WEP_HuskCannon_EMIT.FX_Huskcannon_Projectile_L3'
    ExplosionSoundL1=AkEvent'WW_ZED_Husk.ZED_Husk_SFX_Ranged_Shot_Impact'
    ExplosionSoundL2=AkEvent'WW_ZED_Husk.ZED_Husk_SFX_Ranged_Shot_Impact'
    ExplosionSoundL3=AkEvent'WW_ZED_Husk.ZED_Husk_SFX_Ranged_Shot_Impact'
    ConcussiveForceEffectL1=ParticleSystem'WEP_HuskCannon_EMIT.FX_Huskcannon_Impact_L1_CF'
    ConcussiveForceEffectL2=ParticleSystem'WEP_HuskCannon_EMIT.FX_Huskcannon_Impact_L2_CF'
    ConcussiveForceEffectL3=ParticleSystem'WEP_HuskCannon_EMIT.FX_Huskcannon_Impact_L3_CF'
    GroundFireExplosionActorClass=Class'KFExplosion_HuskCannonFireballGroundFire'
    begin object name=ExploTemplate1 class=KFGameExplosion
        ExplosionEffects=KFImpactEffectInfo'wep_molotov_arch.Molotov_GroundFire'
        bDirectionalExplosion=true
        Damage=3
        DamageRadius=150
        MyDamageType=Class'KFGame.KFDT_Fire_Ground'
        KnockDownStrength=0
        MomentumTransferScale=0
        ExploLight=PointLightComponent'Default__KFProj_HuskCannon_Fireball.FlamePointLight'
        ExploLightFadeOutTime=0.3
        ExploLightStartFadeOutTime=1.5
        FractureMeshRadius=0
        CamShake=none
    object end
    // Reference: KFGameExplosion'Default__KFProj_HuskCannon_Fireball.ExploTemplate1'
    GroundFireExplosionTemplate=ExploTemplate1
    BurnDuration=4
    BurnDamageInterval=0.5
    AltGroundFire=KFImpactEffectInfo'WEP_Flamethrower_ARCH.GroundFire_Splash_Impacts'
    ExtraLineCollisionOffsets=/* Array type was not detected. */
    ExplosionActorClass=Class'KFExplosionActor_HuskCannon'
    begin object name=ExploTemplate2 class=KFGameExplosion
        ExplosionEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Explosions.HuskProjectile_Explosion'
        Damage=80
        DamageRadius=100
        MyDamageType=Class'KFDT_Explosive_HuskCannon'
        MomentumTransferScale=6000
        ExplosionEmitterScale=2
        ExplosionSound=AkEvent'WW_ZED_Husk.ZED_Husk_SFX_Ranged_Shot_Impact'
        ExploLight=PointLightComponent'Default__KFProj_HuskCannon_Fireball.ExplosionPointLight'
        ExploLightFadeOutTime=0.5
        FracturePartVel=100
        CamShake=none
    object end
    // Reference: KFGameExplosion'Default__KFProj_HuskCannon_Fireball.ExploTemplate2'
    ExplosionTemplate=ExploTemplate2
    ProjFlightTemplate=ParticleSystem'WEP_HuskCannon_EMIT.FX_Huskcannon_Projectile_L3'
    AmbientComponent=AkComponent'Default__KFProj_HuskCannon_Fireball.AmbientAkSoundComponent'
    MomentumTransfer=0
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionHeight=4
        CollisionRadius=4
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_HuskCannon_Fireball.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionHeight=4
        CollisionRadius=4
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_HuskCannon_Fireball.CollisionCylinder'
    Components(0)=CollisionCylinder
    Components(1)=AkComponent'Default__KFProj_HuskCannon_Fireball.AmbientAkSoundComponent'
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionHeight=4
        CollisionRadius=4
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_HuskCannon_Fireball.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}