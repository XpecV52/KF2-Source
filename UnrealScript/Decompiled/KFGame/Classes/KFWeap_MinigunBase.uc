/*******************************************************************************
 * KFWeap_MinigunBase generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_MinigunBase extends KFWeapon
    abstract
    native
    nativereplication
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

var bool bWindUpReady;
var bool bZoomActive;
var repnotify bool bWindUpModeActive;
var repnotify bool bStoredWindUpMode;
var repnotify bool bFiringModeActive;
var bool bReplicatedFiringModeActive;
var float WindUpActivationTime;
var transient float WindUpControlTime;
var float WindUpRotationSpeed;
var CylinderRotationInfo CylinderRotInfo;
var repnotify float ReplicatedWindUpControlTime;
var float WindUpViewRotationSpeed;
var float WindUpPawnMovementSpeed;
var float FiringViewRotationSpeed;
var float FiringPawnMovementSpeed;

replication
{
     if(bNetDirty && Role == ROLE_Authority)
        ReplicatedWindUpControlTime, bFiringModeActive, 
        bStoredWindUpMode, bWindUpModeActive;
}

simulated event ReplicatedEvent(name VarName)
{
    switch(VarName)
    {
        case 'bWindUpModeActive':
            bReplicatedFiringModeActive = bWindUpModeActive || bFiringModeActive;
            NotifyRotationState();
            break;
        case 'bStoredWindUpMode':
            NotifyRotationState();
            break;
        case 'bFiringModeActive':
            bReplicatedFiringModeActive = bWindUpModeActive || bFiringModeActive;
            NotifyRotationState();
            break;
        case 'ReplicatedWindUpControlTime':
            if((Instigator == none) || !Instigator.IsLocallyControlled())
            {
                WindUpControlTime = ReplicatedWindUpControlTime;
            }
            break;
        default:
            break;
    }
}

simulated event PostInitAnimTree(SkeletalMeshComponent SkelComp)
{
    super.PostInitAnimTree(SkelComp);
    PostInitAnimTreeMinigun(SkelComp);
}

simulated event PostInitAnimTreeMinigun(SkeletalMeshComponent SkelComp)
{
    CylinderRotInfo.Control = SkelControlSingleBone(SkelComp.FindSkelControl('CylinderControl'));
    if(CylinderRotInfo.Control != none)
    {
        CylinderRotInfo.Control.SetSkelControlActive(true);
    }
}

// Export UKFWeap_MinigunBase::execUpdateCylinderRotation(FFrame&, void* const)
native simulated function UpdateCylinderRotation(out CylinderRotationInfo RotInfo, float Degrees);

simulated event float GetPerkFireRateModifier()
{
    local KFPerk_Commando Perk;

    Perk = KFPerk_Commando(GetPerk());
    if((WorldInfo.TimeDilation < float(1)) && Perk != none)
    {
        return Perk.GetZedTimeModifierForWindUp();
    }
    return 0;
}

simulated function Activate()
{
    local KFPlayerController KFPC;
    local KFPlayerInput KFPI;

    super.Activate();
    if(!WeaponContentLoaded || Instigator == none)
    {
        return;
    }
    KFPC = KFPlayerController(Instigator.Controller);
    if((KFPC != none) && KFPC.PlayerInput != none)
    {
        KFPI = KFPlayerInput(KFPC.PlayerInput);
        if((KFPI != none) && KFPI.bIronsightsActive)
        {
            SetIronSights(true);
        }
    }
}

simulated event Vector GetMuzzleLoc()
{
    local Rotator ViewRotation;

    if(Instigator != none)
    {
        ViewRotation = Instigator.GetViewRotation();
        if(KFPlayerController(Instigator.Controller) != none)
        {
            ViewRotation += KFPlayerController(Instigator.Controller).WeaponBufferRotation;
        }
        return Instigator.GetPawnViewLocation() + (FireOffset >> ViewRotation);
    }
    return Location;
}

simulated function BeginFire(byte FireModeNum)
{
    if(FireModeNum == 0)
    {
        bFiringModeActive = true;
        bForceNetUpdate = true;
    }
    super.BeginFire(FireModeNum);
}

simulated function EndFire(byte FireModeNum)
{
    if(FireModeNum == 0)
    {
        bFiringModeActive = false;
        bForceNetUpdate = true;
    }
    super(Weapon).EndFire(FireModeNum);
}

simulated function bool ShouldOwnerWalk()
{
    return IsFiring();
}

simulated function SetWeaponSprint(bool bNewSprintStatus)
{
    if(bNewSprintStatus && bWindUpModeActive)
    {
        WindUp(false);
        UpdateZoom();
    }
    super.SetWeaponSprint(bNewSprintStatus);
}

simulated function bool AllowIronSights()
{
    return true;
}

simulated function bool IsUsingSights()
{
    return bWindUpModeActive;
}

simulated function SetIronSights(bool bNewIronSights)
{
    if(!Instigator.IsLocallyControlled())
    {
        return;
    }
    ServerSetIronSights(bNewIronSights);
    bStoredWindUpMode = bNewIronSights;
    if((GetStateName() == 'Reloading') || GetStateName() == 'WeaponSprinting')
    {
        WindUp(false);
        UpdateZoom();
        return;
    }
    PlayIdleAnim();
    WindUp(bNewIronSights);
    UpdateZoom();
    bForceNetUpdate = true;
}

reliable server function ServerSetIronSights(bool bNewIronSights)
{
    bStoredWindUpMode = bNewIronSights;
    if((GetStateName() == 'Reloading') || GetStateName() == 'WeaponSprinting')
    {
        WindUp(false);
        UpdateZoom();
        return;
    }
    WindUp(bNewIronSights);
    UpdateZoom();
}

simulated function WindUp(bool bWindUpActive)
{
    bWindUpModeActive = bWindUpActive;
    NotifyRotationState();
}

simulated function NotifyRotationState()
{
    local KFPawn KFPawn;
    local KFWeapAttach_Minigun KFWeapAttach;

    KFPawn = KFPawn(Instigator);
    KFWeapAttach = KFWeapAttach_Minigun(KFPawn.WeaponAttachment);
    if(KFWeapAttach != none)
    {
        KFWeapAttach.UpdateWindUp((bReplicatedFiringModeActive || bWindUpModeActive) || IsFiring());
    }
}

simulated function UpdateZoom()
{
    local bool bNewZoomStatus;

    if(!Instigator.IsLocallyControlled())
    {
        return;
    }
    bNewZoomStatus = bWindUpModeActive || IsFiring();
    if(bZoomActive == bNewZoomStatus)
    {
        return;
    }
    bZoomActive = bNewZoomStatus;
    PerformZoom(bZoomActive);
}

simulated event OnZoomInFinished();

simulated event OnZoomOutFinished();

simulated event Tick(float DeltaTime)
{
    local KFPawn_Human OwnerHuman;
    local KFPlayerController OwnerController;
    local float NewMovementSpeedMod, NewRotationSpeedLimit;

    super.Tick(DeltaTime);
    if((WorldInfo.NetMode == NM_DedicatedServer) || WorldInfo.NetMode == NM_ListenServer)
    {
        ReplicatedWindUpControlTime = WindUpControlTime;
    }
    if(Role == ROLE_Authority)
    {
        OwnerHuman = KFPawn_Human(Instigator);
        if(OwnerHuman != none)
        {
            OwnerController = KFPlayerController(OwnerHuman.Controller);
            if(OwnerController != none)
            {
                NewMovementSpeedMod = MovementSpeedMod;
                NewRotationSpeedLimit = OwnerController.RotationSpeedLimit;
                if(IsFiring())
                {
                    NewMovementSpeedMod = FiringPawnMovementSpeed;
                    NewRotationSpeedLimit = FiringViewRotationSpeed;                    
                }
                else
                {
                    if(bWindUpModeActive)
                    {
                        NewMovementSpeedMod = WindUpPawnMovementSpeed;
                        NewRotationSpeedLimit = WindUpViewRotationSpeed;                        
                    }
                    else
                    {
                        NewMovementSpeedMod = 1;
                        NewRotationSpeedLimit = 2000;
                    }
                }
                if((NewMovementSpeedMod != MovementSpeedMod) || NewRotationSpeedLimit != OwnerController.RotationSpeedLimit)
                {
                    MovementSpeedMod = NewMovementSpeedMod;
                    OwnerController.RotationSpeedLimit = NewRotationSpeedLimit;
                    OwnerHuman.UpdateGroundSpeed();
                }
            }
        }
    }
}

simulated function NotifyBeginState()
{
    super.NotifyBeginState();
    NotifyRotationState();
}

simulated function NotifyEndState()
{
    super.NotifyEndState();
    NotifyRotationState();
}

simulated function InitializeReload()
{
    WindUp(false);
    bZoomActive = false;
    super.InitializeReload();
}

reliable server function ServerSendToReload(byte ClientReloadAmount)
{
    super.ServerSendToReload(ClientReloadAmount);
    WindUp(false);
    bZoomActive = false;
}

simulated state WeaponWindingUp
{
    simulated event bool IsFiring()
    {
        return true;
    }

    simulated function BeginState(name PrevStateName)
    {
        local KFPerk InstigatorPerk;
        local int IdleIndex;

        NotifyBeginState();
        InstigatorPerk = GetPerk();
        if(InstigatorPerk != none)
        {
            SetZedTimeResist(InstigatorPerk.GetZedTimeModifierForWindUp());
        }
        UpdateZoom();
        if(Instigator.IsLocallyControlled())
        {
            if(IdleAnims.Length > 0)
            {
                IdleIndex = Rand(IdleAnims.Length);
                PlayAnimation(IdleAnims[IdleIndex], 0, true, 0.2);
            }
            StartIdleFidgetTimer();
            ToggleAdditiveBobAnim(!bUsingSights);
        }
        if(bWindUpReady)
        {
            GotoState('WeaponFiring');
        }
    }

    simulated function EndState(name NextStateName)
    {
        NotifyEndState();
    }

    simulated event Tick(float DeltaTime)
    {
        global.Tick(DeltaTime);
        if(bPlayingLoopingFireSnd && ShouldForceSingleFireSound())
        {
            StopLoopingFireSound(CurrentFireMode);
        }
        if(bWindUpReady)
        {
            GotoState('WeaponFiring');            
        }
        else
        {
            if(!bFiringModeActive)
            {
                HandleFinishedFiring();
            }
        }
    }
    stop;    
}

simulated state WeaponFiring
{
    simulated event BeginState(name PreviousStateName)
    {
        local KFPerk InstigatorPerk;

        super.BeginState(PreviousStateName);
        InstigatorPerk = GetPerk();
        if(InstigatorPerk != none)
        {
            SetZedTimeResist(InstigatorPerk.GetZedTimeModifierForWindUp());
        }
    }

    simulated function EndState(name NextStateName)
    {
        super.EndState(NextStateName);
        UpdateZoom();
    }
    stop;    
}

simulated state MeleeAttackBasic
{
    ignores AllowSprinting, AllowIronSights;

    simulated function BeginState(name PreviousStateName)
    {
        local KFPerk InstigatorPerk;

        InstigatorPerk = GetPerk();
        if(InstigatorPerk != none)
        {
            SetZedTimeResist(InstigatorPerk.GetZedTimeModifier(self));
        }
        TimeWeaponFiring(CurrentFireMode);
        NotifyBeginState();
    }
    stop;    
}

simulated state Active
{
    simulated event BeginState(name PreviousStateName)
    {
        local KFPerk InstigatorPerk;

        WindUp(bStoredWindUpMode);
        UpdateZoom();
        super.BeginState(PreviousStateName);
        InstigatorPerk = GetPerk();
        if(InstigatorPerk != none)
        {
            SetZedTimeResist(InstigatorPerk.GetZedTimeModifierForWindUp());
        }
    }
    stop;    
}

simulated state GrenadeFiring
{
    simulated event bool IsFiring()
    {
        return false;
    }
    stop;    
}

defaultproperties
{
    WindUpActivationTime=1.5
    WindUpRotationSpeed=200
    WindUpViewRotationSpeed=2000
    WindUpPawnMovementSpeed=1
    FiringViewRotationSpeed=2000
    FiringPawnMovementSpeed=0.75
    bKeepIronSightsOnJump=true
    bSkipZoomInRotation=true
    FireSightedAnims(0)=Shoot
    FireLoopSightedAnim=ShootLoop
    FireLastSightedAnim=Shoot_Last
    IdleSightedAnims(0)=Idle
    FireLoopStartSightedAnim=ShootLoop_Start
    FireLoopEndSightedAnim=ShootLoop_End
    FireLoopEndLastSightedAnim=ShootLoop_End_Last
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_MinigunBase.MeleeHelper'
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_MinigunBase.FirstPersonMesh'
    Mesh=FirstPersonMesh
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_MinigunBase.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_MinigunBase.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
    bOnlyRelevantToOwner=false
    bAlwaysRelevant=true
}