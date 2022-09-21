/*******************************************************************************
 * KFWeap_Rifle_ParasiteImplanter generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_Rifle_ParasiteImplanter extends KFWeap_ScopedBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

const SecondaryFireAnim = 'Shoot_Secondary';
const SecondaryFireIronAnim = 'Shoot_Secondary_Iron';

var float LastFireInterval;
var float SeedFullRechargeSeconds;
var transient float SeedRechargePerSecond;
var transient float SeedIncrement;
var repnotify byte SeedAmmo;
var LinearColor NoAmmoMaterialColor;
var LinearColor AmmoReadyMaterialColor;
var protected const float AltFireRecoilScale;

replication
{
     if(bNetDirty && Role == ROLE_Authority)
        SeedAmmo;
}

simulated event ReplicatedEvent(name VarName)
{
    if(VarName == 'SeedAmmo')
    {
        if((AmmoCount[1] < AmmoCost[1]) && SeedAmmo >= AmmoCost[1])
        {
            UpdateMaterial(true);            
        }
        else
        {
            if((AmmoCount[1] >= AmmoCost[1]) && SeedAmmo < AmmoCost[1])
            {
                UpdateMaterial(false);
            }
        }
        AmmoCount[1] = SeedAmmo;        
    }
    else
    {
        super(KFWeapon).ReplicatedEvent(VarName);
    }
}

static simulated event KFGame.KFGFxObject_TraderItems.EFilterTypeUI GetTraderFilter()
{
    if((default.FiringStatesArray[0] == 'WeaponFiring') || default.FiringStatesArray[0] == 'WeaponBurstFiring')
    {
        return 7;        
    }
    else
    {
        return 2;
    }
}

simulated event PreBeginPlay()
{
    super(KFWeapon).PreBeginPlay();
    StartSeedRecharge();
}

function StartSeedRecharge()
{
    local float UsedSeedRechargeTime;

    if(Role == ROLE_Authority)
    {
        UsedSeedRechargeTime = SeedFullRechargeSeconds;
        SeedRechargePerSecond = float(MagazineCapacity[1]) / UsedSeedRechargeTime;
        SeedIncrement = 0;
    }
}

function RechargeSeed(float DeltaTime)
{
    if(Role == ROLE_Authority)
    {
        SeedIncrement += (SeedRechargePerSecond * DeltaTime);
        if((SeedIncrement >= 1) && AmmoCount[1] < MagazineCapacity[1])
        {
            ++ AmmoCount[1];
            SeedIncrement -= 1;
            SeedAmmo = byte(AmmoCount[1]);
        }
    }
}

function GivenTo(Pawn thisPawn, optional bool bDoNotActivate)
{
    super(KFWeapon).GivenTo(thisPawn, bDoNotActivate);
    if((Role == ROLE_Authority) && !thisPawn.IsLocallyControlled())
    {
        StartSeedRecharge();
    }
}

simulated event Tick(float DeltaTime)
{
    local bool bWasLowAmmo;

    bWasLowAmmo = AmmoCount[1] < AmmoCost[1];
    if(AmmoCount[1] < MagazineCapacity[1])
    {
        RechargeSeed(DeltaTime);
    }
    if(WorldInfo.NetMode != NM_DedicatedServer)
    {
        if(bWasLowAmmo && AmmoCount[1] >= AmmoCost[1])
        {
            UpdateMaterial(true);
        }        
    }
    else
    {
        if(bWasLowAmmo && AmmoCount[1] >= AmmoCost[1])
        {
            NotifyAltAmmoReady(true);
        }
    }
    super.Tick(DeltaTime);
}

static simulated event SetTraderWeaponStats(out array<STraderItemWeaponStats> WeaponStats)
{
    super(KFWeapon).SetTraderWeaponStats(WeaponStats);
    WeaponStats.Length = WeaponStats.Length + 1;
    WeaponStats[WeaponStats.Length - 1].StatType = 9;
    WeaponStats[WeaponStats.Length - 1].StatValue = default.SeedFullRechargeSeconds;
}

simulated function bool HasAnyAmmo()
{
    return (HasSpareAmmo()) || HasAmmo(0);
}

simulated function ConsumeAmmo(byte FireModeNum)
{
    local bool bWasHighAmmo;

    if(FireModeNum != 1)
    {
        super(KFWeapon).ConsumeAmmo(FireModeNum);
        return;
    }
    bWasHighAmmo = AmmoCount[1] >= AmmoCost[1];
    if(Role == ROLE_Authority)
    {
        if((MagazineCapacity[1] > 0) && AmmoCount[1] > 0)
        {
            AmmoCount[1] = Max(AmmoCount[1] - AmmoCost[1], 0);
        }
    }
    if(WorldInfo.NetMode != NM_DedicatedServer)
    {
        if(bWasHighAmmo && AmmoCount[1] < AmmoCost[1])
        {
            UpdateMaterial(false);
        }        
    }
    else
    {
        if(bWasHighAmmo && AmmoCount[1] < AmmoCost[1])
        {
            NotifyAltAmmoReady(false);
        }
    }
}

simulated function AltFireMode()
{
    if(!Instigator.IsLocallyControlled())
    {
        return;
    }
    StartFire(1);
}

simulated function float GetFireInterval(byte FireModeNum)
{
    if((FireModeNum == 0) && AmmoCount[FireModeNum] == 0)
    {
        return LastFireInterval;
    }
    return super(Weapon).GetFireInterval(FireModeNum);
}

simulated function name GetWeaponFireAnim(byte FireModeNum)
{
    if(FireModeNum == 1)
    {
        return ((bUsingSights) ? 'Shoot_Secondary_Iron' : 'Shoot_Secondary');
    }
    return super(KFWeapon).GetWeaponFireAnim(FireModeNum);
}

simulated function UpdateMaterial(bool HasEnoughAmmo)
{
    local LinearColor MatColor;

    if(WorldInfo.NetMode != NM_DedicatedServer)
    {
        MatColor = ((HasEnoughAmmo) ? AmmoReadyMaterialColor : NoAmmoMaterialColor);
        if(WeaponMICs.Length >= 0)
        {
            WeaponMICs[0].SetVectorParameterValue('Vector_GlowColor', MatColor);
        }
    }
}

simulated function NotifyAltAmmoReady(bool bActive)
{
    local KFPawn KFP;

    if(WorldInfo.NetMode != NM_Client)
    {
        KFP = KFPawn(Instigator);
        KFP.OnWeaponSpecialAction(((bActive) ? 2 : 1));
    }
}

simulated function ModifyRecoil(out float CurrentRecoilModifier)
{
    if(CurrentFireMode == 1)
    {
        CurrentRecoilModifier *= AltFireRecoilScale;
    }
    super(KFWeapon).ModifyRecoil(CurrentRecoilModifier);
}

simulated function bool ShouldAutoReload(byte FireModeNum)
{
    if(FireModeNum == 1)
    {
        return false;
    }
    return super(KFWeapon).ShouldAutoReload(FireModeNum);
}

simulated function bool CanOverrideMagReload(byte FireModeNum)
{
    return super(KFWeapon).CanOverrideMagReload(FireModeNum) || FireModeNum == 1;
}

defaultproperties
{
    LastFireInterval=0.3
    SeedFullRechargeSeconds=14
    SeedAmmo=100
    NoAmmoMaterialColor=(R=0,G=0,B=0,A=1)
    AmmoReadyMaterialColor=(R=0.08,G=1,B=0.08,A=1)
    AltFireRecoilScale=0.2
    begin object name=SceneCapture2DComponent0 class=TWSceneCapture2DDPGComponent
        FieldOfView=12.5
    object end
    // Reference: TWSceneCapture2DDPGComponent'Default__KFWeap_Rifle_ParasiteImplanter.SceneCapture2DComponent0'
    SceneCapture=SceneCapture2DComponent0
    ScopeLenseMICTemplate=MaterialInstanceConstant'WEP_1P_ParasiteImplanter_MAT.Wep_1stP_Parasite_Lens_MIC'
    ScopedSensitivityMod=8
    PackageKey="ParasiteImplanter"
    FirstPersonMeshName="WEP_1P_ParasiteImplanter_MESH.Wep_1stP_ParasiteImplanter_Rig"
    FirstPersonAnimSetNames=/* Array type was not detected. */
    PickupMeshName="WEP_3P_ParasiteImplanter_MESH.Wep_3rdP_ParasiteImplanter_Pickup"
    AttachmentArchetypeName="WEP_ParasiteImplanter_ARCH.Wep_ParasiteImplanter_3P"
    MuzzleFlashTemplateName="WEP_ParasiteImplanter_ARCH.Wep_ParasiteImplanter_MuzzleFlash"
    bHasIronSights=true
    bWarnAIWhenAiming=true
    bCanRefillSecondaryAmmo=false
    bCanBeReloaded=true
    bReloadFromMagazine=true
    bHasFireLastAnims=true
    InventorySize=7
    PenetrationPower=/* Array type was not detected. */
    MeshFOV=70
    MeshIronSightFOV=27
    PlayerIronSightFOV=70
    IronSightPosition=(X=0,Y=-0.09,Z=1.042)
    DOF_BlendInSpeed=3
    DOF_FG_FocalRadius=0
    DOF_FG_MaxNearBlurSize=3.5
    AimWarningDelay=(X=0.4,Y=0.8)
    GroupPriority=100
    WeaponSelectTexture=Texture2D'wep_ui_parasiteimplanter_tex.UI_WeaponSelect_ParasiteImplanter'
    SecondaryAmmoTexture=Texture2D'ui_firemodes_tex.UI_FireModeSelect_Electricity'
    MagazineCapacity[0]=6
    MagazineCapacity[1]=100
    AmmoCost=/* Array type was not detected. */
    SpareAmmoCapacity=78
    InitialSpareMags=3
    WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Medium_Recoil'
    BonesToLockOnEmpty=/* Array type was not detected. */
    WeaponFireSnd=/* Array type was not detected. */
    WeaponDryFireSnd=/* Array type was not detected. */
    PlayerViewOffset=(X=3,Y=8,Z=-1.8)
    NumBloodMapMaterials=2
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_Rifle_ParasiteImplanter.MeleeHelper'
    EjectedShellForegroundDuration=1.5
    maxRecoilPitch=575
    minRecoilPitch=425
    maxRecoilYaw=135
    minRecoilYaw=-135
    RecoilRate=0.08
    RecoilViewRotationScale=0.6
    RecoilMaxYawLimit=500
    RecoilMinYawLimit=65035
    RecoilMaxPitchLimit=1250
    RecoilMinPitchLimit=64785
    RecoilISMaxYawLimit=50
    RecoilISMinYawLimit=65485
    RecoilISMaxPitchLimit=500
    RecoilISMinPitchLimit=65485
    IronSightMeshFOVCompensationScale=1.5
    AssociatedPerkClasses=/* Array type was not detected. */
    WeaponUpgrades=/* Array type was not detected. */
    FiringStatesArray=/* Array type was not detected. */
    WeaponFireTypes=/* Array type was not detected. */
    WeaponProjectiles=/* Array type was not detected. */
    FireInterval=/* Array type was not detected. */
    Spread=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    FireOffset=(X=25,Y=3,Z=-2.5)
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Rifle_ParasiteImplanter.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="Corrupter Carbine"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Rifle_ParasiteImplanter.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Rifle_ParasiteImplanter.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
    begin object name=SceneCapture2DComponent0 class=TWSceneCapture2DDPGComponent
        FieldOfView=12.5
    object end
    // Reference: TWSceneCapture2DDPGComponent'Default__KFWeap_Rifle_ParasiteImplanter.SceneCapture2DComponent0'
    Components(0)=SceneCapture2DComponent0
}