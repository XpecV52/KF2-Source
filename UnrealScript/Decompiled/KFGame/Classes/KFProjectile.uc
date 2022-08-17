/*******************************************************************************
 * KFProjectile generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFProjectile extends Projectile
    abstract
    native
    nativereplication
    hidecategories(Navigation);

enum FracturedMeshGlassShatterType
{
    FMGS_ShatterNone,
    FMGS_ShatterDamaged,
    FMGS_ShatterAll,
    FMGS_MAX
};

struct native TouchInfo
{
    var Actor Actor;
    var float Time;

    structdefaultproperties
    {
        Actor=none
        Time=0
    }
};

var repnotify Vector OriginalLocation;
/** This will cause the projectile to move to the Original Spawn location when first replicated. This solves the issue of the projectile spawning some distance away from the player when first replicated */
var() bool bSyncToOriginalLocation;
/** If bSyncToOriginalLocation && !Instigator.IsFirstPerson(), will move the projectile to the third person weapon attachment muzzle bone */
var() bool bSyncToThirdPersonMuzzleLocation;
var bool bFiredFromLeftHandWeapon;
var bool bNoReplicationToInstigator;
var bool bUseClientSideHitDetection;
var bool bReplicateClientHitsAsFragments;
var bool bDamageDestructiblesOnTouch;
var repnotify bool bHasExploded;
var bool bWasTimeDilated;
var bool bReplicateLocationOnExplosion;
var bool bValidateExplosionNormalOnClient;
var repnotify bool bHasDisintegrated;
var bool bAlwaysReplicateDisintegration;
var bool bAlwaysReplicateExplosion;
var bool bAttachExplosionToHitMover;
var bool bCanDisintegrate;
var bool bAltExploEffects;
var bool bFadingOutProjEffects;
var bool bWaitForEffects;
var bool bShuttingDown;
var bool bSuppressSounds;
var bool bAutoStartAmbientSound;
var bool bStopAmbientSoundOnExplode;
var bool bImportantAmbientSound;
var bool bAmbientSoundZedTimeOnly;
var float AlwaysRelevantDistanceSquared;
var repnotify float InitialPenetrationPower;
var float PenetrationPower;
var TouchInfo LastTouched;
var TouchInfo LastBounced;
var float TouchTimeThreshhold;
var KFProjectile.FracturedMeshGlassShatterType GlassShatterType;
/** Additional Z Axis velocity to apply when launching this projectile */
var(Projectile) float TossZ;
/** How much to scale gravity for this projectile. Used to get different kinds of projectile arcs */
var(Projectile) float GravityScale;
var export editinline transient PrimitiveComponent LastTouchComponent;
var array<Vector> ExtraLineCollisionOffsets;
/** TerminalVelocity for this projectile when falling */
var(Projectile) float TerminalVelocity;
var class<GameExplosionActor> ExplosionActorClass;
/** Defines the explosion. */
var(Projectile) export editinline KFGameExplosion ExplosionTemplate;
/** Effects Template for projectile being disintegrated by siren's scream */
var(Projectile) ParticleSystem ProjDisintegrateTemplate;
var export editinline ParticleSystemComponent ProjDisintegrateEffects;
var Rotator DisintegrateEffectRotation;
var GameExplosionActor ExplosionActor;
var float PostExplosionLifetime;
var KFImpactEffectInfo AltExploEffects;
var export editinline ParticleSystemComponent ProjEffects;
var(Projectile) ParticleSystem ProjFlightTemplate;
var float ProjEffectsFadeOutDuration;
/** Effects Template for the bullet flying through the air in Zed time */
var(Projectile) ParticleSystem ProjFlightTemplateZedTime;
var AkEvent AmbientSoundPlayEvent;
var AkEvent AmbientSoundStopEvent;
var export editinline AkComponent AmbientComponent;
var KFImpactEffectInfo ImpactEffects;
var class<KFPerk> AssociatedPerkClass;

replication
{
     if(bNetDirty && bCanDisintegrate)
        DisintegrateEffectRotation, bHasDisintegrated;

     if(bNetInitial && bSyncToOriginalLocation)
        OriginalLocation;

     if(bNetInitial && bSyncToThirdPersonMuzzleLocation)
        bFiredFromLeftHandWeapon;

     if(bNetInitial || bAlwaysReplicateExplosion)
        bHasExploded, bWasTimeDilated;

     if(bNetInitial)
        InitialPenetrationPower, bAltExploEffects;
}

// Export UKFProjectile::execGetTerminalVelocity(FFrame&, void* const)
native function float GetTerminalVelocity();

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    if(bDeleteMe || bShuttingDown)
    {
        return;
    }
    SpawnFlightEffects();
}

function Init(Vector Direction)
{
    SetRotation(rotator(Direction));
    Velocity = Speed * Direction;
    Velocity.Z += TossZ;
    if(KFWeapon(Owner) != none)
    {
        bFiredFromLeftHandWeapon = KFWeapon(Owner).GetCurrentMuzzleID() == 1;
    }
    if(bSyncToOriginalLocation)
    {
        OriginalLocation = Location;
        SyncOriginalLocation();
    }
}

simulated event ReplicatedEvent(name VarName)
{
    local Vector ExplosionNormal;

    if(VarName == 'bHasExploded')
    {
        bHasExploded = false;
        ExplosionNormal = vect(0, 0, 1);
        if(bValidateExplosionNormalOnClient)
        {
            ExplosionNormal = ValidateExplosionNormal();
        }
        CallExplode(Location, ExplosionNormal);        
    }
    else
    {
        if(VarName == 'bHasDisintegrated')
        {
            Disintegrate(DisintegrateEffectRotation);            
        }
        else
        {
            if(VarName == 'OriginalLocation')
            {
                SyncOriginalLocation();                
            }
            else
            {
                if(VarName == 'InitialPenetrationPower')
                {
                    PenetrationPower = InitialPenetrationPower;                    
                }
                else
                {
                    super(Actor).ReplicatedEvent(VarName);
                }
            }
        }
    }
}

simulated function Vector ValidateExplosionNormal()
{
    local Vector ExplosionNormal, AimDir, HitLocation, HitNormal;
    local Actor TraceActor, HitActor;

    if(!IsZero(Velocity))
    {
        AimDir = Normal(Velocity);
    }
    if(IsZero(Velocity) && !IsZero(OriginalLocation))
    {
        AimDir = Normal(Location - OriginalLocation);
    }
    if(IsZero(AimDir))
    {
        AimDir = Normal(vector(Rotation));
    }
    TraceActor = ((Instigator != none) ? Instigator : self);
    HitActor = TraceActor.Trace(HitLocation, HitNormal, Location + (AimDir * 32), Location - (AimDir * 32), true,,, 1);
    if(HitActor != none)
    {
        ExplosionNormal = HitNormal;
    }
    return ExplosionNormal;
}

simulated function SyncOriginalLocation()
{
    local Vector MuzzleLocation, PredictedHitLocation, AimDir, EndTrace, MuzzleToPredictedHit;

    if(WorldInfo.NetMode == NM_DedicatedServer)
    {
        return;
    }
    if((((bSyncToThirdPersonMuzzleLocation && Instigator != none) && !Instigator.IsFirstPerson()) && KFPawn(Instigator) != none) && KFPawn(Instigator).WeaponAttachment != none)
    {
        MuzzleLocation = KFPawn(Instigator).WeaponAttachment.GetMuzzleLocation(((bFiredFromLeftHandWeapon) ? 1 : 0));
        if(!IsZero(Velocity))
        {
            AimDir = Normal(Velocity);
        }
        if(IsZero(Velocity))
        {
            AimDir = Normal(Location - OriginalLocation);
        }
        if(IsZero(AimDir))
        {
            AimDir = Normal(vector(Rotation));
        }
        if(Location != MuzzleLocation)
        {
            EndTrace = Location + (AimDir * float(16384));
            PredictedHitLocation = GetPredictedHitLocation(Location, EndTrace);
            MuzzleToPredictedHit = Normal(PredictedHitLocation - MuzzleLocation);
            if((MuzzleToPredictedHit Dot vector(Rotation)) > 0)
            {
                AimDir = MuzzleToPredictedHit;
            }
        }
        SetLocation(MuzzleLocation);
        if(IsZero(Velocity))
        {
            SetPhysics(default.Physics);
            SetCollision(default.bCollideActors, default.bBlockActors);
        }
        Velocity = Speed * Normal(AimDir);        
    }
    else
    {
        if(Role < ROLE_Authority)
        {
            if(IsZero(Velocity))
            {
                SetPhysics(default.Physics);
                AimDir = Normal(Location - OriginalLocation);
                if(IsZero(AimDir))
                {
                    AimDir = vector(Rotation);
                }
                Velocity = Speed * AimDir;
                SetCollision(default.bCollideActors, default.bBlockActors);
            }
            SetLocation(OriginalLocation);
        }
    }
}

simulated function Vector GetPredictedHitLocation(Vector StartTrace, Vector EndTrace)
{
    local Vector HitLocation, HitNormal;
    local Actor HitActor;

    HitActor = Instigator.Trace(HitLocation, HitNormal, EndTrace, StartTrace, true,,, 1);
    if(HitActor == none)
    {
        HitLocation = EndTrace;
    }
    return HitLocation;
}

// Export UKFProjectile::execCalculateStickOrientation(FFrame&, void* const)
native function Rotator CalculateStickOrientation(Vector HitNormal);

simulated event Touch(Actor Other, PrimitiveComponent OtherComp, Vector HitLocation, Vector HitNormal)
{
    local editinline StaticMeshComponent HitStaticMesh;

    if(Other.bStatic && Other.bWorldGeometry)
    {
        HitStaticMesh = StaticMeshComponent(OtherComp);
        if((HitStaticMesh != none) && HitStaticMesh.CanBecomeDynamic())
        {
            HitWall(HitNormal, Other, OtherComp);
        }
        return;
    }
    LastTouchComponent = OtherComp;
    super.Touch(Other, OtherComp, HitLocation, HitNormal);
}

simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
    if(Other != Instigator)
    {
        if(ExplosionTemplate != none)
        {
            TriggerExplosion(HitLocation, HitNormal, Other);
        }
        ShutDown();
    }
}

simulated function bool CheckRepeatingTouch(Actor Other)
{
    if(((LastTouched.Actor == Other) && TouchTimeThreshhold > float(0)) && (WorldInfo.TimeSeconds - LastTouched.Time) <= TouchTimeThreshhold)
    {
        return true;
    }
    LastTouched.Actor = Other;
    LastTouched.Time = WorldInfo.TimeSeconds;
    return false;
}

simulated function bool Bounce(Vector HitNormal, Actor BouncedOff);

simulated function ProcessDestructibleTouchOnBounce(Actor Other, Vector HitLocation, Vector HitNormal)
{
    local TraceHitInfo HitInfo;

    if(!Other.bWorldGeometry && Other.bCanBeDamaged)
    {
        if((LastBounced.Actor == Other) && (WorldInfo.TimeSeconds - LastBounced.Time) <= TouchTimeThreshhold)
        {
            return;
        }
        if(bDamageDestructiblesOnTouch)
        {
            HitInfo.HitComponent = LastTouchComponent;
            HitInfo.Item = -1;
            Other.TakeDamage(int(Damage), InstigatorController, HitLocation, MomentumTransfer * Normal(Velocity), MyDamageType, HitInfo, self);
        }
        if(Other.bBlockActors)
        {
            LastBounced.Actor = Other;
            LastBounced.Time = WorldInfo.TimeSeconds;
            HitWall(HitNormal, Other, none);
        }
    }
}

simulated function ProcessBulletTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
    local Pawn Victim;
    local array<ImpactInfo> HitZoneImpactList;
    local Vector StartTrace, EndTrace, Direction;
    local TraceHitInfo HitInfo;

    if(WorldInfo.NetMode != NM_DedicatedServer)
    {
        KFImpactEffectManager(WorldInfo.MyImpactEffectManager).PlayImpactEffects(HitLocation, Instigator,, ImpactEffects);
    }
    if(!Other.IsA('Pawn'))
    {
        if(bDamageDestructiblesOnTouch && Other.bCanBeDamaged)
        {
            HitInfo.HitComponent = LastTouchComponent;
            HitInfo.Item = -1;
            Other.TakeDamage(int(Damage), InstigatorController, Location, MomentumTransfer * Normal(Velocity), MyDamageType, HitInfo, self);
        }
        if(InteractiveFoliageActor(Other) == none)
        {
            PenetrationPower = 0;
            return;
        }
    }
    Victim = Pawn(Other);
    if(Victim != none)
    {
        StartTrace = HitLocation;
        Direction = Normal(Velocity);
        EndTrace = StartTrace + (Direction * (Victim.CylinderComponent.CollisionRadius * 6));
        TraceProjHitZones(Victim, EndTrace, StartTrace, HitZoneImpactList);
        if(HitZoneImpactList.Length > 0)
        {
            HitZoneImpactList[0].RayDir = Direction;
            if(bReplicateClientHitsAsFragments)
            {
                if((Instigator != none) && KFWeapon(Instigator.Weapon) != none)
                {
                    KFWeapon(Instigator.Weapon).HandleGrenadeProjectileImpact(HitZoneImpactList[0], Class);
                }                
            }
            else
            {
                if((Owner != none) && KFWeapon(Owner) != none)
                {
                    KFWeapon(Owner).HandleProjectileImpact(HitZoneImpactList[0], PenetrationPower);
                }
            }
        }
    }
}

simulated function CallExplode(Vector HitLocation, Vector HitNormal)
{
    Explode(HitLocation, HitNormal);
}

simulated function bool TraceProjHitZones(Pawn P, Vector EndTrace, Vector StartTrace, out array<ImpactInfo> out_Hits)
{
    local Matrix RotMatrix;
    local Vector WorldOffset;
    local int I;

    if(TraceAllPhysicsAssetInteractions(P.Mesh, EndTrace, StartTrace, out_Hits, vect(0, 0, 0), true))
    {
        return true;
    }
    if(ExtraLineCollisionOffsets.Length > 0)
    {
        RotMatrix = MakeRotationMatrix(Rotation);
        I = 0;
        J0x8E:

        if(I < ExtraLineCollisionOffsets.Length)
        {
            WorldOffset = TransformVector(RotMatrix, ExtraLineCollisionOffsets[I]);
            if(TraceAllPhysicsAssetInteractions(P.Mesh, EndTrace + WorldOffset, StartTrace + WorldOffset, out_Hits, vect(0, 0, 0), true))
            {
                return true;
            }
            ++ I;
            goto J0x8E;
        }
    }
    return false;
}

simulated event Landed(Vector HitNormal, Actor FloorActor)
{
    HitWall(HitNormal, FloorActor, none);
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
    TriggerExplosion(HitLocation, HitNormal, none);
    ShutDown();
}

simulated function AdjustCanDisintigrate()
{
    local KFPerk InstigatorPerk;
    local KFPawn InstigatorPawn;

    InstigatorPawn = KFPawn(Instigator);
    if(InstigatorPawn != none)
    {
        InstigatorPerk = InstigatorPawn.GetPerk();
        if((InstigatorPerk != none) && InstigatorPerk.ShouldRandSirenResist())
        {
            bCanDisintegrate = false;
        }
    }
}

simulated function Disintegrate(Rotator InDisintegrateEffectRotation)
{
    if(bHasExploded)
    {
        return;
    }
    if((WorldInfo.NetMode == NM_ListenServer) || WorldInfo.NetMode == NM_DedicatedServer)
    {
        DisintegrateEffectRotation = rotator(-Velocity);
    }
    SetPhysics(0);
    if((ProjDisintegrateTemplate != none) && WorldInfo.NetMode != NM_DedicatedServer)
    {
        ProjDisintegrateEffects = WorldInfo.MyEmitterPool.SpawnEmitter(ProjDisintegrateTemplate, Location, InDisintegrateEffectRotation);
    }
    bHasDisintegrated = true;
    DeferredDestroy(0.1);
}

simulated function TriggerExplosion(Vector HitLocation, Vector HitNormal, Actor HitActor)
{
    local Vector NudgedHitLocation, ExplosionDirection;

    if(bHasDisintegrated)
    {
        return;
    }
    if(!bHasExploded)
    {
        if(((WorldInfo.NetMode == NM_ListenServer) || WorldInfo.NetMode == NM_DedicatedServer) || InstigatorController != none)
        {
            bWasTimeDilated = WorldInfo.TimeDilation < 1;
        }
        if((bStopAmbientSoundOnExplode && AmbientSoundStopEvent != none) && AmbientComponent != none)
        {
            AmbientComponent.StopEvents();
        }
        if(ExplosionTemplate != none)
        {
            StopSimulating();
            NudgedHitLocation = HitLocation + (HitNormal * 32);
            SetExplosionActorClass();
            ExplosionActor = Spawn(ExplosionActorClass, self,, NudgedHitLocation, rotator(HitNormal));
            if(ExplosionActor != none)
            {
                ExplosionActor.Instigator = Instigator;
                ExplosionActor.InstigatorController = InstigatorController;
                PrepareExplosionTemplate();
                if(IsZero(HitLocation))
                {
                    HitLocation = Location;
                }
                if(IsZero(HitNormal))
                {
                    HitNormal = vect(0, 0, 1);
                }
                ExplosionTemplate.HitLocation = HitLocation;
                ExplosionTemplate.HitNormal = HitNormal;
                if(bAttachExplosionToHitMover && InterpActor(HitActor) != none)
                {
                    ExplosionActor.Attachee = HitActor;
                    ExplosionTemplate.bAttachExplosionEmitterToAttachee = true;
                    ExplosionActor.SetBase(HitActor);
                }
                if(ExplosionTemplate.bDirectionalExplosion)
                {
                    ExplosionDirection = GetExplosionDirection(HitNormal);
                }
                PrepareExplosionActor(ExplosionActor);
                ExplosionActor.Explode(ExplosionTemplate, ExplosionDirection);
            }
            if(!bPendingDelete && !bDeleteMe)
            {
                DeferredDestroy(PostExplosionLifetime);
            }
        }
        bHasExploded = true;
    }
}

protected simulated function PrepareExplosionTemplate()
{
    GetRadialDamageValues(ExplosionTemplate.Damage, ExplosionTemplate.DamageRadius, ExplosionTemplate.DamageFalloffExponent);
}

protected simulated function GetRadialDamageValues(out float outDamage, out float outRadius, out float outFalloff);

simulated function Vector GetExplosionDirection(Vector HitNormal);

protected simulated function PrepareExplosionActor(GameExplosionActor GEA);

protected simulated function SetExplosionActorClass();

simulated function ShutDown()
{
    if((bStopAmbientSoundOnExplode && AmbientSoundStopEvent != none) && AmbientComponent != none)
    {
        AmbientComponent.StopEvents();
    }
    if(bShuttingDown)
    {
        return;
    }
    bShuttingDown = true;
    StopSimulating();
    if(ProjEffectsFadeOutDuration > 0)
    {
        if(WorldInfo.NetMode == NM_DedicatedServer)
        {
            DeferredDestroy(0.15);            
        }
        else
        {
            DeferredDestroy(ProjEffectsFadeOutDuration + 0.1);
        }        
    }
    else
    {
        Destroy();
    }
}

protected simulated function StopSimulating()
{
    Velocity = vect(0, 0, 0);
    Acceleration = vect(0, 0, 0);
    RotationRate = rot(0, 0, 0);
    SetPhysics(0);
    SetCollision(false, false);
    StopFlightEffects();
    bRotationFollowsVelocity = false;
}

protected simulated function DeferredDestroy(float DelaySec)
{
    local editinline MeshComponent ComponentIt;

    foreach ComponentList(Class'MeshComponent', ComponentIt)
    {
        ComponentIt.SetHidden(true);        
    }    
    SetPhysics(0);
    SetCollision(false, false);
    bCollideWorld = false;
    bShuttingDown = true;
    LifeSpan = DelaySec;
}

simulated function Destroyed()
{
    if(ProjEffects != none)
    {
        DetachComponent(ProjEffects);
        WorldInfo.MyEmitterPool.OnParticleSystemFinished(ProjEffects);
        ProjEffects = none;
    }
    if((AmbientSoundStopEvent != none) && AmbientComponent != none)
    {
        AmbientComponent.StopEvents();
    }
    super(Actor).Destroyed();
}

// Export UKFProjectile::execGetGravityZ(FFrame&, void* const)
native function float GetGravityZ();

simulated event Tick(float DeltaTime)
{
    super(Actor).Tick(DeltaTime);
    if(WorldInfo.NetMode != NM_DedicatedServer)
    {
        if(((((AmbientSoundPlayEvent != none) && bAmbientSoundZedTimeOnly) && !self.WorldInfo.TimeDilation < 1) && AmbientSoundStopEvent != none) && AmbientComponent != none)
        {
            AmbientComponent.StopEvents();
            AmbientComponent = none;
        }
        if(((ProjEffects != none) && bFadingOutProjEffects) && bShuttingDown)
        {
            if(ProjEffectsFadeOutDuration >= 0)
            {
                ProjEffectsFadeOutDuration -= DeltaTime;
                if(ProjEffectsFadeOutDuration <= 0)
                {
                    bFadingOutProjEffects = false;
                    ProjEffectsFadeOutDuration = 0;
                    ProjEffects.KillParticlesForced();
                    Destroy();
                }
            }
        }
    }
}

simulated function SpawnFlightEffects()
{
    if(WorldInfo.NetMode != NM_DedicatedServer)
    {
        if(((bAutoStartAmbientSound && AmbientSoundPlayEvent != none) && !bSuppressSounds) && !bAmbientSoundZedTimeOnly || self.WorldInfo.TimeDilation < 1)
        {
            if(bImportantAmbientSound || !WorldInfo.bDropDetail && WorldInfo.GetDetailMode() != 0)
            {
                if(AmbientComponent != none)
                {
                    AmbientComponent.StopEvents();
                    AmbientComponent.PlayEvent(AmbientSoundPlayEvent);
                }
            }
        }
        if((self.WorldInfo.TimeDilation < 1) && ProjFlightTemplateZedTime != none)
        {
            ProjEffects = WorldInfo.MyEmitterPool.SpawnEmitterCustomLifetime(ProjFlightTemplateZedTime);            
        }
        else
        {
            if(ProjFlightTemplate != none)
            {
                ProjEffects = WorldInfo.MyEmitterPool.SpawnEmitterCustomLifetime(ProjFlightTemplate);                
            }
            else
            {
                return;
            }
        }
        ProjEffects.SetAbsolute(false, false, false);
        ProjEffects.SetLODLevel(((WorldInfo.bDropDetail) ? 1 : 0));
        ProjEffects.bUpdateComponentInTick = true;
        AttachComponent(ProjEffects);
    }
}

protected simulated function StopFlightEffects()
{
    if(ProjEffects != none)
    {
        if(ProjEffectsFadeOutDuration > 0)
        {
            bFadingOutProjEffects = true;
        }
        ProjEffects.DeactivateSystem();
    }
}

simulated function OnInstigatorControllerLeft();

defaultproperties
{
    GravityScale=1
    PostExplosionLifetime=1
    Speed=4000
    MaxSpeed=4000
    MomentumTransfer=1
    MyDamageType=Class'KFDT_Ballistic'
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProjectile.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProjectile.CollisionCylinder'
    Components(0)=CollisionCylinder
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFProjectile.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}