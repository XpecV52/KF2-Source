/*******************************************************************************
 * KFPawn_ZedPatriarch_Versus generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFPawn_ZedPatriarch_Versus extends KFPawn_ZedPatriarch
    config(Game)
    hidecategories(Navigation);

var KFPlayerController MyKFPC;
var KFPlayerController ViewerPlayer;
var float LowHealthThreshold;
var bool bWarnedLowHealthThisPhase;
var bool bIsQuickHealMessageShowing;
var private bool bAutoHealed;
var bool bSummonedThisPhase;
var private float HealThreshold;
var private float AutoHealThreshold;
var private float SummonChildrenDuration;
var private repnotify byte CloakCharges;
var const localized string LowHealthMsg;
var const localized string NoHealsRemainingMsg;
var const localized string NoMortarTargetsMsg;

replication
{
     if(bNetOwner && bNetDirty)
        MyKFPC;

     if(bNetDirty)
        CloakCharges;
}

simulated event ReplicatedEvent(name VarName)
{
    if(VarName == 'CloakCharges')
    {
        if(IsLocallyControlled())
        {
            UpdateCloakCharges();
        }
        return;
    }
    super.ReplicatedEvent(VarName);
}

function PossessedBy(Controller C, bool bVehicleTransition)
{
    super.PossessedBy(C, bVehicleTransition);
    Class'KFPawn_MonsterBoss'.static.PlayBossEntranceTheatrics((self));
    MyKFPC = KFPlayerController(C);
    SetTimer(2 + FRand(), false, 'Timer_EnableCloak');
}

function SetCloaked(bool bNewCloaking)
{
    if(bNewCloaking && IsDoingSpecialMove() || CloakCharges == 0)
    {
        return;
    }
    super.SetCloaked(bNewCloaking);
    UpdateCloakedTimer();
    if(WorldInfo.NetMode != NM_DedicatedServer)
    {
        UpdateCloakCharges();
    }
}

function UpdateCloakedTimer()
{
    if((CloakCharges == 0) || !bIsCloaking)
    {
        if(IsTimerActive('Timer_UpdateCloakCharge'))
        {
            ClearTimer('Timer_UpdateCloakCharge');
        }
        return;
    }
    if(bIsCloaking)
    {
        if(!IsTimerActive('Timer_UpdateCloakCharge'))
        {
            SetTimer(1, true, 'Timer_UpdateCloakCharge');
        }
    }
}

function Timer_UpdateCloakCharge()
{
    CloakCharges = byte(Max(CloakCharges - 1, 0));
    if(CloakCharges == 0)
    {
        SetCloaked(false);
        ClearTimer('Timer_UpdateCloakCharge');
    }
    if(WorldInfo.NetMode != NM_DedicatedServer)
    {
        UpdateCloakCharges();
    }
}

private final function UpdateCloakCharges()
{
    SpecialMoveCooldowns[7].Charges = CloakCharges;
}

function Timer_EnableCloak()
{
    SetCloaked(true);
}

simulated event Tick(float DeltaTime)
{
    if(WorldInfo.NetMode != NM_DedicatedServer)
    {
        if(ViewerPlayer == none)
        {
            ViewerPlayer = KFPlayerController(WorldInfo.GetALocalPlayerController());
        }
        UpdateHealAvailable();
        UpdateCloakIconState();
    }
    super.Tick(DeltaTime);
}

simulated function UpdateGunTrackingSkelCtrl(float DeltaTime)
{
    local Rotator ViewRot;

    if(GunTrackingSkelCtrl != none)
    {
        if(bGunTracking)
        {
            ViewRot = GetViewRotation();
            if((Role < ROLE_Authority) && !IsLocallyControlled())
            {
                ViewRot.Pitch = NormalizeRotAxis(RemoteViewPitch << 8);
            }
            GunTrackingSkelCtrl.DesiredTargetLocation = (GetPawnViewLocation()) + (vector(ViewRot) * 5000);
            GunTrackingSkelCtrl.InterpolateTargetLocation(DeltaTime);            
        }
        else
        {
            GunTrackingSkelCtrl.SetSkelControlActive(false);
        }
    }
}

protected simulated function float GetMinCloakPct()
{
    if((ViewerPlayer != none) && (ViewerPlayer.GetTeamNum() == GetTeamNum()) || ViewerPlayer.PlayerReplicationInfo.bOnlySpectator)
    {
        return 0.4;
    }
    return super.GetMinCloakPct();
}

private final function UpdateHealAvailable()
{
    if(!IsHealAllowed())
    {
        SpecialMoveCooldowns[5].LastUsedTime = WorldInfo.TimeSeconds;
    }
}

private final function UpdateCloakIconState()
{
    if(SpecialMoveCooldowns[7].Charges == 0)
    {
        SpecialMoveCooldowns[7].LastUsedTime = WorldInfo.TimeSeconds;        
    }
    else
    {
        SpecialMoveCooldowns[7].LastUsedTime = 0;
    }
}

private final function bool IsHealAllowed()
{
    return (GetHealthPercentage() < HealThreshold) && SpecialMoveCooldowns[5].Charges > 0;
}

function GetMissileAimDirAndTargetLoc(int MissileNum, Vector MissileLoc, Rotator MissileRot, out Vector AimDir, out Vector TargetLoc)
{
    local PlayerController PC;
    local Vector HitLocation, HitNormal, TraceStart, TraceEnd;
    local Actor HitActor;

    PC = PlayerController(Controller);
    if(PC == none)
    {
        return;
    }
    TraceStart = PC.PlayerCamera.CameraCache.POV.Location;
    TraceEnd = PC.PlayerCamera.CameraCache.POV.Location + (vector(PC.PlayerCamera.CameraCache.POV.Rotation) * 10000);
    HitActor = Trace(HitLocation, HitNormal, TraceEnd, TraceStart, true,,, 1);
    if(HitActor != none)
    {
        AimDir = Normal(HitLocation - MissileLoc);
        TargetLoc = HitLocation;        
    }
    else
    {
        AimDir = Normal(TraceEnd - MissileLoc);
        TargetLoc = TraceEnd;
    }
}

function GetMortarAimDirAndTargetLoc(int MissileNum, Vector MissileLoc, Rotator MissileRot, out Vector AimDir, out Vector TargetLoc, out float MissileSpeed)
{
    local Patriarch_MortarTarget MissileTarget;
    local Vector X, Y, Z;

    GetAxes(MissileRot, X, Y, Z);
    MissileTarget = GetMortarTarget(MissileNum);
    TargetLoc = MissileTarget.TargetPawn.Location + (vect(0, 0, -1) * MissileTarget.TargetPawn.GetCollisionHeight());
    AimDir = Normal(vect(0, 0, 1) + Normal(MissileTarget.TargetVelocity));
    MissileSpeed = VSize(MissileTarget.TargetVelocity);
}

function PreMortarAttack()
{
    ClearMortarTargets();
    CollectMortarTargets(true, true);
    CollectMortarTargets();
}

function bool CollectMortarTargets(optional bool bInitialTarget, optional bool bForceInitialTarget)
{
    local int NumTargets;
    local KFPawn_Human KFP;
    local float TargetDistSQ;
    local Vector MortarVelocity, MortarStartLoc, TargetLoc, TargetProjection;

    MortarStartLoc = Location + (vect(0, 0, 1) * (GetCollisionHeight()));
    NumTargets = ((bInitialTarget) ? 0 : 1);
    foreach WorldInfo.AllPawns(Class'KFPawn_Human', KFP)
    {
        if(!KFP.IsAliveAndWell() || MortarTargets.Find('TargetPawn', KFP != -1)
        {
            continue;            
        }
        TargetLoc = KFP.Location + (vect(0, 0, -1) * (KFP.GetCollisionHeight() * 0.8));
        TargetProjection = MortarStartLoc - TargetLoc;
        TargetDistSQ = VSizeSq(TargetProjection);
        if((TargetDistSQ > MinMortarRangeSQ) && TargetDistSQ < MaxMortarRangeSQ)
        {
            TargetLoc += (Normal(TargetProjection) * KFP.GetCollisionRadius());
            if(SuggestTossVelocity(MortarVelocity, TargetLoc, MortarStartLoc, MortarProjectileClass.default.Speed, 500, 1, vect(0, 0, 0),, (GetGravityZ()) * 0.8))
            {
                if(!FastTrace(MortarStartLoc + (Normal(vect(0, 0, 1) + (Normal(TargetLoc - MortarStartLoc) * 0.9)) * FMax(VSize(MortarVelocity) * 0.55, 800)), MortarStartLoc,, true))
                {
                    continue;                    
                }
                MortarTargets.Insert(NumTargets, 1;
                MortarTargets[NumTargets].TargetPawn = KFP;
                MortarTargets[NumTargets].TargetVelocity = MortarVelocity;
                if(bInitialTarget || NumTargets == 2)
                {                    
                    return true;
                }
                ++ NumTargets;
            }
        }        
    }    
    return false;
}

function ClearMortarTargets()
{
    MortarTargets.Length = 0;
}

function IncrementBattlePhase()
{
    super.IncrementBattlePhase();
    bSummonedThisPhase = false;
}

private final function CheckHealth()
{
    local float HealthPct;

    HealthPct = GetHealthPercentage();
    if(HealthPct < HealThreshold)
    {
        if(Role == ROLE_Authority)
        {
            if((SpecialMoveCooldowns[5].Charges > 0) && HealthPct <= AutoHealThreshold)
            {
                if(IsDoingSpecialMove() && !IsDoingSpecialMove(29))
                {
                    EndSpecialMove();
                }
                bAutoHealed = true;
                DoSpecialMove(29, true);
            }
        }
        if((((!bWarnedLowHealthThisPhase && IsLocallyControlled()) && MyKFPC.myGfxHUD != none) && HealthPct <= LowHealthThreshold) && SpecialMoveCooldowns[5].Charges > 0)
        {
            bWarnedLowHealthThisPhase = true;
            MyKFPC.myGfxHUD.ShowNonCriticalMessage(LowHealthMsg);
        }
    }
}

simulated function NotifySpecialMoveEnded(KFSpecialMove FinishedMove, KFGame.KFPawn.ESpecialMove SMHandle)
{
    super(KFPawn_Monster).NotifySpecialMoveEnded(FinishedMove, SMHandle);
    if(Role == ROLE_Authority)
    {
        SetTimer(2 + FRand(), false, 'Timer_EnableCloak');
    }
}

function NotifyTakeHit(Controller InstigatedBy, Vector HitLocation, int Damage, class<DamageType> DamageType, Vector Momentum, Actor DamageCauser)
{
    super(KFPawn_MonsterBoss).NotifyTakeHit(InstigatedBy, HitLocation, Damage, DamageType, Momentum, DamageCauser);
    CheckHealth();
}

function NotifyHealed()
{
    bWarnedLowHealthThisPhase = false;
    -- SpecialMoveCooldowns[5].Charges;
    CloakCharges = ((bAutoHealed) ? byte(float(default.CloakCharges) * 0.75) : default.CloakCharges);
    SpecialMoveCooldowns[7].Charges = CloakCharges;
    bAutoHealed = false;
}

simulated function bool ShouldDrawBossIcon()
{
    return !bIsCloaking;
}

simulated function bool UseAdjustedControllerSensitivity()
{
    return IsDoingSpecialMove(26) || IsDoingSpecialMove(28);
}

singular function SummonChildren()
{
    if(!bSummonedThisPhase)
    {
        super.SummonChildren();
        bSummonedThisPhase = true;
        SetTimer(SummonChildrenDuration, false, 'Timer_StopSummoningChildren');
        SetFleeAndHealMode(true);
    }
}

function Timer_StopSummoningChildren()
{
    KFGameInfo(WorldInfo.Game).SpawnManager.StopSummoningBossMinions();
}

defaultproperties
{
    LowHealthThreshold=0.3
    HealThreshold=0.5
    AutoHealThreshold=0.25
    SummonChildrenDuration=10
    CloakCharges=60
    LowHealthMsg="Health Is Critical! Heal Now!"
    NoHealsRemainingMsg="No Heals Remaining"
    NoMortarTargetsMsg="No Valid Mortar Targets"
    CloakedAkComponent=AkComponent'Default__KFPawn_ZedPatriarch_Versus.CloakedAkComponent0'
    begin object name=KFSyringeStaticMeshComponent1 class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFPawn_ZedPatriarch_Versus.KFSyringeStaticMeshComponent1'
    HealingSyringeMeshes(0)=KFSyringeStaticMeshComponent1
    begin object name=KFSyringeStaticMeshComponent2 class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFPawn_ZedPatriarch_Versus.KFSyringeStaticMeshComponent2'
    HealingSyringeMeshes(1)=KFSyringeStaticMeshComponent2
    begin object name=KFSyringeStaticMeshComponent3 class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFPawn_ZedPatriarch_Versus.KFSyringeStaticMeshComponent3'
    HealingSyringeMeshes(2)=KFSyringeStaticMeshComponent3
    BoilLightComponent=PointLightComponent'Default__KFPawn_ZedPatriarch_Versus.BoilLightComponent0'
    BattlePhases(0)=bAllowedToSprint=true,SprintCooldownTime=3,bCanTentacleGrab=false,TentacleGrabCooldownTime=0,bCanUseMissiles=true,MissileAttackCooldownTime=10,bCanUseMortar=false,MortarAttackCooldownTime=0,bCanDoMortarBarrage=false,bCanChargeAttack=true,ChargeAttackCooldownTime=14,MaxRageAttacks=0,TentacleDamage=10,MinigunAttackCooldownTime=2.25,bCanSummonMinions=true,bCanMoveWhenMinigunning=(
/* Exception thrown while deserializing bCanMoveWhenMinigunning
System.InvalidOperationException: Nullable object must have a value.
   at System.ThrowHelper.ThrowInvalidOperationException(ExceptionResource resource)
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */,
/* Exception thrown while deserializing bCanMoveWhenMinigunning
System.InvalidOperationException: Nullable object must have a value.
   at System.ThrowHelper.ThrowInvalidOperationException(ExceptionResource resource)
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */,
/* Exception thrown while deserializing bCanMoveWhenMinigunning
System.InvalidOperationException: Nullable object must have a value.
   at System.ThrowHelper.ThrowInvalidOperationException(ExceptionResource resource)
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */,
/* Exception thrown while deserializing bCanMoveWhenMinigunning
System.InvalidOperationException: Nullable object must have a value.
   at System.ThrowHelper.ThrowInvalidOperationException(ExceptionResource resource)
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */),
/* Exception thrown while deserializing BattlePhases
System.ArgumentException: Requested value '0_452' was not found.
   at System.Enum.TryParseEnum(Type enumType, String value, Boolean ignoreCase, EnumResult& parseResult)
   at System.Enum.Parse(Type enumType, String value, Boolean ignoreCase)
   at UELib.Core.UDefaultProperty.DeserializeTagUE3()
   at UELib.Core.UDefaultProperty.Deserialize()
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    BattlePhases(1)=0_7[7914]=/* Unknown default property type! */,
/* Exception thrown while deserializing BattlePhases
System.ArgumentException: Requested value '0_1379' was not found.
   at System.Enum.TryParseEnum(Type enumType, String value, Boolean ignoreCase, EnumResult& parseResult)
   at System.Enum.Parse(Type enumType, String value, Boolean ignoreCase)
   at UELib.Core.UDefaultProperty.DeserializeTagUE3()
   at UELib.Core.UDefaultProperty.Deserialize()
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    BattlePhases(2)=
/* Exception thrown while deserializing BattlePhases
System.ArgumentException: Requested value '0_3854848' was not found.
   at System.Enum.TryParseEnum(Type enumType, String value, Boolean ignoreCase, EnumResult& parseResult)
   at System.Enum.Parse(Type enumType, String value, Boolean ignoreCase)
   at UELib.Core.UDefaultProperty.DeserializeTagUE3()
   at UELib.Core.UDefaultProperty.Deserialize()
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    BattlePhases(3)=
/* Exception thrown while deserializing BattlePhases
System.ArgumentException: Requested value '0_1023' was not found.
   at System.Enum.TryParseEnum(Type enumType, String value, Boolean ignoreCase, EnumResult& parseResult)
   at System.Enum.Parse(Type enumType, String value, Boolean ignoreCase)
   at UELib.Core.UDefaultProperty.DeserializeTagUE3()
   at UELib.Core.UDefaultProperty.Deserialize()
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    MissileProjectileClass=Class'KFProj_Missile_Patriarch_Versus'
    MaxMortarRangeSQ=6250000
    bVersusZed=true
    ThirdPersonViewOffset=(OffsetHigh=(X=-200,Y=90,Z=45),OffsetMid=(X=-185,Y=110,Z=45),OffsetLow=(X=-220,Y=130,Z=55))
    begin object name=MeleeHelper class=KFMeleeHelperAI
        BaseDamage=25
    object end
    // Reference: KFMeleeHelperAI'Default__KFPawn_ZedPatriarch_Versus.MeleeHelper'
    MeleeAttackHelper=MeleeHelper
    XPValues=2500
    MoveListGamepadScheme=/* Array type was not detected. */
    SpecialMoveCooldowns=/* Array type was not detected. */
    FootstepCameraShake=CameraShake'Default__KFPawn_ZedPatriarch_Versus.FootstepCameraShake0'
    SprintAkComponent=AkComponent'Default__KFPawn_ZedPatriarch_Versus.SprintAkComponent0'
    HeadShotAkComponent=AkComponent'Default__KFPawn_ZedPatriarch_Versus.HeadshotAkComponent0'
    begin object name=ThirdPersonHead0 class=SkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: SkeletalMeshComponent'Default__KFPawn_ZedPatriarch_Versus.ThirdPersonHead0'
    ThirdPersonHeadMeshComponent=ThirdPersonHead0
    bNeedsCrosshair=true
    AfflictionHandler=KFAfflictionManager'Default__KFPawn_ZedPatriarch_Versus.Afflictions'
    IncapSettings=/* Array type was not detected. */
    SprintSpeed=700
    SprintStrafeSpeed=400
    TeammateCollisionRadiusPercent=0.3
    DefaultInventory=/* Array type was not detected. */
    begin object name=FirstPersonArms class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedPatriarch_Versus.FirstPersonArms'
    ArmsMesh=FirstPersonArms
    begin object name=SpecialMoveHandler class=KFSpecialMoveHandler
        SpecialMoveClasses=/* Array type was not detected. */
    object end
    // Reference: KFSpecialMoveHandler'Default__KFPawn_ZedPatriarch_Versus.SpecialMoveHandler'
    SpecialMoveHandler=SpecialMoveHandler
    AmbientAkComponent=AkComponent'Default__KFPawn_ZedPatriarch_Versus.AmbientAkSoundComponent_1'
    WeaponAkComponent=AkComponent'Default__KFPawn_ZedPatriarch_Versus.AmbientAkSoundComponent'
    WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'Default__KFPawn_ZedPatriarch_Versus.WeaponAmbientEchoHandler'
    FootstepAkComponent=AkComponent'Default__KFPawn_ZedPatriarch_Versus.FootstepAkSoundComponent'
    DialogAkComponent=AkComponent'Default__KFPawn_ZedPatriarch_Versus.DialogAkSoundComponent'
    Health=1680
    begin object name=KFPawnSkeletalMeshComponent class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedPatriarch_Versus.KFPawnSkeletalMeshComponent'
    Mesh=KFPawnSkeletalMeshComponent
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedPatriarch_Versus.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=Sprite class=SpriteComponent
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__KFPawn_ZedPatriarch_Versus.Sprite'
    Components(0)=Sprite
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedPatriarch_Versus.CollisionCylinder'
    Components(1)=CollisionCylinder
    begin object name=Arrow class=ArrowComponent
        ReplacementPrimitive=none
    object end
    // Reference: ArrowComponent'Default__KFPawn_ZedPatriarch_Versus.Arrow'
    Components(2)=Arrow
    begin object name=KFPawnSkeletalMeshComponent class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedPatriarch_Versus.KFPawnSkeletalMeshComponent'
    Components(3)=KFPawnSkeletalMeshComponent
    Components(4)=AkComponent'Default__KFPawn_ZedPatriarch_Versus.AmbientAkSoundComponent'
    Components(5)=AkComponent'Default__KFPawn_ZedPatriarch_Versus.AmbientAkSoundComponent_1'
    Components(6)=AkComponent'Default__KFPawn_ZedPatriarch_Versus.FootstepAkSoundComponent'
    Components(7)=AkComponent'Default__KFPawn_ZedPatriarch_Versus.DialogAkSoundComponent'
    Components(8)=AkComponent'Default__KFPawn_ZedPatriarch_Versus.SprintAkComponent0'
    Components(9)=AkComponent'Default__KFPawn_ZedPatriarch_Versus.HeadshotAkComponent0'
    Components(10)=AkComponent'Default__KFPawn_ZedPatriarch_Versus.CloakedAkComponent0'
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedPatriarch_Versus.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}