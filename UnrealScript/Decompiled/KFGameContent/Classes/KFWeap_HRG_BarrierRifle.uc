/*******************************************************************************
 * KFWeap_HRG_BarrierRifle generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_HRG_BarrierRifle extends KFWeap_LMG_Stoner63A
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

/** Amount of shield charge that is consumed per second */
var(Shield) float ShieldConsumptionPerSecond;
/** Amount of shield chared that is recharged per second */
var(Shield) float ShieldRechargePerSecond;
/** Cooldown to apply after the shield is destroyed */
var(Shield) float CooldownAfterShieldDepleted;
/** Cooldown to apply after the shield depleted the charge */
var(Shield) float CooldownAfterShieldDestroyed;
/** VFX and SFX for blocking damage */
var(Shield) AkBaseSoundObject BlockSound;
var(Shield) ParticleSystem BlockParticleSystem;
var(Shield) name BlockEffectsSocketName;
/** Blocking information per damage type */
var(Shield) array<BlockEffectInfo> BlockDamageTypes;
/** Modifier applied to the damage received by the character */
var(Shield) float BlockDamageModifier;
/** Modifier applied to the damager that will affect the shield charge */
var(Shield) float ShieldDamageAbsorbtionModifier;
/** Angle to block with the shield */
var(Shield) float BlockingAngle;
/** Turn ON/OFF VFX duration */
var(Shield) float ShieldFXDuration;
/** Shield Block VFX duration */
var(Shield) float ShieldBlockVFXDuration;
var protected transient bool bIsShieldActive;
var protected transient bool bWasShieldDepleted;
var protected transient bool bWasShielDestroyed;
var protected transient bool bCanRechargeShield;
var protected transient bool bShieldActionAvailable;
var protected bool bActivatingShield;
var protected bool bDeactivatingShield;
var protected transient float ShieldRechargeIncrement;
var protected transient float ShieldConsumptionIncrement;
var protected transient float BlockingAngleCos;
var protected transient float FXDelta;
var transient float RedOverlayMax;
var transient float RedOverlayMin;
var protected transient float OverlayDelta;
var WeaponFireSndInfo ShieldActivateSound;
var WeaponFireSndInfo ShieldDeactivateSound;
var WeaponFireSndInfo ShieldEndSound;
var repnotify byte ShieldAmmo;

replication
{
     if(bNetDirty && Role == ROLE_Authority)
        bActivatingShield, bDeactivatingShield;

     if((bNetDirty && Role == ROLE_Authority) && bAllowClientAmmoTracking)
        ShieldAmmo;
}

simulated event ReplicatedEvent(name VarName)
{
    if(VarName == 'ShieldAmmo')
    {
        AmmoCount[1] = ShieldAmmo;        
    }
    else
    {
        super.ReplicatedEvent(VarName);
    }
}

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    BlockingAngleCos = Cos((BlockingAngle / 2) * 0.01745329);
}

simulated function Activate()
{
    super(KFWeapon).Activate();
    if(WorldInfo.NetMode != NM_DedicatedServer)
    {
        UpdateShieldFXValue(0);
    }
}

simulated function UpdateShieldFXValue(float Value)
{
    if(WeaponMICs.Length > 4)
    {
        WeaponMICs[4].SetScalarParameterValue('Opacity', Value);
    }
}

simulated function AltFireMode()
{
    if(!Instigator.IsLocallyControlled())
    {
        return;
    }
    if(Role < ROLE_Authority)
    {
        UseShield();
    }
    CustomFire();
}

reliable server function UseShield()
{
    CustomFire();
}

simulated function CustomFire()
{
    if(((bWasShieldDepleted || bWasShielDestroyed) || !bShieldActionAvailable) || AmmoCount[1] == 0)
    {
        return;
    }
    ((bIsShieldActive) ? DeactivateShield() : ActivateShield());
    bIsShieldActive = !bIsShieldActive;
    bShieldActionAvailable = false;
}

simulated function ActivateShield()
{
    WeaponPlayFireSound(ShieldActivateSound.DefaultCue, ShieldActivateSound.FirstPersonCue);
    bActivatingShield = true;
    bDeactivatingShield = false;
    bNetDirty = true;
    NotifyShieldActive(true);
    SetTimer(FireInterval[1], false, 'ShieldActivationCompleted');
}

simulated function DeactivateShield()
{
    WeaponPlayFireSound(ShieldDeactivateSound.DefaultCue, ShieldDeactivateSound.FirstPersonCue);
    bDeactivatingShield = true;
    bActivatingShield = false;
    bCanRechargeShield = false;
    bNetDirty = true;
    NotifyShieldActive(false);
    SetTimer(FireInterval[1], false, 'ShieldDeactivatedTimerCompleted');
}

simulated function ShieldActivationCompleted()
{
    bShieldActionAvailable = true;
}

simulated function ShieldDeactivatedTimerCompleted()
{
    bShieldActionAvailable = true;
    bCanRechargeShield = true;
}

simulated event Tick(float DeltaTime)
{
    if(WorldInfo.NetMode != NM_DedicatedServer)
    {
        if(bActivatingShield && FXDelta < ShieldFXDuration)
        {
            FXDelta = FMin(FXDelta + DeltaTime, ShieldFXDuration);
            UpdateShieldFXValue(FXDelta / ShieldFXDuration);
            if(FXDelta == ShieldFXDuration)
            {
                bActivatingShield = false;
            }            
        }
        else
        {
            if(bDeactivatingShield && FXDelta > 0)
            {
                FXDelta = FMax(FXDelta - DeltaTime, 0);
                UpdateShieldFXValue(FXDelta / ShieldFXDuration);
                if(FXDelta == 0)
                {
                    bDeactivatingShield = false;
                }
            }
        }
    }
    if(OverlayDelta > RedOverlayMin)
    {
        OverlayDelta = FMax(OverlayDelta - DeltaTime, RedOverlayMin);
        UpdateShieldBlockVFX(RedOverlayMax * (OverlayDelta / ShieldBlockVFXDuration));
    }
    if(Role == ROLE_Authority)
    {
        if(bIsShieldActive)
        {
            ConsumeShield(DeltaTime);            
        }
        else
        {
            if(bCanRechargeShield && AmmoCount[1] < MagazineCapacity[1])
            {
                RechargeShield(DeltaTime);
            }
        }
    }
    super(KFWeapon).Tick(DeltaTime);
}

simulated function ConsumeShield(float DeltaTime)
{
    local int Charge;

    if(Role == ROLE_Authority)
    {
        ShieldRechargeIncrement = 0;
        ShieldConsumptionIncrement += (ShieldConsumptionPerSecond * DeltaTime);
        if((ShieldConsumptionIncrement >= 1) && AmmoCount[1] > 0)
        {
            Charge = int(ShieldConsumptionIncrement);
            AmmoCount[1] = Max(AmmoCount[1] - Charge, 0);
            ShieldConsumptionIncrement -= float(Charge);
            ShieldAmmo = byte(AmmoCount[1]);
            if(AmmoCount[1] == 0)
            {
                OnShieldDepleted();
            }
        }
    }
}

simulated function RechargeShield(float DeltaTime)
{
    local int Charge;

    if(Role == ROLE_Authority)
    {
        ShieldConsumptionIncrement = 0;
        ShieldRechargeIncrement += (ShieldRechargePerSecond * DeltaTime);
        if((ShieldRechargeIncrement >= 1) && AmmoCount[1] < MagazineCapacity[1])
        {
            Charge = int(ShieldRechargeIncrement);
            AmmoCount[1] = Min(AmmoCount[1] + Charge, MagazineCapacity[1]);
            ShieldRechargeIncrement -= float(Charge);
            ShieldAmmo = byte(AmmoCount[1]);
        }
    }
}

simulated function OnShieldDepleted()
{
    bWasShieldDepleted = true;
    bActivatingShield = false;
    bDeactivatingShield = true;
    bCanRechargeShield = false;
    bIsShieldActive = false;
    ShieldAmmo = 0;
    bNetDirty = true;
    NotifyShieldActive(false);
    WeaponPlayFireSound(ShieldEndSound.DefaultCue, ShieldEndSound.FirstPersonCue);
    SetTimer(CooldownAfterShieldDepleted, false, 'ShieldRepletedTimerCompleted');
}

simulated function ShieldRepletedTimerCompleted()
{
    bWasShieldDepleted = false;
    bCanRechargeShield = true;
}

simulated function OnShieldDestroyed()
{
    bWasShielDestroyed = true;
    bActivatingShield = false;
    bDeactivatingShield = true;
    bCanRechargeShield = false;
    bIsShieldActive = false;
    ShieldAmmo = 0;
    bNetDirty = true;
    NotifyShieldActive(false);
    WeaponPlayFireSound(ShieldEndSound.DefaultCue, ShieldEndSound.FirstPersonCue);
    SetTimer(CooldownAfterShieldDestroyed, false, 'ShieldDestroyedTimerCompleted');
}

simulated function ShieldDestroyedTimerCompleted()
{
    bWasShielDestroyed = false;
    bCanRechargeShield = true;
}

simulated function int GetSecondaryAmmoForHUD()
{
    return AmmoCount[1];
}

simulated function ShieldAbsorbDamage(int DamageBase)
{
    local int Damage;

    ShieldConsumptionIncrement += (float(DamageBase) * ShieldDamageAbsorbtionModifier);
    Damage = int(ShieldConsumptionIncrement);
    AmmoCount[1] = Max(AmmoCount[1] - Damage, 0);
    ShieldConsumptionIncrement -= float(Damage);
    if(AmmoCount[1] == 0)
    {
        OnShieldDestroyed();
    }
}

function AdjustDamage(out int InDamage, class<DamageType> DamageType, Actor DamageCauser)
{
    local KFPerk InstigatorPerk;
    local byte BlockTypeIndex;
    local float DmgCauserDot;

    if(!bIsShieldActive)
    {
        return;
    }
    if(Instigator.IsSameTeam(DamageCauser.Instigator))
    {
        return;
    }
    if(CanBlockDamageType(DamageType, BlockTypeIndex))
    {
        if(ClassIsChildOf(DamageCauser.Class, Class'Projectile'))
        {
            DmgCauserDot = Normal(DamageCauser.Instigator.Location - DamageCauser.Location) Dot vector(Instigator.Rotation);            
        }
        else
        {
            DmgCauserDot = Normal(DamageCauser.Location - Instigator.Location) Dot vector(Instigator.Rotation);
        }
        if(DmgCauserDot > BlockingAngleCos)
        {
            ShieldAbsorbDamage(InDamage);
            InDamage *= BlockDamageModifier;
            ClientPlayBlockEffects(BlockTypeIndex);
            NotifyShieldBlockActive(true);
            SetTimer(0.1, false, 'ResetShieldBlockVFX');
            InstigatorPerk = GetPerk();
            if(InstigatorPerk != none)
            {
                InstigatorPerk.SetSuccessfullBlock();
            }
        }
    }
}

function bool CanBlockDamageType(class<DamageType> DamageType, optional out byte out_Idx)
{
    local int Idx;

    Idx = 0;
    J0x0C:

    if(Idx < BlockDamageTypes.Length)
    {
        if(ClassIsChildOf(DamageType, BlockDamageTypes[Idx].dmgType))
        {
            out_Idx = byte(Idx);
            return true;
        }
        ++ Idx;
        goto J0x0C;
    }
    out_Idx = 255;
    return false;
}

unreliable client simulated function ClientPlayBlockEffects(optional byte BlockDTIndex)
{
    local AkBaseSoundObject Sound;
    local ParticleSystem PSTemplate;

    BlockDTIndex = 255;
    GetBlockEffects(BlockDTIndex, Sound, PSTemplate);
    PlayLocalBlockEffects(Sound, PSTemplate);
    UpdateShieldBlockVFX(RedOverlayMax);
    OverlayDelta = ShieldBlockVFXDuration;
}

simulated function PlayLocalBlockEffects(AkBaseSoundObject Sound, ParticleSystem PSTemplate)
{
    local Vector Loc;
    local Rotator Rot;
    local editinline ParticleSystemComponent PSC;

    if(Sound != none)
    {
        PlaySoundBase(Sound, true);
    }
    if(PSTemplate != none)
    {
        if(MySkelMesh.GetSocketWorldLocationAndRotation(BlockEffectsSocketName, Loc, Rot))
        {
            PSC = WorldInfo.MyEmitterPool.SpawnEmitter(PSTemplate, Loc, Rot);
            PSC.SetDepthPriorityGroup(2);            
        }
        else
        {
            LogInternal((string(self) @ string(GetFuncName())) @ "missing BlockEffects Socket!");
        }
    }
}

simulated function GetBlockEffects(byte BlockDTIndex, out AkBaseSoundObject outSound, out ParticleSystem outParticleSys)
{
    outSound = BlockSound;
    outParticleSys = BlockParticleSystem;
    if(BlockDTIndex != 255)
    {
        if(BlockDamageTypes[BlockDTIndex].BlockSound != none)
        {
            outSound = BlockDamageTypes[BlockDTIndex].BlockSound;
        }
        if(BlockDamageTypes[BlockDTIndex].BlockParticleSys != none)
        {
            outParticleSys = BlockDamageTypes[BlockDTIndex].BlockParticleSys;
        }
    }
}

simulated function NotifyShieldActive(bool bActive)
{
    local KFPawn KFP;

    if(WorldInfo.NetMode != NM_Client)
    {
        KFP = KFPawn(Instigator);
        KFP.OnWeaponSpecialAction(((bActive) ? 1 : 0));
    }
}

simulated function NotifyShieldBlockActive(bool bActive)
{
    local KFPawn KFP;

    if(WorldInfo.NetMode != NM_Client)
    {
        KFP = KFPawn(Instigator);
        KFP.OnWeaponSpecialAction(((bActive) ? 3 : 2));
    }
}

simulated function UpdateShieldBlockVFX(float Value)
{
    if(WeaponMICs.Length > 4)
    {
        WeaponMICs[4].SetScalarParameterValue('RedOverlay', Value);
    }
}

function ResetShieldBlockVFX()
{
    NotifyShieldBlockActive(false);
}

simulated function bool HasAnyAmmo()
{
    return (AmmoCount[0] > 0) || SpareAmmoCount[0] > 0;
}

simulated state WeaponEquipping
{
    simulated function BeginState(name PreviousStateName)
    {
        UpdateShieldFXValue(0);
        FXDelta = 0;
        bShieldActionAvailable = true;
        super.BeginState(PreviousStateName);
    }
    stop;    
}

simulated state WeaponPuttingDown
{
    simulated event EndState(name NextStateName)
    {
        UpdateShieldFXValue(0);
        bIsShieldActive = false;
        bWasShieldDepleted = false;
        bWasShielDestroyed = false;
        bCanRechargeShield = true;
        bShieldActionAvailable = false;
        bActivatingShield = false;
        bDeactivatingShield = false;
        FXDelta = 0;
        bNetDirty = true;
        super.EndState(NextStateName);
    }
    stop;    
}

defaultproperties
{
    ShieldConsumptionPerSecond=3
    ShieldRechargePerSecond=8
    CooldownAfterShieldDepleted=3
    CooldownAfterShieldDestroyed=3
    BlockSound=AkEvent'WW_WEP_HRG_BarrierRifle.Play_WEP_HRG_BarrierRifle_1P_Shield_Impact'
    BlockParticleSystem=ParticleSystem'FX_Impacts_EMIT.FX_Block_melee_01'
    BlockEffectsSocketName=BlockEffect
    BlockDamageTypes(0)=(dmgType=Class'KFGame.KFDT_Bludgeon',BlockSound=AkEvent'WW_WEP_HRG_BarrierRifle.Play_WEP_HRG_BarrierRifle_1P_Shield_Impact',ParrySound=none,BlockParticleSys=none,ParryParticleSys=none)
    BlockDamageTypes(1)=(dmgType=Class'KFGame.KFDT_Slashing',BlockSound=AkEvent'WW_WEP_HRG_BarrierRifle.Play_WEP_HRG_BarrierRifle_1P_Shield_Impact',ParrySound=none,BlockParticleSys=none,ParryParticleSys=none)
    BlockDamageTypes(2)=(dmgType=Class'KFDT_Fire_HuskFireball',BlockSound=AkEvent'WW_WEP_HRG_BarrierRifle.Play_WEP_HRG_BarrierRifle_1P_Shield_Impact',ParrySound=none,BlockParticleSys=none,ParryParticleSys=none)
    BlockDamageTypes(3)=(dmgType=Class'KFDT_Fire_HuskFlamethrower',BlockSound=none,ParrySound=none,BlockParticleSys=none,ParryParticleSys=none)
    BlockDamageTypes(4)=(dmgType=Class'KFDT_BloatPuke',BlockSound=none,ParrySound=none,BlockParticleSys=none,ParryParticleSys=none)
    BlockDamageTypes(5)=(dmgType=Class'KFDT_EvilDAR_Rocket',BlockSound=AkEvent'WW_WEP_HRG_BarrierRifle.Play_WEP_HRG_BarrierRifle_1P_Shield_Impact',ParrySound=none,BlockParticleSys=none,ParryParticleSys=none)
    BlockDamageTypes(6)=(dmgType=Class'KFDT_EvilDAR_Laser',BlockSound=AkEvent'WW_WEP_HRG_BarrierRifle.Play_WEP_HRG_BarrierRifle_1P_Shield_Impact',ParrySound=none,BlockParticleSys=none,ParryParticleSys=none)
    BlockDamageTypes(7)=(dmgType=Class'KFDT_DAR_EMPBlast',BlockSound=AkEvent'WW_WEP_HRG_BarrierRifle.Play_WEP_HRG_BarrierRifle_1P_Shield_Impact',ParrySound=none,BlockParticleSys=none,ParryParticleSys=none)
    BlockDamageTypes(8)=(dmgType=Class'KFDT_Ballistic_PatMinigun',BlockSound=AkEvent'WW_WEP_HRG_BarrierRifle.Play_WEP_HRG_BarrierRifle_1P_Shield_Impact',ParrySound=none,BlockParticleSys=none,ParryParticleSys=none)
    BlockDamageTypes(9)=(dmgType=Class'KFDT_Explosive_PatMissile',BlockSound=AkEvent'WW_WEP_HRG_BarrierRifle.Play_WEP_HRG_BarrierRifle_1P_Shield_Impact',ParrySound=none,BlockParticleSys=none,ParryParticleSys=none)
    BlockDamageTypes(10)=(dmgType=Class'KFDT_Ballistic_HansAK12',BlockSound=AkEvent'WW_WEP_HRG_BarrierRifle.Play_WEP_HRG_BarrierRifle_1P_Shield_Impact',ParrySound=none,BlockParticleSys=none,ParryParticleSys=none)
    BlockDamageTypes(11)=(dmgType=Class'KFDT_EMP_MatriarchTeslaBlast',BlockSound=AkEvent'WW_WEP_HRG_BarrierRifle.Play_WEP_HRG_BarrierRifle_1P_Shield_Impact',ParrySound=none,BlockParticleSys=none,ParryParticleSys=none)
    BlockDamageTypes(12)=(dmgType=Class'KFDT_EMP_MatriarchPlasmaCannon',BlockSound=none,ParrySound=none,BlockParticleSys=none,ParryParticleSys=none)
    BlockDamageTypes(13)=(dmgType=Class'KFDT_FleshpoundKing_ChestBeam',BlockSound=none,ParrySound=none,BlockParticleSys=none,ParryParticleSys=none)
    BlockDamageModifier=0.3
    ShieldDamageAbsorbtionModifier=1.2
    BlockingAngle=180
    ShieldFXDuration=0.15
    ShieldBlockVFXDuration=0.5
    bCanRechargeShield=true
    bShieldActionAvailable=true
    RedOverlayMax=1
    ShieldActivateSound=(DefaultCue=AkEvent'WW_WEP_HRG_BarrierRifle.Play_WEP_HRG_BarrierRifle_3P_Shield_On',FirstPersonCue=AkEvent'WW_WEP_HRG_BarrierRifle.Play_WEP_HRG_BarrierRifle_1P_Shield_On')
    ShieldDeactivateSound=(DefaultCue=AkEvent'WW_WEP_HRG_BarrierRifle.Play_WEP_HRG_BarrierRifle_3P_Shield_Off',FirstPersonCue=AkEvent'WW_WEP_HRG_BarrierRifle.Play_WEP_HRG_BarrierRifle_1P_Shield_Off')
    ShieldEndSound=(DefaultCue=AkEvent'WW_WEP_HRG_BarrierRifle.Play_WEP_HRG_BarrierRifle_3P_Shield_End',FirstPersonCue=AkEvent'WW_WEP_HRG_BarrierRifle.Play_WEP_HRG_BarrierRifle_1P_Shield_End')
    PackageKey="HRG_BarrierRifle"
    FirstPersonMeshName="WEP_1P_HRG_BarrierRifle_MESH.WEP_1stP_HRG_BarrielRifle_Rig"
    FirstPersonAnimSetNames=/* Array type was not detected. */
    PickupMeshName="WEP_3P_HRG_BarrierRifle_MESH.Wep_3rdP_HRG_BarrierRifle_Pickup"
    AttachmentArchetypeName="WEP_HRG_BarrierRifle_ARCH.Wep_HRG_BarrierRifle_3P"
    MuzzleFlashTemplateName="WEP_HRG_BarrierRifle_ARCH.Wep_HRG_BarrierRifle_MuzzleFlash"
    bCanRefillSecondaryAmmo=false
    InventorySize=7
    GroupPriority=125
    WeaponSelectTexture=Texture2D'wep_ui_hrg_barrierrifle_tex.UI_WeaponSelect_HRG_BarrierRifle'
    SecondaryAmmoTexture=Texture2D'ui_firemodes_tex.UI_FireModeSelect_Electricity'
    MagazineCapacity[0]=60
    MagazineCapacity[1]=100
    AmmoCost=/* Array type was not detected. */
    SpareAmmoCapacity=540
    InitialSpareMags=2
    NumBloodMapMaterials=5
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_HRG_BarrierRifle.MeleeHelper'
    maxRecoilPitch=110
    maxRecoilYaw=80
    minRecoilYaw=-80
    RecoilRate=0.045
    RecoilViewRotationScale=0.4
    AssociatedPerkClasses=/* Array type was not detected. */
    WeaponUpgrades=/* Array type was not detected. */
    WeaponFireTypes=/* Array type was not detected. */
    FireInterval=/* Array type was not detected. */
    Spread=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_HRG_BarrierRifle.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="HRG Bastion"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_HRG_BarrierRifle.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_HRG_BarrierRifle.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}