/*******************************************************************************
 * KFProj_Mine_Reconstructor generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFProj_Mine_Reconstructor extends KFProjectile
    hidecategories(Navigation);

const MINMINEFLOORZ = 0.8f;

struct ReplicatedStickInfo
{
    var Vector vRepStuckLocation;
    var Vector vRepStuckNormal;

    structdefaultproperties
    {
        vRepStuckLocation=(X=0,Y=0,Z=0)
        vRepStuckNormal=(X=0,Y=0,Z=0)
    }
};

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
var AkEvent BounceAkEventHeavy;
var AkEvent ImpactAkEventHeavy;
var MaterialInterface ImpactDecalMaterial;
var float ImpactDecalWidth;
var float ImpactDecalHeight;
var float ImpactDecalThickness;
var float FuseDuration;
var repnotify bool bClientExplode;
var bool bFadingOut;
var bool bCantBeTouchedByInstigator;
var bool bManuallyDetonated;
var bool bCantDetonateOnFullHP;
var bool bSticked;
var repnotify bool bArmed;
var float FadeOutTime;
var const int MaxBounces;
var int NumBounces;
var float MaxExplodeTriggerRadiusPerPercentage;
var float MinExplodeTriggerRadiusPerPercentage;
var float MaxExplodeTriggerHeightPerPercentage;
var float MinExplodeTriggerHeightPerPercentage;
var float MaxDamageRadiusPerPercentage;
var float MinDamageRadiusPerPercentage;
var float MaxCollisionRadius;
var float MinCollisionRadius;
var float MaxCollisionHeight;
var float MinCollisionHeight;
var float MaxDamagePerPercentage;
var float MinDamagePerPercentage;
var repnotify float InheritedScale;
var repnotify float fChargePercentage;
var float fCachedCylinderWidth;
var float fCachedCylinderHeight;
var repnotify ReplicatedStickInfo StickInfo;

replication
{
     if(bNetDirty && Role == ROLE_Authority)
        InheritedScale, StickInfo, 
        bClientExplode, fChargePercentage;

     if(bNetInitial && Role == ROLE_Authority)
        bArmed;
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
    if(VarName == 'fChargePercentage')
    {
        fCachedCylinderWidth = Lerp(MinCollisionRadius, MaxCollisionRadius, fChargePercentage);
        fCachedCylinderHeight = Lerp(MinCollisionHeight, MaxCollisionHeight, fChargePercentage);
        CylinderComponent(CollisionComponent).SetCylinderSize(fCachedCylinderWidth, fCachedCylinderHeight);
        ExplodeTriggerRadius = Lerp(MinExplodeTriggerRadiusPerPercentage, MaxExplodeTriggerRadiusPerPercentage, fChargePercentage);
        ExplodeTriggerHeight = Lerp(MinExplodeTriggerHeightPerPercentage, MaxExplodeTriggerHeightPerPercentage, fChargePercentage);
        ExplosionTemplate.DamageRadius = Lerp(MinDamageRadiusPerPercentage, MaxDamageRadiusPerPercentage, fChargePercentage);
        ExplosionTemplate.Damage = Lerp(MinDamagePerPercentage, MaxDamagePerPercentage, fChargePercentage);
    }
    if(VarName == 'StickInfo')
    {
        StickInClient(StickInfo.vRepStuckLocation, StickInfo.vRepStuckNormal);
    }
    if(VarName == 'bArmed')
    {
        if(bArmed)
        {
            SetPhysics(2);
        }
    }
}

simulated function SetInheritedScale(float Scale, float ChargePercentage)
{
    InheritedScale = Scale;
    fChargePercentage = ChargePercentage;
    fChargePercentage = FMax(0.1, fChargePercentage);
    CylinderComponent(CollisionComponent).SetCylinderSize(Lerp(MinCollisionRadius, MaxCollisionRadius, fChargePercentage), Lerp(MinCollisionHeight, MaxCollisionHeight, ChargePercentage));
    ExplodeTriggerRadius = Lerp(MinExplodeTriggerRadiusPerPercentage, MaxExplodeTriggerRadiusPerPercentage, fChargePercentage);
    ExplodeTriggerHeight = Lerp(MinExplodeTriggerHeightPerPercentage, MaxExplodeTriggerHeightPerPercentage, fChargePercentage);
    ExplosionTemplate.DamageRadius = Lerp(MinDamageRadiusPerPercentage, MaxDamageRadiusPerPercentage, fChargePercentage);
    ExplosionTemplate.Damage = Lerp(MinDamagePerPercentage, MaxDamagePerPercentage, fChargePercentage);
    ExplodeTriggerRadius = FMax(0.1, ExplodeTriggerRadius);
    ExplodeTriggerHeight = FMax(0.1, ExplodeTriggerHeight);
    ExplosionTemplate.DamageRadius = FMax(0.1, ExplosionTemplate.DamageRadius);
    ExplosionTemplate.Damage = FMax(0.1, ExplosionTemplate.Damage);
    bNetDirty = true;
}

simulated event PostBeginPlay()
{
    local Vector HitLocation, HitNormal;

    TeamNum = GetTeamNum();
    super.PostBeginPlay();
    if(WorldInfo.NetMode != NM_Client)
    {
        if((InstigatorController != none) || IsAIProjectile())
        {            
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

simulated function SpawnFlightEffects()
{
    local Vector vec;

    vec.X = fChargePercentage;
    vec.Y = fChargePercentage;
    vec.Z = fChargePercentage;
    super.SpawnFlightEffects();
    if(ProjEffects != none)
    {
        ProjEffects.SetVectorParameter(name("BlobCharge"), vec);
        ProjEffects.SetFloatParameter(name("MineFxControlParam"), fChargePercentage);
    }
}

simulated function ShutDown();

protected simulated function StopSimulating();

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
    super.Explode(HitLocation, HitNormal);
}

simulated event HitWall(Vector HitNormal, Actor Wall, PrimitiveComponent WallComp)
{
    if(Wall.Class == Class)
    {
        return;
    }
    if((CanStick(Wall, HitNormal)) && Wall.bStatic == true)
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

function RestoreCylinder()
{
    CylinderComponent(CollisionComponent).SetCylinderSize(fCachedCylinderWidth, fCachedCylinderHeight);
}

simulated function bool Bounce(Vector HitNormal, Actor BouncedOff)
{
    local Vector VNorm;

    if(CheckRepeatingTouch(BouncedOff))
    {
        CylinderComponent(CollisionComponent).SetCylinderSize(1, 1);
        SetTimer(0.06, false, 'RestoreCylinder');
        return false;
    }
    VNorm = (Velocity Dot HitNormal) * HitNormal;
    Velocity = (-VNorm * DampenFactor) + ((Velocity - VNorm) * DampenFactorParallel);
    Speed = VSize(Velocity);
    if(Speed < float(60))
    {
        Speed = 200;
    }
    PlayImpactSound();
    return true;
}

simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
    if(((Other != Instigator) && Other.GetTeamNum() != GetTeamNum()) && !IsInState('Armed'))
    {
        ProcessBulletTouch(Other, HitLocation, HitNormal);
    }
    if(bCanStick || bCanPin)
    {
        StickHelper.TryStick(HitNormal, HitLocation, Other);
        return;
    }
    if((ExplosionTemplate != none) && Role == ROLE_Authority)
    {
        TriggerExplosion(HitLocation, HitNormal, Other);
    }
    ShutDown();
}

simulated function Stick(Vector StuckLocation, Vector StuckNormal)
{
    local Vector HitLocation, HitNormal;
    local Rotator StuckRotation;
    local KFProj_Mine_Reconstructor PukeMine;
    local Rotator RandRot;

    if(Role != ROLE_Authority)
    {
        return;
    }
    if(bSticked == true)
    {
        return;
    }
    RotationRate = rot(0, 0, 0);
    CylinderComponent.SetTraceBlocking(true, true);
    SetCollisionSize(ExplodeTriggerRadius, ExplodeTriggerHeight);
    CylinderComponent.SetActorCollision(true, false);
    bCollideComplex = false;
    bBounce = false;
    SetPhysics(0);
    SetOwner(none);
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
        foreach TouchingActors(Class'KFProj_Mine_Reconstructor', PukeMine)
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
    StickInfo.vRepStuckNormal = StuckNormal;
    StickInfo.vRepStuckLocation = StuckLocation;
    bNetDirty = true;
    bSticked = true;
    bArmed = true;
}

reliable client simulated function StickInClient(Vector StuckLocation, Vector StuckNormal)
{
    local Vector HitLocation, HitNormal;
    local Rotator StuckRotation, RandRot;

    if(bSticked == true)
    {
        return;
    }
    RotationRate = rot(0, 0, 0);
    SetLocation(StuckLocation);
    CylinderComponent.SetTraceBlocking(true, true);
    SetCollisionSize(ExplodeTriggerRadius, ExplodeTriggerHeight);
    CylinderComponent.SetActorCollision(true, false);
    bCollideComplex = false;
    bBounce = false;
    SetOwner(none);
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
    SetRotation(StuckRotation);
    RandRot.Yaw = Rand(65535);
    SetRelativeRotation(RandRot);
    SwapToGroundFX(StuckRotation);
    PlayImpactSound(true);
    SpawnImpactDecal(StuckLocation, StuckNormal);
    GotoState('Armed');
    bSticked = true;
    bArmed = true;
}

simulated function SwapToGroundFX(Rotator GroundRotation)
{
    local Vector vec;

    if(!IsInState('Armed'))
    {
        vec.X = fChargePercentage;
        vec.Y = fChargePercentage;
        vec.Z = fChargePercentage;
        StopFlightEffects();
        ProjFlightTemplate = GroundFXTemplate;
        ProjFlightTemplateZedTime = GroundFXTemplate;
        bAutoStartAmbientSound = true;
        SpawnFlightEffects();
        if(ProjEffects != none)
        {
            ProjEffects.SetAbsolute(true, true, false);
            ProjEffects.SetTranslation(Location + LandedFXOffset);
            ProjEffects.SetRotation(GroundRotation);
            ProjEffects.SetVectorParameter(name("BlobCharge"), vec);
            ProjEffects.SetFloatParameter(name("MineFxControlParam"), fChargePercentage);
        }
    }
}

simulated function PlayImpactSound(optional bool bIsAtRest)
{
    if(WorldInfo.NetMode != NM_DedicatedServer)
    {
        if(bIsAtRest)
        {
            if(fChargePercentage < 0.75)
            {
                PostAkEvent(ImpactAkEvent, true, true, false);                
            }
            else
            {
                PostAkEvent(ImpactAkEventHeavy, true, true, false);
            }            
        }
        else
        {
            if(fChargePercentage < 0.75)
            {
                PostAkEvent(BounceAkEvent, true, true, false);                
            }
            else
            {
                PostAkEvent(BounceAkEventHeavy, true, true, false);
            }
        }
    }
}

simulated function SpawnImpactDecal(Vector HitLocation, Vector HitNormal)
{
    if(((WorldInfo.MyDecalManager != none) && !WorldInfo.bDropDetail) && !IsInState('Armed'))
    {
        WorldInfo.MyDecalManager.SpawnDecal(ImpactDecalMaterial, HitLocation, rotator(-HitNormal), ImpactDecalWidth, ImpactDecalHeight, ImpactDecalThickness, true);
    }
}

simulated function bool ValidTouch(Pawn Other)
{
    if(bCantBeTouchedByInstigator == false)
    {
        if(Other.IsAliveAndWell() == false)
        {
            return false;
        }
        if(bCantDetonateOnFullHP)
        {
            if((Other.GetTeamNum() == TeamNum) && Other.Health >= Other.HealthMax)
            {
                return false;
            }
        }
        return FastTrace(Other.Location, Location,, true);        
    }
    else
    {
        if(bCantDetonateOnFullHP)
        {
            if((Other.GetTeamNum() == TeamNum) && Other.Health >= Other.HealthMax)
            {
                return false;
            }
        }
        if((Other.IsAliveAndWell() == false) || Other == Instigator)
        {
            return false;
        }
        return FastTrace(Other.Location, Location,, true);
    }
    return FastTrace(Other.Location, Location,, true);
}

simulated event Touch(Actor Other, PrimitiveComponent OtherComp, Vector HitLocation, Vector HitNormal)
{
    local Pawn P;

    P = Pawn(Other);
    if(P != none)
    {
        if(((P != Instigator) || ((WorldInfo.TimeSeconds - CreationTime) >= 0.1) && P == Instigator) && ValidTouch(P))
        {
            ImpactedActor = Other;
            ProcessTouch(Other, HitLocation, HitNormal);
            ImpactedActor = none;
        }        
    }
    else
    {
        if(bBounce)
        {
            super.Touch(Other, OtherComp, HitLocation, HitNormal);
        }
    }
}

function Detonate()
{
    if(Role == ROLE_Authority)
    {
        TriggerExplosion(Location, vect(0, 0, 1), none);
    }
}

function ManuallyDetonate()
{
    bManuallyDetonated = true;
    if(Role == ROLE_Authority)
    {
        TriggerExplosion(Location, vect(0, 0, 1), none);
    }
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
    super.TriggerExplosion(Location, HitNormal, HitActor);
    SetHidden(true);
    if(Role == ROLE_Authority)
    {
        bClientExplode = true;
        bForceNetUpdate = true;
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
    SetOwner(none);
    SetCollision(false, false);
    if(WorldInfo.NetMode != NM_DedicatedServer)
    {
        bFadingOut = false;
        FadeOutTime = WorldInfo.TimeSeconds + default.FadeOutTime;        
    }
    else
    {
        SetTimer(0.2, false, 'Timer_Destroy');
    }
    if(WorldInfo.NetMode != NM_Client)
    {
        bTearOff = true;
        bNetDirty = true;
        bForceNetUpdate = true;
    }
}

simulated function Timer_Destroy()
{
    Destroy();
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

protected simulated function PrepareExplosionTemplate()
{
    local Weapon OwnerWeapon;
    local KFWeap_Mine_Reconstructor OwnerMinerec;
    local Pawn OwnerPawn;

    super.PrepareExplosionTemplate();
    OwnerWeapon = Weapon(Owner);
    if(OwnerWeapon != none)
    {
        OwnerPawn = Pawn(OwnerWeapon.Owner);
        if(OwnerPawn != none)
        {
            ExplosionTemplate.DamageRadius *= KFPawn(OwnerPawn).GetPerk().GetAoERadiusModifier();
            if(fChargePercentage > 0.51)
            {
                ExplosionTemplate.ExplosionSound = AkEvent'Play_WEP_Mine_Reconstructor_Mine_Explosion_Heavy';
            }
            OwnerMinerec = KFWeap_Mine_Reconstructor(OwnerWeapon);
            if((OwnerMinerec != none) && !bManuallyDetonated)
            {
                OwnerMinerec.RemoveProjectileFromPool(self);
            }
        }
    }
}

protected simulated function PrepareExplosionActor(GameExplosionActor GEA)
{
    KFExplosion_MineReconstructor(GEA).fChargePercentage = fChargePercentage;
    super.PrepareExplosionActor(GEA);
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
        if(Role != ROLE_Authority)
        {
            SetPhysics(ROLE_AutonomousProxy);
            CheckTouching();
        }
    }
    stop;    
}

defaultproperties
{
    GroundFXTemplate=ParticleSystem'WEP_Mine_Reconstructor_EMIT.FX_Bloat_Mine_01'
    BurstFXTemplate=ParticleSystem'WEP_Mine_Reconstructor_EMIT.FX_Bloat_Mine_Hit_01'
    DampenFactor=0.125
    DampenFactorParallel=0.175
    SpawnCollisionOffsetAmt=28
    LandedFXOffset=(X=0,Y=0,Z=2)
    ExplodeTriggerRadius=60
    ExplodeTriggerHeight=22
    BounceAkEvent=AkEvent'WW_WEP_MineReconstructor.Play_WEP_Mine_Reconstructor_Mine'
    ImpactAkEvent=AkEvent'WW_WEP_MineReconstructor.Play_WEP_Mine_Reconstructor_Mine'
    BounceAkEventHeavy=AkEvent'WW_WEP_MineReconstructor.Play_WEP_Mine_Reconstructor_Mine_Heavy'
    ImpactAkEventHeavy=AkEvent'WW_WEP_MineReconstructor.Play_WEP_Mine_Reconstructor_Mine_Heavy'
    ImpactDecalWidth=178
    ImpactDecalHeight=178
    ImpactDecalThickness=28
    FuseDuration=300
    bCantBeTouchedByInstigator=true
    bCantDetonateOnFullHP=true
    FadeOutTime=500000
    MaxExplodeTriggerRadiusPerPercentage=60
    MinExplodeTriggerRadiusPerPercentage=30
    MaxExplodeTriggerHeightPerPercentage=22
    MinExplodeTriggerHeightPerPercentage=11
    MaxDamageRadiusPerPercentage=340
    MinDamageRadiusPerPercentage=160
    MaxCollisionRadius=20
    MinCollisionRadius=10
    MaxCollisionHeight=20
    MinCollisionHeight=10
    MaxDamagePerPercentage=270
    MinDamagePerPercentage=30
    InheritedScale=1
    bSyncToOriginalLocation=true
    bSyncToThirdPersonMuzzleLocation=true
    bUseClientSideHitDetection=true
    bReplicateLocationOnExplosion=true
    bStopAmbientSoundOnExplode=true
    GlassShatterType=FracturedMeshGlassShatterType.FMGS_ShatterAll
    TouchTimeThreshhold=0.05
    TossZ=150
    GravityScale=0.5
    ExtraLineCollisionOffsets=/* Array type was not detected. */
    TerminalVelocity=2000
    ExplosionActorClass=Class'KFExplosion_MineReconstructor'
    begin object name=ExploTemplate0 class=KFGameExplosion
        ExplosionEffects=KFImpactEffectInfo'WEP_Mine_Reconstructor_Arch.Mine_Reconstructor_Mine_Explosion'
        Damage=150
        DamageRadius=200
        DamageFalloffExponent=0.5
        MyDamageType=Class'KFDT_Toxic_MineReconstructorExplosion'
        KnockDownStrength=0
        MomentumTransferScale=45000
        ExplosionSound=AkEvent'WW_WEP_MineReconstructor.Play_WEP_Mine_Reconstructor_Mine_Explosion'
        CamShake=KFCameraShake'WEP_Mine_Reconstructor_Arch.Camera_Shake'
        CamShakeInnerRadius=200
        CamShakeOuterRadius=400
    object end
    // Reference: KFGameExplosion'Default__KFProj_Mine_Reconstructor.ExploTemplate0'
    ExplosionTemplate=ExploTemplate0
    ProjFlightTemplate=ParticleSystem'WEP_Mine_Reconstructor_EMIT.FX_Bloat_Mine_projectile_01'
    AmbientSoundPlayEvent=AkEvent'WW_WEP_MineReconstructor.Play_WEP_Mine_Reconstructor_Mine_Loop'
    AmbientSoundStopEvent=AkEvent'WW_WEP_MineReconstructor.Stop_WEP_Mine_Reconstructor_Mine'
    begin object name=AmbientAkSoundComponent class=AkComponent
        bStopWhenOwnerDestroyed=true
        bForceOcclusionUpdateInterval=true
        OcclusionUpdateInterval=0.25
    object end
    // Reference: AkComponent'Default__KFProj_Mine_Reconstructor.AmbientAkSoundComponent'
    AmbientComponent=AmbientAkSoundComponent
    Speed=2000
    MaxSpeed=2000
    MomentumTransfer=50000
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionHeight=10
        CollisionRadius=10
        ReplacementPrimitive=none
        CollideActors=true
        PhysMaterialOverride=PhysicalMaterial'WEP_Mine_Reconstructor_EMIT.BloatPukeMine_PM'
    object end
    // Reference: CylinderComponent'Default__KFProj_Mine_Reconstructor.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionHeight=10
        CollisionRadius=10
        ReplacementPrimitive=none
        CollideActors=true
        PhysMaterialOverride=PhysicalMaterial'WEP_Mine_Reconstructor_EMIT.BloatPukeMine_PM'
    object end
    // Reference: CylinderComponent'Default__KFProj_Mine_Reconstructor.CollisionCylinder'
    Components(0)=CollisionCylinder
    begin object name=AmbientAkSoundComponent class=AkComponent
        bStopWhenOwnerDestroyed=true
        bForceOcclusionUpdateInterval=true
        OcclusionUpdateInterval=0.25
    object end
    // Reference: AkComponent'Default__KFProj_Mine_Reconstructor.AmbientAkSoundComponent'
    Components(1)=AmbientAkSoundComponent
    Physics=EPhysics.PHYS_Falling
    bPushedByEncroachers=false
    bNetTemporary=false
    bCanBeDamaged=false
    bCollideComplex=true
    bProjTarget=true
    bNoEncroachCheck=true
    bBounce=true
    LifeSpan=300
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionHeight=10
        CollisionRadius=10
        ReplacementPrimitive=none
        CollideActors=true
        PhysMaterialOverride=PhysicalMaterial'WEP_Mine_Reconstructor_EMIT.BloatPukeMine_PM'
    object end
    // Reference: CylinderComponent'Default__KFProj_Mine_Reconstructor.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}