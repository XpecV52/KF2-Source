/*******************************************************************************
 * KFTargetingWeaponComponent generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFTargetingWeaponComponent extends Actor
    abstract
    notplaceable
    hidecategories(Navigation);

const DEFAULT_FIREMODE = 0;
const ALTFIRE_FIREMODE = 1;
const TARGETINGMODE_FLAGS_ZED = 1;
const TARGETINGMODE_FLAGS_PLAYER = 2;
const TARGETINGMODE_FLAGS_ALL = 3;

enum ETargetingMode
{
    ETargetingMode_Zed,
    ETargetingMode_Player,
    ETargetingMode_MAX
};

var byte TargetingModeFlags[2];
var KFWeapon KFW;
var float LockRange[2];
var float LockAcquireTime[2];
var float LockAcquireTime_Large[2];
var float LockAcquireTime_Boss[2];
var float LockAcquireTime_Versus[2];
var float LockTolerance[2];
var KFPawn LockedTarget[2];
var int LockedHitZone[2];
var KFPawn PendingLockedTarget[2];
var int PendingHitZone[2];
var float LockAim[2];
var float LockTargetingSoundInterval[2];
var AkBaseSoundObject LockAcquiredSoundFirstPerson;
var AkBaseSoundObject LockLostSoundFirstPerson;
var AkBaseSoundObject LockTargetingSoundFirstPerson;
var float PendingLockAcquireTimeLeft[2];
var float PendingLockTimeout[2];
var float LockedOnTimeout;
var float LockedOnTimeoutTimer[2];
var Vector LockedAimLocation[2];
var array<name> HumanTargetableBoneNames;
var array<Vector> TargetVulnerableLocations_Zed;
var array<Vector> TargetVulnerableLocations_Player;
var float TargetLocationReplicationInterval;
var float TargetLocationReplicationTimer[2];
var bool bTargetingUpdated;

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    SetTickIsDisabled(true);
}

simulated function Init(KFWeapon InKFW)
{
    KFW = InKFW;
    Instigator = InKFW.Instigator;
}

simulated event Tick(float DeltaTime)
{
    super.Tick(DeltaTime);
    if(((Instigator != none) && Instigator.Controller != none) && Instigator.IsLocallyControlled())
    {
        CheckTargetLock(DeltaTime);
    }
}

simulated function CheckTargetLock(float DeltaTime)
{
    local bool bAllowLockOn;
    local byte Flags;

    bTargetingUpdated = false;
    if((((Instigator == none) || Instigator.Controller == none) || KFW != Instigator.Weapon) || KFPlayerController(Instigator.Controller) == none)
    {
        return;
    }
    TargetVulnerableLocations_Zed.Length = 0;
    TargetVulnerableLocations_Player.Length = 0;
    Flags = TargetingModeFlags[((KFW.bUseAltFireMode) ? 1 : 0)];
    if(!AllowTargetLockOn(0))
    {
        AdjustLockTarget(0, none);
        PendingLockedTarget[0] = none;
        LockedAimLocation[0] = vect(0, 0, 0);        
    }
    else
    {
        bAllowLockOn = true;
        if((Flags & 1) != 0)
        {
            UpdateTargetLock(0, DeltaTime);
        }
    }
    if(!AllowTargetLockOn(1))
    {
        AdjustLockTarget(1, none);
        PendingLockedTarget[1] = none;
        LockedAimLocation[1] = vect(0, 0, 0);        
    }
    else
    {
        bAllowLockOn = true;
        if((Flags & 2) != 0)
        {
            UpdateTargetLock(1, DeltaTime);
        }
    }
    if(!bAllowLockOn)
    {
        ClearTimer('PlayTargetingBeepTimer');
        return;
    }
    bTargetingUpdated = true;
}

simulated function bool AllowTargetLockOn(byte TargetingMode)
{
    return !Instigator.bNoWeaponFiring;
}

simulated function AdjustLockTarget(byte TargetingMode, KFPawn NewLockTarget)
{
    if(LockedTarget[TargetingMode] == NewLockTarget)
    {
        return;
    }
    if(NewLockTarget == none)
    {
        if(LockedTarget[TargetingMode] != none)
        {
            LockedTarget[TargetingMode] = none;
            if(TargetingMode == 0)
            {
                TargetVulnerableLocations_Zed.Length = 0;                
            }
            else
            {
                TargetVulnerableLocations_Player.Length = 0;
            }
            LockedAimLocation[TargetingMode] = vect(0, 0, 0);
            ServerSetTargetingLocation(TargetingMode, LockedAimLocation[TargetingMode]);
            if((Instigator != none) && Instigator.IsHumanControlled())
            {
                KFW.PlaySoundBase(LockLostSoundFirstPerson, true);
            }
        }        
    }
    else
    {
        LockedTarget[TargetingMode] = NewLockTarget;
        if((Instigator != none) && Instigator.IsHumanControlled())
        {
            KFW.PlaySoundBase(LockAcquiredSoundFirstPerson, true);
        }
    }
}

private reliable server final function ServerSetTargetingLocation(byte TargetingMode, Vector NewTargetingLocation)
{
    LockedAimLocation[TargetingMode] = NewTargetingLocation;
}

simulated function PlayTargetingBeepTimer()
{
    if((Instigator != none) && Instigator.IsHumanControlled())
    {
        KFW.PlaySoundBase(LockTargetingSoundFirstPerson, true);
    }
}

simulated function UpdateTargetLock(byte TargetingMode, float DeltaTime)
{
    local Actor BestTarget;

    BestTarget = DetermineBestTarget(TargetingMode);
    UpdateLockTargets(TargetingMode, DeltaTime, BestTarget);
    SetupAimLock(TargetingMode, DeltaTime);
}

simulated function Actor DetermineBestTarget(byte TargetingMode)
{
    local Vector StartTrace;
    local Rotator ViewRotation;
    local Vector X, Y, Z;
    local Actor BestTarget, HitActor, TA;
    local Vector EndTrace, Aim, HitLocation, HitNormal;
    local KFPlayerController KFPC;

    KFPC = KFPlayerController(Instigator.Controller);
    StartTrace = Instigator.GetWeaponStartTraceLocation();
    ViewRotation = Instigator.GetViewRotation();
    ViewRotation += KFPC.WeaponBufferRotation;
    GetAxes(ViewRotation, X, Y, Z);
    BestTarget = none;
    Aim = vector(ViewRotation);
    EndTrace = StartTrace + (Aim * (GetLockRange()));
    HitActor = KFW.Trace(HitLocation, HitNormal, EndTrace, StartTrace, true,,, 1);
    if((HitActor == none) || !CanLockOnTo(TargetingMode, HitActor))
    {
        TA = PickTarget(Aim, StartTrace, TargetingMode == 1);
        if((TA != none) && CanLockOnTo(TargetingMode, TA))
        {
            HitActor = Trace(HitLocation, HitNormal, TA.Location, StartTrace, true,,, 1);
            if((KFFracturedMeshActor(HitActor) != none) || KFDestructibleActor(HitActor) != none)
            {
                BestTarget = none;                
            }
            else
            {
                BestTarget = TA;
            }
        }        
    }
    else
    {
        BestTarget = HitActor;
    }
    return BestTarget;
}

simulated function bool CanLockOnTo(byte TargetingMode, Actor TA)
{
    local KFPawn PawnTarget;

    PawnTarget = KFPawn(TA);
    if((((((((TA == none) || !TA.bProjTarget) || TA.bDeleteMe) || PawnTarget == none) || TA == Instigator) || PawnTarget.Health <= 0) || !KFW.bUseAltFireMode && !KFW.HasAmmo(0)) || KFW.bUseAltFireMode && !KFW.HasAmmo(1))
    {
        return false;
    }
    return ((TargetingMode == 0) && !WorldInfo.GRI.OnSameTeam(Instigator, TA)) || (TargetingMode == 1) && WorldInfo.GRI.OnSameTeam(Instigator, TA);
}

simulated function Actor PickTarget(Vector Aim, Vector StartTrace, optional bool bTargetTeammates)
{
    local float bestAim, bestDist;

    bTargetTeammates = false;
    bestAim = GetLockAim();
    bestDist = 0;
    return KFPlayerController(Instigator.Controller).GetPickedAimAtTarget(bestAim, bestDist, Aim, StartTrace, GetLockRange(), bTargetTeammates);
}

simulated function UpdateLockTargets(byte TargetingMode, float DeltaTime, Actor BestTarget)
{
    if(LockedTarget[TargetingMode] != none)
    {
        if(LockedTarget[TargetingMode].bDeleteMe)
        {
            AdjustLockTarget(TargetingMode, none);
        }
    }
    if(BestTarget != none)
    {
        if(BestTarget == LockedTarget[TargetingMode])
        {
            UpdateTargetLocked(TargetingMode);            
        }
        else
        {
            if(PendingLockedTarget[TargetingMode] != BestTarget)
            {
                UpdatePendingLockTarget(TargetingMode, BestTarget);
            }
        }
        AcquireLockTarget(TargetingMode, DeltaTime, BestTarget);        
    }
    else
    {
        TimeoutPendingLockTarget(TargetingMode, DeltaTime);
    }
    TimeoutLockTarget(TargetingMode, DeltaTime, BestTarget);
}

simulated function UpdateTargetLocked(byte TargetingMode)
{
    LockedOnTimeoutTimer[TargetingMode] = GetLockTolerance();
    if(PendingLockedTarget[TargetingMode] != none)
    {
        ClearTimer('PlayTargetingBeepTimer');
        PendingLockedTarget[TargetingMode] = none;
    }
}

simulated function UpdatePendingLockTarget(byte TargetingMode, Actor BestTarget)
{
    local KFPawn_Monster KFPM;

    KFPM = KFPawn_Monster(BestTarget);
    PendingLockedTarget[TargetingMode] = KFPawn(BestTarget);
    PendingLockTimeout[TargetingMode] = GetLockTolerance();
    PendingLockAcquireTimeLeft[TargetingMode] = GetLockAcquireTime();
    if(KFPM != none)
    {
        if(KFPM.IsABoss())
        {
            PendingLockAcquireTimeLeft[TargetingMode] = GetLockAcquireTime_Boss();            
        }
        else
        {
            if(KFPM.bVersusZed)
            {
                PendingLockAcquireTimeLeft[TargetingMode] = GetLockAcquireTime_Versus();                
            }
            else
            {
                if(KFPM.IsLargeZed())
                {
                    PendingLockAcquireTimeLeft[TargetingMode] = GetLockAcquireTime_Large();
                }
            }
        }
    }
    SetTimer(LockTargetingSoundInterval[TargetingMode], true, 'PlayTargetingBeepTimer');
    if((Instigator != none) && Instigator.IsHumanControlled())
    {
        PlaySoundBase(LockTargetingSoundFirstPerson, true);
    }
}

simulated function AcquireLockTarget(byte TargetingMode, float DeltaTime, Actor BestTarget)
{
    if(PendingLockedTarget[TargetingMode] != none)
    {
        PendingLockAcquireTimeLeft[TargetingMode] -= DeltaTime;
        if((PendingLockedTarget[TargetingMode] == BestTarget) && PendingLockAcquireTimeLeft[TargetingMode] <= float(0))
        {
            AdjustLockTarget(TargetingMode, PendingLockedTarget[TargetingMode]);
            PendingLockedTarget[TargetingMode] = none;
            ClearTimer('PlayTargetingBeepTimer');
        }
    }
}

simulated function TimeoutPendingLockTarget(byte TargetingMode, float DeltaTime)
{
    if(PendingLockedTarget[TargetingMode] != none)
    {
        PendingLockTimeout[TargetingMode] -= DeltaTime;
        if((PendingLockTimeout[TargetingMode] <= float(0)) || !CanLockOnTo(TargetingMode, PendingLockedTarget[TargetingMode]))
        {
            PendingLockedTarget[TargetingMode] = none;
            ClearTimer('PlayTargetingBeepTimer');
        }
    }
}

simulated function TimeoutLockTarget(byte TargetingMode, float DeltaTime, Actor BestTarget)
{
    if((LockedTarget[TargetingMode] != none) && BestTarget != LockedTarget[TargetingMode])
    {
        LockedOnTimeoutTimer[TargetingMode] -= DeltaTime;
        if((LockedOnTimeoutTimer[TargetingMode] <= 0) || !CanLockOnTo(TargetingMode, LockedTarget[TargetingMode]))
        {
            AdjustLockTarget(TargetingMode, none);
        }
    }
}

simulated function SetupAimLock(byte TargetingMode, float DeltaTime)
{
    local Vector Aim, StartTrace, BestZoneLocation;
    local int OldHitZone;

    Aim = vector(Instigator.GetViewRotation());
    StartTrace = Instigator.GetWeaponStartTraceLocation();
    if(LockedTarget[TargetingMode] != none)
    {
        OldHitZone = LockedHitZone[TargetingMode];
        LockedHitZone[TargetingMode] = AddTargetingZones(TargetingMode, LockedTarget[TargetingMode], StartTrace, Aim, BestZoneLocation);
        if(OldHitZone != LockedHitZone[TargetingMode])
        {
            if((Instigator != none) && Instigator.IsHumanControlled())
            {
                KFW.PlaySoundBase(LockTargetingSoundFirstPerson, true);
            }
        }
        TargetLocationReplicationTimer[TargetingMode] -= DeltaTime;
        if((TargetLocationReplicationTimer[TargetingMode] <= float(0)) || IsZero(LockedAimLocation[TargetingMode]))
        {
            TargetLocationReplicationTimer[TargetingMode] = TargetLocationReplicationInterval;
            ServerSetTargetingLocation(TargetingMode, LockedAimLocation[TargetingMode]);
        }
        LockedAimLocation[TargetingMode] = BestZoneLocation;        
    }
    else
    {
        LockedHitZone[TargetingMode] = -1;
    }
    if(PendingLockedTarget[TargetingMode] != none)
    {
        PendingHitZone[TargetingMode] = AddTargetingZones(TargetingMode, PendingLockedTarget[TargetingMode], StartTrace, Aim, BestZoneLocation);        
    }
    else
    {
        PendingHitZone[TargetingMode] = -1;
    }
}

simulated function int AddTargetingZones(byte TargetingMode, KFPawn KFPTarget, Vector StartTrace, Vector Aim, out Vector BestZoneLocation)
{
    local KFPawn_Monster KFPM;
    local KFPawn_Human KFPH;

    if(TargetingMode == 0)
    {
        KFPM = KFPawn_Monster(KFPTarget);
        if(KFPM != none)
        {
            return GetZedVulnerableLocations(KFPM, Aim, StartTrace, BestZoneLocation);
        }        
    }
    else
    {
        KFPH = KFPawn_Human(KFPTarget);
        if(KFPH != none)
        {
            return GetHumanVulnerableLocations(KFPH, Aim, StartTrace, BestZoneLocation);
        }
    }
    return -1;
}

simulated function int GetZedVulnerableLocations(KFPawn_Monster Zed, Vector Aim, Vector StartTrace, out Vector BestZoneLocation)
{
    local Vector ZoneLocation;
    local int BestZoneIndex;
    local float BestZoneDot;
    local Vector DirToZone;
    local float DotToZone;
    local int I;

    I = 0;
    J0x0B:

    if(I < Zed.WeakSpotSocketNames.Length)
    {
        Zed.Mesh.GetSocketWorldLocationAndRotation(Zed.WeakSpotSocketNames[I], ZoneLocation);
        if(!IsZero(ZoneLocation))
        {
            TargetVulnerableLocations_Zed.AddItem(ZoneLocation;
            DirToZone = ZoneLocation - StartTrace;
            DotToZone = Normal(Aim) Dot Normal(DirToZone);
            if(DotToZone > BestZoneDot)
            {
                BestZoneIndex = TargetVulnerableLocations_Zed.Length - 1;
                BestZoneDot = DotToZone;
                BestZoneLocation = ZoneLocation;
            }
        }
        ++ I;
        goto J0x0B;
    }
    return BestZoneIndex;
}

simulated function int GetHumanVulnerableLocations(KFPawn_Human Human, Vector Aim, Vector StartTrace, out Vector BestZoneLocation)
{
    local Vector ZoneLocation;
    local int BestZoneIndex;
    local float BestZoneDot;
    local Vector DirToZone;
    local float DotToZone;
    local int I;

    I = 0;
    J0x0B:

    if(I < HumanTargetableBoneNames.Length)
    {
        ZoneLocation = Human.Mesh.GetBoneLocation(HumanTargetableBoneNames[I]);
        if(!IsZero(ZoneLocation))
        {
            TargetVulnerableLocations_Player.AddItem(ZoneLocation;
            DirToZone = ZoneLocation - StartTrace;
            DotToZone = Normal(Aim) Dot Normal(DirToZone);
            if(DotToZone > BestZoneDot)
            {
                BestZoneIndex = TargetVulnerableLocations_Player.Length - 1;
                BestZoneDot = DotToZone;
                BestZoneLocation = ZoneLocation;
            }
        }
        ++ I;
        goto J0x0B;
    }
    return BestZoneIndex;
}

simulated function OnWeaponAttachedTo()
{
    SetTickIsDisabled(false);
}

simulated function OnWeaponDetached()
{
    SetTickIsDisabled(true);
}

simulated function float GetLockRange()
{
    return LockRange[((KFW.bUseAltFireMode) ? 1 : 0)];
}

simulated function float GetLockAim()
{
    return LockAim[((KFW.bUseAltFireMode) ? 1 : 0)];
}

simulated function float GetLockAcquireTime()
{
    return LockAcquireTime[((KFW.bUseAltFireMode) ? 1 : 0)];
}

simulated function float GetLockAcquireTime_Large()
{
    return LockAcquireTime_Large[((KFW.bUseAltFireMode) ? 1 : 0)];
}

simulated function float GetLockAcquireTime_Boss()
{
    return LockAcquireTime_Boss[((KFW.bUseAltFireMode) ? 1 : 0)];
}

simulated function float GetLockAcquireTime_Versus()
{
    return LockAcquireTime_Versus[((KFW.bUseAltFireMode) ? 1 : 0)];
}

simulated function float GetLockTolerance()
{
    return LockTolerance[((KFW.bUseAltFireMode) ? 1 : 0)];
}

defaultproperties
{
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    CollisionType=ECollisionType.COLLIDE_CustomDefault
    bHidden=true
    bOnlyRelevantToOwner=true
}