/*******************************************************************************
 * KFPawn_AutoTurret generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFPawn_AutoTurret extends KFPawn
    config(Game)
    hidecategories(Navigation);

const WeaponSocketName = 'WeaponSocket';
const WeaponAttachmentSocketName = 'WeaponAttachment';
const TransitionParamName = 'transition_full_to_empty';
const EmptyParamName = 'Blinking_0_off___1_on';
const DroneFlyingStartAudio = AkEvent'WW_WEP_Autoturret.Play_WEP_AutoTurret_IdleFly';
const DroneFlyingStopAudio = AkEvent'WW_WEP_Autoturret.Stop_WEP_AutoTurret_IdleFly';
const DroneDryFire = AkEvent'WW_WEP_Autoturret.Play_WEP_AutoTurret_Dron_Dry_Fire';
const NoAmmoSocketName = 'malfunction';
const NoAmmoFXTemplate = ParticleSystem'WEP_AutoTurret_EMIT.FX_NoAmmo_Sparks';

enum ETurretState
{
    ETS_None,
    ETS_Throw,
    ETS_Deploy,
    ETS_TargetSearch,
    ETS_Combat,
    ETS_Detonate,
    ETS_Empty,
    ETS_MAX
};

var export editinline SkeletalMeshComponent TurretMesh;
var Controller InstigatorController;
var const float DeployZSpeed;
var const float DeployHeight;
var const float EffectiveRadius;
var const float ExplosiveRadius;
var const Rotator AimRotationVel;
var const Rotator CombatRotationVel;
var const float TimeBeforeRefreshingTargets;
var const float TimeIdlingWhenSearching;
var const float MinIdlingVariation;
var const float MaxIdlingVariation;
var const int EmptyPitch;
var GameExplosion ExplosionTemplate;
var class<KFWeaponDefinition> WeaponDefinition;
var const bool bCanDetonateOnProximityWithAmmo;
var transient bool bRotating;
var bool deployUsingOffsetFromPlayerLocation;
var transient bool bHasSearchRandomLocation;
var transient bool bRotatingByTime;
var repnotify KFPawn_AutoTurret.ETurretState CurrentState;
var transient byte TeamNum;
var repnotify Rotator ReplicatedRotation;
var repnotify float CurrentAmmoPercentage;
var repnotify AkEvent TurretWeaponAmbientSound;
var repnotify int WeaponSkinId;
var transient Rotator DeployRotation;
var transient Rotator RotationStart;
var transient Rotator TargetRotation;
var transient float RotationAlpha;
var transient float RotationTime;
var transient KFWeap_AutoTurretWeapon TurretWeapon;
var transient KFWeapAttach_AutoTurretWeap TurretWeaponAttachment;
var transient KFWeap_AutoTurret OwnerWeapon;
var float deployUsingOffsetZ;
var transient Vector ThrowInstigatorLocation;
var transient Vector GroundLocation;
var transient Vector DeployedLocation;
var transient float RandomSearchLocation;
var transient KFPawn_Monster EnemyTarget;
var transient MaterialInstanceConstant TurretAttachMIC;
var export editinline AkComponent FlyAkComponent;
var export editinline transient ParticleSystemComponent NoAmmoFX;

replication
{
     if(bNetDirty)
        CurrentAmmoPercentage, CurrentState, 
        EnemyTarget, ReplicatedRotation, 
        TurretWeaponAmbientSound, WeaponSkinId;
}

simulated event ReplicatedEvent(name VarName)
{
    if(VarName == 'CurrentState')
    {
        ChangeState(CurrentState);        
    }
    else
    {
        if(VarName == 'ReplicatedRotation')
        {
            RotateBySpeed(ReplicatedRotation);            
        }
        else
        {
            if(VarName == 'CurrentAmmoPercentage')
            {
                UpdateTurretMeshMaterialColor(CurrentAmmoPercentage);                
            }
            else
            {
                if(VarName == 'TurretWeaponAmbientSound')
                {
                    SetWeaponAmbientSound(TurretWeaponAmbientSound);                    
                }
                else
                {
                    if(VarName == 'WeaponSkinId')
                    {
                        SetWeaponSkin(WeaponSkinId);                        
                    }
                    else
                    {
                        super.ReplicatedEvent(VarName);
                    }
                }
            }
        }
    }
}

simulated event PreBeginPlay()
{
    local class<KFWeapon> WeaponClass;
    local Rotator ZeroRotator;

    super.PreBeginPlay();
    WeaponClass = class<KFWeap_AutoTurretWeapon>(DynamicLoadObject(WeaponDefinition.default.WeaponClassPath, Class'Class'));
    WeaponClassForAttachmentTemplate = WeaponClass;
    SetMeshVisibility(false);
    if(Role == ROLE_Authority)
    {
        Weapon = Spawn(WeaponClass, self);
        TurretWeapon = KFWeap_AutoTurretWeapon(Weapon);
        MyKFWeapon = TurretWeapon;
        if(Weapon != none)
        {
            Weapon.Instigator = Instigator;
            TurretWeapon.InstigatorDrone = self;
            Weapon.SetCollision(false, false);
            Weapon.SetBase(self,, TurretMesh, 'WeaponSocket');
            TurretMesh.AttachComponentToSocket(Weapon.Mesh, 'WeaponSocket');
            Weapon.SetRelativeLocation(vect(0, 0, 0));
            Weapon.SetRelativeRotation(ZeroRotator);
            Weapon.Mesh.SetOnlyOwnerSee(true);
            MyKFWeapon.Mesh.SetHidden(true);
        }
    }
    if((WorldInfo.NetMode == NM_Client) || WorldInfo.NetMode == NM_Standalone)
    {
        if(WeaponClass.default.AttachmentArchetype != none)
        {
            SetTurretWeaponAttachment(WeaponClass);
        }
    }
}

simulated function SetTurretWeaponAttachment(class<KFWeapon> WeaponClass)
{
    local KFWeaponAttachment AttachmentTemplate;
    local Rotator ZeroRotator;

    if(WeaponAttachment != none)
    {
        return;
    }
    AttachmentTemplate = WeaponClass.default.AttachmentArchetype;
    WeaponAttachment = Spawn(AttachmentTemplate.Class, self,,,, AttachmentTemplate);
    if(WeaponAttachment != none)
    {
        WeaponAttachment.SetCollision(false, false);
        WeaponAttachment.Instigator = Instigator;
        TurretMesh.AttachComponentToSocket(WeaponAttachment.WeapMesh, 'WeaponAttachment');
        WeaponAttachment.SetRelativeLocation(vect(0, 0, 0));
        WeaponAttachment.SetRelativeRotation(ZeroRotator);
        WeaponAttachment.WeapMesh.SetOnlyOwnerSee(false);
        WeaponAttachment.WeapMesh.SetOwnerNoSee(false);
        WeaponAttachment.ChangeVisibility(true);
        WeaponAttachment.AttachLaserSight();
        TurretWeaponAttachment = KFWeapAttach_AutoTurretWeap(WeaponAttachment);
        TurretWeaponAttachment.PlayCloseAnim();
    }
}

simulated function UpdateInstigator(Pawn NewInstigator)
{
    local KFPawn_Human KFPH;

    Instigator = NewInstigator;
    TeamNum = Instigator.GetTeamNum();
    if(Weapon != none)
    {
        Weapon.Instigator = NewInstigator;
    }
    KFPH = KFPawn_Human(NewInstigator);
    if((KFPH != none) && KFPH.WeaponSkinItemId > 0)
    {
        SetWeaponSkin(KFPH.WeaponSkinItemId);
    }
}

simulated function SetWeaponSkin(int SkinID)
{
    if(Role == ROLE_Authority)
    {
        WeaponSkinId = SkinID;
        bForceNetUpdate = true;
    }
    if(WeaponAttachment != none)
    {
        WeaponAttachment.SetWeaponSkin(SkinID);
    }
}

simulated function UpdateWeaponUpgrade(int UpgradeIndex)
{
    if(Weapon != none)
    {
        TurretWeapon.SetWeaponUpgradeLevel(UpgradeIndex);
    }
}

function SetTurretState(KFPawn_AutoTurret.ETurretState State)
{
    if(CurrentState == State)
    {
        return;
    }
    ChangeState(State);
    CurrentState = State;
    bForceNetUpdate = true;
}

function UpdateReadyToUse(bool bReady)
{
    if(OwnerWeapon != none)
    {
        OwnerWeapon.SetReadyToUse(bReady);
    }
}

simulated function ChangeState(KFPawn_AutoTurret.ETurretState State)
{
    switch(State)
    {
        case 0:
            break;
        case 1:
            GotoState('Throw');
            break;
        case 2:
            GotoState('Deploy');
            break;
        case 3:
            GotoState('TargetSearch');
            break;
        case 4:
            GotoState('Combat');
            break;
        case 5:
            GotoState('Detonate');
            break;
        case 6:
            GotoState('Empty');
            break;
        default:
            break;
            break;
    }
}

simulated function PlayEmptySound1()
{
    PlaySoundBase(AkEvent'Play_WEP_AutoTurret_Dron_Dry_Fire');
}

simulated function PlayEmptySound2()
{
    PlaySoundBase(AkEvent'Play_WEP_AutoTurret_Dron_Dry_Fire');
}

simulated function PlayEmptySound3()
{
    PlaySoundBase(AkEvent'Play_WEP_AutoTurret_Dron_Dry_Fire');
}

simulated function PlayEmptyState()
{
    if(TurretWeaponAttachment != none)
    {
        StopIdleSound();
        TurretWeaponAttachment.PlayEmptyState();
    }
}

simulated function StopIdleSound()
{
    FlyAkComponent.StopEvents();
}

function CheckForTargets()
{
    local KFPawn_Monster CurrentTarget;
    local TraceHitInfo HitInfo;
    local float currentDistance, Distance;
    local Vector MuzzleLoc;
    local Rotator MuzzleRot;
    local Vector HitLocation, HitNormal;
    local Actor HitActor;

    if(EnemyTarget != none)
    {
        currentDistance = VSizeSq(Location - EnemyTarget.Location);        
    }
    else
    {
        currentDistance = 9999;
    }
    TurretWeapon.GetMuzzleLocAndRot(MuzzleLoc, MuzzleRot);
    foreach CollidingActors(Class'KFPawn_Monster', CurrentTarget, EffectiveRadius, Location, true,, HitInfo)
    {
        HitActor = Trace(HitLocation, HitNormal, CurrentTarget.Mesh.GetBoneLocation('Spine1'), MuzzleLoc,,,, 1);
        if(((!CurrentTarget.IsAliveAndWell() || CurrentTarget.bIsCloaking) || HitActor == none) || KFPawn_Monster(HitActor) == none)
        {
            continue;            
        }
        Distance = VSizeSq(Location - CurrentTarget.Location);
        if(EnemyTarget == none)
        {
            EnemyTarget = CurrentTarget;
            currentDistance = Distance;
            continue;
        }
        if(currentDistance > Distance)
        {
            EnemyTarget = CurrentTarget;
            currentDistance = Distance;
        }        
    }    
    if(EnemyTarget != none)
    {
        SetTurretState(4);
    }
}

simulated event Destroyed()
{
    local KFWeap_AutoTurret WeapOwner;

    StopIdleSound();
    WeapOwner = KFWeap_AutoTurret(Owner);
    if(WeapOwner != none)
    {
        WeapOwner.RemoveDeployedTurret(,, self);
    }
    ClearTimer('CheckEnemiesWithinExplosionRadius');
    if(NoAmmoFX != none)
    {
        NoAmmoFX.KillParticlesForced();
        WorldInfo.MyEmitterPool.OnParticleSystemFinished(NoAmmoFX);
        NoAmmoFX = none;
    }
    super.Destroyed();
}

simulated function CheckEnemiesWithinExplosionRadius()
{
    local KFPawn_Monster KFPM;
    local Vector CheckExplosionLocation;

    CheckExplosionLocation = Location;
    CheckExplosionLocation.Z -= (DeployHeight * 0.5);
    if(CheckExplosionLocation.Z < GroundLocation.Z)
    {
        CheckExplosionLocation.Z = GroundLocation.Z;
    }
    foreach CollidingActors(Class'KFPawn_Monster', KFPM, ExplosiveRadius, CheckExplosionLocation, true)
    {
        if((KFPM != none) && KFPM.IsAliveAndWell())
        {
            SetTurretState(5);            
            return;
        }        
    }    
}

simulated function StartIdleAnim()
{
    if(TurretWeaponAttachment != none)
    {
        TurretWeaponAttachment.PlayIdleAnim();
        FlyAkComponent.PlayEvent(AkEvent'Play_WEP_AutoTurret_IdleFly', true, true);
    }
}

simulated event Tick(float DeltaTime)
{
    local Rotator NewRotationRate;

    RotationRate = NewRotationRate;
    if(bRotating)
    {
        UpdateRotation(DeltaTime);
    }
    super.Tick(DeltaTime);
}

simulated function UpdateRotation(float DeltaTime)
{
    local Rotator RotationDiff, RotationStep, NewRotation, RotationSpeed;
    local int Sign;

    if(bRotating)
    {
        if(bRotatingByTime)
        {
            if(RotationAlpha < RotationTime)
            {
                RotationAlpha += DeltaTime;
                RotationStep = RLerp(RotationStart, TargetRotation, FMin(RotationAlpha / RotationTime, 1), true);
                RotationStep.Roll = 0;
                RotationStep.Yaw = RotationStep.Yaw % 65536;
                RotationStep.Pitch = RotationStep.Pitch % 65536;
                if(RotationStep.Yaw < 0)
                {
                    RotationStep.Yaw += 65536;
                }
                if(RotationStep.Pitch < 0)
                {
                    RotationStep.Pitch += 65536;
                }
                SetRotation(RotationStep);                
            }
            else
            {
                bRotating = false;
            }            
        }
        else
        {
            RotationSpeed = ((CurrentState == 4) ? CombatRotationVel : AimRotationVel);
            RotationDiff = TargetRotation - Rotation;
            RotationDiff.Yaw = NormalizeRotAxis(RotationDiff.Yaw);
            RotationDiff.Pitch = NormalizeRotAxis(RotationDiff.Pitch);
            RotationDiff.Roll = NormalizeRotAxis(RotationDiff.Roll);
            Sign = ((RotationDiff.Yaw >= 0) ? 1 : -1);
            RotationStep.Yaw = int((float(RotationSpeed.Yaw) * DeltaTime) * float(Sign));
            if(Abs(float(RotationStep.Yaw)) > Abs(float(RotationDiff.Yaw)))
            {
                RotationStep.Yaw = RotationDiff.Yaw;
            }
            Sign = ((RotationDiff.Pitch >= 0) ? 1 : -1);
            RotationStep.Pitch = int((float(RotationSpeed.Pitch) * DeltaTime) * float(Sign));
            if(Abs(float(RotationStep.Pitch)) > Abs(float(RotationDiff.Pitch)))
            {
                RotationStep.Pitch = RotationDiff.Pitch;
            }
            RotationStep.Roll = 0;
            NewRotation = Rotation + RotationStep;
            NewRotation.Yaw = NewRotation.Yaw % 65536;
            NewRotation.Pitch = NewRotation.Pitch % 65536;
            if(NewRotation.Yaw < 0)
            {
                NewRotation.Yaw += 65536;
            }
            if(NewRotation.Pitch < 0)
            {
                NewRotation.Pitch += 65536;
            }
            SetRotation(NewRotation);
            if(ReachedRotation())
            {
                bRotating = false;
            }
        }
    }
}

simulated function RotateByTime(Rotator NewRotation, float Time)
{
    if(NewRotation != Rotation)
    {
        RotationStart = Rotation;
        TargetRotation = NewRotation;
        RotationAlpha = 0;
        RotationTime = Time;
        bRotating = true;
        bRotatingByTime = true;
    }
}

simulated function RotateBySpeed(Rotator NewRotation)
{
    TargetRotation = NewRotation;
    RotationAlpha = 0;
    RotationTime = 0;
    bRotating = true;
    bRotatingByTime = false;
}

simulated event byte ScriptGetTeamNum()
{
    return TeamNum;
}

simulated function RequestRotation(Rotator NewRotation)
{
    if(Role == ROLE_Authority)
    {
        ReplicatedRotation.Yaw = ((NewRotation.Yaw >> 8) & 255) << 8;
        ReplicatedRotation.Pitch = ((NewRotation.Pitch >> 8) & 255) << 8;
        bForceNetUpdate = true;
    }
    RotateBySpeed(ReplicatedRotation);
}

simulated function bool ReachedRotation(optional int DeltaError)
{
    local int YawDiff;

    DeltaError = 2000;
    YawDiff = int(Abs(float((TargetRotation.Yaw & 65535) - (Rotation.Yaw & 65535))));
    return (YawDiff < DeltaError) || YawDiff > (65535 - DeltaError);
}

event TakeDamage(int Damage, Controller InstigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser);

simulated function TakeRadiusDamage(Controller InstigatedBy, float BaseDamage, float DamageRadius, class<DamageType> DamageType, float Momentum, Vector HurtOrigin, bool bFullDamage, Actor DamageCauser, optional float DamageFalloffExponent)
{
    DamageFalloffExponent = 1;
}

function bool CanAITargetThisPawn(Controller TargetingController)
{
    return false;
}

simulated function UpdateTurretMeshMaterialColor(float Value)
{
    if(TurretWeaponAttachment == none)
    {
        return;
    }
    if(TurretAttachMIC == none)
    {
        TurretAttachMIC = TurretWeaponAttachment.WeapMesh.CreateAndSetMaterialInstanceConstant(0);
    }
    if(TurretAttachMIC != none)
    {
        TurretAttachMIC.SetScalarParameterValue('transition_full_to_empty', 1 - Value);
        TurretAttachMIC.SetScalarParameterValue('Blinking_0_off___1_on', float(((Value == 0) ? 1 : 0)));
    }
}

simulated function bool GetAutoTargetBones(out array<name> WeakBones, out array<name> NormalBones)
{
    return false;
}

simulated function SetWeaponAmbientSound(AkEvent NewAmbientSound, optional AkEvent FirstPersonAmbientSound)
{
    super.SetWeaponAmbientSound(NewAmbientSound, FirstPersonAmbientSound);
    if(WorldInfo.NetMode == NM_DedicatedServer)
    {
        TurretWeaponAmbientSound = NewAmbientSound;
        bNetDirty = true;
    }
}

auto simulated state Throw
{
    simulated function BeginState(name PreviousStateName)
    {
        super(Object).BeginState(PreviousStateName);
        ThrowInstigatorLocation = Instigator.Location;
        if(Role == ROLE_Authority)
        {
            UpdateReadyToUse(false);
        }
    }

    simulated function EndState(name NextStateName)
    {
        super(Object).EndState(NextStateName);
        if(Role == ROLE_Authority)
        {
            UpdateReadyToUse(true);
        }
    }

    simulated event Landed(Vector HitNormal, Actor FloorActor)
    {
        super(KFPawn).Landed(HitNormal, FloorActor);
        if(Role == ROLE_Authority)
        {
            GroundLocation = Location;
            DeployRotation = Rotation;
            SetTurretState(2);
        }
    }

    simulated event Tick(float DeltaTime)
    {
        if(deployUsingOffsetFromPlayerLocation)
        {
            if(Location.Z < (ThrowInstigatorLocation.Z - deployUsingOffsetZ))
            {
                GroundLocation = Location;
                DeployRotation = Rotation;
                SetTurretState(2);
            }
        }
        super(KFPawn_AutoTurret).Tick(DeltaTime);
    }
    stop;    
}

simulated state Deploy
{
    simulated function BeginState(name PreviousStateName)
    {
        local float AnimDuration;

        super(Object).BeginState(PreviousStateName);
        if(TurretWeaponAttachment != none)
        {
            AnimDuration = TurretWeaponAttachment.PlayDeployAnim();
            SetTimer(AnimDuration, false, 'StartIdleAnim');
        }
        SetPhysics(4);
        if(Role == ROLE_Authority)
        {
            Velocity = vect(0, 0, 1) * DeployZSpeed;
            UpdateReadyToUse(false);
        }
    }

    simulated event Tick(float DeltaTime)
    {
        local float CurrentHeight;
        local Vector LocationNext;

        super(KFPawn_AutoTurret).Tick(DeltaTime);
        LocationNext = Location;
        LocationNext.Z += (Velocity.Z * DeltaTime);
        if((Velocity.Z <= 0.01) || !FastTrace(LocationNext, Location, vect(25, 25, 25)))
        {
            SetTurretState(3);            
        }
        else
        {
            CurrentHeight = Location.Z - GroundLocation.Z;
            if(CurrentHeight >= DeployHeight)
            {
                SetTurretState(3);
            }
        }
    }

    simulated function EndState(name NextStateName)
    {
        super(Object).EndState(NextStateName);
        DeployedLocation = Location;
        Velocity = vect(0, 0, 0);
        if(Role == ROLE_Authority)
        {
            UpdateReadyToUse(true);
            if(bCanDetonateOnProximityWithAmmo)
            {
                SetTimer(0.25, true, 'CheckEnemiesWithinExplosionRadius');
            }
        }
    }
    stop;    
}

simulated state TargetSearch
{
    simulated function BeginState(name PreviousStateName)
    {
        super(Object).BeginState(PreviousStateName);
        bHasSearchRandomLocation = false;
        if(Role == ROLE_Authority)
        {
            GetRandomSearchLocation();
            SetTimer(TimeBeforeRefreshingTargets, true, 'CheckForTargets');
        }
    }

    simulated function EndState(name EndStateName)
    {
        if(Role == ROLE_Authority)
        {
            ClearTimer('CheckForTargets');
            ClearTimer('GetRandomSearchLocation');
        }
        super(Object).EndState(EndStateName);
    }

    simulated event Tick(float DeltaTime)
    {
        super(KFPawn_AutoTurret).Tick(DeltaTime);
        if(Role == ROLE_Authority)
        {
            if((ReachedRotation()) && !bHasSearchRandomLocation)
            {
                SetTimer(TimeIdlingWhenSearching + RandRange(MinIdlingVariation, MaxIdlingVariation), false, 'GetRandomSearchLocation');
                bHasSearchRandomLocation = true;
            }
        }
    }

    function GetRandomSearchLocation()
    {
        local Rotator NewRotation;

        NewRotation.Yaw += int(RandRange(0, 65536));
        bHasSearchRandomLocation = false;
        RequestRotation(NewRotation);
    }
    stop;    
}

simulated state Combat
{
    simulated function BeginState(name PreviousStateName)
    {
        super(Object).BeginState(PreviousStateName);
        if((WorldInfo.NetMode == NM_Client) || WorldInfo.NetMode == NM_Standalone)
        {
            if(TurretWeaponAttachment != none)
            {
                TurretWeaponAttachment.UpdateLaserColor(true);
            }
        }
    }

    simulated function EndState(name NextStateName)
    {
        ClearTimer('CheckForTargets');
        if((Role == ROLE_Authority) && TurretWeapon != none)
        {
            TurretWeapon.StopFire(0);
        }
        if((WorldInfo.NetMode == NM_Client) || WorldInfo.NetMode == NM_Standalone)
        {
            if(TurretWeaponAttachment != none)
            {
                TurretWeaponAttachment.UpdateLaserColor(false);
            }
        }
        super(Object).EndState(NextStateName);
    }

    simulated event Tick(float DeltaTime)
    {
        local Vector MuzzleLoc;
        local Rotator MuzzleRot, DesiredRotationRot;
        local Vector HitLocation, HitNormal;
        local TraceHitInfo HitInfo;
        local Actor HitActor;
        local float NewAmmoPercentage;

        if(Role == ROLE_Authority)
        {
            TurretWeapon.GetMuzzleLocAndRot(MuzzleLoc, MuzzleRot);
            NewAmmoPercentage = float(TurretWeapon.AmmoCount[0]) / float(TurretWeapon.MagazineCapacity[0]);
            if(NewAmmoPercentage != CurrentAmmoPercentage)
            {
                CurrentAmmoPercentage = NewAmmoPercentage;
                if(WorldInfo.NetMode == NM_Standalone)
                {
                    UpdateTurretMeshMaterialColor(CurrentAmmoPercentage);                    
                }
                else
                {
                    bNetDirty = true;
                }
            }            
        }
        else
        {
            WeaponAttachment.WeapMesh.GetSocketWorldLocationAndRotation('MuzzleFlash', MuzzleLoc, MuzzleRot);
        }
        if(Role == ROLE_Authority)
        {
            if(EnemyTarget != none)
            {
                HitActor = Trace(HitLocation, HitNormal, EnemyTarget.Mesh.GetBoneLocation('Spine1'), MuzzleLoc,,,, 1);
                if(((!EnemyTarget.IsAliveAndWell() || EnemyTarget.bIsCloaking) || VSizeSq(EnemyTarget.Location - Location) > (EffectiveRadius * EffectiveRadius)) || ((HitActor != none) && KFPawn_Monster(HitActor) == none) && KFPawn_Human(HitActor) == none)
                {
                    EnemyTarget = none;
                    CheckForTargets();
                    if(EnemyTarget == none)
                    {
                        SetTurretState(3);
                        return;
                    }
                }
            }
        }
        if(EnemyTarget != none)
        {
            DesiredRotationRot = rotator(Normal(EnemyTarget.Mesh.GetBoneLocation('Spine1') - MuzzleLoc));
            DesiredRotationRot.Roll = 0;
            RotateBySpeed(DesiredRotationRot);
            if(Role == ROLE_Authority)
            {
                HitActor = Trace(HitLocation, HitNormal, MuzzleLoc + (vector(Rotation) * EffectiveRadius), MuzzleLoc,,, HitInfo, 1);
                if(TurretWeapon != none)
                {
                    if(KFPawn_Monster(HitActor) != none)
                    {
                        TurretWeapon.fire();
                        if(!TurretWeapon.HasAmmo(0))
                        {
                            SetTurretState(6);
                        }                        
                    }
                    else
                    {
                        TurretWeapon.StopFire(0);
                    }
                }
            }
        }
        super(KFPawn_AutoTurret).Tick(DeltaTime);
    }
    stop;    
}

simulated state Detonate
{
    function BeginState(name PreviousStateName)
    {
        super(Object).BeginState(PreviousStateName);
        StopIdleSound();
        if(Role == ROLE_Authority)
        {
            TriggerExplosion();
        }
    }

    function TriggerExplosion()
    {
        local KFExplosionActorReplicated ExploActor;

        ExploActor = Spawn(Class'KFExplosionActorReplicated', TurretWeapon,, Location, Rotation,, true);
        if(ExploActor != none)
        {
            ExploActor.InstigatorController = Instigator.Controller;
            ExploActor.Instigator = Instigator;
            ExploActor.Explode(ExplosionTemplate);
        }
        Destroy();
    }
    stop;    
}

simulated state Empty
{
    simulated function BeginState(name PreviousStateName)
    {
        super(Object).BeginState(PreviousStateName);
        if((WorldInfo.NetMode == NM_Client) || WorldInfo.NetMode == NM_Standalone)
        {
            if(NoAmmoFX == none)
            {
                NoAmmoFX = WorldInfo.MyEmitterPool.SpawnEmitter(ParticleSystem'FX_NoAmmo_Sparks', Location);
            }
            SetTimer(0.5, false, 'PlayEmptySound1');
            SetTimer(1, false, 'PlayEmptySound2');
            SetTimer(1.5, false, 'PlayEmptySound3');
            SetTimer(2, false, 'PlayEmptyState');
            UpdateTurretMeshMaterialColor(0);
        }
        if((Role == ROLE_Authority) && !bCanDetonateOnProximityWithAmmo)
        {
            SetTimer(0.25, true, 'CheckEnemiesWithinExplosionRadius');
        }
    }

    simulated function EndState(name NextStateName)
    {
        super(Object).EndState(NextStateName);
    }
    stop;    
}

defaultproperties
{
    begin object name=TurretMesh0 class=SkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_3P_AutoTurret_MESH.drone_SM'
        PhysicsAsset=PhysicsAsset'WEP_3P_AutoTurret_MESH.drone_SM_Physics'
        ReplacementPrimitive=none
        CastShadow=false
        bIgnoreRadialImpulse=true
    object end
    // Reference: SkeletalMeshComponent'Default__KFPawn_AutoTurret.TurretMesh0'
    TurretMesh=TurretMesh0
    DeployZSpeed=800
    DeployHeight=200
    EffectiveRadius=1500
    ExplosiveRadius=100
    AimRotationVel=(Pitch=16384,Yaw=32768,Roll=0)
    CombatRotationVel=(Pitch=16384,Yaw=32768,Roll=0)
    TimeBeforeRefreshingTargets=0.5
    TimeIdlingWhenSearching=1
    MinIdlingVariation=-0.5
    MaxIdlingVariation=1
    begin object name=ExploTemplate0 class=KFGameExplosion
        ExplosionEffects=KFImpactEffectInfo'wep_autoturret_arch.AutoTurret_Explosion'
        DamageRadius=300
        DamageFalloffExponent=0.5
        MyDamageType=Class'KFDT_Explosive_AutoTurret'
        KnockDownStrength=0
        ExplosionSound=AkEvent'WW_WEP_Autoturret.Play_WEP_AutoTurret_Alt_Fire_3P'
        CamShake=KFCameraShake'FX_CameraShake_Arch.Misc_Explosions.Light_Explosion_Rumble'
        CamShakeInnerRadius=200
        CamShakeFalloff=1.5
    object end
    // Reference: KFGameExplosion'Default__KFPawn_AutoTurret.ExploTemplate0'
    ExplosionTemplate=ExploTemplate0
    WeaponDefinition=Class'KFGame.KFWeapDef_AutoTurretWeapon'
    deployUsingOffsetFromPlayerLocation=true
    deployUsingOffsetZ=100
    begin object name=FlyAkComponent0 class=AkComponent
        BoneName=Dummy
        bStopWhenOwnerDestroyed=true
        bForceOcclusionUpdateInterval=true
        OcclusionUpdateInterval=0.2
    object end
    // Reference: AkComponent'Default__KFPawn_AutoTurret.FlyAkComponent0'
    FlyAkComponent=FlyAkComponent0
    begin object name=ThirdPersonHead0 class=SkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: SkeletalMeshComponent'Default__KFPawn_AutoTurret.ThirdPersonHead0'
    ThirdPersonHeadMeshComponent=ThirdPersonHead0
    bIsTurret=true
    AfflictionHandler=KFAfflictionManager'Default__KFPawn_AutoTurret.Afflictions'
    begin object name=FirstPersonArms class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_AutoTurret.FirstPersonArms'
    ArmsMesh=FirstPersonArms
    SpecialMoveHandler=KFSpecialMoveHandler'Default__KFPawn_AutoTurret.SpecialMoveHandler'
    AmbientAkComponent=AkComponent'Default__KFPawn_AutoTurret.AmbientAkSoundComponent_1'
    WeaponAkComponent=AkComponent'Default__KFPawn_AutoTurret.AmbientAkSoundComponent'
    WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'Default__KFPawn_AutoTurret.WeaponAmbientEchoHandler'
    SecondaryWeaponAkComponent=AkComponent'Default__KFPawn_AutoTurret.SecondaryWeaponAkSoundComponent'
    FootstepAkComponent=AkComponent'Default__KFPawn_AutoTurret.FootstepAkSoundComponent'
    DialogAkComponent=AkComponent'Default__KFPawn_AutoTurret.DialogAkSoundComponent'
    PowerUpAkComponent=AkComponent'Default__KFPawn_AutoTurret.PowerUpAkSoundComponent'
    bIgnoreForces=true
    bRunPhysicsWithNoController=true
    begin object name=TurretMesh0 class=SkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_3P_AutoTurret_MESH.drone_SM'
        PhysicsAsset=PhysicsAsset'WEP_3P_AutoTurret_MESH.drone_SM_Physics'
        ReplacementPrimitive=none
        CastShadow=false
        bIgnoreRadialImpulse=true
    object end
    // Reference: SkeletalMeshComponent'Default__KFPawn_AutoTurret.TurretMesh0'
    Mesh=TurretMesh0
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionHeight=30
        CollisionRadius=40
        ReplacementPrimitive=none
        BlockActors=false
        bIgnoreRadialImpulse=true
    object end
    // Reference: CylinderComponent'Default__KFPawn_AutoTurret.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=Sprite class=SpriteComponent
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__KFPawn_AutoTurret.Sprite'
    Components(0)=Sprite
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionHeight=30
        CollisionRadius=40
        ReplacementPrimitive=none
        BlockActors=false
        bIgnoreRadialImpulse=true
    object end
    // Reference: CylinderComponent'Default__KFPawn_AutoTurret.CollisionCylinder'
    Components(1)=CollisionCylinder
    begin object name=Arrow class=ArrowComponent
        ReplacementPrimitive=none
    object end
    // Reference: ArrowComponent'Default__KFPawn_AutoTurret.Arrow'
    Components(2)=Arrow
    begin object name=KFPawnSkeletalMeshComponent class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_AutoTurret.KFPawnSkeletalMeshComponent'
    Components(3)=KFPawnSkeletalMeshComponent
    Components(4)=AkComponent'Default__KFPawn_AutoTurret.AmbientAkSoundComponent'
    Components(5)=AkComponent'Default__KFPawn_AutoTurret.AmbientAkSoundComponent_1'
    Components(6)=AkComponent'Default__KFPawn_AutoTurret.FootstepAkSoundComponent'
    Components(7)=AkComponent'Default__KFPawn_AutoTurret.DialogAkSoundComponent'
    Components(8)=AkComponent'Default__KFPawn_AutoTurret.PowerUpAkSoundComponent'
    Components(9)=AkComponent'Default__KFPawn_AutoTurret.SecondaryWeaponAkSoundComponent'
    begin object name=TurretMesh0 class=SkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_3P_AutoTurret_MESH.drone_SM'
        PhysicsAsset=PhysicsAsset'WEP_3P_AutoTurret_MESH.drone_SM_Physics'
        ReplacementPrimitive=none
        CastShadow=false
        bIgnoreRadialImpulse=true
    object end
    // Reference: SkeletalMeshComponent'Default__KFPawn_AutoTurret.TurretMesh0'
    Components(10)=TurretMesh0
    begin object name=FlyAkComponent0 class=AkComponent
        BoneName=Dummy
        bStopWhenOwnerDestroyed=true
        bForceOcclusionUpdateInterval=true
        OcclusionUpdateInterval=0.2
    object end
    // Reference: AkComponent'Default__KFPawn_AutoTurret.FlyAkComponent0'
    Components(11)=FlyAkComponent0
    bCanBeDamaged=false
    bCollideComplex=true
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionHeight=30
        CollisionRadius=40
        ReplacementPrimitive=none
        BlockActors=false
        bIgnoreRadialImpulse=true
    object end
    // Reference: CylinderComponent'Default__KFPawn_AutoTurret.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}