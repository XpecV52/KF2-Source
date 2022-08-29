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
var protected bool bIsAIProjectile;
var protected const bool bWarnAIWhenFired;
var const bool bCanStick;
var const bool bCanPin;
var float AlwaysRelevantDistanceSquared;
var byte WeaponFireMode;
var KFProjectile.FracturedMeshGlassShatterType GlassShatterType;
var KFLightPool.LightPoolPriority ProjFlightLightPriority;
var repnotify float InitialPenetrationPower;
var float PenetrationPower;
var TouchInfo LastTouched;
var TouchInfo LastBounced;
var float TouchTimeThreshhold;
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
var AkEvent DisintegrateSound;
/** Effects Template for projectile being disintegrated by siren's scream */
var(Projectile) ParticleSystem ProjDisintegrateTemplate;
var export editinline ParticleSystemComponent ProjDisintegrateEffects;
var Rotator DisintegrateEffectRotation;
var GameExplosionActor ExplosionActor;
var float PostExplosionLifetime;
var KFImpactEffectInfo AltExploEffects;
var float UpgradeDamageMod;
var export editinline ParticleSystemComponent ProjEffects;
var(Projectile) ParticleSystem ProjFlightTemplate;
var float ProjEffectsFadeOutDuration;
var export editinline PointLightComponent ProjFlightLight;
/** Effects Template for the bullet flying through the air in Zed time */
var(Projectile) ParticleSystem ProjFlightTemplateZedTime;
var AkEvent AmbientSoundPlayEvent;
var AkEvent AmbientSoundStopEvent;
var private export editinline AkComponent AmbientComponent;
var KFImpactEffectInfo ImpactEffects;
var class<KFPerk> AssociatedPerkClass;
var protected const float MaxAIWarningDistSQ;
var protected const float MaxAIWarningDistFromPointSQ;
var repnotify transient Actor StuckToActor;
var transient Actor PrevStuckToActor;
var transient int StuckToBoneIdx;
var transient Vector StuckToLocation;
var transient Rotator StuckToRotation;
var repnotify transient Actor PinActor;
var transient int PinBoneIdx;
var export editinline KFProjectileStickHelper StickHelper;

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

     if(bNetInitial && bNetOwner)
        WeaponFireMode;

     if(bCanStick && bNetInitial || !bNetOwner)
        StuckToActor, StuckToBoneIdx, 
        StuckToLocation, StuckToRotation;

     if(bCanPin && bNetDirty)
        PinActor, PinBoneIdx;
}

// Export UKFProjectile::execGetTerminalVelocity(FFrame&, void* const)
native function float GetTerminalVelocity();

// Export UKFProjectile::execStopAmbientSound(FFrame&, void* const)
native function StopAmbientSound(optional bool bForce);

event PreBeginPlay()
{
    super.PreBeginPlay();
    bIsAIProjectile = (InstigatorController == none) || !InstigatorController.bIsPlayer;
}

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
    local KFWeapon KFW;

    SetRotation(rotator(Direction));
    Velocity = Speed * Direction;
    Velocity.Z += TossZ;
    KFW = KFWeapon(Owner);
    if(KFW != none)
    {
        bFiredFromLeftHandWeapon = KFW.GetCurrentMuzzleID() == 1;
        WeaponFireMode = KFW.CurrentFireMode;
    }
    if(bSyncToOriginalLocation)
    {
        OriginalLocation = Location;
        SyncOriginalLocation();
    }
    if((WorldInfo.NetMode != NM_Client) && ShouldWarnAIWhenFired())
    {
        WarnAI(Direction);
    }
}

function WarnAI(Vector Direction)
{
    local Pawn P;
    local KFPawn_Monster HitMonster;
    local Vector Projection, DangerPoint;

    foreach WorldInfo.AllPawns(Class'Pawn', P)
    {
        if(((P.GetTeamNum() != Instigator.GetTeamNum()) && !P.IsHumanControlled()) && P.IsAliveAndWell())
        {
            Projection = P.Location - Location;
            if(VSizeSq(Projection) < MaxAIWarningDistSQ)
            {
                PointDistToLine(P.Location, Direction, Location, DangerPoint);
                if(VSizeSq(DangerPoint - P.Location) < MaxAIWarningDistFromPointSQ)
                {
                    HitMonster = KFPawn_Monster(P);
                    if((HitMonster != none) && HitMonster.MyKFAIC != none)
                    {
                        HitMonster.MyKFAIC.ReceiveLocationalWarning(DangerPoint, Location, self);
                    }
                }
            }
        }        
    }    
}

function bool ShouldWarnAIWhenFired()
{
    return bWarnAIWhenFired;
}

function bool IsAIProjectile()
{
    return bIsAIProjectile;
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
                    if(VarName == 'StuckToActor')
                    {
                        if(StuckToActor == none)
                        {
                            StickHelper.UnStick();                            
                        }
                        else
                        {
                            if(StuckToActor != PrevStuckToActor)
                            {
                                StickHelper.ReplicatedStick(StuckToActor, StuckToBoneIdx);
                            }
                        }                        
                    }
                    else
                    {
                        if(VarName == 'PinActor')
                        {
                            if((PinActor != none) && PinBoneIdx != -1)
                            {
                                StickHelper.Pin(PinActor, PinBoneIdx);
                            }                            
                        }
                        else
                        {
                            super(Actor).ReplicatedEvent(VarName);
                        }
                    }
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

singular simulated event HitWall(Vector HitNormal, Actor Wall, PrimitiveComponent WallComp)
{
    local KActorFromStatic NewKActor;
    local editinline StaticMeshComponent HitStaticMesh;
    local TraceHitInfo HitInfo;

    super(Actor).HitWall(HitNormal, Wall, WallComp);
    if(bCanStick || bCanPin)
    {
        LastTouchComponent = WallComp;
        StickHelper.TryStick(HitNormal,, Wall);
        return;
    }
    if(Wall.bWorldGeometry)
    {
        HitStaticMesh = StaticMeshComponent(WallComp);
        if((HitStaticMesh != none) && HitStaticMesh.CanBecomeDynamic())
        {
            NewKActor = Class'KActorFromStatic'.static.MakeDynamic(HitStaticMesh);
            if(NewKActor != none)
            {
                Wall = NewKActor;
            }            
        }
        else
        {
            if((!Wall.bStatic && Wall.bCanBeDamaged) && Wall.bProjTarget)
            {
                LastBounced.Actor = Wall;
                LastBounced.Time = WorldInfo.TimeSeconds;
                NotifyHitDestructible(HitNormal, Wall, WallComp);
            }
        }
    }
    ImpactedActor = Wall;
    if(!Wall.bStatic && (DamageRadius == float(0)) || bDamageDestructiblesOnTouch)
    {
        HitInfo.HitComponent = WallComp;
        HitInfo.Item = -1;
        Wall.TakeDamage(int(Damage), InstigatorController, Location, MomentumTransfer * Normal(Velocity), MyDamageType, HitInfo, self);
    }
    Explode(Location, HitNormal);
    ImpactedActor = none;
}

simulated function NotifyHitDestructible(Vector HitNormal, Actor Wall, PrimitiveComponent WallComp);

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
        if(bCanStick || bCanPin)
        {
            StickHelper.TryStick(HitNormal, HitLocation, Other);
            return;
        }
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
            HitWall(HitNormal, Other, LastTouchComponent);
        }
    }
}

simulated function ProcessBulletTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
    local Pawn Victim;
    local array<ImpactInfo> HitZoneImpactList;
    local Vector StartTrace, EndTrace, Direction;
    local TraceHitInfo HitInfo;
    local KFWeapon KFW;

    if(WorldInfo.NetMode != NM_DedicatedServer)
    {
        KFImpactEffectManager(WorldInfo.MyImpactEffectManager).PlayImpactEffects(HitLocation, Instigator,, ImpactEffects);
    }
    Victim = Pawn(Other);
    if(Victim == none)
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
    else
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
                if(Instigator != none)
                {
                    KFW = KFWeapon(Instigator.Weapon);
                    if(KFW != none)
                    {
                        KFW.HandleGrenadeProjectileImpact(HitZoneImpactList[0], Class);
                    }
                }                
            }
            else
            {
                if(Owner != none)
                {
                    KFW = KFWeapon(Owner);
                    if(KFW != none)
                    {
                        KFW.HandleProjectileImpact(WeaponFireMode, HitZoneImpactList[0], PenetrationPower);
                    }
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
    if(WorldInfo.NetMode != NM_DedicatedServer)
    {
        if(ProjDisintegrateTemplate != none)
        {
            ProjDisintegrateEffects = WorldInfo.MyEmitterPool.SpawnEmitter(ProjDisintegrateTemplate, Location, InDisintegrateEffectRotation);
        }
        if(DisintegrateSound != none)
        {
            PlaySoundBase(DisintegrateSound, true);
        }
    }
    bHasDisintegrated = true;
    DeferredDestroy(0.1);
}

simulated function TriggerExplosion(Vector HitLocation, Vector HitNormal, Actor HitActor)
{
    local Vector NudgedHitLocation, ExplosionDirection;
    local Pawn P;

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
        if(bStopAmbientSoundOnExplode)
        {
            StopAmbientSound();
        }
        if(ExplosionTemplate != none)
        {
            StopSimulating();
            NudgedHitLocation = HitLocation + (HitNormal * 32);
            SetExplosionActorClass();
            if(ExplosionActorClass == Class'KFPerk_Demolitionist'.static.GetNukeExplosionActorClass())
            {
                P = Pawn(HitActor);
                if(P != none)
                {
                    NudgedHitLocation = P.Location - (vect(0, 0, 1) * P.GetCollisionHeight());
                }
            }
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

simulated function bool AllowNuke()
{
    return true;
}

protected simulated function PrepareExplosionTemplate()
{
    local KFWeapon KFW;

    GetRadialDamageValues(ExplosionTemplate.Damage, ExplosionTemplate.DamageRadius, ExplosionTemplate.DamageFalloffExponent);
    ExplosionTemplate.Damage *= UpgradeDamageMod;
    KFW = KFWeapon(Owner);
    if((KFW == none) && Instigator != none)
    {
        KFW = KFWeapon(Instigator.Weapon);
    }
    if(KFW != none)
    {
        KFW.ModifyExplosionRadius(ExplosionTemplate.DamageRadius, WeaponFireMode);
    }
}

protected simulated function GetRadialDamageValues(out float outDamage, out float outRadius, out float outFalloff);

simulated function Vector GetExplosionDirection(Vector HitNormal);

protected simulated function PrepareExplosionActor(GameExplosionActor GEA)
{
    if(GEA.InstigatorController == none)
    {
        GEA.InstigatorController = InstigatorController;
    }
}

protected simulated function SetExplosionActorClass();

simulated function ShutDown()
{
    if(bStopAmbientSoundOnExplode)
    {
        StopAmbientSound();
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
    StopAmbientSound();
    super(Actor).Destroyed();
}

// Export UKFProjectile::execGetGravityZ(FFrame&, void* const)
native function float GetGravityZ();

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
        if(ProjFlightLight != none)
        {
            AttachComponent(ProjFlightLight);
            KFLightPool(WorldInfo.MyLightPool).RegisterPointLight(ProjFlightLight, ProjFlightLightPriority);
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
        if((ProjFlightLight != none) && ProjFlightLight.bAttached)
        {
            DetachComponent(ProjFlightLight);
        }
        ProjEffects.DeactivateSystem();
    }
}

function Detonate();

function Timer_Explode();

simulated function OnInstigatorControllerLeft();

function Vector CalculateResidualFlameVelocity(Vector HitNormal, Vector HitVelDir, float HitVelMag)
{
    local Vector SpawnDir;

    SpawnDir = VRandCone(HitVelDir, 3.141593 / float(4));
    SpawnDir = SpawnDir + (-SpawnDir Dot HitNormal * HitNormal);
    SpawnDir = VRandCone(SpawnDir, 3.141593 / float(4));
    return SpawnDir * (HitVelMag / 3);
}

function SpawnResidualFlame(class<KFProjectile> SpawnClass, Vector SpawnLoc, Vector SpawnVel)
{
    local KFProjectile SpawnedProjectile;

    SpawnedProjectile = Spawn(SpawnClass, self,, SpawnLoc);
    if((SpawnedProjectile != none) && !SpawnedProjectile.bDeleteMe)
    {
        if(SpawnedProjectile.InstigatorController == none)
        {
            SpawnedProjectile.InstigatorController = InstigatorController;
        }
        SpawnedProjectile.Init(Normal(SpawnVel));
        SpawnedProjectile.Velocity = SpawnVel;
        SpawnedProjectile.Speed = VSize(SpawnedProjectile.Velocity);
    }
}

simulated function SetStickOrientation(Vector HitNormal);

reliable server function ServerStick(Actor StickTo, int BoneIdx, Vector StickLoc, Rotator StickRot)
{
    StickHelper.ServerStick(StickTo, BoneIdx, StickLoc, StickRot);
}

defaultproperties
{
    GravityScale=1
    DisintegrateSound=AkEvent'WW_WEP_Bullet_Impacts.Play_Siren_Grenade_Dis'
    PostExplosionLifetime=1
    UpgradeDamageMod=1
    MaxAIWarningDistSQ=4000000
    MaxAIWarningDistFromPointSQ=16384
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