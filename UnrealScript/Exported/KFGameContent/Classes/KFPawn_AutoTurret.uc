//=============================================================================
// KFPawn_AutoTurret
//=============================================================================
// Base pawn class for autoturret
//=============================================================================
// 2022!
//=============================================================================
class KFPawn_AutoTurret extends KFPawn
	notplaceable;
    


enum ETurretState
{
    ETS_None,
    ETS_Throw,
    ETS_Deploy,
    ETS_TargetSearch,
    ETS_Combat,
    ETS_Detonate,
    ETS_Empty
};

var SkeletalMeshComponent TurretMesh;
var Controller InstigatorController;

/** Speed to rise the drone in Z axis after thrown */
var const float DeployZSpeed;
/** Height (Z axis) the drone should position for deployment */
var const float DeployHeight;
/** Radius to detect enemies */
var const float EffectiveRadius;
/** Radius to trigger explosion */
var const float ExplosiveRadius;
/** Rotation Vel for aiming targets */
var const rotator AimRotationVel;
/** Rotation Vel for aiming targets */
var const rotator CombatRotationVel;
/** Time before refreshing targets */
var const float TimeBeforeRefreshingTargets;
/** Time to idle after rotating to a random position (search) */
var const float TimeIdlingWhenSearching;
/** Min Value to apply randomness to idling */
var const float MinIdlingVariation;
/** Max Value to apply randomness to idling */
var const float MaxIdlingVariation;
/** Pitch requested when out of ammo */
var const int EmptyPitch;
/** Turret Explosion */
var GameExplosion ExplosionTemplate;
/** Weapon the turret carries */
var class<KFWeaponDefinition> WeaponDefinition;
/** WIf explodes when an enemy gets nearby */
var const bool bCanDetonateOnProximityWithAmmo;

var repnotify ETurretState CurrentState;
var repnotify rotator ReplicatedRotation;
var repnotify float CurrentAmmoPercentage;
var repnotify AKEvent TurretWeaponAmbientSound;
var repnotify int WeaponSkinID;
var repnotify int AutoTurretFlashCount;

var transient rotator DeployRotation;

/** Rotation */
var transient rotator RotationStart;
var transient rotator TargetRotation;
var transient float   RotationAlpha;
var transient float   RotationTime;
var transient bool    bRotating;

var transient KFWeap_AutoTurretWeapon TurretWeapon;
var transient KFWeapAttach_AutoTurretWeap TurretWeaponAttachment;

var transient KFWeap_Autoturret OwnerWeapon;

var bool deployUsingOffsetFromPlayerLocation;
var float deployUsingOffsetZ;

var transient vector ThrowInstigatorLocation;
var transient vector GroundLocation; 
var transient vector DeployedLocation;
var transient float RandomSearchLocation;
var transient KFPawn_Monster EnemyTarget;
var transient bool bHasSearchRandomLocation;
var transient byte TeamNum;
var transient bool bRotatingByTime;
var transient MaterialInstanceConstant TurretAttachMIC;

/** Socket name to attach weapon */
const WeaponSocketName = 'WeaponSocket';
const WeaponAttachmentSocketName = 'WeaponAttachment';

const TransitionParamName = 'transition_full_to_empty';
const EmptyParamName = 'Blinking_0_off___1_on';

const DroneFlyingStartAudio = AkEvent'WW_WEP_Autoturret.Play_WEP_AutoTurret_IdleFly';
const DroneFlyingStopAudio = AkEvent'WW_WEP_Autoturret.Stop_WEP_AutoTurret_IdleFly';

var AkComponent FlyAkComponent;

const DroneDryFire = AkEvent'WW_WEP_Autoturret.Play_WEP_AutoTurret_Dron_Dry_Fire';

const NoAmmoSocketName = 'malfunction';
const NoAmmoFXTemplate = ParticleSystem'WEP_AutoTurret_EMIT.FX_NoAmmo_Sparks';
var transient ParticleSystemComponent NoAmmoFX;

replication
{
    if( bNetDirty )
		CurrentState, ReplicatedRotation, CurrentAmmoPercentage, TurretWeaponAmbientSound, EnemyTarget, WeaponSkinID, AutoTurretFlashCount;
}

simulated event ReplicatedEvent(name VarName)
{
	if( VarName == nameof(CurrentState) )
	{
        ChangeState(CurrentState);
    }
    else if (VarName == nameof(ReplicatedRotation))
    {
        RotateBySpeed(ReplicatedRotation);
    }
    else if (VarName == nameof(CurrentAmmoPercentage))
    {
        UpdateTurretMeshMaterialColor(CurrentAmmoPercentage);
    }
    else if (VarName == nameof(TurretWeaponAmbientSound))
    {
        SetWeaponAmbientSound(TurretWeaponAmbientSound);
    }
    else if (VarName == nameof(WeaponSkinID))
    {
        SetWeaponSkin(WeaponSkinID);
    }
    else if (VarName == nameof(AutoTurretFlashCount))
    {
        FlashCountUpdated(Weapon, AutoTurretFlashCount, TRUE);
    }
    else if (VarName == nameof(FlashCount))
    {
        // Intercept Flash Count: do nothing
    }
    else
	{
		super.ReplicatedEvent(VarName);
	}
}

simulated event PreBeginPlay()
{
    local class<KFWeapon> WeaponClass;
    local rotator ZeroRotator;

    super.PreBeginPlay();
    
    WeaponClass = class<KFWeap_AutoTurretWeapon> (DynamicLoadObject(WeaponDefinition.default.WeaponClassPath, class'Class'));
    WeaponClassForAttachmentTemplate = WeaponClass;

    SetMeshVisibility(false);

    if (Role == ROLE_Authority)
    {
        Weapon = Spawn(WeaponClass, self);
        TurretWeapon = KFWeap_AutoTurretWeapon(Weapon);
        MyKFWeapon = TurretWeapon;

        if (Weapon != none)
        {
            Weapon.bReplicateInstigator=true;
            Weapon.bReplicateMovement=true;
            Weapon.Instigator = Instigator;
            TurretWeapon.InstigatorDrone = self;
            Weapon.SetCollision(false, false);
            Weapon.SetBase(self,, TurretMesh, WeaponSocketName);
            TurretMesh.AttachComponentToSocket(Weapon.Mesh, WeaponSocketName);

            Weapon.SetRelativeLocation(vect(0,0,0));
            Weapon.SetRelativeRotation(ZeroRotator);
            Weapon.Mesh.SetOnlyOwnerSee(true);
            MyKFWeapon.Mesh.SetHidden(true);
        }
    }
    if (WorldInfo.NetMode == NM_Client || WorldInfo.NetMode == NM_Standalone)
    {
        /** If this fails, the AutoTurret is still loading from KFWeap_Autoturret.  */
        if (WeaponClass.default.AttachmentArchetype != none)
		{
            SetTurretWeaponAttachment(WeaponClass);
        }
    }
}

simulated function SetTurretWeaponAttachment(class<KFWeapon> WeaponClass)
{
    local KFWeaponAttachment AttachmentTemplate;
    local rotator ZeroRotator;

    if (WeaponAttachment != none)
        return;

    // Create the new Attachment.
    AttachmentTemplate = WeaponClass.default.AttachmentArchetype;
    WeaponAttachment = Spawn(AttachmentTemplate.Class, self,,,, AttachmentTemplate);
    
    if (WeaponAttachment != None)
    {
        WeaponAttachment.SetCollision(false, false);
        WeaponAttachment.Instigator = Instigator;

        TurretMesh.AttachComponentToSocket(WeaponAttachment.WeapMesh, WeaponAttachmentSocketName);
        WeaponAttachment.SetRelativeLocation(vect(0,0,0));
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

    if (Weapon != none)
    {
        Weapon.Instigator = NewInstigator;
    }
    
    KFPH = KFPawn_Human(NewInstigator);
    if (KFPH != none && KFPH.WeaponSkinItemId > 0)
    {
        SetWeaponSkin(KFPH.WeaponSkinItemId);
    }
}

simulated function SetWeaponSkin(int SkinID)
{
    if (Role == Role_Authority)
    {
        WeaponSkinID = SkinID;
        bForceNetUpdate = true;
    }    
    
    if (WeaponAttachment != none)
    {
        WeaponAttachment.SetWeaponSkin(SkinID);
    }
}

simulated function UpdateWeaponUpgrade(int UpgradeIndex)
{
    if (Weapon != none)
    {
        TurretWeapon.SetWeaponUpgradeLevel(UpgradeIndex);
    }
}

/**
    Object states
 */
function SetTurretState(ETurretState State)
{
    if (CurrentState == State)
        return;

    ChangeState(State);

    CurrentState = State;
    bForceNetUpdate = true;
}

function UpdateReadyToUse(bool bReady)
{
    if (OwnerWeapon != none)
    {
        OwnerWeapon.SetReadyToUse(bReady);
    }
}

simulated function ChangeState(ETurretState State)
{
    switch(State)
    {
        case ETS_None:
            break;
        case ETS_Throw:
            GotoState('Throw');
            break;
        case ETS_Deploy:
            GotoState('Deploy');
            break;
        case ETS_TargetSearch:
            GotoState('TargetSearch');
            break;
        case ETS_Combat:
            GotoState('Combat');
            break;
        case ETS_Detonate:
            GotoState('Detonate');
            break;
        case ETS_Empty:
            GotoState('Empty');
            break;
        default:
            break;
    }
}

auto simulated state Throw
{
    simulated function BeginState(name PreviousStateName)
	{
		super.BeginState(PreviousStateName);

        ThrowInstigatorLocation = Instigator.Location;

        if (Role == Role_Authority)
        {
            UpdateReadyToUse(false);
        }
    }

    simulated event Landed(vector HitNormal, actor FloorActor)
    {
        super.Landed(HitNormal, FloorActor);

        if (Role == ROLE_Authority)
        {
            GroundLocation = Location;
            DeployRotation = Rotation;

            SetTurretState(ETS_Deploy);
        }      
    }

    simulated event Tick(float DeltaTime)
    {
        if (deployUsingOffsetFromPlayerLocation)
        {
            // If the drone goes below the offset, prevent from falling more
            if (Location.Z < (ThrowInstigatorLocation.z - deployUsingOffsetZ))
            {
                GroundLocation = Location;
                DeployRotation = Rotation;

                SetTurretState(ETS_Deploy);
            }
        }

        super.Tick(DeltaTime);
    }
}

simulated state Deploy
{
    simulated function BeginState(name PreviousStateName)
	{
        local float AnimDuration;

		super.BeginState(PreviousStateName);

        if (TurretWeaponAttachment != none)
        {
            AnimDuration = TurretWeaponAttachment.PlayDeployAnim();
            SetTimer(AnimDuration, false, nameof(StartIdleAnim));
        }

        SetPhysics(PHYS_FLYING);
 
        if (Role == ROLE_Authority)
        {
            Velocity = vect(0,0,1) * DeployZSpeed;
            UpdateReadyToUse(false);
        }
    }

	simulated event Tick(float DeltaTime)
    {
		local float CurrentHeight;
        local vector LocationNext;

        super.Tick(DeltaTime);

        LocationNext = Location;
        LocationNext.z += Velocity.z * DeltaTime;

        // If there's little to no movement or we are going to collide
        if (Velocity.z <= 0.01f || !FastTrace(LocationNext, Location, vect(25,25,25)))
        {
            SetTurretState(ETS_TargetSearch);
        }
        else
        {
            // Check height to change state
            CurrentHeight = Location.Z - GroundLocation.Z;
            if (CurrentHeight >= DeployHeight)
            {
                SetTurretState(ETS_TargetSearch);
            }
        }
    }

    simulated function EndState(name NextStateName)
    {
        super.EndState(NextStateName);
        DeployedLocation = Location;

        Velocity = vect(0,0,0);

        if (Role == ROLE_Authority)
        {
            UpdateReadyToUse(true);

            if (bCanDetonateOnProximityWithAmmo)
            {
                SetTimer(0.25f, true, nameof(CheckEnemiesWithinExplosionRadius));
            }
        }
    }
}

simulated state TargetSearch
{
    simulated function BeginState(name PreviousStateName)
	{
		super.BeginState(PreviousStateName);

        bHasSearchRandomLocation = false;

        if (Role == ROLE_Authority)
        {
            GetRandomSearchLocation();
            // bHasSearchRandomLocation=true;

            SetTimer(TimeBeforeRefreshingTargets, true, nameof(CheckForTargets));
        }
    }

    simulated function EndState(name EndStateName)
    {
        if (Role == ROLE_Authority)
        {
            ClearTimer(nameof(CheckForTargets));
            ClearTimer(nameof(GetRandomSearchLocation));
        }

        super.EndState(EndStateName);
    }

    simulated event Tick( float DeltaTime )
    {
        super.Tick(DeltaTime);

        if (Role == ROLE_Authority)
        {
            if (ReachedRotation() && !bHasSearchRandomLocation)
            {
                SetTimer( TimeIdlingWhenSearching + RandRange(MinIdlingVariation, MaxIdlingVariation), false, nameof(GetRandomSearchLocation));
                bHasSearchRandomLocation = true;
            }
        }
    }

    function GetRandomSearchLocation()
    {
        local rotator NewRotation;

        NewRotation.Yaw += RandRange(0,65536);
        bHasSearchRandomLocation = false;

        RequestRotation(NewRotation);
    }
}

simulated state Combat
{
    simulated function BeginState(name PreviousStateName)
	{
		super.BeginState(PreviousStateName);

        /*if (Role == ROLE_Authority)
        {
            SetTimer(TimeBeforeRefreshingTargets, true, nameof(CheckForTargets));
        }*/

        if (WorldInfo.NetMode == NM_Client || WorldInfo.NetMode == NM_Standalone)
        {
            if (TurretWeaponAttachment != none)
            {
                TurretWeaponAttachment.UpdateLaserColor(true);
            }
        }
    }

    simulated function EndState(name NextStateName)
    {
        ClearTimer(nameof(CheckForTargets));

        if (Role == ROLE_Authority && TurretWeapon != none)
        {
            TurretWeapon.StopFire(0);
        }

        if (WorldInfo.NetMode == NM_Client || WorldInfo.NetMode == NM_Standalone)
        {
            if (TurretWeaponAttachment != none)
            {
                TurretWeaponAttachment.UpdateLaserColor(false);
            }
        }

        super.EndState(NextStateName);
    }

    simulated event Tick( float DeltaTime )
    {
        local vector MuzzleLoc;
        local rotator MuzzleRot;
        local rotator DesiredRotationRot;

        local vector HitLocation, HitNormal;
        local TraceHitInfo HitInfo;
        local Actor HitActor;

        local float NewAmmoPercentage;

        if (Role == ROLE_Authority)
        {
            TurretWeapon.GetMuzzleLocAndRot(MuzzleLoc, MuzzleRot);

            NewAmmoPercentage = float(TurretWeapon.AmmoCount[0]) / TurretWeapon.MagazineCapacity[0];
            
            if (NewAmmoPercentage != CurrentAmmoPercentage)
            {
                CurrentAmmoPercentage = NewAmmoPercentage;

                if (WorldInfo.NetMode == NM_Standalone)
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

        if (Role == ROLE_Authority)
        {
            if (EnemyTarget != none)
            {
                // Trace from the Target reference to MuzzleLoc, because MuzzleLoc could be already inside physics, as it's outside the collider of the Drone!
                HitActor = Trace(HitLocation, HitNormal, EnemyTarget.Mesh.GetBoneLocation('Spine1'), MuzzleLoc,,,,TRACEFLAG_Bullet);

                /** Search for new enemies if current is dead, cloaked or too far, or something between the drone and the target except a player */
                if (!EnemyTarget.IsAliveAndWell()
                    || EnemyTarget.bIsCloaking
                    || VSizeSq(EnemyTarget.Location - Location) > EffectiveRadius * EffectiveRadius
                    || (HitActor != none && KFPawn_Monster(HitActor) == none && KFPawn_Human(HitActor) == none))
                {
                    EnemyTarget = none;
                    CheckForTargets();

                    if (EnemyTarget == none)
                    {
                        SetTurretState(ETS_TargetSearch);
                        return;
                    }
                }
            }
        }
        
        if (EnemyTarget != none)
        {
            DesiredRotationRot = rotator(Normal(EnemyTarget.Mesh.GetBoneLocation('Spine1') - MuzzleLoc));
            DesiredRotationRot.Roll  = 0;

            RotateBySpeed(DesiredRotationRot);

            if (Role == ROLE_Authority)
            {
                HitActor = Trace(HitLocation, HitNormal, MuzzleLoc + vector(Rotation) * EffectiveRadius, MuzzleLoc, , , HitInfo, TRACEFLAG_Bullet);
                
                if (TurretWeapon != none)
                {
                    if (KFPawn_Monster(HitActor) != none)
                    {
                        TurretWeapon.Fire();
                        
                        if (!TurretWeapon.HasAmmo(0))
                        {
                            SetTurretState(ETS_Empty);
                        }
                    }
                    else
                    {
                        TurretWeapon.StopFire(0);
                    }
                }
            }
        }

        super.Tick(DeltaTime);
    }
}

simulated state Detonate
{
    function BeginState(name PreviousStateName)
	{
		super.BeginState(PreviousStateName);
        
        StopIdleSound();

        if (Role == ROLE_Authority)
        {
            TriggerExplosion();
        }
    }

    function TriggerExplosion()
    {
        local KFExplosionActorReplicated ExploActor;

        // explode using the given template
        ExploActor = Spawn(class'KFExplosionActorReplicated', TurretWeapon,, Location, Rotation,, true);
        if (ExploActor != None)
        {
            ExploActor.InstigatorController = Instigator.Controller;
            ExploActor.Instigator = Instigator;

            ExploActor.Explode(ExplosionTemplate);
        }

        Destroy();
    }
}

simulated state Empty
{
    simulated function BeginState(name PreviousStateName)
	{
		super.BeginState(PreviousStateName);
        
        if (WorldInfo.NetMode == NM_Client || WorldInfo.NetMode == NM_Standalone)
        {   
            // Attach No Ammo VFX
            if (NoAmmoFX == none)
            {
                NoAmmoFX = WorldInfo.MyEmitterPool.SpawnEmitter(NoAmmoFXTemplate, Location);                                              
            }

            // Play dry sound 2 or 3 times
            SetTimer(0.5f, false, 'PlayEmptySound1');
            SetTimer(1.f, false, 'PlayEmptySound2');
            SetTimer(1.5f, false, 'PlayEmptySound3');

            // When sound finish play animation
            SetTimer(2.f, false, 'PlayEmptyState');

            UpdateTurretMeshMaterialColor(0.0f);
        }
        
        if (Role == ROLE_Authority && !bCanDetonateOnProximityWithAmmo)
        {
            SetTimer(0.25f, true, nameof(CheckEnemiesWithinExplosionRadius));
        }
    }

    simulated function EndState(name NextStateName)
    {
        super.EndState(NextStateName);
    }
}

// We can't use the same delegate, hence we create 3 functions..

simulated function PlayEmptySound1()
{
    PlaySoundBase(DroneDryFire);
}

simulated function PlayEmptySound2()
{
    PlaySoundBase(DroneDryFire);
}

simulated function PlayEmptySound3()
{
    PlaySoundBase(DroneDryFire);
}

simulated function PlayEmptyState()
{
    if (TurretWeaponAttachment != none)
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
    local TraceHitInfo   HitInfo;    

    local float CurrentDistance;
    local float Distance;

    local vector MuzzleLoc;
    local rotator MuzzleRot;

	local vector HitLocation, HitNormal;
    local Actor HitActor;

    if (EnemyTarget != none)
    {
        CurrentDistance = VSizeSq(Location - EnemyTarget.Location);
    }
    else
    {
        CurrentDistance = 9999.f;
    }

    TurretWeapon.GetMuzzleLocAndRot(MuzzleLoc, MuzzleRot);
    
    foreach CollidingActors(class'KFPawn_Monster', CurrentTarget, EffectiveRadius, Location, true,, HitInfo)
    {
        // Trace from the Target reference to MuzzleLoc, because MuzzleLoc could be already inside physics, as it's outside the collider of the Drone!
        HitActor = Trace(HitLocation, HitNormal, CurrentTarget.Mesh.GetBoneLocation('Spine1'), MuzzleLoc,,,,TRACEFLAG_Bullet);

        if (!CurrentTarget.IsAliveAndWell() || CurrentTarget.bIsCloaking || HitActor == none || KFPawn_Monster(HitActor) == none)
        {
            continue;
        }

        Distance = VSizeSq(Location - CurrentTarget.Location);

        if (EnemyTarget == none)
        {
            EnemyTarget = CurrentTarget;
            CurrentDistance = Distance;
        }
        else if (CurrentDistance > Distance)
        {
            EnemyTarget = CurrentTarget;
            CurrentDistance = Distance;
        }
    }

    if (EnemyTarget != none)
    {
        SetTurretState(ETS_Combat);
    }
}

////////////////////////////////////////////////////////////

simulated event Destroyed()
{
    local KFWeap_AutoTurret WeapOwner;

    StopIdleSound();

    WeapOwner = KFWeap_AutoTurret(Owner);

    if (WeapOwner != none)
    {
        WeapOwner.RemoveDeployedTurret(,self);
    }

    ClearTimer(nameof(CheckEnemiesWithinExplosionRadius));

    if (NoAmmoFX != none)
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
    CheckExplosionLocation.z -= DeployHeight * 0.5f;

    if (CheckExplosionLocation.z < GroundLocation.z)
    {
        CheckExplosionLocation.z = GroundLocation.z;
    }

    //DrawDebugSphere(CheckExplosionLocation, ExplosiveRadius, 10, 255, 255, 0 );

    foreach CollidingActors(class'KFPawn_Monster', KFPM, ExplosiveRadius, CheckExplosionLocation, true,,)
    {
        if(KFPM != none && KFPM.IsAliveAndWell())
        {
            SetTurretState(ETS_Detonate);
            return;
        }
    }
}

simulated function StartIdleAnim()
{
    if (TurretWeaponAttachment != none)
    {
        TurretWeaponAttachment.PlayIdleAnim();

        FlyAkComponent.PlayEvent(DroneFlyingStartAudio, true, true);
    }
}

simulated event Tick(float DeltaTime)
{
    local rotator NewRotationRate;

    /** This gets reset somehow and causes issues with the rotation */
    RotationRate = NewRotationRate;

    if (bRotating)
    {
        UpdateRotation(DeltaTime);
    }

    super.Tick(DeltaTime);
}

simulated function UpdateRotation(float DeltaTime)
{
    local rotator RotationDiff;
    local rotator RotationStep;
    local rotator NewRotation;
    local rotator RotationSpeed;
    local int Sign;

    if (bRotating)
    {
        if (bRotatingByTime) /** Rotate in an amount of time */
        {
            if(RotationAlpha < RotationTime)
            {
                RotationAlpha += DeltaTime;
            
                RotationStep = RLerp(RotationStart, TargetRotation, FMin(RotationAlpha / RotationTime, 1.0f), true);
                RotationStep.Roll = 0.0f;

                RotationStep.Yaw = RotationStep.Yaw % 65536;
                RotationStep.Pitch = RotationStep.Pitch % 65536;
                
                if (RotationStep.Yaw < 0)
                    RotationStep.Yaw += 65536;

                if (RotationStep.Pitch < 0)
                    RotationStep.Pitch += 65536;

                SetRotation(RotationStep);
            }
            else
            {
                bRotating = false;   
            }
        }
        else /** Rotate By Speed */
        {
            RotationSpeed = CurrentState == ETS_Combat ? CombatRotationVel : AimRotationVel;

            RotationDiff = TargetRotation - Rotation;

            RotationDiff.Yaw   = NormalizeRotAxis(RotationDiff.Yaw);
            RotationDiff.Pitch = NormalizeRotAxis(RotationDiff.Pitch);
            RotationDiff.Roll  = NormalizeRotAxis(RotationDiff.Roll);

            Sign = RotationDiff.Yaw >= 0? 1 : -1;
            RotationStep.Yaw = RotationSpeed.Yaw * DeltaTime * Sign;
            if (Abs(RotationStep.Yaw) > Abs(RotationDiff.Yaw))
            {
                RotationStep.Yaw = RotationDiff.Yaw;
            }

            Sign = RotationDiff.Pitch >= 0? 1 : -1;
            RotationStep.Pitch = RotationSpeed.Pitch * DeltaTime * Sign;
            if (Abs(RotationStep.Pitch) > Abs(RotationDiff.Pitch))
            {
                RotationStep.Pitch = RotationDiff.Pitch;
            }

            RotationStep.Roll = 0.0f;

            NewRotation = Rotation + RotationStep;
            NewRotation.Yaw   = NewRotation.Yaw % 65536;
            NewRotation.Pitch = NewRotation.Pitch % 65536;
            
            if (NewRotation.Yaw < 0)
                NewRotation.Yaw += 65536;

            if (NewRotation.Pitch < 0)
                NewRotation.Pitch += 65536;

            SetRotation(NewRotation);

            if (ReachedRotation())
            {
                bRotating = false;
            }
        }
    }
}

simulated function RotateByTime(rotator NewRotation, float Time)
{
    if (NewRotation != Rotation)
    {
        RotationStart   = Rotation;
        TargetRotation  = NewRotation;
        RotationAlpha   = 0.0;
        RotationTime    = Time;
        bRotating       = true;
        bRotatingByTime = true;
    }
}

simulated function RotateBySpeed(rotator NewRotation)
{
    TargetRotation  = NewRotation;
    RotationAlpha   = 0.0f;
    RotationTime    = 0.0f;
    bRotating       = true;
    bRotatingByTime = false;
}

simulated event byte ScriptGetTeamNum()
{
	return TeamNum;
}

simulated function RequestRotation(rotator NewRotation)
{
    if (Role == ROLE_Authority)
    {
        /** Set rotation the same as its going to be replicated **/
        ReplicatedRotation.Yaw   = ((NewRotation.Yaw >> 8) & 255) << 8;
        ReplicatedRotation.Pitch = ((NewRotation.Pitch >> 8) & 255) << 8;
        
        bForceNetUpdate = true;
    }

    RotateBySpeed(ReplicatedRotation);
}

simulated function bool ReachedRotation(int DeltaError = 2000)
{
    local int YawDiff;
    YawDiff = Abs((TargetRotation.Yaw & 65535) - (Rotation.Yaw & 65535));
    return (YawDiff < DeltaError) || (YawDiff > 65535 - DeltaError);
}

event TakeDamage(int Damage, Controller InstigatedBy, vector HitLocation, vector Momentum, class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser)
{
}

simulated function TakeRadiusDamage(
	Controller			InstigatedBy,
	float				BaseDamage,
	float				DamageRadius,
	class<DamageType>	DamageType,
	float				Momentum,
	vector				HurtOrigin,
	bool				bFullDamage,
	Actor               DamageCauser,
	optional float      DamageFalloffExponent=1.f
)
{}

function bool CanAITargetThisPawn(Controller TargetingController)
{
    return false;
}

simulated function UpdateTurretMeshMaterialColor(float Value)
{
    if (TurretWeaponAttachment == none)
    {
        return;
    }

    if (TurretAttachMIC == none)
    {
        TurretAttachMIC = TurretWeaponAttachment.WeapMesh.CreateAndSetMaterialInstanceConstant(0);
    }
    
    if (TurretAttachMIC != none)
    {
        TurretAttachMIC.SetScalarParameterValue(TransitionParamName, 1.0f - Value);
		TurretAttachMIC.SetScalarParameterValue(EmptyParamName, Value == 0.0f ? 1 : 0);
    }
}

/** No AutoAim */
simulated function bool GetAutoTargetBones(out array<name> WeakBones, out array<name> NormalBones)
{
	return false;
}

simulated function SetWeaponAmbientSound(AkEvent NewAmbientSound, optional AkEvent FirstPersonAmbientSound)
{
    super.SetWeaponAmbientSound(NewAmbientSound, FirstPersonAmbientSound);

    if (WorldInfo.NetMode == NM_DedicatedServer)
    {
        TurretWeaponAmbientSound = NewAmbientSound;
        bNetDirty = true;
    }
}

/**
 * This function's responsibility is to signal clients that non-instant hit shot
 * has been fired. Call this on the server and local player.
 *
 * Network: Server and Local Player
 */
simulated function IncrementFlashCount(Weapon InWeapon, byte InFiringMode)
{
    Super.IncrementFlashCount(InWeapon, InFiringMode);
    AutoTurretFlashCount = FlashCount;
    // bNetDirty = true;
    bForceNetUpdate = true;
}

simulated function ClearFlashCount(Weapon InWeapon)
{
    Super.ClearFlashCount(InWeapon);

    AutoTurretFlashCount = FlashCount;
    bForceNetUpdate=true;
}

defaultproperties
{
   Begin Object Class=SkeletalMeshComponent Name=TurretMesh0
      SkeletalMesh=SkeletalMesh'WEP_3P_AutoTurret_MESH.drone_SM'
      PhysicsAsset=PhysicsAsset'WEP_3P_AutoTurret_MESH.drone_SM_Physics'
      ReplacementPrimitive=None
      CastShadow=False
      bIgnoreRadialImpulse=True
      Name="TurretMesh0"
      ObjectArchetype=SkeletalMeshComponent'Engine.Default__SkeletalMeshComponent'
   End Object
   TurretMesh=TurretMesh0
   DeployZSpeed=800.000000
   DeployHeight=200.000000
   EffectiveRadius=1500.000000
   ExplosiveRadius=100.000000
   AimRotationVel=(Pitch=16384,Yaw=32768,Roll=0)
   CombatRotationVel=(Pitch=16384,Yaw=32768,Roll=0)
   TimeBeforeRefreshingTargets=0.500000
   TimeIdlingWhenSearching=1.000000
   MinIdlingVariation=-0.500000
   MaxIdlingVariation=1.000000
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFPawn_AutoTurret:ExploTemplate0'
   WeaponDefinition=Class'KFGame.KFWeapDef_AutoTurretWeapon'
   deployUsingOffsetFromPlayerLocation=True
   deployUsingOffsetZ=100.000000
   Begin Object Class=AkComponent Name=FlyAkComponent0
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.200000
      Name="FlyAkComponent0"
      ObjectArchetype=AkComponent'AkAudio.Default__AkComponent'
   End Object
   FlyAkComponent=FlyAkComponent0
   Begin Object Class=SkeletalMeshComponent Name=ThirdPersonHead0 Archetype=SkeletalMeshComponent'KFGame.Default__KFPawn:ThirdPersonHead0'
      ReplacementPrimitive=None
      bAcceptsDynamicDecals=True
      Name="ThirdPersonHead0"
      ObjectArchetype=SkeletalMeshComponent'KFGame.Default__KFPawn:ThirdPersonHead0'
   End Object
   ThirdPersonHeadMeshComponent=ThirdPersonHead0
   bIsTurret=True
   Begin Object Class=KFAfflictionManager Name=Afflictions_0 Archetype=KFAfflictionManager'KFGame.Default__KFPawn:Afflictions_0'
      FireFullyCharredDuration=2.500000
      FireCharPercentThreshhold=0.250000
      Name="Afflictions_0"
      ObjectArchetype=KFAfflictionManager'KFGame.Default__KFPawn:Afflictions_0'
   End Object
   AfflictionHandler=KFAfflictionManager'kfgamecontent.Default__KFPawn_AutoTurret:Afflictions_0'
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonArms Archetype=KFSkeletalMeshComponent'KFGame.Default__KFPawn:FirstPersonArms'
      bIgnoreControllersWhenNotRendered=True
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bAllowPerObjectShadows=True
      Name="FirstPersonArms"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFPawn:FirstPersonArms'
   End Object
   ArmsMesh=FirstPersonArms
   Begin Object Class=KFSpecialMoveHandler Name=SpecialMoveHandler_0 Archetype=KFSpecialMoveHandler'KFGame.Default__KFPawn:SpecialMoveHandler_0'
      Name="SpecialMoveHandler_0"
      ObjectArchetype=KFSpecialMoveHandler'KFGame.Default__KFPawn:SpecialMoveHandler_0'
   End Object
   SpecialMoveHandler=KFSpecialMoveHandler'kfgamecontent.Default__KFPawn_AutoTurret:SpecialMoveHandler_0'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_1 Archetype=AkComponent'KFGame.Default__KFPawn:AmbientAkSoundComponent_1'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      Name="AmbientAkSoundComponent_1"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn:AmbientAkSoundComponent_1'
   End Object
   AmbientAkComponent=AmbientAkSoundComponent_1
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_0 Archetype=AkComponent'KFGame.Default__KFPawn:AmbientAkSoundComponent_0'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="AmbientAkSoundComponent_0"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn:AmbientAkSoundComponent_0'
   End Object
   WeaponAkComponent=AmbientAkSoundComponent_0
   Begin Object Class=KFWeaponAmbientEchoHandler Name=WeaponAmbientEchoHandler_0 Archetype=KFWeaponAmbientEchoHandler'KFGame.Default__KFPawn:WeaponAmbientEchoHandler_0'
      Name="WeaponAmbientEchoHandler_0"
      ObjectArchetype=KFWeaponAmbientEchoHandler'KFGame.Default__KFPawn:WeaponAmbientEchoHandler_0'
   End Object
   WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'kfgamecontent.Default__KFPawn_AutoTurret:WeaponAmbientEchoHandler_0'
   Begin Object Class=AkComponent Name=SecondaryWeaponAkSoundComponent Archetype=AkComponent'KFGame.Default__KFPawn:SecondaryWeaponAkSoundComponent'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="SecondaryWeaponAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn:SecondaryWeaponAkSoundComponent'
   End Object
   SecondaryWeaponAkComponent=SecondaryWeaponAkSoundComponent
   Begin Object Class=AkComponent Name=FootstepAkSoundComponent Archetype=AkComponent'KFGame.Default__KFPawn:FootstepAkSoundComponent'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="FootstepAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn:FootstepAkSoundComponent'
   End Object
   FootstepAkComponent=FootstepAkSoundComponent
   Begin Object Class=AkComponent Name=DialogAkSoundComponent Archetype=AkComponent'KFGame.Default__KFPawn:DialogAkSoundComponent'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      Name="DialogAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn:DialogAkSoundComponent'
   End Object
   DialogAkComponent=DialogAkSoundComponent
   Begin Object Class=AkComponent Name=PowerUpAkSoundComponent Archetype=AkComponent'KFGame.Default__KFPawn:PowerUpAkSoundComponent'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="PowerUpAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn:PowerUpAkSoundComponent'
   End Object
   PowerUpAkComponent=PowerUpAkSoundComponent
   bIgnoreForces=True
   bRunPhysicsWithNoController=True
   Mesh=TurretMesh0
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFPawn:CollisionCylinder'
      CollisionHeight=30.000000
      CollisionRadius=40.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockZeroExtent=False
      bIgnoreRadialImpulse=True
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFPawn:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'KFGame.Default__KFPawn:Sprite'
      SpriteCategoryName="Pawns"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'KFGame.Default__KFPawn:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=CollisionCylinder
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'KFGame.Default__KFPawn:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      SpriteCategoryName="Pawns"
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'KFGame.Default__KFPawn:Arrow'
   End Object
   Components(2)=Arrow
   Begin Object Class=KFSkeletalMeshComponent Name=KFPawnSkeletalMeshComponent Archetype=KFSkeletalMeshComponent'KFGame.Default__KFPawn:KFPawnSkeletalMeshComponent'
      MinDistFactorForKinematicUpdate=0.200000
      bSkipAllUpdateWhenPhysicsAsleep=True
      bIgnoreControllersWhenNotRendered=True
      bHasPhysicsAssetInstance=True
      bUpdateKinematicBonesFromAnimation=False
      bPerBoneMotionBlur=True
      bOverrideAttachmentOwnerVisibility=True
      bChartDistanceFactor=True
      ReplacementPrimitive=None
      RBChannel=RBCC_Pawn
      RBDominanceGroup=20
      bOwnerNoSee=True
      bAcceptsDynamicDecals=True
      bUseOnePassLightingOnTranslucency=True
      CollideActors=True
      BlockZeroExtent=True
      BlockRigidBody=True
      RBCollideWithChannels=(Default=True,Pawn=True,Vehicle=True,BlockingVolume=True)
      Translation=(X=0.000000,Y=0.000000,Z=-86.000000)
      ScriptRigidBodyCollisionThreshold=200.000000
      PerObjectShadowCullDistance=2500.000000
      bAllowPerObjectShadows=True
      TickGroup=TG_DuringAsyncWork
      Name="KFPawnSkeletalMeshComponent"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFPawn:KFPawnSkeletalMeshComponent'
   End Object
   Components(3)=KFPawnSkeletalMeshComponent
   Components(4)=AmbientAkSoundComponent_0
   Components(5)=AmbientAkSoundComponent_1
   Components(6)=FootstepAkSoundComponent
   Components(7)=DialogAkSoundComponent
   Components(8)=PowerUpAkSoundComponent
   Components(9)=SecondaryWeaponAkSoundComponent
   Components(10)=TurretMesh0
   Components(11)=FlyAkComponent0
   bAlwaysRelevant=True
   bCanBeDamaged=False
   bCollideComplex=True
   CollisionComponent=CollisionCylinder
   Name="Default__KFPawn_AutoTurret"
   ObjectArchetype=KFPawn'KFGame.Default__KFPawn'
}
