/*******************************************************************************
 * KFProj_BloatPukeMine generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFProj_BloatPukeMine extends KFProjectile
    hidecategories(Navigation);

const MINMINEFLOORZ = 0.8f;

var ParticleSystem GroundFXTemplate;
var ParticleSystem BurstFXTemplate;
var byte TeamNum;
var int Health;
var float DampenFactor;
var float DampenFactorParallel;
var float SpawnCollisionOffsetAmt;
var Vector LandedFXOffset;
var float ExplodeTriggerRadius;
var float ExplodeTriggerHeight;
var AkEvent BounceAkEvent;
var AkEvent ImpactAkEvent;
var MaterialInterface ImpactDecalMaterial;
var float ImpactDecalWidth;
var float ImpactDecalHeight;
var float ImpactDecalThickness;
var float FuseDuration;
var repnotify bool bClientExplode;
var bool bFadingOut;
var float FadeOutTime;
var const int MaxBounces;
var int NumBounces;

replication
{
     if(bNetDirty)
        bClientExplode;
}

simulated event ReplicatedEvent(name VarName)
{
    if(VarName == 'bClientExplode')
    {
        TriggerExplosion(Location, vect(0, 0, 1), none);        
    }
    else
    {
        super.ReplicatedEvent(VarName);
    }
}

simulated event PostBeginPlay()
{
    local Vector HitLocation, HitNormal;

    TeamNum = GetTeamNum();
    super.PostBeginPlay();
    if(WorldInfo.NetMode != NM_Client)
    {
        if(InstigatorController != none)
        {
            Class'KFGameplayPoolManager'.static.GetPoolManager().AddProjectileToPool(self, 1);            
        }
        else
        {
            Destroy();
            return;
        }
    }
    if(Role == ROLE_Authority)
    {
        Instigator.Trace(HitLocation, HitNormal, Location, Instigator.Location, false,,, 1);
        if(!IsZero(HitLocation))
        {
            SetLocation(HitLocation + (HitNormal * SpawnCollisionOffsetAmt));
        }
        SetTimer(FuseDuration, false, 'Timer_Explode');
    }
}

simulated function ShutDown();

protected simulated function StopSimulating();

simulated function Explode(Vector HitLocation, Vector HitNormal);

simulated event HitWall(Vector HitNormal, Actor Wall, PrimitiveComponent WallComp)
{
    if(Wall.Class == Class)
    {
        return;
    }
    if(CanStick(Wall, HitNormal))
    {
        Stick(Location, HitNormal);        
    }
    else
    {
        Bounce(HitNormal, Wall);
    }
}

protected simulated function bool CanStick(Actor HitActor, out Vector HitNormal)
{
    if(HitNormal.Z < 0.8)
    {
        return false;
    }
    return true;
}

simulated event Bump(Actor Other, PrimitiveComponent OtherComp, Vector HitNormal)
{
    if(Other.bWorldGeometry || Other.bStatic)
    {
        HitWall(HitNormal, Other, OtherComp);
    }
}

simulated function bool Bounce(Vector HitNormal, Actor BouncedOff)
{
    local Vector VNorm;

    if((((LastBounced.Actor != none) && BouncedOff != none) && BouncedOff == LastBounced.Actor) && (WorldInfo.TimeSeconds - LastBounced.Time) < 0.1)
    {
        return false;
    }
    VNorm = (Velocity Dot HitNormal) * HitNormal;
    Velocity = (-VNorm * DampenFactor) + ((Velocity - VNorm) * DampenFactorParallel);
    Speed = VSize(Velocity);
    if(Speed < float(40))
    {
        Stick(Location, HitNormal);
        return false;
    }
    LastBounced.Actor = BouncedOff;
    LastBounced.Time = WorldInfo.TimeSeconds;
    PlayImpactSound();
    return true;
}

simulated function Stick(Vector StuckLocation, Vector StuckNormal)
{
    local Vector HitLocation, HitNormal;
    local Rotator StuckRotation;
    local KFProj_BloatPukeMine PukeMine;
    local Rotator RandRot;

    SetPhysics(0);
    RotationRate = rot(0, 0, 0);
    CylinderComponent.SetTraceBlocking(true, true);
    SetCollisionSize(ExplodeTriggerRadius, ExplodeTriggerHeight);
    CylinderComponent.SetActorCollision(true, false);
    bCollideComplex = false;
    bBounce = false;
    NetUpdateFrequency = 0.25;
    bOnlyDirtyReplication = true;
    bForceNetUpdate = true;
    Trace(HitLocation, HitNormal, Location - vect(0, 0, 50), Location + vect(0, 0, 5), false,,, 1);
    if(!IsZero(HitLocation))
    {
        StuckRotation = rotator(HitNormal);        
    }
    else
    {
        StuckRotation = rotator(StuckNormal);
    }
    if(Role == ROLE_Authority)
    {
        foreach TouchingActors(Class'KFProj_BloatPukeMine', PukeMine)
        {
            PukeMine.TriggerExplosion(PukeMine.Location, vect(0, 0, 1), none);            
        }        
    }
    SetRotation(StuckRotation);
    RandRot.Yaw = Rand(65535);
    SetRelativeRotation(RandRot);
    SwapToGroundFX(StuckRotation);
    PlayImpactSound(true);
    SpawnImpactDecal(StuckLocation, StuckNormal);
    GotoState('Armed');
}

simulated function SwapToGroundFX(Rotator GroundRotation)
{
    if(WorldInfo.NetMode != NM_DedicatedServer)
    {
        StopFlightEffects();
        ProjFlightTemplate = GroundFXTemplate;
        ProjFlightTemplateZedTime = GroundFXTemplate;
        bAutoStartAmbientSound = true;
        SpawnFlightEffects();
        ProjEffects.SetAbsolute(true, true, false);
        ProjEffects.SetTranslation(Location + LandedFXOffset);
        ProjEffects.SetRotation(GroundRotation);
    }
}

simulated function PlayImpactSound(optional bool bIsAtRest)
{
    if(WorldInfo.NetMode != NM_DedicatedServer)
    {
        if(bIsAtRest)
        {
            PostAkEvent(ImpactAkEvent, true, true, false);            
        }
        else
        {
            PostAkEvent(BounceAkEvent, true, true, false);
        }
    }
}

simulated function SpawnImpactDecal(Vector HitLocation, Vector HitNormal)
{
    if((WorldInfo.MyDecalManager != none) && !WorldInfo.bDropDetail)
    {
        WorldInfo.MyDecalManager.SpawnDecal(ImpactDecalMaterial, HitLocation, rotator(-HitNormal), ImpactDecalWidth, ImpactDecalHeight, ImpactDecalThickness, true);
    }
}

simulated function bool ValidTouch(Pawn Other)
{
    if(Other.GetTeamNum() == TeamNum)
    {
        return false;
    }
    return FastTrace(Other.Location, Location,, true);
}

singular simulated event Touch(Actor Other, PrimitiveComponent OtherComp, Vector HitLocation, Vector HitNormal)
{
    local Pawn P;

    if((WorldInfo.TimeSeconds - CreationTime) < 0.1)
    {
        return;
    }
    P = Pawn(Other);
    if((P != none) && ValidTouch(P))
    {
        TriggerExplosion(Location, vect(0, 0, 1), P);
    }
}

singular event TakeDamage(int InDamage, Controller InstigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser)
{
    if((bFadingOut || DamageCauser.Class == Class) || DamageType == ExplosionTemplate.MyDamageType)
    {
        return;
    }
    if((((Health > 0) && InDamage > 0) && InstigatedBy != none) && InstigatedBy.GetTeamNum() != TeamNum)
    {
        Health -= InDamage;
        if(Health <= 0)
        {
            TriggerExplosion(Location, vect(0, 0, 1), none);
        }
    }
}

function Detonate()
{
    TriggerExplosion(Location, vect(0, 0, 1), none);
}

function Timer_Explode()
{
    Detonate();
}

simulated function TriggerExplosion(Vector HitLocation, Vector HitNormal, Actor HitActor)
{
    if(bFadingOut)
    {
        return;
    }
    super.TriggerExplosion(HitLocation, HitNormal, HitActor);
    SetHidden(true);
    if(Role == ROLE_Authority)
    {
        bClientExplode = true;
        bForceNetUpdate = true;
    }
}

simulated event Tick(float DeltaTime)
{
    local float FadeOutSize;

    super.Tick(DeltaTime);
    if(bFadingOut)
    {
        FadeOutSize = (FadeOutTime - WorldInfo.TimeSeconds) / default.FadeOutTime;
        if(FadeOutSize <= 0.25)
        {
            bFadingOut = false;
            SpawnBurstEffect();
            Destroy();
            return;
        }
        if(ProjEffects != none)
        {
            ProjEffects.SetScale(FadeOutSize);
        }
    }
}

simulated event TornOff()
{
    FadeOut();
}

simulated function FadeOut()
{
    if(Physics == 2)
    {
        Destroy();
        return;
    }
    if((bFadingOut || bDeleteMe) || (WorldInfo.NetMode == NM_DedicatedServer) && bTearOff)
    {
        return;
    }
    SetCollision(false, false);
    if(WorldInfo.NetMode != NM_DedicatedServer)
    {
        bFadingOut = true;
        FadeOutTime = WorldInfo.TimeSeconds + default.FadeOutTime;
    }
    if(WorldInfo.NetMode != NM_Client)
    {
        bTearOff = true;
        bForceNetUpdate = true;
        NetUpdateFrequency = 1000;
        SetTimer(0.1, false, 'Destroy');
    }
}

simulated function SpawnBurstEffect()
{
    if(((WorldInfo.NetMode == NM_DedicatedServer) || WorldInfo.MyEmitterPool == none) || ProjEffects == none)
    {
        return;
    }
    WorldInfo.MyEmitterPool.SpawnEmitter(BurstFXTemplate, ProjEffects.GetPosition(), rotator(vect(0, 0, 1)));
}

simulated event Destroyed()
{
    if(WorldInfo.NetMode != NM_Client)
    {
        if(InstigatorController != none)
        {
            Class'KFGameplayPoolManager'.static.GetPoolManager().RemoveProjectileFromPool(self, 1);
        }
    }
    super.Destroyed();
}

simulated function OnInstigatorControllerLeft()
{
    if(WorldInfo.NetMode != NM_Client)
    {
        SetTimer((1 + float(Rand(5))) + FRand(), false, 'Timer_Explode');
    }
}

simulated state Armed
{
    simulated function CheckTouching()
    {
        local Pawn P;

        foreach TouchingActors(Class'Pawn', P)
        {
            Touch(P, none, Location, Normal(Location - P.Location));            
        }        
    }

    simulated function BeginState(name PreviousStateName)
    {
        CheckTouching();
    }
    stop;    
}

defaultproperties
{
    GroundFXTemplate=ParticleSystem'ZED_Bloat_EMIT.FX_Bloat_Mine_01'
    BurstFXTemplate=ParticleSystem'ZED_Bloat_EMIT.FX_Bloat_Mine_Hit_01'
    Health=100
    DampenFactor=0.125
    DampenFactorParallel=0.175
    SpawnCollisionOffsetAmt=28
    LandedFXOffset=(X=0,Y=0,Z=2)
    ExplodeTriggerRadius=60
    ExplodeTriggerHeight=22
    BounceAkEvent=AkEvent'WW_ZED_Bloat.Play_Bloat_Mine_Bounce'
    ImpactAkEvent=AkEvent'WW_ZED_Bloat.Play_Bloat_Mine_Hit'
    ImpactDecalMaterial=DecalMaterial'FX_Mat_Lib.FX_Puke_Mine_Splatter_DM'
    ImpactDecalWidth=178
    ImpactDecalHeight=178
    ImpactDecalThickness=28
    FuseDuration=300
    FadeOutTime=1.75
    bStopAmbientSoundOnExplode=true
    GlassShatterType=FracturedMeshGlassShatterType.FMGS_ShatterAll
    ExtraLineCollisionOffsets=/* Array type was not detected. */
    ExplosionActorClass=Class'KFExplosion_PlayerBloatPukeMine'
    begin object name=ExploTemplate0 class=KFGameExplosion
        ExplosionEffects=KFImpactEffectInfo'ZED_Bloat_ARCH.Bloat_Mine_Explosion'
        Damage=30
        DamageRadius=450
        DamageFalloffExponent=0
        MyDamageType=Class'KFDT_Toxic_BloatPukeMine'
        KnockDownStrength=0
        MomentumTransferScale=0
        ExplosionSound=AkEvent'WW_ZED_Bloat.Play_Bloat_Mine_Explode'
        ExploLight=PointLightComponent'Default__KFProj_BloatPukeMine.ExplosionPointLight'
        ExploLightFadeOutTime=0.25
        ExploLightStartFadeOutTime=0.3
        ExploLightFlickerIntensity=5
        ExploLightFlickerInterpSpeed=15
        FractureMeshRadius=0
        FracturePartVel=0
        CamShake=KFCameraShake'FX_CameraShake_Arch.Grenades.Default_Grenade'
    object end
    // Reference: KFGameExplosion'Default__KFProj_BloatPukeMine.ExploTemplate0'
    ExplosionTemplate=ExploTemplate0
    ProjFlightTemplate=ParticleSystem'ZED_Bloat_EMIT.FX_Bloat_Mine_projectile_01'
    AmbientSoundPlayEvent=AkEvent'WW_ZED_Bloat.Play_Bloat_Mine_Amb_LP'
    AmbientSoundStopEvent=AkEvent'WW_ZED_Bloat.Stop_Bloat_Mine_Amb_LP'
    begin object name=AmbientAkSoundComponent class=AkComponent
        bStopWhenOwnerDestroyed=true
        bForceOcclusionUpdateInterval=true
        OcclusionUpdateInterval=0.25
    object end
    // Reference: AkComponent'Default__KFProj_BloatPukeMine.AmbientAkSoundComponent'
    AmbientComponent=AmbientAkSoundComponent
    Speed=2000
    MaxSpeed=2000
    bBlockedByInstigator=false
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionHeight=10
        CollisionRadius=10
        ReplacementPrimitive=none
        CollideActors=true
        BlockNonZeroExtent=false
        PhysMaterialOverride=PhysicalMaterial'ZED_Bloat_EMIT.BloatPukeMine_PM'
    object end
    // Reference: CylinderComponent'Default__KFProj_BloatPukeMine.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionHeight=10
        CollisionRadius=10
        ReplacementPrimitive=none
        CollideActors=true
        BlockNonZeroExtent=false
        PhysMaterialOverride=PhysicalMaterial'ZED_Bloat_EMIT.BloatPukeMine_PM'
    object end
    // Reference: CylinderComponent'Default__KFProj_BloatPukeMine.CollisionCylinder'
    Components(0)=CollisionCylinder
    begin object name=AmbientAkSoundComponent class=AkComponent
        bStopWhenOwnerDestroyed=true
        bForceOcclusionUpdateInterval=true
        OcclusionUpdateInterval=0.25
    object end
    // Reference: AkComponent'Default__KFProj_BloatPukeMine.AmbientAkSoundComponent'
    Components(1)=AmbientAkSoundComponent
    Physics=EPhysics.PHYS_Falling
    bNetTemporary=false
    bAlwaysRelevant=true
    bCollideComplex=true
    bProjTarget=true
    bNoEncroachCheck=true
    bBounce=true
    LifeSpan=0
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionHeight=10
        CollisionRadius=10
        ReplacementPrimitive=none
        CollideActors=true
        BlockNonZeroExtent=false
        PhysMaterialOverride=PhysicalMaterial'ZED_Bloat_EMIT.BloatPukeMine_PM'
    object end
    // Reference: CylinderComponent'Default__KFProj_BloatPukeMine.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}