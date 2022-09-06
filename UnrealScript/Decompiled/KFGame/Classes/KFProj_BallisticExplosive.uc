/*******************************************************************************
 * KFProj_BallisticExplosive generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFProj_BallisticExplosive extends KFProjectile
    abstract
    hidecategories(Navigation);

var repnotify bool bDud;
/** When true this projectile will collide/hit/explode when hitting teammates */
var() bool bCollideWithTeammates;
var bool bClientDudHit;
var bool bIsTimedExplosive;
/** Distance this projectile arms itself at */
var() float ArmDistSquared;
/** The effect to display when the projectile becomes a dud */
var(Projectile) ParticleSystem ProjDudTemplate;
var KFImpactEffectInfo GrenadeBounceEffectInfo;
/** Dampen amount for every bounce */
var() float DampenFactor;
/** Dampen amount for parallel angle to velocity */
var() float DampenFactorParallel;
/** Dampen amount for every bounce */
var() float WallHitDampenFactor;
/** Dampen amount for parallel angle to velocity */
var() float WallHitDampenFactorParallel;
/** How much to offset the emitter mesh when the grenade has landed so that it doesn't penetrate the ground */
var() Vector LandedTranslationOffset;
var array<Actor> ImpactList;

replication
{
     if((Role == ROLE_Authority) && !bNetOwner)
        bDud;

     if(bNetInitial && !bNetOwner)
        ArmDistSquared;
}

simulated function SyncOriginalLocation()
{
    local KFPerk InstigatorPerk;
    local KFPawn KFP;

    KFP = KFPawn(Instigator);
    if(KFP != none)
    {
        InstigatorPerk = KFP.GetPerk();
        if((InstigatorPerk != none) && InstigatorPerk.ShouldNeverDud())
        {
            ArmDistSquared = 0;
        }
    }
    if((((Physics == 2) && Role < ROLE_Authority) && Instigator != none) && Instigator.IsLocallyControlled())
    {
        Velocity = vect(0, 0, 0);
    }
    super.SyncOriginalLocation();
}

simulated event PreBeginPlay()
{
    super.PreBeginPlay();
    AdjustCanDisintigrate();
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
    if((WorldInfo.NetMode == NM_Standalone) || ((WorldInfo.NetMode == NM_ListenServer) && Instigator != none) && Instigator.IsLocallyControlled())
    {
        super.Explode(HitLocation, HitNormal);
        return;
    }
    if(((Owner != none) && KFWeapon(Owner) != none) && Instigator != none)
    {
        if((Instigator.Role < ROLE_Authority) && Instigator.IsLocallyControlled())
        {
            KFWeapon(Owner).HandleClientProjectileExplosion(HitLocation, self);
            return;
        }
    }
    StopSimulating();
}

simulated function CallExplode(Vector HitLocation, Vector HitNormal)
{
    SetLocation(HitLocation);
    Explode(HitLocation, HitNormal);
}

simulated event HitWall(Vector HitNormal, Actor Wall, PrimitiveComponent WallComp)
{
    local Vector VNorm;
    local Rotator NewRotation;
    local Vector Offset;
    local bool bWantsClientSideDudHit;
    local TraceHitInfo HitInfo;
    local float TraveledDistance;

    if((Instigator != none) && Instigator.Role < ROLE_Authority)
    {
        bWantsClientSideDudHit = true;
    }
    TraveledDistance = (WorldInfo.TimeSeconds - CreationTime) * Speed;
    TraveledDistance *= TraveledDistance;
    if(bDud || ((TraveledDistance < ArmDistSquared) || bIsTimedExplosive) || (OriginalLocation == vect(0, 0, 0)) && ArmDistSquared > float(0))
    {
        VNorm = (Velocity Dot HitNormal) * HitNormal;
        Velocity = (-VNorm * WallHitDampenFactor) + ((Velocity - VNorm) * WallHitDampenFactorParallel);
        Speed = VSize(Velocity);
        if(!bDud || bWantsClientSideDudHit && !bClientDudHit)
        {
            SetIsDud(bWantsClientSideDudHit, HitNormal);
        }
        if((WorldInfo.NetMode != NM_DedicatedServer) && Pawn(Wall) == none)
        {
            KFImpactEffectManager(WorldInfo.MyImpactEffectManager).PlayImpactEffects(Location, Instigator, HitNormal, GrenadeBounceEffectInfo, true);
        }
        if(Speed < float(40))
        {
            ImpactedActor = Wall;
            SetPhysics(0);
            if(ProjEffects != none)
            {
                ProjEffects.SetTranslation(LandedTranslationOffset);
            }
            RotationRate.Yaw = 0;
            RotationRate.Pitch = 0;
            RotationRate.Roll = 0;
            NewRotation = Rotation;
            NewRotation.Pitch = 0;
            SetRotation(NewRotation);
            Offset.Z = LandedTranslationOffset.X;
            SetLocation(Location + Offset);
        }
        if(((!Wall.bStatic && Wall.bCanBeDamaged) && (DamageRadius == float(0)) || bDamageDestructiblesOnTouch) && !CheckRepeatingTouch(Wall))
        {
            HitInfo.HitComponent = WallComp;
            HitInfo.Item = -1;
            Wall.TakeDamage(int(Damage), InstigatorController, Location, MomentumTransfer * Normal(Velocity), MyDamageType, HitInfo, self);
        }
    }
    if(!bDud && !bIsTimedExplosive)
    {
        super.HitWall(HitNormal, Wall, WallComp);
    }
}

function float GetTerminalVelocity()
{
    if(bDud)
    {
        return super(Actor).GetTerminalVelocity();        
    }
    else
    {
        return super.GetTerminalVelocity();
    }
}

simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
    local bool bWantsClientSideDudHit;
    local float TraveledDistance;
    local Vector VNorm;

    if(Other.IsA('KFTrigger_SirenProjectileShield'))
    {
        return;
    }
    if(!bCollideWithTeammates && Pawn(Other) != none)
    {
        if(Other.GetTeamNum() == GetTeamNum())
        {
            return;
        }
    }
    if((Instigator != none) && Instigator.Role < ROLE_Authority)
    {
        bWantsClientSideDudHit = true;
    }
    TraveledDistance = (WorldInfo.TimeSeconds - CreationTime) * Speed;
    TraveledDistance *= TraveledDistance;
    if((!bDud || bWantsClientSideDudHit && !bClientDudHit) && ((TraveledDistance < ArmDistSquared) || bIsTimedExplosive) || (OriginalLocation == vect(0, 0, 0)) && ArmDistSquared > float(0))
    {
        if(((LastTouched.Actor == Other) && TouchTimeThreshhold > float(0)) && (WorldInfo.TimeSeconds - LastTouched.Time) <= TouchTimeThreshhold)
        {
            return;
        }
        SetIsDud(bWantsClientSideDudHit, HitNormal);
        if((((Other != Instigator) && !Other.bStatic) && Other.GetTeamNum() != GetTeamNum()) && !CheckRepeatingTouch(Other))
        {
            ProcessBulletTouch(Other, HitLocation, HitNormal);
        }
        VNorm = (Velocity Dot HitNormal) * HitNormal;
        Velocity = (-VNorm * DampenFactor) + ((Velocity - VNorm) * DampenFactorParallel);
        Speed = VSize(Velocity);
    }
    if(!bDud && !bIsTimedExplosive)
    {
        if((Other != Instigator) && !Other.bStatic)
        {
            if(!CheckRepeatingTouch(Other) && Other.GetTeamNum() != GetTeamNum())
            {
                ProcessBulletTouch(Other, HitLocation, HitNormal);
            }
        }
        if((WorldInfo.NetMode == NM_Standalone) || ((WorldInfo.NetMode == NM_ListenServer) && Instigator != none) && Instigator.IsLocallyControlled())
        {
            super.ProcessTouch(Other, HitLocation, HitNormal);
            return;
        }
        if(((Owner != none) && KFWeapon(Owner) != none) && Instigator != none)
        {
            if((Instigator.Role < ROLE_Authority) && Instigator.IsLocallyControlled())
            {
                KFWeapon(Owner).HandleClientProjectileExplosion(HitLocation, self);
                super.ProcessTouch(Other, HitLocation, HitNormal);
                return;
            }
        }
        StopSimulating();
    }
}

simulated function ProcessBulletTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
    if(ImpactList.Find(Other != -1)
    {
        return;
    }
    if(Other != none)
    {
        ImpactList.AddItem(Other;
    }
    super.ProcessBulletTouch(Other, HitLocation, HitNormal);
}

simulated function SetIsDud(bool bWantsClientSideDudHit, Vector HitNormal)
{
    bDud = true;
    if(bWantsClientSideDudHit)
    {
        bClientDudHit = true;
    }
    LifeSpan = 1;
    SetPhysics(2);
    GravityScale = 1;
    StopFlightEffects();
    ProjFlightTemplate = ProjDudTemplate;
    ProjFlightTemplateZedTime = ProjDudTemplate;
    SpawnFlightEffects();
    OnDudEffect();
}

simulated function OnDudEffect();

simulated function bool TraceProjHitZones(Pawn P, Vector EndTrace, Vector StartTrace, out array<ImpactInfo> out_Hits)
{
    local Vector ClosestHit, Direction;

    super.TraceProjHitZones(P, EndTrace, StartTrace, out_Hits);
    if(bDud && out_Hits.Length == 0)
    {
        P.Mesh.FindClosestBone(StartTrace, ClosestHit);
        if(!IsZero(ClosestHit))
        {
            StartTrace = ClosestHit;
            Direction = Normal(ClosestHit - StartTrace);
            EndTrace = StartTrace + (Direction * (P.CylinderComponent.CollisionRadius * 6));
            super.TraceProjHitZones(P, EndTrace, StartTrace, out_Hits);
        }
    }
    return out_Hits.Length > 0;
}

protected simulated function PrepareExplosionTemplate()
{
    Class'KFPerk_Demolitionist'.static.PrepareExplosive(Instigator, self);
    super.PrepareExplosionTemplate();
}

protected simulated function SetExplosionActorClass()
{
    local KFPlayerReplicationInfo InstigatorPRI;

    if(bWasTimeDilated && Instigator != none)
    {
        InstigatorPRI = KFPlayerReplicationInfo(Instigator.PlayerReplicationInfo);
        if(InstigatorPRI != none)
        {
            if(InstigatorPRI.bNukeActive && Class'KFPerk_Demolitionist'.static.ProjectileShouldNuke(self))
            {
                ExplosionActorClass = Class'KFPerk_Demolitionist'.static.GetNukeExplosionActorClass();
            }
        }
    }
    super.SetExplosionActorClass();
}

defaultproperties
{
    DampenFactor=0.025
    DampenFactorParallel=0.05
    WallHitDampenFactor=0.025
    WallHitDampenFactorParallel=0.05
    LandedTranslationOffset=(X=2,Y=0,Z=0)
    bSyncToOriginalLocation=true
    bSyncToThirdPersonMuzzleLocation=true
    bUseClientSideHitDetection=true
    bDamageDestructiblesOnTouch=true
    bReplicateLocationOnExplosion=true
    bValidateExplosionNormalOnClient=true
    bAlwaysReplicateDisintegration=true
    bAlwaysReplicateExplosion=true
    bCanDisintegrate=true
    bAutoStartAmbientSound=true
    bStopAmbientSoundOnExplode=true
    AlwaysRelevantDistanceSquared=6250000
    GlassShatterType=FracturedMeshGlassShatterType.FMGS_ShatterAll
    TouchTimeThreshhold=0.15
    ExtraLineCollisionOffsets(0)=
/* Exception thrown while deserializing ExtraLineCollisionOffsets
System.ArgumentException: Requested value '!=_9274' was not found.
   at System.Enum.TryParseEnum(Type enumType, String value, Boolean ignoreCase, EnumResult& parseResult)
   at System.Enum.Parse(Type enumType, String value, Boolean ignoreCase)
   at UELib.Core.UDefaultProperty.DeserializeTagUE3()
   at UELib.Core.UDefaultProperty.Deserialize()
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    ExplosionActorClass=Class'KFExplosionActor'
    begin object name=AmbientAkSoundComponent class=AkComponent
        bStopWhenOwnerDestroyed=true
        bForceOcclusionUpdateInterval=true
        OcclusionUpdateInterval=0.25
    object end
    // Reference: AkComponent'Default__KFProj_BallisticExplosive.AmbientAkSoundComponent'
    AmbientComponent=AmbientAkSoundComponent
    bBlockedByInstigator=false
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionHeight=5
        CollisionRadius=5
        ReplacementPrimitive=none
        CollideActors=true
        BlockNonZeroExtent=false
    object end
    // Reference: CylinderComponent'Default__KFProj_BallisticExplosive.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionHeight=5
        CollisionRadius=5
        ReplacementPrimitive=none
        CollideActors=true
        BlockNonZeroExtent=false
    object end
    // Reference: CylinderComponent'Default__KFProj_BallisticExplosive.CollisionCylinder'
    Components(0)=CollisionCylinder
    begin object name=AmbientAkSoundComponent class=AkComponent
        bStopWhenOwnerDestroyed=true
        bForceOcclusionUpdateInterval=true
        OcclusionUpdateInterval=0.25
    object end
    // Reference: AkComponent'Default__KFProj_BallisticExplosive.AmbientAkSoundComponent'
    Components(1)=AmbientAkSoundComponent
    bNetTemporary=false
    bCollideComplex=true
    bBounce=true
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionHeight=5
        CollisionRadius=5
        ReplacementPrimitive=none
        CollideActors=true
        BlockNonZeroExtent=false
    object end
    // Reference: CylinderComponent'Default__KFProj_BallisticExplosive.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}