/*******************************************************************************
 * KFWeap_Blunt_MedicBat generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_Blunt_MedicBat extends KFWeap_MeleeBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

const HardFire_L = 'HardFire_L';
const HardFire_R = 'HardFire_R';
const HardFire_F = 'HardFire_F';
const HardFire_B = 'HardFire_B';

var class<KFExplosionActor> ExplosionActorClass;
var() KFGameExplosion ExplosionTemplate;
var() KFGameExplosion LightAttackExplosionTemplate;
var bool bFriendlyFireEnabled;
var array<float> AttackHealAmounts;
var array<byte> AttackHealCosts;
/** How many points of heal ammo to recharge per second */
var(Healing) float HealFullRechargeSeconds;
var float HealingIncrement;
var float HealRechargePerSecond;
var repnotify byte HealingDartAmmo;
var byte StoredPrimaryAmmo;
var byte StoredSecondaryAmmo;
var transient Actor BlastAttachee;
var Vector BlastHitLocation;
var transient float BlastSpawnOffset;
var float StartingDamageRadius;
var class<DamageType> HealingDamageType;
var class<KFGFxWorld_MedicOptics> OpticsUIClass;
var KFGFxWorld_MedicOptics OpticsUI;

replication
{
     if(bNetInitial)
        bFriendlyFireEnabled;

     if((bNetDirty && Role == ROLE_Authority) && bAllowClientAmmoTracking)
        HealingDartAmmo;
}

simulated event ReplicatedEvent(name VarName)
{
    if(VarName == 'HealingDartAmmo')
    {
        AmmoCount[1] = HealingDartAmmo;        
    }
    else
    {
        super(KFWeapon).ReplicatedEvent(VarName);
    }
}

simulated event Tick(float DeltaTime)
{
    if(AmmoCount[1] < MagazineCapacity[1])
    {
        HealAmmoRegeneration(DeltaTime);
    }
    if((Instigator != none) && Instigator.Weapon == self)
    {
        UpdateOpticsUI();
    }
    super(KFWeapon).Tick(DeltaTime);
}

simulated function ConsumeAmmoDarts(int AmmoDartCost)
{
    if((Role == ROLE_Authority) || bAllowClientAmmoTracking)
    {
        if((MagazineCapacity[1] > 0) && AmmoCount[1] > 0)
        {
            AmmoCount[1] = byte(Max(AmmoCount[1] - AmmoDartCost, 0));
        }
    }
}

simulated function ConsumeAmmo(byte FireModeNum)
{
    if(FireModeNum != 0)
    {
        super(KFWeapon).ConsumeAmmo(FireModeNum);
        return;
    }
    ConsumeAmmoDarts(AmmoCost[0]);
}

function GivenTo(Pawn thisPawn, optional bool bDoNotActivate)
{
    super(KFWeapon).GivenTo(thisPawn, bDoNotActivate);
    if((Role == ROLE_Authority) && !thisPawn.IsLocallyControlled())
    {
        StartHealRecharge();
    }
}

function StartHealRecharge()
{
    local KFPerk InstigatorPerk;
    local float UsedHealRechargeTime;

    if(Role == ROLE_Authority)
    {
        InstigatorPerk = GetPerk();
        UsedHealRechargeTime = HealFullRechargeSeconds * (GetUpgradeHealRechargeMod(CurrentWeaponUpgradeIndex));
        InstigatorPerk.ModifyHealerRechargeTime(UsedHealRechargeTime);
        HealRechargePerSecond = float(MagazineCapacity[1]) / UsedHealRechargeTime;
        HealingIncrement = 0;
    }
}

function HealAmmoRegeneration(float DeltaTime)
{
    if(Role == ROLE_Authority)
    {
        HealingIncrement += (HealRechargePerSecond * DeltaTime);
        if((HealingIncrement >= 1) && AmmoCount[1] < MagazineCapacity[1])
        {
            ++ AmmoCount[1];
            HealingIncrement -= 1;
            if(bAllowClientAmmoTracking)
            {
                HealingDartAmmo = AmmoCount[1];
            }
        }
    }
}

simulated event bool HasAmmo(byte FireModeNum, optional int Amount)
{
    if(FireModeNum == 0)
    {
        return true;
    }
    return super(KFWeapon).HasAmmo(FireModeNum, Amount);
}

reliable client simulated function ClientWeaponSet(bool bOptionalSet, optional bool bDoNotActivate)
{
    local KFInventoryManager KFIM;

    super(KFWeapon).ClientWeaponSet(bOptionalSet, bDoNotActivate);
    if(OpticsUI == none)
    {
        KFIM = KFInventoryManager(InvManager);
        if(KFIM != none)
        {
            OpticsUI = KFGFxWorld_MedicOptics(KFIM.GetOpticsUIMovie(OpticsUIClass));
        }
    }
    StartHealRecharge();
}

function ItemRemovedFromInvManager()
{
    local KFInventoryManager KFIM;
    local KFWeap_Blunt_MedicBat KFW;

    super(KFWeapon).ItemRemovedFromInvManager();
    if(OpticsUI != none)
    {
        KFIM = KFInventoryManager(InvManager);
        if(KFIM != none)
        {
            foreach KFIM.InventoryActors(Class'KFWeap_Blunt_MedicBat', KFW)
            {
                if((KFW != self) && KFW.OpticsUI.Class == OpticsUI.Class)
                {                    
                    return;
                }                
            }            
            KFIM.RemoveOpticsUIMovie(OpticsUI.Class);
            OpticsUI.Close();
            OpticsUI = none;
        }
    }
}

simulated function AttachWeaponTo(SkeletalMeshComponent MeshCpnt, optional name SocketName)
{
    super(KFWeapon).AttachWeaponTo(MeshCpnt, SocketName);
    if(OpticsUI != none)
    {
        OpticsUI.SetPause(false);
        UpdateOpticsUI(true);
        OpticsUI.SetShotPercentCost(float(AmmoCost[1]));
    }
}

simulated function DetachWeapon()
{
    local Pawn OwnerPawn;

    super(KFWeapon).DetachWeapon();
    OwnerPawn = Pawn(Owner);
    if((OwnerPawn != none) && OwnerPawn.Weapon == self)
    {
        if(OpticsUI != none)
        {
            OpticsUI.SetPause();
        }
    }
}

simulated function UpdateOpticsUI(optional bool bForceUpdate)
{
    if((OpticsUI != none) && OpticsUI.OpticsContainer != none)
    {
        if((AmmoCount[0] != StoredPrimaryAmmo) || bForceUpdate)
        {
            StoredPrimaryAmmo = AmmoCount[0];
            OpticsUI.SetPrimaryAmmo(StoredPrimaryAmmo);
        }
        if((AmmoCount[1] != StoredSecondaryAmmo) || bForceUpdate)
        {
            StoredSecondaryAmmo = AmmoCount[1];
            OpticsUI.SetHealerCharge(StoredSecondaryAmmo);
        }
        if(OpticsUI.MinPercentPerShot != float(AmmoCost[1]))
        {
            OpticsUI.SetShotPercentCost(1);
        }
    }
}

simulated function bool HasAnyAmmo()
{
    if((HasSpareAmmo()) || AmmoCount[0] >= AmmoCost[6])
    {
        return true;
    }
    return false;
}

simulated function int GetSecondaryAmmoForHUD()
{
    return AmmoCount[1];
}

simulated event PreBeginPlay()
{
    super(KFWeapon).PreBeginPlay();
    if((Role == ROLE_Authority) && KFGameInfo(WorldInfo.Game).FriendlyFireScale != 0)
    {
        bFriendlyFireEnabled = true;
    }
    if(ExplosionTemplate != none)
    {
        StartingDamageRadius = ExplosionTemplate.DamageRadius;
    }
}

simulated function bool CanOverrideMagReload(byte FireModeNum)
{
    return FireModeNum != 2;
}

simulated function SendToFiringState(byte FireModeNum)
{
    if((FireModeNum == 2) && !CanReload())
    {
        SetCurrentFireMode(FireModeNum);
        GotoState('WeaponUpkeep');
        return;
    }
    super.SendToFiringState(FireModeNum);
}

simulated function bool CanReload(optional byte FireModeNum)
{
    return true;
}

simulated function bool ShouldRefire()
{
    if(CurrentFireMode == 6)
    {
        return false;
    }
    return super(Weapon).ShouldRefire();
}

protected simulated function PrepareExplosion()
{
    local KFPlayerController KFPC;
    local KFPerk InstigatorPerk;

    ExplosionTemplate = default.ExplosionTemplate;
    ExplosionTemplate.DamageRadius = StartingDamageRadius;
    if(Owner.Role == ROLE_Authority)
    {
        KFPC = KFPlayerController(Instigator.Controller);
        if(KFPC != none)
        {
            InstigatorPerk = KFPC.GetPerk();
            ExplosionTemplate.DamageRadius *= InstigatorPerk.GetAoERadiusModifier();
        }
    }
    ExplosionActorClass = default.ExplosionActorClass;
}

simulated function name GetWeaponFireAnim(byte FireModeNum)
{
    switch(MeleeAttackHelper.CurrentAttackDir)
    {
        case 0:
        case 4:
        case 5:
            return 'HardFire_F';
        case 1:
        case 6:
        case 7:
            return 'HardFire_B';
        case 2:
            return 'HardFire_L';
        case 3:
            return 'HardFire_R';
        default:
            return 'None';
            break;
    }
}

simulated function SpawnExplosionFromTemplate(KFGameExplosion Template)
{
    local KFExplosionActor ExploActor;
    local Vector SpawnLoc;
    local Rotator SpawnRot;

    SpawnLoc = BlastHitLocation;
    SpawnRot = GetAdjustedAim(SpawnLoc);
    ExploActor = Spawn(ExplosionActorClass, self,, SpawnLoc, SpawnRot,, true);
    if(ExploActor != none)
    {
        ExploActor.InstigatorController = Instigator.Controller;
        ExploActor.Instigator = Instigator;
        ExplosionTemplate.bFullDamageToAttachee = true;
        KFExplosionActorReplicated(ExploActor).bIgnoreInstigator = false;
        ExploActor.bReplicateInstigator = true;
        ExploActor.Explode(Template, vector(SpawnRot));
    }
}

simulated function CustomFire()
{
    if(Instigator.Role < ROLE_Authority)
    {
        return;
    }
    PrepareExplosion();
    SpawnExplosionFromTemplate(ExplosionTemplate);
    IncrementFlashCount();
}

simulated function HealTeammateWithAttack(Actor HitActor, Vector HitLocation, float HealingAmount, byte HealCost)
{
    local KFPawn Victim;

    if(Role == ROLE_Authority)
    {
        if(Instigator != none)
        {
            if(HitActor.bWorldGeometry)
            {
                return;
            }
            Victim = KFPawn(HitActor);
            if((((Victim != none) && Victim.GetTeamNum() == Instigator.GetTeamNum()) && Victim.Health > 0) && Victim.Health < Victim.HealthMax)
            {
                if(AmmoCount[1] >= HealCost)
                {
                    ConsumeAmmoDarts(HealCost);
                    Victim.HealDamage(int(HealingAmount), Instigator.Controller, HealingDamageType);
                    if(Instigator.Role >= ROLE_Authority)
                    {
                        BlastHitLocation = HitLocation;
                        SpawnExplosionFromTemplate(LightAttackExplosionTemplate);
                    }
                }
            }
        }
    }
}

private reliable server final function ServerBeginMedicBatExplosion(Actor HitActor, optional Vector HitLocation)
{
    if(VSizeSq2D(HitLocation - Instigator.Location) > Square(500))
    {
        return;
    }
    BlastHitLocation = HitLocation;
    BlastAttachee = HitActor;
    SendToFiringState(6);
}

simulated function BeginMedicBatExplosion()
{
    SendToFiringState(6);
}

simulated state MeleeAttackBasic
{
    simulated function NotifyMeleeCollision(Actor HitActor, optional Vector HitLocation)
    {
        HealTeammateWithAttack(HitActor, HitLocation, AttackHealAmounts[3], AttackHealCosts[3]);
    }
    stop;    
}

simulated state MeleeChainAttacking
{
    simulated function NotifyMeleeCollision(Actor HitActor, optional Vector HitLocation)
    {
        HealTeammateWithAttack(HitActor, HitLocation, AttackHealAmounts[0], AttackHealCosts[0]);
    }
    stop;    
}

simulated state MeleeHeavyAttacking
{
    simulated function NotifyMeleeCollision(Actor HitActor, optional Vector HitLocation)
    {
        local KFPawn Victim;

        if(Instigator != none)
        {
            if(HitActor.bWorldGeometry)
            {
                return;
            }
            Victim = KFPawn(HitActor);
            if((Victim == none) || Victim.bPlayedDeath && (WorldInfo.TimeSeconds - Victim.TimeOfDeath) > 0)
            {
                return;
            }
            if((AmmoCount[0] >= AmmoCost[6]) && !IsTimerActive('BeginMedicBatExplosion'))
            {
                BlastAttachee = HitActor;
                BlastHitLocation = HitLocation;
                SetTimer(0.001, false, 'BeginMedicBatExplosion');
                if((Role < ROLE_Authority) && Instigator.IsLocallyControlled())
                {
                    if(!HitActor.bTearOff || Victim == none)
                    {
                        ServerBeginMedicBatExplosion(HitActor, HitLocation);
                    }
                }                
            }
            else
            {
                HealTeammateWithAttack(HitActor, HitLocation, AttackHealAmounts[5], AttackHealCosts[5]);
            }
        }
    }
    stop;    
}

simulated state Active
{
    simulated function WeaponEmpty()
    {
        local int I;

        I = 0;
        J0x0B:

        if(I < GetPendingFireLength())
        {
            if(PendingFire(I))
            {
                BeginFire(byte(I));
                goto J0x5F;
            }
            ++ I;
            goto J0x0B;
        }
        J0x5F:

    }
    stop;    
}

defaultproperties
{
    ExplosionActorClass=Class'KFGame.KFExplosionActorReplicated'
    begin object name=HeavyAttackHealingExplosion class=KFGameExplosion
        ExplosionEffects=KFImpactEffectInfo'WEP_Medic_Bat_ARCH.Medic_Bat_Explosion'
        HealingAmount=30
        DamageFalloffExponent=0
        MyDamageType=Class'KFDT_Toxic_MedicBatGas'
        KnockDownStrength=0
        MomentumTransferScale=0
        ExplosionSound=AkEvent'WW_WEP_MEL_MedicBat.Play_WEP_MedicBat_Smoke_Explode'
        FractureMeshRadius=0
        FracturePartVel=0
        CamShake=none
        CamShakeInnerRadius=0
        CamShakeOuterRadius=0
        CamShakeFalloff=1.5
    object end
    // Reference: KFGameExplosion'Default__KFWeap_Blunt_MedicBat.HeavyAttackHealingExplosion'
    ExplosionTemplate=HeavyAttackHealingExplosion
    begin object name=LightAttackExplosion class=KFGameExplosion
        Damage=0
        ParticleEmitterTemplate=ParticleSystem'WEP_Medic_Bat_EMIT.FX_Medic_Bat_Hit'
        CamShake=none
        CamShakeInnerRadius=0
        CamShakeOuterRadius=0
        CamShakeFalloff=1.5
    object end
    // Reference: KFGameExplosion'Default__KFWeap_Blunt_MedicBat.LightAttackExplosion'
    LightAttackExplosionTemplate=LightAttackExplosion
    AttackHealAmounts(0)=30
    AttackHealAmounts(1)=0
    AttackHealAmounts(2)=0
    AttackHealAmounts(3)=30
    AttackHealAmounts(4)=0
    AttackHealAmounts(5)=40
    AttackHealCosts(0)=30
    AttackHealCosts(1)=0
    AttackHealCosts(2)=0
    AttackHealCosts(3)=30
    AttackHealCosts(4)=0
    AttackHealCosts(5)=30
    HealFullRechargeSeconds=12
    HealingDartAmmo=100
    BlastSpawnOffset=-10
    HealingDamageType=Class'KFGame.KFDT_Healing'
    OpticsUIClass=Class'KFGame.KFGFxWorld_MedicOptics'
    ParryStrength=5
    BlockDamageMitigation=0.6
    ParryDamageMitigationPercent=0.5
    BlockSound=AkEvent'WW_WEP_Bullet_Impacts.Play_Block_MEL_Crovel'
    ParrySound=AkEvent'WW_WEP_Bullet_Impacts.Play_Parry_Metal'
    PackageKey="Medic_Bat"
    FirstPersonMeshName="WEP_1P_Medic_Bat_MESH.Wep_1stP_Medic_Bat_Rig"
    FirstPersonAnimSetNames=/* Array type was not detected. */
    PickupMeshName="WEP_3P_Medic_Bat_MESH.Wep_3rdP_Medic_Bat_Pickup"
    AttachmentArchetypeName="WEP_Medic_Bat_ARCH.Wep_Medic_Bat_3P"
    bCanRefillSecondaryAmmo=false
    bCanBeReloaded=true
    bReloadFromMagazine=true
    FireModeIconPaths=/* Array type was not detected. */
    InventorySize=4
    MagazineCapacity[0]=3
    MagazineCapacity[1]=100
    GroupPriority=75
    WeaponSelectTexture=Texture2D'WEP_UI_Medic_Bat_TEX.UI_WeaponSelect_MedicBat'
    SecondaryAmmoTexture=Texture2D'UI_SecondaryAmmo_TEX.MedicDarts'
    AmmoCost=/* Array type was not detected. */
    SpareAmmoCapacity=12
    InitialSpareMags=1
    PlayerViewOffset=(X=3,Y=1,Z=-3)
    begin object name=MeleeHelper class=KFMeleeHelperWeapon
        ChainSequence_B=/* Array type was not detected. */
        ChainSequence_L=/* Array type was not detected. */
        ChainSequence_R=/* Array type was not detected. */
        MeleeImpactCamShakeScale=0.035
        MaxHitRange=250
        HitboxChain=/* Array type was not detected. */
    object end
    // Reference: KFMeleeHelperWeapon'Default__KFWeap_Blunt_MedicBat.MeleeHelper'
    MeleeAttackHelper=MeleeHelper
    AssociatedPerkClasses=/* Array type was not detected. */
    WeaponUpgrades=/* Array type was not detected. */
    FiringStatesArray=/* Array type was not detected. */
    WeaponFireTypes=/* Array type was not detected. */
    FireInterval=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Blunt_MedicBat.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="Hemoclobber"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Blunt_MedicBat.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Blunt_MedicBat.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}