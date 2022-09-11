/*******************************************************************************
 * KFWeap_Bow_CompoundBow generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_Bow_CompoundBow extends KFWeapon
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

const ArrowSocketName = 'RW_Weapon';

var float MaxChargeTime;
var float ValueIncreaseTime;
var float StateMaxChargeTime;
var float StateValueIncreaseTime;
var transient float ChargeTime;
var transient float MaxChargeLevel;
var transient bool bIsFullyCharged;
var transient bool bHasArrowBeenFired;
var bool bReloadingFromEmptyMag;
var byte StartFireModeAfterReload;
var float DmgIncreasePerCharge;
var array<float> ArrowSpeedPerCharge;
/** How much to increase the wait time to force a reload, this value will be added to FireInterval */
var() float ForceReloadTime;
var ParticleSystem CryoProjectileEffectOn;
var ParticleSystem CryoProjectileEffectOff;
var export editinline transient KFParticleSystemComponent CryoProjectilePSC;
/** The Sound FX to play for the Cryo Projectile */
var() AkEvent CryoProjectileSoundEffectOn;
var() AkEvent CryoProjectileSoundEffectOff;
/** Anims for Iron, Idle and ShootLoop transitions */
var(Animations) const editconst name IdleToIronSightAnim;
var(Animations) const editconst name IronSightToIdleAnim;
var(Animations) const editconst name IronSightShootToShootAnim;
var(Animations) const editconst name ShootToIronSightShootAnim;

simulated function int GetChargeLevel()
{
    local float Level;

    Level = float(Min(int(ChargeTime / StateValueIncreaseTime), int(MaxChargeLevel)));
    return Min(int(Level), ArrowSpeedPerCharge.Length - 1);
}

static simulated event KFGame.KFGFxObject_TraderItems.EFilterTypeUI GetTraderFilter()
{
    return 3;
}

simulated function ConsumeAmmo(byte FireModeNum)
{
    super.ConsumeAmmo(FireModeNum);
    if((Role == ROLE_Authority) || bAllowClientAmmoTracking)
    {
        if((FireModeNum == 0) || FireModeNum == 1)
        {
            bReloadingFromEmptyMag = SpareAmmoCount[GetAmmoType(FireModeNum)] == 0;
        }
    }
}

simulated function bool ShouldPlayFireLast(byte FireModeNum)
{
    if(SpareAmmoCount[GetAmmoType(FireModeNum)] == 0)
    {
        return true;
    }
    return false;
}

simulated function name GetReloadAnimName(bool bTacticalReload)
{
    if(AmmoCount[GetAmmoType(CurrentFireMode)] > 0)
    {
        WarnInternal("Compound Bow reloading with non-empty mag");
    }
    if(bReloadingFromEmptyMag)
    {
        return ((bTacticalReload) ? 'Reload_Empty_Elite' : 'Reload_Empty');
    }
    return ((bTacticalReload) ? 'Reload_Half_Elite' : 'Reload_Half');
}

simulated function SetIronSights(bool bNewIronSights)
{
    local KFPawn_Human P;

    super.SetIronSights(bNewIronSights);
    P = KFPawn_Human(Instigator);
    if((P != none) && P.IsLocallyControlled())
    {
        P.SetIronSights(bNewIronSights, true);
        KFPawn(Instigator).bNetDirty = true;
    }
}

simulated function AltFireMode()
{
    local KFPawn_Human P;

    super.AltFireMode();
    if(!Instigator.IsLocallyControlled())
    {
        return;
    }
    if(WorldInfo.NetMode == NM_DedicatedServer)
    {
        return;
    }
    if(bUseAltFireMode)
    {
        CryoProjectilePSC.DeactivateSystem();
        CryoProjectilePSC.SetTemplate(CryoProjectileEffectOn);
        CryoProjectilePSC.ActivateSystem();
        WeaponPlayFireSound(CryoProjectileSoundEffectOn, CryoProjectileSoundEffectOn);        
    }
    else
    {
        CryoProjectilePSC.DeactivateSystem();
        CryoProjectilePSC.SetTemplate(CryoProjectileEffectOff);
        CryoProjectilePSC.ActivateSystem();
        WeaponPlayFireSound(CryoProjectileSoundEffectOff, CryoProjectileSoundEffectOff);
    }
    P = KFPawn_Human(Instigator);
    if(P != none)
    {
        P.SetUsingAltFireMode(bUseAltFireMode, true);
        P.bNetDirty = true;
    }
}

simulated function AttachWeaponTo(SkeletalMeshComponent MeshCpnt, optional name SocketName)
{
    super.AttachWeaponTo(MeshCpnt, SocketName);
    if(CryoProjectilePSC == none)
    {
        CryoProjectilePSC = new (self) Class'KFParticleSystemComponent';
        CryoProjectilePSC.SetDepthPriorityGroup(2);
        CryoProjectilePSC.SetTickGroup(4);
        CryoProjectilePSC.SetFOV(MySkelMesh.FOV);
        MySkelMesh.AttachComponentToSocket(CryoProjectilePSC, 'RW_Weapon');
    }
    if(bUseAltFireMode)
    {
        CryoProjectilePSC.SetTemplate(CryoProjectileEffectOn);
        CryoProjectilePSC.ActivateSystem();
        WeaponPlayFireSound(CryoProjectileSoundEffectOn, CryoProjectileSoundEffectOn);
    }
}

simulated function DetachWeapon()
{
    if(CryoProjectilePSC != none)
    {
        CryoProjectilePSC.DeactivateSystem();
        MySkelMesh.DetachComponent(CryoProjectilePSC);
        CryoProjectilePSC = none;
    }
    super.DetachWeapon();
}

simulated event SetFOV(float NewFOV)
{
    super.SetFOV(NewFOV);
    if(CryoProjectilePSC != none)
    {
        CryoProjectilePSC.super(KFParticleSystemComponent).SetFOV(NewFOV);
    }
}

simulated function float GetReloadRateScale()
{
    local KFPerk CurrentPerk;
    local float AnimRate;

    CurrentPerk = GetPerk();
    AnimRate = super.GetReloadRateScale();
    if(CurrentPerk != none)
    {
        CurrentPerk.ModifyRateOfFire(AnimRate, self);
    }
    return AnimRate;
}

simulated function StartLoopingFireEffects(byte FireModeNum, optional bool bForceAnim)
{
    local KFPerk CurrentPerk;
    local float AdjustedAnimLength;
    local name WeaponFireAnimName;

    if(bForceAnim || (FireModeNum < bLoopingFireAnim.Length) && bLoopingFireAnim[FireModeNum])
    {
        WeaponFireAnimName = GetLoopStartFireAnim(FireModeNum);
        if(WeaponFireAnimName != 'None')
        {
            AdjustedAnimLength = MySkelMesh.GetAnimLength(WeaponFireAnimName);
            CurrentPerk = GetPerk();
            if(CurrentPerk != none)
            {
                CurrentPerk.ModifyRateOfFire(AdjustedAnimLength, self);
            }
            PlayAnimation(WeaponFireAnimName, AdjustedAnimLength, false, FireTweenTime, 0);            
        }
        else
        {
            WeaponFireAnimName = GetLoopingFireAnim(FireModeNum);
            PlayAnimation(WeaponFireAnimName, MySkelMesh.GetAnimLength(WeaponFireAnimName), true, FireTweenTime);
        }
        bPlayingLoopingFireAnim = true;
    }
    StartLoopingFireSound(FireModeNum);
}

simulated function StopLoopingFireEffects(byte FireModeNum)
{
    local KFPerk CurrentPerk;
    local float AdjustedAnimLength;
    local name LoopEndFireAnim;

    if(bPlayingLoopingFireAnim)
    {
        LoopEndFireAnim = GetLoopEndFireAnim(FireModeNum);
        if(LoopEndFireAnim != 'None')
        {
            AdjustedAnimLength = MySkelMesh.GetAnimLength(LoopEndFireAnim);
            CurrentPerk = GetPerk();
            if(CurrentPerk != none)
            {
                CurrentPerk.ModifyRateOfFire(AdjustedAnimLength, self);
            }
            PlayAnimation(LoopEndFireAnim, AdjustedAnimLength);            
        }
        else
        {
            ClearTimer('OnAnimEnd');
        }
        bPlayingLoopingFireAnim = false;
    }
    StopLoopingFireSound(FireModeNum);
}

simulated function CauseMuzzleFlash(byte FireModeNum)
{
    return;
}

simulated function StartFire(byte FireModeNum)
{
    if((((FireModeNum == 0) || FireModeNum == 1) || FireModeNum == 4) || FireModeNum == 3)
    {
        if((IsTimerActive('RefireCheckTimer') || IsTimerActive('ForceReload')) || IsInState('Reloading'))
        {
            if((FireModeNum == 0) || FireModeNum == 1)
            {
                StartFireModeAfterReload = FireModeNum;
            }
            return;
        }
    }
    super.StartFire(FireModeNum);
}

simulated function StopFire(byte FireModeNum)
{
    StartFireModeAfterReload = 255;
    super.StopFire(FireModeNum);
}

simulated function OnStartFire()
{
    local KFPawn PawnInst;

    PawnInst = KFPawn(Instigator);
    if(PawnInst != none)
    {
        PawnInst.OnStartFire();
    }
}

simulated function float GetForceReloadDelay()
{
    return ForceReloadTime;
}

simulated function bool AllowSprinting()
{
    return !IsTimerActive('ForceReload');
}

simulated function Timer_StopFireEffects()
{
    if(WorldInfo.NetMode == NM_Client)
    {
        Instigator.WeaponStoppedFiring(self, false);
    }
    ClearFlashCount();
    ClearFlashLocation();
}

simulated function Timer_StartFireAfterReload()
{
    if(IsTimerActive('Timer_StopFireEffects'))
    {
        return;
    }
    ClearTimer('Timer_StartFireAfterReload');
    if(StartFireModeAfterReload != 255)
    {
        StartFire(StartFireModeAfterReload);
    }
}

simulated function int GetModifiedDamage(byte FireModeNum, optional Vector RayDir)
{
    local int ModifiedDamage;

    ModifiedDamage = super.GetModifiedDamage(FireModeNum, RayDir);
    if((FireModeNum == 0) || FireModeNum == 1)
    {
        ModifiedDamage = int(float(ModifiedDamage) * (1 + (DmgIncreasePerCharge * float(GetChargeLevel()))));
    }
    return ModifiedDamage;
}

simulated function KFProjectile SpawnProjectile(class<KFProjectile> KFProjClass, Vector RealStartLoc, Vector AimDir)
{
    local KFProjectile SpawnedProjectile;
    local int Level;
    local float SpeedCharge;

    SpawnedProjectile = super.SpawnProjectile(KFProjClass, RealStartLoc, AimDir);
    if((SpawnedProjectile != none) && (CurrentFireMode == 0) || CurrentFireMode == 1)
    {
        Level = GetChargeLevel();
        SpeedCharge = ArrowSpeedPerCharge[Level];
        SpawnedProjectile.MaxSpeed = SpeedCharge;
        SpawnedProjectile.Speed = SpeedCharge;
        SpawnedProjectile.TerminalVelocity = SpeedCharge;
        if((Level == 0) || Level == 1)
        {
            SpawnedProjectile.SetPhysics(2);
        }
        SpawnedProjectile.Init(AimDir);
    }
    return SpawnedProjectile;
}

simulated function ProcessInstantHitEx(byte FiringMode, ImpactInfo Impact, optional int NumHits, optional out float out_PenetrationVal, optional int ImpactNum)
{
    local KFPerk InstigatorPerk;

    InstigatorPerk = GetPerk();
    if(InstigatorPerk != none)
    {
        InstigatorPerk.UpdatePerkHeadShots(Impact, InstantHitDamageTypes[FiringMode], ImpactNum);
    }
    super.ProcessInstantHitEx(FiringMode, Impact, NumHits, out_PenetrationVal, ImpactNum);
}

simulated function ANIMNOTIFY_LockBolt()
{
    EmptyMagBlendNode.SetBlendTarget(1, 0);
}

simulated state Active
{
    simulated function BeginState(name PreviousStateName)
    {
        if(IsTimerActive('Timer_StopFireEffects'))
        {
            return;
        }
        super.BeginState(PreviousStateName);
    }

    simulated function ZoomIn(bool bAnimateTransition, float ZoomTimeToGo)
    {
        if(IsTimerActive('Timer_StopFireEffects'))
        {
            return;
        }
        GotoState('ActiveIronSight');
    }
    stop;    
}

simulated state ActiveIronSight extends Active
{
    simulated function ZoomOut(bool bAnimateTransition, float ZoomTimeToGo)
    {
        ZoomTimeToGo = MySkelMesh.GetAnimLength(IronSightToIdleAnim);
        global.ZoomOut(true, ZoomTimeToGo);
        PlayAnimation(IronSightToIdleAnim, ZoomTime, false);
        GotoState('Active');
    }

    simulated function BeginState(name PreviousStateName)
    {
        local float ZoomTimeToGo;

        ZoomTimeToGo = MySkelMesh.GetAnimLength(IdleToIronSightAnim);
        global.ZoomIn(true, ZoomTimeToGo);
        PlayAnimation(IdleToIronSightAnim, ZoomTime, false);
    }
    stop;    
}

simulated state CompoundBowCharge extends WeaponSingleFireAndReload
{
    ignores FireAmmunition;

    simulated event BeginState(name PreviousStateName)
    {
        local KFPerk CurrentPerk;

        super(WeaponFiring).BeginState(PreviousStateName);
        StateMaxChargeTime = MaxChargeTime;
        StateValueIncreaseTime = ValueIncreaseTime;
        CurrentPerk = GetPerk();
        if(CurrentPerk != none)
        {
            CurrentPerk.ModifyRateOfFire(StateMaxChargeTime, self);
            CurrentPerk.ModifyRateOfFire(StateValueIncreaseTime, self);
        }
        ChargeTime = 0;
        MaxChargeLevel = float(int(StateMaxChargeTime / StateValueIncreaseTime));
        bIsFullyCharged = false;
        bHasArrowBeenFired = false;
        global.OnStartFire();
    }

    simulated function bool ShouldRefire()
    {
        return StillFiring(CurrentFireMode);
    }

    simulated event Tick(float DeltaTime)
    {
        global.Tick(DeltaTime);
        if(bIsFullyCharged)
        {
            return;
        }
        if(PendingFire(CurrentFireMode))
        {
            ChargeTime += DeltaTime;
        }
        if(ChargeTime >= StateMaxChargeTime)
        {
            bIsFullyCharged = true;
        }
    }

    simulated event EndState(name NextStateName)
    {
        ClearZedTimeResist();
        ClearPendingFire(CurrentFireMode);
        ClearTimer('RefireCheckTimer');
        KFPawn(Instigator).bHasStartedFire = false;
        KFPawn(Instigator).bNetDirty = true;
        if(bUsingSights)
        {
            if(Instigator.IsLocallyControlled())
            {
                SetIronSights(false);
            }
        }
    }

    simulated function PutDownWeapon()
    {
        ChargeTime = 0;
        bIsFullyCharged = false;
        global.PutDownWeapon();
    }

    simulated function HandleFinishedFiring()
    {
        FireAmmunition();
        bHasArrowBeenFired = true;
        if(bPlayingLoopingFireAnim)
        {
            StopLoopingFireEffects(CurrentFireMode);
        }
        if(MuzzleFlash != none)
        {
            SetTimer(MuzzleFlash.MuzzleFlash.Duration, false, 'Timer_StopFireEffects');            
        }
        else
        {
            SetTimer(0.3, false, 'Timer_StopFireEffects');
        }
        NotifyWeaponFinishedFiring(CurrentFireMode);
        super(Weapon).HandleFinishedFiring();
    }

    simulated function ZoomIn(bool bAnimateTransition, float ZoomTimeToGo)
    {
        if(bHasArrowBeenFired || !bIsFullyCharged)
        {
            return;
        }
        if(IsTimerActive('Timer_StopFireEffects'))
        {
            return;
        }
        ZoomTimeToGo = MySkelMesh.GetAnimLength(ShootToIronSightShootAnim);
        global.ZoomIn(true, ZoomTimeToGo);
        PlayAnimation(ShootToIronSightShootAnim, ZoomTime, false);
    }

    simulated function ZoomOut(bool bAnimateTransition, float ZoomTimeToGo)
    {
        if(IsTimerActive('Timer_StopFireEffects'))
        {
            return;
        }
        ZoomTimeToGo = MySkelMesh.GetAnimLength(IronSightShootToShootAnim);
        global.ZoomOut(true, ZoomTimeToGo);
        PlayAnimation(IronSightShootToShootAnim, ZoomTime, false);
    }
    stop;    
}

simulated state Reloading
{
    simulated function byte GetWeaponStateId()
    {
        local KFPerk Perk;
        local bool bTacticalReload;

        Perk = GetPerk();
        bTacticalReload = (Perk != none) && Perk.GetUsingTactialReload(self);
        if(bReloadingFromEmptyMag)
        {
            return byte(((bTacticalReload) ? 4 : 2));
        }
        return byte(((bTacticalReload) ? 3 : 1));
    }

    simulated function ReloadComplete()
    {
        super.ReloadComplete();
        if(StartFireModeAfterReload != 255)
        {
            SetTimer(0.01, true, 'Timer_StartFireAfterReload');
        }
    }
    stop;    
}

defaultproperties
{
    MaxChargeTime=0.50664
    ValueIncreaseTime=0.2
    StartFireModeAfterReload=255
    DmgIncreasePerCharge=0.5
    ArrowSpeedPerCharge(0)=4000
    ArrowSpeedPerCharge(1)=10000
    ArrowSpeedPerCharge(2)=15000
    ForceReloadTime=0.1
    CryoProjectileEffectOn=ParticleSystem'WEP_CompoundBow_EMIT.FX_Compound_Bow_Cryo_Idle_1P'
    CryoProjectileEffectOff=ParticleSystem'WEP_CompoundBow_EMIT.FX_Compound_Bow_Cryo_ToggleOff'
    CryoProjectileSoundEffectOn=AkEvent'WW_WEP_SA_CompoundBow.CompoundBow_Cryo_On'
    CryoProjectileSoundEffectOff=AkEvent'WW_WEP_SA_CompoundBow.CompoundBow_Cryo_Off'
    IdleToIronSightAnim=Idle_To_Iron
    IronSightToIdleAnim=Iron_To_Idle
    IronSightShootToShootAnim=ShootLoop_Iron_To_ShootLoop
    ShootToIronSightShootAnim=ShootLoop_To_ShootLoop_Iron
    PackageKey="CompoundBow"
    FirstPersonMeshName="WEP_1P_CompoundBow_MESH.Wep_1stP_CompoundBow_Rig"
    FirstPersonAnimSetNames=/* Array type was not detected. */
    PickupMeshName="WEP_3P_CompoundBow_MESH.Wep_3rdP_CompoundBow_Pickup"
    AttachmentArchetypeName="WEP_CompoundBow_ARCH.Wep_CompoundBow_3P"
    MuzzleFlashTemplateName="WEP_CompoundBow_ARCH.Wep_CompoundBow_MuzzleFlash"
    bHasIronSights=true
    bWarnAIWhenAiming=true
    bCanBeReloaded=true
    bReloadFromMagazine=true
    bHasFireLastAnims=true
    FireModeIconPaths=/* Array type was not detected. */
    InventorySize=8
    PenetrationPower=/* Array type was not detected. */
    MeshIronSightFOV=52
    PlayerIronSightFOV=70
    MaxAIWarningDistSQ=4000000
    AimWarningDelay=(X=0.4,Y=0.8)
    GroupPriority=125
    WeaponSelectTexture=Texture2D'WEP_UI_CompoundBow_TEX.UI_WeaponSelect_Compound_Bow'
    MagazineCapacity=1
    SpareAmmoCapacity=30
    InitialSpareMags=10
    AmmoPickupScale=3
    bLoopingFireAnim=/* Array type was not detected. */
    FireAnim=None
    FireLastAnim=None
    FireSightedAnims=/* Array type was not detected. */
    FireLastSightedAnim=None
    BonesToLockOnEmpty=/* Array type was not detected. */
    WeaponFireSnd=/* Array type was not detected. */
    WeaponDryFireSnd=/* Array type was not detected. */
    PlayerViewOffset=(X=0,Y=0,Z=0)
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_Bow_CompoundBow.MeleeHelper'
    maxRecoilPitch=200
    minRecoilPitch=150
    maxRecoilYaw=100
    minRecoilYaw=-100
    RecoilRate=0.06
    RecoilMaxYawLimit=500
    RecoilMinYawLimit=65035
    RecoilMaxPitchLimit=900
    RecoilMinPitchLimit=64785
    RecoilISMaxYawLimit=50
    RecoilISMinYawLimit=65485
    RecoilISMaxPitchLimit=375
    RecoilISMinPitchLimit=65460
    AssociatedPerkClasses=/* Array type was not detected. */
    FiringStatesArray=/* Array type was not detected. */
    WeaponFireTypes=/* Array type was not detected. */
    WeaponProjectiles=/* Array type was not detected. */
    FireInterval=/* Array type was not detected. */
    Spread=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    FireOffset=(X=25,Y=2,Z=-4)
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Bow_CompoundBow.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="Compound Bow"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Bow_CompoundBow.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Bow_CompoundBow.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}