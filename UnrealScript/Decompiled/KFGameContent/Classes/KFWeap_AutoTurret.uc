/*******************************************************************************
 * KFWeap_AutoTurret generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_AutoTurret extends KFWeap_ThrownBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

const DETONATE_FIREMODE = 5;
const TransitionParamName = 'transition_full_to_empty';
const EmptyParamName = 'Blinking_0_off___1_on';

/** NEW - IronSights Key */
var(Animations) const editconst name DetonateAnim;
var(Animations) const editconst name DetonateLastAnim;
/** Sound to play upon successful detonation */
var() AkEvent DetonateAkEvent;
var const float ThrowStrength;
var const byte MaxTurretsDeployed;
var transient byte NumDeployedTurrets;
var const Vector TurretSpawnOffset;
var transient KFPlayerController KFPC;
var transient bool bTurretReadyToUse;
var transient bool bDetonateLocked;
var repnotify float CurrentAmmoPercentage;

replication
{
     if(bNetDirty)
        CurrentAmmoPercentage, NumDeployedTurrets, 
        bTurretReadyToUse;
}

simulated event ReplicatedEvent(name VarName)
{
    if(VarName == 'CurrentAmmoPercentage')
    {
        UpdateMaterialColor(CurrentAmmoPercentage);        
    }
    else
    {
        super(KFWeapon).ReplicatedEvent(VarName);
    }
}

simulated event PreBeginPlay()
{
    local class<KFWeap_AutoTurretWeapon> WeaponClass;

    super(KFWeapon).PreBeginPlay();
    WeaponClass = class<KFWeap_AutoTurretWeapon>(DynamicLoadObject(Class'KFPawn_AutoTurret'.default.WeaponDefinition.default.WeaponClassPath, Class'Class'));
    WeaponClass.static.TriggerAsyncContentLoad(WeaponClass);
}

simulated event PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    if(Role == ROLE_Authority)
    {
        KFPC = KFPlayerController(Instigator.Controller);
        NumDeployedTurrets = byte(KFPC.DeployedTurrets.Length);
    }
}

simulated function SetIronSights(bool bNewIronSights)
{
    if(!Instigator.IsLocallyControlled())
    {
        return;
    }
    if(bNewIronSights)
    {
        StartFire(5);        
    }
    else
    {
        StopFire(5);
    }
}

simulated function Projectile ProjectileFire()
{
    local Vector SpawnLocation, SpawnDirection;
    local KFPawn_AutoTurret SpawnedActor;

    if((Role == ROLE_Authority) && CurrentFireMode == 0)
    {
        GetTurretSpawnLocationAndDir(SpawnLocation, SpawnDirection);
        SpawnedActor = Spawn(Class'KFPawn_AutoTurret', self,, SpawnLocation + (TurretSpawnOffset >> Rotation), Rotation,, true);
        if(SpawnedActor != none)
        {
            SpawnedActor.OwnerWeapon = self;
            SpawnedActor.SetPhysics(2);
            SpawnedActor.Velocity = SpawnDirection * ThrowStrength;
            SpawnedActor.UpdateInstigator(Instigator);
            SpawnedActor.UpdateWeaponUpgrade(CurrentWeaponUpgradeIndex);
            SpawnedActor.SetTurretState(1);
            KFPC.DeployedTurrets.AddItem(SpawnedActor;
            NumDeployedTurrets = byte(KFPC.DeployedTurrets.Length);
            bTurretReadyToUse = false;
            bForceNetUpdate = true;
        }
        return none;        
    }
    else
    {
        return super(KFWeapon).ProjectileFire();
    }
    return none;
}

simulated function GetTurretSpawnLocationAndDir(out Vector SpawnLocation, out Vector SpawnDirection)
{
    local Vector StartTrace, EndTrace, RealStartLoc, AimDir;
    local ImpactInfo TestImpact;
    local Vector DirA, DirB;
    local Quat Q;

    StartTrace = GetSafeStartTraceLocation();
    AimDir = vector(GetAdjustedAim(StartTrace));
    RealStartLoc = GetPhysicalFireStartLoc(AimDir);
    if(StartTrace != RealStartLoc)
    {
        EndTrace = StartTrace + (AimDir * (GetTraceRange()));
        TestImpact = CalcWeaponFire(StartTrace, EndTrace);
        DirB = AimDir;
        AimDir = Normal(TestImpact.HitLocation - RealStartLoc);
        DirA = AimDir;
        if((DirA Dot DirB) < 0.995)
        {
            Q = QuatFromAxisAndAngle(Normal(DirB Cross DirA), 0.1);
            AimDir = QuatRotateVector(Q, DirB);
        }
    }
    SpawnDirection = AimDir;
    SpawnLocation = RealStartLoc;
}

simulated function Detonate()
{
    local int I;
    local array<Actor> TurretsCopy;

    if(Role == ROLE_Authority)
    {
        TurretsCopy = KFPC.DeployedTurrets;
        I = 0;
        J0x47:

        if(I < TurretsCopy.Length)
        {
            KFPawn_AutoTurret(TurretsCopy[I]).SetTurretState(5);
            ++ I;
            goto J0x47;
        }
        KFPC.DeployedTurrets.Remove(0, KFPC.DeployedTurrets.Length;
        SetReadyToUse(true);
        if(!HasAnyAmmo() && NumDeployedTurrets == 0)
        {
            if(CanSwitchWeapons())
            {
                Instigator.Controller.ClientSwitchToBestWeapon(false);
            }
        }
    }
}

function RemoveDeployedTurret(optional int Index, optional Actor TurretActor)
{
    Index = -1;    
    if(Index == -1)
    {
        if(TurretActor != none)
        {
            Index = KFPC.DeployedTurrets.Find(TurretActor;
        }
    }
    if(Index != -1)
    {
        KFPC.DeployedTurrets.Remove(Index, 1;
        NumDeployedTurrets = byte(KFPC.DeployedTurrets.Length);
        bForceNetUpdate = true;
    }
}

function SetOriginalValuesFromPickup(KFWeapon PickedUpWeapon)
{
    local int I;

    super(KFWeapon).SetOriginalValuesFromPickup(PickedUpWeapon);
    if((PickedUpWeapon.KFPlayer != none) && PickedUpWeapon.KFPlayer != KFPC)
    {
        KFPC.DeployedTurrets = PickedUpWeapon.KFPlayer.DeployedTurrets;
    }
    PickedUpWeapon.KFPlayer = none;
    NumDeployedTurrets = byte(KFPC.DeployedTurrets.Length);
    bForceNetUpdate = true;
    I = 0;
    J0x119:

    if(I < NumDeployedTurrets)
    {
        KFPC.DeployedTurrets[I].Instigator = Instigator;
        KFPC.DeployedTurrets[I].SetOwner(self);
        if(Instigator.Controller != none)
        {
            KFPawn_AutoTurret(KFPC.DeployedTurrets[I]).InstigatorController = Instigator.Controller;
        }
        ++ I;
        goto J0x119;
    }
}

function DropFrom(Vector StartLocation, Vector StartVelocity)
{
    local DroppedPickup P;

    StartLocation.Z += (Instigator.BaseEyeHeight / float(2));
    if(!CanThrow())
    {
        return;
    }
    if((DroppedPickupClass == none) || DroppedPickupMesh == none)
    {
        Destroy();
        return;
    }
    P = Spawn(DroppedPickupClass,,, StartLocation,,, true);
    if(P == none)
    {
        PlayerController(Instigator.Controller).ReceiveLocalizedMessage(Class'KFLocalMessage_Game', 21);
        return;
    }
    if((Instigator != none) && Instigator.InvManager != none)
    {
        Instigator.InvManager.RemoveFromInventory(self);
        if(Instigator.IsAliveAndWell() && !Instigator.InvManager.bPendingDelete)
        {
            if(((Role == ROLE_Authority) && KFGameInfo(WorldInfo.Game) != none) && KFGameInfo(WorldInfo.Game).DialogManager != none)
            {
                KFGameInfo(WorldInfo.Game).DialogManager.PlayDropWeaponDialog(KFPawn(Instigator));
            }
        }
    }
    SetupDroppedPickup(P, StartVelocity);
    KFDroppedPickup(P).PreviousOwner = KFPlayerController(Instigator.Controller);
    Instigator = none;
    GotoState('None');
    AIController = none;
}

static simulated event bool UsesAmmo()
{
    return true;
}

simulated function bool HasAmmo(byte FireModeNum, optional int Amount)
{
    if(FireModeNum == 5)
    {
        return NumDeployedTurrets > 0;
    }
    return super(KFWeapon).HasAmmo(FireModeNum, Amount);
}

simulated function BeginFire(byte FireModeNum)
{
    if(FireModeNum == 0)
    {
        ClearPendingFire(5);
    }
    if(FireModeNum == 5)
    {
        if(bDetonateLocked)
        {
            return;
        }
        if((NumDeployedTurrets > 0) && bTurretReadyToUse)
        {
            PrepareAndDetonate();
        }        
    }
    else
    {
        if(((FireModeNum == 0) && NumDeployedTurrets >= MaxTurretsDeployed) && HasAnyAmmo())
        {
            if(!bTurretReadyToUse)
            {
                return;
            }
            PrepareAndDetonate();
        }
        super(KFWeapon).BeginFire(FireModeNum);
    }
}

simulated function PrepareAndDetonate()
{
    local name DetonateAnimName;
    local float AnimDuration;
    local bool bInSprintState;

    DetonateAnimName = ((ShouldPlayLastAnims()) ? DetonateLastAnim : DetonateAnim);
    AnimDuration = MySkelMesh.GetAnimLength(DetonateAnimName);
    bInSprintState = IsInState('WeaponSprinting');
    if(WorldInfo.NetMode != NM_DedicatedServer)
    {
        if(NumDeployedTurrets > 0)
        {
            PlaySoundBase(DetonateAkEvent, true);
        }
        if(bInSprintState)
        {
            AnimDuration *= 0.25;
            PlayAnimation(DetonateAnimName, AnimDuration);            
        }
        else
        {
            PlayAnimation(DetonateAnimName);
        }
    }
    if(Role == ROLE_Authority)
    {
        Detonate();
    }
    IncrementFlashCount();
    if(bInSprintState)
    {
        SetTimer(AnimDuration * 0.8, false, 'PlaySprintStart');        
    }
    else
    {
        SetTimer(AnimDuration * 0.5, false, 'GotoActiveState');
    }
}

simulated function AltFireMode();

simulated function bool HasAlwaysOnZedTimeResist()
{
    return true;
}

simulated function GotoActiveState();

static simulated event KFGame.KFGFxObject_TraderItems.EFilterTypeUI GetTraderFilter()
{
    return 6;
}

function CheckTurretAmmo()
{
    local float Percentage;
    local KFWeapon Weapon;
    local KFPawn KFP;

    if(Role == ROLE_Authority)
    {
        if(KFPC == none)
        {
            return;
        }
        if(KFPC.DeployedTurrets.Length > 0)
        {
            Weapon = KFWeapon(KFPawn_AutoTurret(KFPC.DeployedTurrets[0]).Weapon);
            if(Weapon != none)
            {
                Percentage = float(Weapon.AmmoCount[0]) / float(Weapon.MagazineCapacity[0]);
                if(Percentage != CurrentAmmoPercentage)
                {
                    CurrentAmmoPercentage = Percentage;
                    bNetDirty = true;
                    if(WorldInfo.NetMode == NM_Standalone)
                    {
                        UpdateMaterialColor(CurrentAmmoPercentage);                        
                    }
                    else
                    {
                        KFP = KFPawn(Instigator);
                        if(KFP != none)
                        {
                            KFP.OnWeaponSpecialAction(int(float(1) + (CurrentAmmoPercentage * float(100))));
                        }
                    }
                }
            }
        }
    }
}

function SetReadyToUse(bool bReady)
{
    if(bTurretReadyToUse != bReady)
    {
        bTurretReadyToUse = bReady;
        bNetDirty = true;
    }
}

simulated event Tick(float DeltaTime)
{
    super(KFWeapon).Tick(DeltaTime);
    if(Role == ROLE_Authority)
    {
        CheckTurretAmmo();
    }
}

simulated function UpdateMaterialColor(float Percentage)
{
    if(NumDeployedTurrets == 0)
    {
        WeaponMICs[2].SetScalarParameterValue('Blinking_0_off___1_on', 0);        
    }
    else
    {
        if(Percentage >= float(0))
        {
            WeaponMICs[2].SetScalarParameterValue('transition_full_to_empty', 1 - Percentage);
            WeaponMICs[2].SetScalarParameterValue('Blinking_0_off___1_on', float(((Percentage == float(0)) ? 1 : 0)));
        }
    }
}

simulated function SetWeaponUpgradeLevel(int WeaponUpgradeLevel)
{
    local Actor Turret;
    local KFPawn_AutoTurret TurretPawn;

    super(KFWeapon).SetWeaponUpgradeLevel(WeaponUpgradeLevel);
    if(KFPC != none)
    {
        foreach KFPC.DeployedTurrets(Turret,)
        {
            TurretPawn = KFPawn_AutoTurret(Turret);
            if(TurretPawn != none)
            {
                TurretPawn.UpdateWeaponUpgrade(WeaponUpgradeLevel);
            }            
        }        
    }
}

simulated function PlayGrenadeThrow()
{
    local name WeaponFireAnimName;
    local float InterruptTime;

    PlayFiringSound(CurrentFireMode);
    if((Instigator != none) && Instigator.IsFirstPerson())
    {
        WeaponFireAnimName = GetGrenadeThrowAnim();
        if(WeaponFireAnimName != 'None')
        {
            InterruptTime = MySkelMesh.GetAnimInterruptTime(WeaponFireAnimName);
            PlayAnimation(WeaponFireAnimName, MySkelMesh.GetAnimLength(WeaponFireAnimName),, FireTweenTime);
            bDetonateLocked = true;
            SetTimer(InterruptTime, false, 'ClearDetonateLock');
        }
    }
}

simulated function ClearDetonateLock()
{
    bDetonateLocked = false;
    ClearTimer('ClearDetonateLock');
}

static simulated event SetTraderWeaponStats(out array<STraderItemWeaponStats> WeaponStats)
{
    super(KFWeapon).SetTraderWeaponStats(WeaponStats);
    WeaponStats.Length = 4;
    WeaponStats[0].StatType = 0;
    WeaponStats[0].StatValue = Class'KFWeap_AutoTurretWeapon'.static.CalculateTraderWeaponStatDamage();
    WeaponStats[1].StatType = 2;
    WeaponStats[1].StatValue = Class'KFWeap_AutoTurretWeapon'.default.PenetrationPower[0];
    WeaponStats[2].StatType = 1;
    WeaponStats[3].StatType = 3;
    WeaponStats[3].StatValue = Class'KFWeap_AutoTurretWeapon'.static.CalculateTraderWeaponStatFireRate();
}

simulated state Active
{
    simulated function bool CanPlayIdleFidget(optional bool bOnReload)
    {
        if(!HasAmmo(0))
        {
            return false;
        }
        return super.CanPlayIdleFidget(bOnReload);
    }
    stop;    
}

simulated state WeaponDetonating
{
    ignores AllowSprinting;

    simulated event BeginState(name PreviousStateName)
    {
        PrepareAndDetonate();
    }

    simulated function GotoActiveState()
    {
        GotoState('Active');
    }
    stop;    
}

simulated state WeaponThrowing
{
    simulated function bool ShouldRefire()
    {
        return false;
    }

    simulated function EndState(name NextStateName)
    {
        local KFPerk InstigatorPerk;

        super.EndState(NextStateName);
        InstigatorPerk = GetPerk();
        if(InstigatorPerk != none)
        {
            SetZedTimeResist(InstigatorPerk.GetZedTimeModifier(self));
        }
    }
    stop;    
}

simulated state WeaponEquipping
{
    simulated event BeginState(name PreviousStateName)
    {
        super.BeginState(PreviousStateName);
        if(!HasAmmo(0) && HasSpareAmmo())
        {
            PerformArtificialReload();
        }
        StopFire(5);
    }
    stop;    
}

simulated state WeaponPuttingDown
{
    ignores SetIronSights;

    simulated event BeginState(name PreviousStateName)
    {
        super.BeginState(PreviousStateName);
        StopFire(5);
    }
    stop;    
}

simulated state GrenadeFiring
{
    simulated function EndState(name NextStateName)
    {
        ClearDetonateLock();
        super.EndState(NextStateName);
    }
    stop;    
}

defaultproperties
{
    DetonateAnim=Detonate
    DetonateLastAnim=Detonate_Last
    DetonateAkEvent=AkEvent'WW_WEP_Autoturret.Play_WEP_AutoTurret_Detonate_Trigger'
    ThrowStrength=1350
    MaxTurretsDeployed=1
    TurretSpawnOffset=(X=0,Y=15,Z=-50)
    bTurretReadyToUse=true
    PackageKey="AutoTurret"
    FirstPersonMeshName="Wep_1P_AutoTurret_MESH.Wep_1stP_AutoTurret_Rig"
    FirstPersonAnimSetNames=/* Array type was not detected. */
    PickupMeshName="wep_3p_autoturret_mesh.Wep_AutoTurret_Pickup"
    AttachmentArchetypeName="WEP_AutoTurret_ARCH.Wep_AutoTurret_3P"
    FireModeIconPaths=/* Array type was not detected. */
    InventoryGroup=EInventoryGroup.IG_Equipment
    InventorySize=3
    GroupPriority=11
    WeaponSelectTexture=Texture2D'WEP_UI_AutoTurret_TEX.UI_WeaponSelect_AutoTurret'
    MagazineCapacity=1
    AmmoCost=/* Array type was not detected. */
    SpareAmmoCapacity=3
    InitialSpareMags=1
    FireAnim=C4_Throw
    FireLastAnim=C4_Throw_Last
    PlayerViewOffset=(X=6,Y=2,Z=-4)
    NumBloodMapMaterials=3
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_AutoTurret.MeleeHelper'
    AssociatedPerkClasses=/* Array type was not detected. */
    WeaponUpgrades=/* Array type was not detected. */
    CurrentFireMode=5
    FiringStatesArray=/* Array type was not detected. */
    WeaponFireTypes=/* Array type was not detected. */
    FireInterval=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_AutoTurret.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="Sentinel"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_AutoTurret.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_AutoTurret.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}