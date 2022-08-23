/*******************************************************************************
 * KFWeap_Rifle_RailGun generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_Rifle_RailGun extends KFWeap_ScopedBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

/** How long to wait after firing to force reload */
var() float ForceReloadTime;
var ScriptedTexture CanvasTexture;
var int CurrentCanvasTextureSize;
var Texture2D LockedHitZoneIcon;
var Texture2D DefaultHitZoneIcon;
var LinearColor RedIconColor;
var LinearColor YellowIconColor;
var LinearColor BlueIconColor;
/** How far out should we be considering actors for a lock */
var(Locking) float LockRange;
/** How long does the player need to target an actor to lock on to it */
var(Locking) float LockAcquireTime;
/** How long does the player need to target a large zed to lock on to it */
var(Locking) float LockAcquireTime_Large;
/** How long does the player need to target a boss to lock on to it */
var(Locking) float LockAcquireTime_Boss;
/** How long does the player need to target a versus zed to lock on to it */
var(Locking) float LockAcquireTime_Versus;
/** Once locked, how long can the player go without painting the object before they lose the lock */
var(Locking) float LockTolerance;
var bool bLockedOnTarget;
var KFPawn_Monster LockedTarget;
var int LockedHitZone;
var KFPawn_Monster PendingLockedTarget;
var int PendingHitZone;
/** angle for locking for lock targets */
var(Locking) float LockAim;
/** angle of the maximum FOV extents of the scope for rending things onto the scope canvas */
var(Locking) float MaxScopeScreenDot;
/** The frequency with which we play the Lock Targeting sound */
var(Locking) float LockTargetingSoundInterval;
var AkBaseSoundObject LockAcquiredSoundFirstPerson;
var AkBaseSoundObject LockLostSoundFirstPerson;
var AkBaseSoundObject LockTargetingSoundFirstPerson;
var float PendingLockAcquireTimeLeft;
var float PendingLockTimeout;
var float LockedOnTimeout;
var Vector LockedAimLocation;
var array<Vector> TargetVulnerableLocations;
var float TargetLocationReplicationInterval;
var AkEvent AmbientSoundPlayEvent;
var AkEvent AmbientSoundStopEvent;
/** Socket to attach the ambient sound to. */
var() name AmbientSoundSocketName;

simulated function InitFOV(float SizeX, float SizeY, float DefaultPlayerFOV)
{
    local int NewScopeTextureSize;

    super.InitFOV(SizeX, SizeY, DefaultPlayerFOV);
    NewScopeTextureSize = int(ScopeTextureScale * SizeX);
    if(NewScopeTextureSize > MaxSceneCaptureSize)
    {
        NewScopeTextureSize = MaxSceneCaptureSize;
    }
    if(CurrentCanvasTextureSize != NewScopeTextureSize)
    {
        CanvasTexture = ScriptedTexture(Class'ScriptedTexture'.static.Create(NewScopeTextureSize, NewScopeTextureSize, 9, MakeLinearColor(0, 0, 0, 0)));
        CanvasTexture.__Render__Delegate = OnRender;
        CanvasTexture.bNeedsTwoCopies = true;
        if(ScopeLenseMIC != none)
        {
            ScopeLenseMIC.SetTextureParameterValue('ScopeText', CanvasTexture);
        }
        CurrentCanvasTextureSize = NewScopeTextureSize;
    }
}

reliable client simulated function ClientWeaponSet(bool bOptionalSet, optional bool bDoNotActivate)
{
    super.ClientWeaponSet(bOptionalSet);
    if(((Instigator != none) && Instigator.IsLocallyControlled()) && Instigator.IsHumanControlled())
    {
        if(ScopeLenseMIC != none)
        {
            ScopeLenseMIC.SetTextureParameterValue('ScopeText', CanvasTexture);
        }
    }
}

simulated function PlayFireEffects(byte FireModeNum, optional Vector HitLocation)
{
    super(KFWeapon).PlayFireEffects(FireModeNum, HitLocation);
    if(((Instigator != none) && Instigator.IsLocallyControlled()) && AmmoCount[0] == 0)
    {
        SetTimer(ForceReloadTime, false, 'ForceReload');
    }
}

simulated function bool ShouldPlayFireLast(byte FireModeNum)
{
    return false;
}

simulated function name GetReloadAnimName(bool bTacticalReload)
{
    if(AmmoCount[0] > 0)
    {
        WarnInternal("Railgun reloading with non-empty mag");
    }
    return ((bTacticalReload) ? 'Reload_Empty_Elite' : 'Reload_Empty');
}

simulated function StartAmbientSound()
{
    if(((Instigator != none) && Instigator.IsLocallyControlled()) && Instigator.IsFirstPerson())
    {
        PostAkEventOnBone(AmbientSoundPlayEvent, AmbientSoundSocketName, false, true);
    }
}

simulated function StopAmbientSound()
{
    PostAkEventOnBone(AmbientSoundStopEvent, AmbientSoundSocketName, false, true);
}

simulated function DetachWeapon()
{
    StopAmbientSound();
    super.DetachWeapon();
}

simulated event Tick(float DeltaTime)
{
    super.Tick(DeltaTime);
    if(((Instigator != none) && Instigator.Controller != none) && Instigator.IsLocallyControlled())
    {
        CheckTargetLock(DeltaTime);
    }
}

simulated function bool CanLockOnTo(Actor TA)
{
    local KFPawn PawnTarget;

    PawnTarget = KFPawn(TA);
    if((((((((TA == none) || !TA.bProjTarget) || TA.bDeleteMe) || PawnTarget == none) || TA == Instigator) || PawnTarget.Health <= 0) || PawnTarget.bIsCloaking) || !HasAmmo(0))
    {
        return false;
    }
    return !WorldInfo.GRI.OnSameTeam(Instigator, TA);
}

simulated function AdjustLockTarget(KFPawn_Monster NewLockTarget)
{
    if(LockedTarget == NewLockTarget)
    {
        return;
    }
    if(NewLockTarget == none)
    {
        if(bLockedOnTarget)
        {
            bLockedOnTarget = false;
            LockedTarget = none;
            TargetVulnerableLocations.Length = 0;
            LockedAimLocation = vect(0, 0, 0);
            ServerSetTargetingLocation(LockedAimLocation);
            if((Instigator != none) && Instigator.IsHumanControlled())
            {
                PlaySoundBase(LockLostSoundFirstPerson, true);
            }
        }        
    }
    else
    {
        bLockedOnTarget = true;
        LockedTarget = NewLockTarget;
        if((Instigator != none) && Instigator.IsHumanControlled())
        {
            PlaySoundBase(LockAcquiredSoundFirstPerson, true);
        }
    }
}

simulated function bool AllowTargetLockOn()
{
    return (!Instigator.bNoWeaponFiring && bUsingSights) && !bUseAltFireMode;
}

simulated function CheckTargetLock(float DeltaTime)
{
    local KFPawn_Monster KFP;
    local Vector StartTrace;
    local Rotator ViewRotation;
    local Vector X, Y, Z;
    local Actor BestTarget, HitActor, TA;
    local Vector EndTrace, Aim, HitLocation, HitNormal;
    local float bestAim, bestDist;
    local Vector BestZoneLocation;
    local KFPlayerController KFPC;
    local int OldHitZone;

    KFPC = KFPlayerController(Instigator.Controller);
    if((((Instigator == none) || Instigator.Controller == none) || self != Instigator.Weapon) || KFPC == none)
    {
        return;
    }
    TargetVulnerableLocations.Length = 0;
    if(!AllowTargetLockOn())
    {
        AdjustLockTarget(none);
        PendingLockedTarget = none;
        LockedAimLocation = vect(0, 0, 0);
        ClearTimer('PlayTargetingBeepTimer');
        return;
    }
    if(bUsingSights)
    {
        CanvasTexture.bNeedsUpdate = true;
    }
    if(LockedTarget != none)
    {
        if(LockedTarget.bDeleteMe)
        {
            AdjustLockTarget(none);
        }
    }
    StartTrace = GetSafeStartTraceLocation();
    ViewRotation = Instigator.GetViewRotation();
    ViewRotation += KFPC.WeaponBufferRotation;
    GetAxes(ViewRotation, X, Y, Z);
    BestTarget = none;
    Aim = vector(ViewRotation);
    EndTrace = StartTrace + (Aim * LockRange);
    HitActor = Trace(HitLocation, HitNormal, EndTrace, StartTrace, true,,, 1);
    if((HitActor == none) || !CanLockOnTo(HitActor))
    {
        bestAim = LockAim;
        bestDist = 0;
        TA = KFPC.GetPickedAimAtTarget(bestAim, bestDist, Aim, StartTrace, LockRange, false);
        if((TA != none) && CanLockOnTo(TA))
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
    KFP = KFPawn_Monster(BestTarget);
    if((BestTarget != none) && KFP != none)
    {
        if(BestTarget == LockedTarget)
        {
            LockedOnTimeout = LockTolerance;
            if(PendingLockedTarget != none)
            {
                ClearTimer('PlayTargetingBeepTimer');
                PendingLockedTarget = none;
            }            
        }
        else
        {
            if(PendingLockedTarget != BestTarget)
            {
                PendingLockedTarget = KFP;
                PendingLockTimeout = LockTolerance;
                if(KFP.IsABoss())
                {
                    PendingLockAcquireTimeLeft = LockAcquireTime_Boss;                    
                }
                else
                {
                    if(KFP.bVersusZed)
                    {
                        PendingLockAcquireTimeLeft = LockAcquireTime_Versus;                        
                    }
                    else
                    {
                        if(KFP.IsLargeZed())
                        {
                            PendingLockAcquireTimeLeft = LockAcquireTime_Large;                            
                        }
                        else
                        {
                            PendingLockAcquireTimeLeft = LockAcquireTime;
                        }
                    }
                }
                SetTimer(LockTargetingSoundInterval, true, 'PlayTargetingBeepTimer');
                if((Instigator != none) && Instigator.IsHumanControlled())
                {
                    PlaySoundBase(LockTargetingSoundFirstPerson, true);
                }
            }
        }
        if(PendingLockedTarget != none)
        {
            PendingLockAcquireTimeLeft -= DeltaTime;
            if((PendingLockedTarget == BestTarget) && PendingLockAcquireTimeLeft <= float(0))
            {
                AdjustLockTarget(PendingLockedTarget);
                PendingLockedTarget = none;
                ClearTimer('PlayTargetingBeepTimer');
            }
        }        
    }
    else
    {
        if(PendingLockedTarget != none)
        {
            PendingLockTimeout -= DeltaTime;
            if((PendingLockTimeout <= float(0)) || !CanLockOnTo(PendingLockedTarget))
            {
                PendingLockedTarget = none;
                ClearTimer('PlayTargetingBeepTimer');
            }
        }
    }
    if((LockedTarget != none) && BestTarget != LockedTarget)
    {
        LockedOnTimeout -= DeltaTime;
        if((LockedOnTimeout <= 0) || !CanLockOnTo(LockedTarget))
        {
            AdjustLockTarget(none);
        }
    }
    if(LockedTarget != none)
    {
        OldHitZone = LockedHitZone;
        LockedHitZone = AddTargetingZones(LockedTarget, StartTrace, Aim, BestZoneLocation);
        if(OldHitZone != LockedHitZone)
        {
            if((Instigator != none) && Instigator.IsHumanControlled())
            {
                PlaySoundBase(LockTargetingSoundFirstPerson, true);
            }
        }
        TargetLocationReplicationInterval -= DeltaTime;
        if((TargetLocationReplicationInterval <= float(0)) || IsZero(LockedAimLocation))
        {
            TargetLocationReplicationInterval = default.TargetLocationReplicationInterval;
            ServerSetTargetingLocation(LockedAimLocation);
        }
        LockedAimLocation = BestZoneLocation;        
    }
    else
    {
        LockedHitZone = -1;
    }
    if(PendingLockedTarget != none)
    {
        PendingHitZone = AddTargetingZones(PendingLockedTarget, StartTrace, Aim, BestZoneLocation);        
    }
    else
    {
        PendingHitZone = -1;
    }
}

private reliable server final function ServerSetTargetingLocation(Vector NewTargetingLocation)
{
    LockedAimLocation = NewTargetingLocation;
}

simulated function int AddTargetingZones(KFPawn_Monster KFPTarget, Vector StartTrace, Vector Aim, out Vector BestZoneLocation)
{
    local Vector ZoneLocation;
    local int BestZoneIndex;
    local float BestZoneDot;
    local Vector DirToZone;
    local float DotToZone;
    local int I;

    BestZoneIndex = -1;
    I = 0;
    J0x1A:

    if(I < KFPTarget.WeakSpotSocketNames.Length)
    {
        KFPTarget.Mesh.GetSocketWorldLocationAndRotation(KFPTarget.WeakSpotSocketNames[I], ZoneLocation);
        if(!IsZero(ZoneLocation))
        {
            TargetVulnerableLocations.AddItem(ZoneLocation;
            DirToZone = ZoneLocation - StartTrace;
            DotToZone = Normal(Aim) Dot Normal(DirToZone);
            if(DotToZone > BestZoneDot)
            {
                BestZoneIndex = TargetVulnerableLocations.Length - 1;
                BestZoneDot = DotToZone;
                BestZoneLocation = ZoneLocation;
            }
        }
        ++ I;
        goto J0x1A;
    }
    return BestZoneIndex;
}

simulated function PlayTargetingBeepTimer()
{
    if((Instigator != none) && Instigator.IsHumanControlled())
    {
        PlaySoundBase(LockTargetingSoundFirstPerson, true);
    }
}

simulated event Destroyed()
{
    if(CanvasTexture != none)
    {
        CanvasTexture = none;
    }
    StopAmbientSound();
    super(Weapon).Destroyed();
}

simulated function InstantFireClient()
{
    local Vector StartTrace, EndTrace;
    local Rotator AimRot;
    local array<ImpactInfo> ImpactList;
    local int Idx;
    local ImpactInfo RealImpact;
    local float CurPenetrationValue;

    bInstantHit = true;
    StartTrace = GetSafeStartTraceLocation();
    if(!IsZero(LockedAimLocation))
    {
        AimRot = rotator(Normal(LockedAimLocation - StartTrace));
        EndTrace = StartTrace + (vector(AimRot) * (GetTraceRange()));        
    }
    else
    {
        AimRot = GetAdjustedAim(StartTrace);
        EndTrace = StartTrace + (vector(AimRot) * (GetTraceRange()));
    }
    bInstantHit = false;
    PenetrationPowerRemaining = GetInitialPenetrationPower(CurrentFireMode);
    CurPenetrationValue = PenetrationPowerRemaining;
    RealImpact = CalcWeaponFire(StartTrace, EndTrace, ImpactList);
    if(Instigator != none)
    {
        if(ImpactList.Length > 0)
        {
            Instigator.SetFlashLocation(self, CurrentFireMode, ImpactList[ImpactList.Length - 1].HitLocation);            
        }
        else
        {
            Instigator.SetFlashLocation(self, CurrentFireMode, RealImpact.HitLocation);
        }
    }
    if((Instigator != none) && Instigator.IsLocallyControlled())
    {
        InstantFireClient_AddImpacts(StartTrace, AimRot, ImpactList);
        Idx = 0;
        J0x254:

        if(Idx < ImpactList.Length)
        {
            ProcessInstantHitEx(CurrentFireMode, ImpactList[Idx],, CurPenetrationValue, Idx);
            ++ Idx;
            goto J0x254;
        }
        if(Instigator.Role < ROLE_Authority)
        {
            SendClientImpactList(CurrentFireMode, ImpactList);
        }
    }
}

simulated function OnRender(Canvas C)
{
    local int I;

    if(!bUsingSights)
    {
        return;
    }
    I = 0;
    J0x1C:

    if(I < TargetVulnerableLocations.Length)
    {
        if(!IsZero(TargetVulnerableLocations[I]))
        {
            DrawTargetingIcon(C, I);
        }
        ++ I;
        goto J0x1C;
    }
    CanvasTexture.bNeedsUpdate = true;
}

simulated function DrawTargetingIcon(Canvas Canvas, int Index)
{
    local Vector WorldPos;
    local float IconSize, IconScale;
    local Vector2D ScreenPos;

    WorldPos = TargetVulnerableLocations[Index];
    ScreenPos = WorldToCanvas(Canvas, WorldPos);
    IconScale = FMin(float(Canvas.SizeX) / 1024, 1);
    IconScale *= FClamp(1 - (VSize(WorldPos - Instigator.Location) / 4000), 0.2, 1);
    IconSize = 300 * IconScale;
    ScreenPos.X -= (IconSize / 2);
    ScreenPos.Y -= (IconSize / 2);
    if((((ScreenPos.X < float(0)) || ScreenPos.X > float(Canvas.SizeX)) || ScreenPos.Y < float(0)) || ScreenPos.Y > float(Canvas.SizeY))
    {
        return;
    }
    Canvas.SetPos(ScreenPos.X, ScreenPos.Y);
    if((LockedHitZone >= 0) && Index == LockedHitZone)
    {
        Canvas.DrawTile(LockedHitZoneIcon, IconSize, IconSize, 0, 0, float(LockedHitZoneIcon.SizeX), float(LockedHitZoneIcon.SizeY), RedIconColor);        
    }
    else
    {
        if((PendingHitZone >= 0) && Index == PendingHitZone)
        {
            Canvas.DrawTile(LockedHitZoneIcon, IconSize, IconSize, 0, 0, float(LockedHitZoneIcon.SizeX), float(LockedHitZoneIcon.SizeY), YellowIconColor);            
        }
        else
        {
            Canvas.DrawTile(DefaultHitZoneIcon, IconSize, IconSize, 0, 0, float(DefaultHitZoneIcon.SizeX), float(DefaultHitZoneIcon.SizeY), BlueIconColor);
        }
    }
}

simulated function Vector2D WorldToCanvas(Canvas Canvas, Vector WorldPoint)
{
    local Vector ViewLoc, ViewDir;
    local Rotator ViewRot;
    local Vector X, Y, Z;
    local Vector2D ScreenPoint;
    local float DotToZedUpDown, DotToZedLeftRight, UpDownScale, LeftRightScale;

    Instigator.Controller.GetPlayerViewPoint(ViewLoc, ViewRot);
    GetAxes(ViewRot, X, Y, Z);
    ViewDir = Normal(WorldPoint - ViewLoc);
    DotToZedUpDown = Z Dot ViewDir;
    DotToZedLeftRight = Y Dot ViewDir;
    UpDownScale = DotToZedUpDown / MaxScopeScreenDot;
    LeftRightScale = DotToZedLeftRight / MaxScopeScreenDot;
    ScreenPoint.X = float(CanvasTexture.SizeX) * (0.5 + (LeftRightScale * 0.5));
    ScreenPoint.Y = float(CanvasTexture.SizeY) * (0.5 - (UpDownScale * 0.5));
    return ScreenPoint;
}

auto simulated state Inactive
{
    simulated function BeginState(name PreviousStateName)
    {
        super.BeginState(PreviousStateName);
        StopAmbientSound();
        AdjustLockTarget(none);
        ClearTimer('PlayTargetingBeepTimer');
    }
    stop;    
}

simulated state WeaponEquipping
{
    simulated function BeginState(name PreviousStateName)
    {
        super.BeginState(PreviousStateName);
        StartAmbientSound();
    }
    stop;    
}

simulated state WeaponPuttingDown
{
    simulated event BeginState(name PreviousStateName)
    {
        super.BeginState(PreviousStateName);
        StopAmbientSound();
    }
    stop;    
}

simulated state WeaponAbortEquip
{
    simulated event BeginState(name PreviousStateName)
    {
        super(WeaponPuttingDown).BeginState(PreviousStateName);
        StopAmbientSound();
    }
    stop;    
}

defaultproperties
{
    ForceReloadTime=0.5
    LockedHitZoneIcon=Texture2D'Wep_Scope_TEX.Wep_1stP_Yellow_Red_Target'
    DefaultHitZoneIcon=Texture2D'Wep_Scope_TEX.Wep_1stP_Blue_Target'
    RedIconColor=(R=1,G=0,B=0,A=1)
    YellowIconColor=(R=1,G=1,B=0,A=1)
    BlueIconColor=(R=0.25,G=0.6,B=1,A=1)
    LockRange=200000
    LockAcquireTime=0.35
    LockAcquireTime_Large=0.6
    LockAcquireTime_Boss=1.1
    LockAcquireTime_Versus=1.1
    LockTolerance=0.2
    LockAim=0.995
    MaxScopeScreenDot=0.2
    LockTargetingSoundInterval=0.09
    LockAcquiredSoundFirstPerson=AkEvent'WW_WEP_SA_Railgun.Play_Railgun_Scope_Locked'
    LockLostSoundFirstPerson=AkEvent'WW_WEP_SA_Railgun.Play_Railgun_Scope_Lost'
    LockTargetingSoundFirstPerson=AkEvent'WW_WEP_SA_Railgun.Play_Railgun_Scope_Locking'
    TargetLocationReplicationInterval=0.016
    AmbientSoundPlayEvent=AkEvent'WW_WEP_SA_Railgun.Play_Railgun_Loop'
    AmbientSoundStopEvent=AkEvent'WW_WEP_SA_Railgun.Stop_Railgun_Loop'
    AmbientSoundSocketName=AmbientSound
    begin object name=SceneCapture2DComponent0 class=TWSceneCapture2DDPGComponent
        FieldOfView=23
    object end
    // Reference: TWSceneCapture2DDPGComponent'Default__KFWeap_Rifle_RailGun.SceneCapture2DComponent0'
    SceneCapture=SceneCapture2DComponent0
    ScopeLenseMICTemplate=MaterialInstanceConstant'WEP_1P_RailGun_MAT.Wep_1stP_RailGun_Lens_MIC'
    ScopedSensitivityMod=16
    FireModeIconPaths=/* Array type was not detected. */
    InventorySize=10
    MagazineCapacity=1
    bHasIronSights=true
    bWarnAIWhenAiming=true
    bCanBeReloaded=true
    bReloadFromMagazine=true
    PenetrationPower=/* Array type was not detected. */
    MeshIronSightFOV=27
    PlayerIronSightFOV=70
    IronSightPosition=(X=-0.25,Y=0,Z=0)
    DOF_BlendInSpeed=3
    DOF_FG_FocalRadius=0
    DOF_FG_MaxNearBlurSize=3.5
    AimWarningDelay=(X=0.4,Y=0.8)
    GroupPriority=100
    WeaponSelectTexture=Texture2D'WEP_UI_RailGun_TEX.UI_WeaponSelect_Railgun'
    SpareAmmoCapacity=20
    InitialSpareMags=6
    AmmoPickupScale=3
    WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Heavy_Recoil_SingleShot'
    FireSightedAnims=/* Array type was not detected. */
    BonesToLockOnEmpty=/* Array type was not detected. */
    WeaponFireSnd=/* Array type was not detected. */
    WeaponDryFireSnd=/* Array type was not detected. */
    PlayerViewOffset=(X=3,Y=7,Z=-2)
    AttachmentArchetype=KFWeapAttach_Railgun'WEP_RailGun_ARCH.Wep_RailGun_3P_Updated'
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_Rifle_RailGun.MeleeHelper'
    MuzzleFlashTemplate=KFMuzzleFlash'WEP_RailGun_ARCH.Wep_RailGun_MuzzleFlash'
    IronSightsSpreadMod=0.01
    maxRecoilPitch=600
    minRecoilPitch=450
    maxRecoilYaw=250
    minRecoilYaw=-250
    RecoilBlendOutRatio=1.1
    RecoilViewRotationScale=0.6
    RecoilMaxYawLimit=500
    RecoilMinYawLimit=65035
    RecoilMinPitchLimit=64785
    RecoilISMaxYawLimit=50
    RecoilISMinYawLimit=65485
    RecoilISMaxPitchLimit=500
    RecoilISMinPitchLimit=65485
    HippedRecoilModifier=2.33333
    FallingRecoilModifier=1.5
    AssociatedPerkClasses=/* Array type was not detected. */
    FiringStatesArray=/* Array type was not detected. */
    WeaponProjectiles=/* Array type was not detected. */
    FireInterval=/* Array type was not detected. */
    Spread=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    FireOffset=(X=30,Y=3,Z=-2.5)
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_1P_RailGun_MESH.WEP_1stP_RailGun_Rig'
        AnimSets(0)=AnimSet'WEP_1P_RailGun_ANIM.WEP_1P_RailGun_ANIM'
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Rifle_RailGun.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="Rail Gun"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        StaticMesh=StaticMesh'wep_3p_railgun_mesh.Wep_3rdP_RailGun_Pickup'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Rifle_RailGun.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        StaticMesh=StaticMesh'wep_3p_railgun_mesh.Wep_3rdP_RailGun_Pickup'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Rifle_RailGun.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
    begin object name=SceneCapture2DComponent0 class=TWSceneCapture2DDPGComponent
        FieldOfView=23
    object end
    // Reference: TWSceneCapture2DDPGComponent'Default__KFWeap_Rifle_RailGun.SceneCapture2DComponent0'
    Components(0)=SceneCapture2DComponent0
}