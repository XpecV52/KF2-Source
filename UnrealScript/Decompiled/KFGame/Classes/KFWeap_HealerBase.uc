/*******************************************************************************
 * KFWeap_HealerBase generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_HealerBase extends KFWeapon
    abstract
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

const IdleReadyAnim = 'Idle_Ready';
const HealSelfAnim = 'Heal_Self';
const HealSelfReloadAnim = 'Heal_Self_Reload';
const HealTeamAnim = 'Heal_Team';
const HealTeamReloadAnim = 'Heal_Team_Reload';
const QuickHealAnim = 'Heal_Quick';

/** How many points of heal ammo to recharge per second */
var() float HealSelfRechargeSeconds;
/** How many points of heal ammo to recharge per second when healing ourselves */
var() float HealOtherRechargeSeconds;
var float HealRechargeTime;
var float HealingIncrement;
var float HealRechargePerSecond;
var repnotify bool bIsAmmoRecharging;
var bool bQuickHealMode;
var bool bPlayHealAndReload;
var bool bIsQuickHealMessageShowing;
var AkEvent RechargeCompleteSound;
/**  
 *How long after we shart trying to heal before a zed can grab us.
 *  Prevents us from missing healing shots from being grabbed
 */
var(Weapon) float HealAttemptWeakZedGrabCooldown;
/** Maximum range to find teammate */
var() float HealingRangeSQ;
var Pawn HealTarget;
var Pawn LastValidHealTarget;
var float LastReadyHealTime;
var const float StandAloneHealAmount;
var class<KFGFxWorld_HealerScreen> ScreenUIClass;
var KFGFxWorld_HealerScreen ScreenUI;
var float LastUIUpdateTime;
var float UIUpdateInterval;

replication
{
     if(bNetDirty)
        bIsAmmoRecharging;
}

simulated event ReplicatedEvent(name VarName)
{
    super.ReplicatedEvent(VarName);
    if(VarName == 'bIsAmmoRecharging')
    {
        if(!bIsAmmoRecharging && Owner != none)
        {
            PlaySoundBase(RechargeCompleteSound, true, false, false, Owner.Location);
        }
    }
}

function GivenTo(Pawn NewOwner, optional bool bDoNotActivate)
{
    local KFInventoryManager KFInvManger;

    super.GivenTo(NewOwner, bDoNotActivate);
    KFInvManger = KFInventoryManager(InvManager);
    if((InvManager != none) && KFInvManger != none)
    {
        KFInvManger.HealerWeapon = self;
    }
}

simulated function AttachWeaponTo(SkeletalMeshComponent MeshCpnt, optional name SocketName)
{
    super.AttachWeaponTo(MeshCpnt, SocketName);
    if((Instigator != none) && Instigator.IsLocallyControlled())
    {
        if(ScreenUI == none)
        {
            ScreenUI = new (self) ScreenUIClass;
            ScreenUI.Init();
            ScreenUI.Start(true);
        }
        if(ScreenUI != none)
        {
            ScreenUI.SetPause(false);
            ScreenUI.SetCharge(byte(MagazineCapacity[0]));
        }
    }
}

simulated function DetachWeapon()
{
    super.DetachWeapon();
    if(((Instigator != none) && Instigator.IsLocallyControlled()) && ScreenUI != none)
    {
        ScreenUI.SetPause();
    }
}

simulated event Destroyed()
{
    if(((Instigator != none) && Instigator.IsLocallyControlled()) && ScreenUI != none)
    {
        ScreenUI.Close();
    }
    super(Weapon).Destroyed();
}

simulated function int GetSpareAmmoForHUD()
{
    return 0;
}

simulated function bool HasAnyAmmo()
{
    return true;
}

simulated function PerformReload(optional byte FireModeNum)
{
    local KFPerk InstigatorPerk;

    InstigatorPerk = GetPerk();
    if(Role == ROLE_Authority)
    {
        bIsAmmoRecharging = true;
        InstigatorPerk.ModifyHealerRechargeTime(HealRechargeTime);
        HealRechargePerSecond = float(MagazineCapacity[0]) / HealRechargeTime;
    }
}

function HealAmmoRegeneration(float DeltaTime)
{
    HealingIncrement += (HealRechargePerSecond * DeltaTime);
    if((HealingIncrement >= 1) && AmmoCount[0] < MagazineCapacity[0])
    {
        ++ AmmoCount[0];
        HealingIncrement -= 1;
        if(AmmoCount[0] == MagazineCapacity[0])
        {
            bIsAmmoRecharging = false;
            if(Instigator.IsLocallyControlled() && Owner != none)
            {
                PlaySoundBase(RechargeCompleteSound, true, false, false, Owner.Location);
            }
        }
    }
}

simulated function bool CanReload(optional byte FireModeNum);

simulated function AltFireMode()
{
    if(!Instigator.IsLocallyControlled())
    {
        return;
    }
    StartFire(1);
}

simulated function CustomFire()
{
    local float HealAmount;

    if(Role == ROLE_Authority)
    {
        if(CurrentFireMode == 0)
        {
            HealAmount = InstantHitDamage[CurrentFireMode];
            HealTarget.HealDamage(int(HealAmount), Instigator.Controller, InstantHitDamageTypes[CurrentFireMode]);
            HealRechargeTime = HealOtherRechargeSeconds;            
        }
        else
        {
            if(CurrentFireMode == 1)
            {
                if((GetActivePlayerCount()) < 2)
                {
                    HealAmount = StandAloneHealAmount;                    
                }
                else
                {
                    HealAmount = InstantHitDamage[CurrentFireMode];
                }
                Instigator.HealDamage(int(HealAmount), Instigator.Controller, InstantHitDamageTypes[CurrentFireMode]);
                HealRechargeTime = HealSelfRechargeSeconds;
            }
        }
    }
}

simulated function StartFire(byte FireModeNum)
{
    local Pawn Healee;

    if(FireModeNum > 1)
    {
        super.StartFire(FireModeNum);
        return;
    }
    Healee = ((FireModeNum == 0) ? HealTarget : Instigator);
    if((Healee == none) || !IsValidHealingTarget(Healee))
    {
        if(((FireModeNum == 0) && HealTarget == none) && (WorldInfo.TimeSeconds - LastReadyHealTime) < 2)
        {
            MissHeal(LastValidHealTarget);
        }
        return;
    }
    if((Instigator == none) || !Instigator.bNoWeaponFiring)
    {
        if(Role < ROLE_Authority)
        {
            ServerStartHeal(FireModeNum, HealTarget, bPlayHealAndReload);
        }
        BeginFire(FireModeNum);
    }
}

simulated function bool IsValidHealingTarget(Pawn Healee)
{
    if(Healee != none)
    {
        return (Healee.Health < Healee.HealthMax) && Healee.IsAliveAndWell();
    }
    return false;
}

private reliable server final function ServerStartHeal(byte FireModeNum, Pawn P, bool bClientIsReloading)
{
    if((FireModeNum == 0) && !P.IsAliveAndWell())
    {
        return;
    }
    bPlayHealAndReload = bClientIsReloading;
    HealTarget = P;
    ServerStartFire(FireModeNum);
}

simulated function MissHeal(Pawn P)
{
    if(Role < ROLE_Authority)
    {
        ServerMissHeal(P);        
    }
    else
    {
        if(((Role == ROLE_Authority) && KFGameInfo(WorldInfo.Game) != none) && KFGameInfo(WorldInfo.Game).DialogManager != none)
        {
            KFGameInfo(WorldInfo.Game).DialogManager.PlayHealMissDialog(KFPawn(Instigator), KFPawn(P));
        }
    }
}

private unreliable server final function ServerMissHeal(Pawn P)
{
    MissHeal(P);
}

simulated function PlayFireEffects(byte FireModeNum, optional Vector HitLocation)
{
    PlayFiringSound(CurrentFireMode);
    if((Instigator != none) && Instigator.IsFirstPerson())
    {
        ShakeView();
    }
}

simulated function name GetHealAnimName(byte FireModeNum)
{
    if(bPlayHealAndReload)
    {
        return ((FireModeNum == 0) ? 'Heal_Team_Reload' : 'Heal_Self_Reload');        
    }
    else
    {
        return ((FireModeNum == 0) ? 'Heal_Team' : 'Heal_Self');
    }
}

simulated function float GetFireInterval(byte FireModeNum)
{
    local name AnimName;

    if(FireModeNum <= 1)
    {
        AnimName = GetHealAnimName(FireModeNum);
        return FMax(MySkelMesh.GetAnimInterruptTime(AnimName), 0.01);
    }
    return super(Weapon).GetFireInterval(FireModeNum);
}

simulated function bool ShouldRefire()
{
    return false;
}

simulated event Tick(float DeltaTime)
{
    super.Tick(DeltaTime);
    if((Role == ROLE_Authority) && AmmoCount[0] < MagazineCapacity[0])
    {
        HealAmmoRegeneration(DeltaTime);
    }
    if((Instigator != none) && (Instigator.WorldInfo.TimeSeconds - LastUIUpdateTime) > UIUpdateInterval)
    {
        LastUIUpdateTime = Instigator.WorldInfo.TimeSeconds;
        UpdateInteractionMessage();
    }
    UpdateScreenUI();
}

simulated function UpdateInteractionMessage()
{
    local KFPlayerController InstigatorKFPC;
    local bool bCannotBeHealed;
    local KFPowerUp PowerUp;

    if(((Instigator != none) && Instigator.IsLocallyControlled()) && Instigator.Health > 0)
    {
        InstigatorKFPC = KFPlayerController(Instigator.Controller);
        if(InstigatorKFPC == none)
        {
            return;
        }
        PowerUp = InstigatorKFPC.GetPowerUp();
        bCannotBeHealed = (PowerUp != none) && !PowerUp.CanBeHealedWhilePowerUpIsActive;
        if(bIsQuickHealMessageShowing)
        {
            if(((Instigator.Health > InstigatorKFPC.LowHealthThreshold) || AmmoCount[0] < AmmoCost[1]) || bCannotBeHealed)
            {
                bIsQuickHealMessageShowing = false;
                InstigatorKFPC.ReceiveLocalizedMessage(Class'KFLocalMessage_Interaction', 0);
            }
        }
        if(((Instigator.Health <= InstigatorKFPC.LowHealthThreshold) && AmmoCount[0] >= AmmoCost[1]) && !bCannotBeHealed)
        {
            bIsQuickHealMessageShowing = true;
            InstigatorKFPC.ReceiveLocalizedMessage(Class'KFLocalMessage_Interaction', 13);
        }
    }
}

simulated function UpdateScreenUI()
{
    if(((Instigator != none) && Instigator.IsLocallyControlled()) && Instigator.Weapon == self)
    {
        if((ScreenUI != none) && ScreenUI.CurrentCharge != AmmoCount[0])
        {
            ScreenUI.SetCharge(byte(AmmoCount[0]));
        }
    }
}

simulated function UpdateHealTarget(optional bool bSkipOnAnimEnd)
{
    local bool bHasHealTarget;
    local Vector AimDir, StartTrace, Projection;
    local Pawn P;
    local KFPawn KFP;
    local float DistSq, FOV, HealTargetRating, BestHealTargetRating;

    if((WorldInfo.TimeSeconds - LastReadyHealTime) < 0.2)
    {
        return;
    }
    bHasHealTarget = HealTarget != none;
    HealTarget = none;
    StartTrace = Instigator.GetWeaponStartTraceLocation();
    AimDir = vector(GetAdjustedAim(StartTrace));
    foreach WorldInfo.AllPawns(Class'Pawn', P)
    {
        if(((P != Instigator) && P.GetTeamNum() == Instigator.GetTeamNum()) && P.IsAliveAndWell())
        {
            KFP = KFPawn(P);
            if((KFP != none) && !KFP.CanBeHealed())
            {
                continue;                
            }
            Projection = P.Location - StartTrace;
            DistSq = VSizeSq(Projection);
            if(DistSq > HealingRangeSQ)
            {
                continue;                
            }
            FOV = AimDir Dot Normal(Projection);
            if(FOV > 0.4)
            {
                HealTargetRating = FOV + (0.4 * (1 - (DistSq / HealingRangeSQ)));
                if((HealTargetRating > BestHealTargetRating) && FastTrace(P.Location, StartTrace))
                {
                    BestHealTargetRating = HealTargetRating;
                    HealTarget = P;
                    LastValidHealTarget = P;
                    LastReadyHealTime = WorldInfo.TimeSeconds;
                }
            }
        }        
    }    
    if(!bSkipOnAnimEnd && bHasHealTarget != (HealTarget != none))
    {
        OnAnimEnd(none, 0, 0);
    }
}

simulated function QuickHealEndTimer();

simulated function QuickHealFireTimer();

simulated function Activate()
{
    super.Activate();
    HealTarget = none;
    if(bQuickHealMode && Instigator.IsLocallyControlled())
    {
        SetCurrentFireMode(1);
        GotoState('WeaponQuickHeal');
        if(Role < ROLE_Authority)
        {
            ServerStartQuickHeal();
        }
    }
}

private reliable server final function ServerStartQuickHeal()
{
    SetCurrentFireMode(1);
    GotoState('WeaponQuickHeal');
}

function int GetActivePlayerCount()
{
    local KFPlayerController KFPC;
    local int TotalPlayers;

    TotalPlayers = 0;
    foreach WorldInfo.AllControllers(Class'KFPlayerController', KFPC)
    {
        if(KFPC.bIsAchievementPlayer)
        {
            ++ TotalPlayers;
        }        
    }    
    return TotalPlayers;
}

simulated state Active
{
    simulated event Tick(float DeltaTime)
    {
        global.Tick(DeltaTime);
        UpdateHealTarget();
        UpdateScreenUI();
    }

    simulated function PlayIdleAnim()
    {
        local int IdleIndex;

        if((Instigator != none) && Instigator.IsFirstPerson())
        {
            UpdateHealTarget(true);
            if(HealTarget != none)
            {
                PlayAnimation('Idle_Ready', 0, true, 0.2);                
            }
            else
            {
                IdleIndex = Rand(IdleAnims.Length);
                PlayAnimation(IdleAnims[IdleIndex], 0, true, 0.2);
            }
        }
    }
    stop;    
}

simulated state WeaponHealing extends WeaponSingleFiring
{
    simulated function byte GetWeaponStateId()
    {
        return 29;
    }

    simulated event BeginState(name PreviousStateName)
    {
        LogInternal(((((((((string(WorldInfo.TimeSeconds) @ "Self:") @ string(self)) @ "Instigator:") @ string(Instigator)) @ string(GetStateName())) $ "::") $ string(GetFuncName())) @ "PreviousStateName:") @ string(PreviousStateName), 'Inventory');
        SetWeakZedGrabCooldownOnPawn(HealAttemptWeakZedGrabCooldown);
        PlayHeal();
        TimeWeaponFiring(CurrentFireMode);
        NotifyBeginState();
    }

    simulated function PlayHeal()
    {
        local name AnimName;

        AnimName = GetHealAnimName(CurrentFireMode);
        if((Instigator != none) && Instigator.IsFirstPerson())
        {
            if(AnimName != 'None')
            {
                PlayAnimation(AnimName,,, FireTweenTime);
            }
        }
    }

    simulated function RefireCheckTimer()
    {
        FireAmmunition();
        PerformReload();
        HandleFinishedFiring();
    }

    simulated function EndState(name NextStateName)
    {
        super(WeaponFiring).EndState(NextStateName);
        NotifyEndState();
    }
    stop;    
}

simulated state WeaponQuickHeal extends WeaponHealing
{
    simulated function byte GetWeaponStateId()
    {
        return 30;
    }

    simulated event BeginState(name PreviousStateName)
    {
        super.BeginState(PreviousStateName);
        bQuickHealMode = false;
    }

    simulated function EndState(name NextStateName)
    {
        super.EndState(NextStateName);
        ClearTimer('QuickHealEndTimer');
    }

    simulated function TimeWeaponFiring(byte FireModeNum)
    {
        local float Duration, QuickHealFireTime;
        local name AnimName;

        AnimName = GetHealAnimName(FireModeNum);
        Duration = MySkelMesh.GetAnimLength(AnimName);
        if(Duration > float(0))
        {
            SetTimer(Duration, false, 'QuickHealEndTimer');
        }
        QuickHealFireTime = FMax(MySkelMesh.GetAnimInterruptTime(AnimName), 0.01);
        SetTimer(QuickHealFireTime, false, 'QuickHealFireTimer');
    }

    simulated function QuickHealEndTimer()
    {
        KFInventoryManager(InvManager).SwitchToLastWeapon();
        PutDownWeapon();
        WeaponIsDown();
    }

    simulated function QuickHealFireTimer()
    {
        FireAmmunition();
        PerformReload();
    }

    simulated function name GetHealAnimName(byte FireModeNum)
    {
        return 'Heal_Quick';
    }
    stop;    
}

defaultproperties
{
    HealSelfRechargeSeconds=15
    HealOtherRechargeSeconds=7.5
    RechargeCompleteSound=AkEvent'WW_WEP_SA_Syringe.Play_WEP_SA_Syringe_Charged'
    HealAttemptWeakZedGrabCooldown=1
    HealingRangeSQ=23000
    StandAloneHealAmount=50
    ScreenUIClass=Class'KFGFxWorld_HealerScreen'
    UIUpdateInterval=1
    bTargetAdhesionEnabled=false
    bCanBeReloaded=true
    bReloadFromMagazine=true
    bInfiniteSpareAmmo=true
    bAllowClientAmmoTracking=false
    InventoryGroup=EInventoryGroup.IG_Equipment
    GroupPriority=6
    MagazineCapacity=100
    AmmoCost(0)=100
    AmmoCost(1)=100
    FireTweenTime=0.3
    WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_SA_Syringe.Play_WEP_SA_Syringe_3P_Fire_Single',FirstPersonCue=AkEvent'WW_WEP_SA_Syringe.Play_WEP_SA_Syringe_1P_Fire_Single')
    WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_SA_Syringe.Play_WEP_SA_Syringe_3P_Fire_Single',FirstPersonCue=AkEvent'WW_WEP_SA_Syringe.Play_WEP_SA_Syringe_1P_Fire_Single')
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_HealerBase.MeleeHelper'
    AssociatedPerkClasses(0)=none
    FiringStatesArray=/* Array type was not detected. */
    WeaponFireTypes=/* Array type was not detected. */
    FireInterval=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_HealerBase.FirstPersonMesh'
    Mesh=FirstPersonMesh
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_HealerBase.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_HealerBase.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}