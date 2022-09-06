/*******************************************************************************
 * KFProj_Grenade_HRGIncendiaryRifle generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFProj_Grenade_HRGIncendiaryRifle extends KFProj_HighExplosive_M16M203
    hidecategories(Navigation);

var class<KFProjectile> ResidualFlameProjClass;
/** Number of lingering flames to spawn */
var() int NumResidualFlames;
var protected const class<KFExplosionActorLingering> GroundFireExplosionActorClass;
var KFGameExplosion GroundFireExplosionTemplate;
var bool bSpawnGroundFire;
var bool bUseAltGroundFireEffect;
var KFImpactEffectInfo AltGroundFireEffect;
var Vector LastVelocity;

replication
{
     if(bNetInitial)
        bSpawnGroundFire;
}

simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
    if(ClassIsChildOf(Other.Class, Class'KFPawn'))
    {
        bSpawnGroundFire = false;
    }
    super(KFProj_BallisticExplosive).ProcessTouch(Other, HitLocation, HitNormal);
}

function SpawnResidualFlames(Vector HitLocation, Vector HitNormal, Vector HitVelocity)
{
    local int I;
    local Vector HitVelDir;
    local float HitVelMag;
    local Vector SpawnLoc, SpawnVel;

    HitVelMag = VSize(HitVelocity);
    HitVelDir = Normal(HitVelocity);
    SpawnLoc = HitLocation + (HitNormal * 10);
    I = 0;
    J0x5A:

    if(I < NumResidualFlames)
    {
        SpawnVel = CalculateResidualFlameVelocity(HitNormal, HitVelDir, HitVelMag);
        SpawnResidualFlame(ResidualFlameProjClass, SpawnLoc, SpawnVel);
        ++ I;
        goto J0x5A;
    }
}

simulated function TriggerExplosion(Vector HitLocation, Vector HitNormal, Actor HitActor)
{
    local Vector FlameSpawnVel;
    local KFExplosionActorLingering GFExplosionActor;
    local Vector GroundExplosionHitNormal;
    local bool bDoExplosion;

    if(bHasDisintegrated)
    {
        return;
    }
    bDoExplosion = !bHasExploded && Role == ROLE_Authority;
    if(bDoExplosion && bSpawnGroundFire)
    {
        if(bUseAltGroundFireEffect && AltGroundFireEffect != none)
        {
            GroundFireExplosionTemplate.ExplosionEffects = AltGroundFireEffect;
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
            GFExplosionActor.Explode(GroundFireExplosionTemplate, GroundExplosionHitNormal);
        }
    }
    if(bDoExplosion)
    {
        FlameSpawnVel = 0.25 * (CalculateResidualFlameVelocity(HitNormal, Normal(LastVelocity), VSize(LastVelocity)));
        SpawnResidualFlames(HitLocation, HitNormal, FlameSpawnVel);
    }
    super(KFProjectile).TriggerExplosion(HitLocation, HitNormal, HitActor);
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
    LastVelocity = Velocity;
    super(KFProj_BallisticExplosive).Explode(HitLocation, HitNormal);
}

simulated function PostBeginPlay()
{
    local KFPlayerReplicationInfo InstigatorPRI;

    if(Instigator != none)
    {
        if(AltGroundFireEffect != none)
        {
            InstigatorPRI = KFPlayerReplicationInfo(Instigator.PlayerReplicationInfo);
            if(InstigatorPRI != none)
            {
                bUseAltGroundFireEffect = InstigatorPRI.bSplashActive;
            }            
        }
        else
        {
            bUseAltGroundFireEffect = false;
        }
    }
    super(KFProjectile).PostBeginPlay();
}

protected simulated function PrepareExplosionTemplate()
{
    super(KFProj_BallisticExplosive).PrepareExplosionTemplate();
    if(bAltExploEffects)
    {
        ExplosionTemplate.ExplosionEffects = AltExploEffects;
    }
}

defaultproperties
{
    ResidualFlameProjClass=Class'KFProj_Flame_HRGIncendiaryRifle'
    NumResidualFlames=4
    GroundFireExplosionActorClass=Class'KFExplosion_HRGIncendiaryRifleGroundFire'
    begin object name=ExploTemplate1 class=KFGameExplosion
        ExplosionEffects=KFImpactEffectInfo'wep_molotov_arch.Molotov_GroundFire'
        bDirectionalExplosion=true
        Damage=10
        DamageRadius=150
        MyDamageType=Class'KFDT_Fire_Ground_HRGIncendiaryRifle'
        KnockDownStrength=0
        MomentumTransferScale=1
        ExplosionSound=AkEvent'WW_WEP_EXP_MOLOTOV.Play_WEP_EXP_Molotov_Explosion'
        ExploLight=PointLightComponent'Default__KFProj_Grenade_HRGIncendiaryRifle.FlamePointLight'
        ExploLightFadeOutTime=0.2
        ExploLightStartFadeOutTime=0.4
        FractureMeshRadius=0
        CamShake=none
    object end
    // Reference: KFGameExplosion'Default__KFProj_Grenade_HRGIncendiaryRifle.ExploTemplate1'
    GroundFireExplosionTemplate=ExploTemplate1
    bSpawnGroundFire=true
    AltGroundFireEffect=KFImpactEffectInfo'WEP_Flamethrower_ARCH.GroundFire_Splash_Impacts'
    begin object name=ExploTemplate0 class=KFGameExplosion
        ExplosionEffects=KFImpactEffectInfo'wep_molotov_arch.Molotov_Explosion'
        Damage=100
        MyDamageType=Class'KFDT_Explosive_HRGIncendiaryRifle'
        MomentumTransferScale=0
        ExplosionSound=AkEvent'WW_WEP_EXP_Grenade_Frag.Play_WEP_EXP_Grenade_Frag_Explosion'
        ExploLight=PointLightComponent'Default__KFProj_Grenade_HRGIncendiaryRifle.ExplosionPointLight'
    object end
    // Reference: KFGameExplosion'Default__KFProj_Grenade_HRGIncendiaryRifle.ExploTemplate0'
    ExplosionTemplate=ExploTemplate0
    AmbientComponent=AkComponent'Default__KFProj_Grenade_HRGIncendiaryRifle.AmbientAkSoundComponent'
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Grenade_HRGIncendiaryRifle.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Grenade_HRGIncendiaryRifle.CollisionCylinder'
    Components(0)=CollisionCylinder
    Components(1)=AkComponent'Default__KFProj_Grenade_HRGIncendiaryRifle.AmbientAkSoundComponent'
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProj_Grenade_HRGIncendiaryRifle.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}