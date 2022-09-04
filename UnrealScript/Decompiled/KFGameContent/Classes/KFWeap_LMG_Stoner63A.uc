/*******************************************************************************
 * KFWeap_LMG_Stoner63A generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_LMG_Stoner63A extends KFWeap_RifleBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

const ReloadLowAmmoAnim = 'Reload_Empty_Half';
const ReloadLowAmmoEliteAnim = 'Reload_Empty_Half_Elite';

var protected const string AmmoBeltBulletBonePrefix;
var protected const int NumAmmoBeltBullets;
var protected transient int LastAmmoCount;
var protected transient bool bAmmoBeltInitialized;

simulated event ReplicatedEvent(name VarName)
{
    super(KFWeapon).ReplicatedEvent(VarName);
    if(!bAmmoBeltInitialized)
    {
        UpdateAmmoBeltBullets();
    }
}

simulated event PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    if(!bAmmoBeltInitialized && Role == ROLE_Authority)
    {
        UpdateAmmoBeltBullets();
    }
}

simulated function ConsumeAmmo(byte FireModeNum)
{
    super(KFWeapon).ConsumeAmmo(FireModeNum);
    UpdateAmmoBeltBullets();
}

simulated function PerformReload(optional byte FireModeNum)
{
    super(KFWeapon).PerformReload(FireModeNum);
    UpdateAmmoBeltBullets();
}

simulated function ANIMNOTIFY_RestoreAmmoBelt()
{
    local int AmmoType, PendingAmmoCount;

    AmmoType = GetAmmoType(0);
    PendingAmmoCount = Min(AmmoCount[AmmoType] + SpareAmmoCount[AmmoType], MagazineCapacity[AmmoType]);
    if(PendingAmmoCount < NumAmmoBeltBullets)
    {
        UpdateAmmoBeltBullets(PendingAmmoCount);        
    }
    else
    {
        UpdateAmmoBeltBullets(,, true);
    }
}

simulated function UpdateAmmoBeltBullets(optional int ForcedBulletCount, optional bool bShowAll)
{
    local name BulletBoneName;
    local int NumAmmo, I;

    ForcedBulletCount = -1;
    bShowAll = false;
    if(WorldInfo.NetMode == NM_DedicatedServer)
    {
        return;
    }
    if(MySkelMesh.LocalAtoms.Length == 0)
    {
        if(!IsTimerActive('Timer_AttemptAmmoBeltUpdate'))
        {
            SetTimer(0.01, false, 'Timer_AttemptAmmoBeltUpdate');
        }
        return;
    }
    bAmmoBeltInitialized = true;
    NumAmmo = ((ForcedBulletCount != -1) ? ForcedBulletCount : AmmoCount[GetAmmoType(0)]);
    if(!bShowAll && (LastAmmoCount == NumAmmo) || (LastAmmoCount >= NumAmmoBeltBullets) && NumAmmo >= NumAmmoBeltBullets)
    {
        return;
    }
    I = 0;
    J0x13F:

    if(I < NumAmmoBeltBullets)
    {
        BulletBoneName = name(AmmoBeltBulletBonePrefix $ string(I + 1));
        if(bShowAll || NumAmmo >= NumAmmoBeltBullets)
        {
            MySkelMesh.UnHideBoneByName(BulletBoneName);            
        }
        else
        {
            if(I > (NumAmmo - 1))
            {
                MySkelMesh.HideBoneByName(BulletBoneName, 0);                
            }
            else
            {
                MySkelMesh.UnHideBoneByName(BulletBoneName);
            }
        }
        ++ I;
        goto J0x13F;
    }
    LastAmmoCount = NumAmmo;
}

simulated function Timer_AttemptAmmoBeltUpdate()
{
    if(!bAmmoBeltInitialized)
    {
        UpdateAmmoBeltBullets();
    }
}

simulated function name GetReloadAnimName(bool bTacticalReload)
{
    if((AmmoCount[0] > 0) && AmmoCount[0] < NumAmmoBeltBullets)
    {
        return ((bTacticalReload) ? 'Reload_Empty_Half_Elite' : 'Reload_Empty_Half');        
    }
    else
    {
        return super(KFWeapon).GetReloadAnimName(bTacticalReload);
    }
}

simulated state WeaponEquipping
{
    simulated event BeginState(name PreviousStateName)
    {
        super.BeginState(PreviousStateName);
        UpdateAmmoBeltBullets();
    }
    stop;    
}

defaultproperties
{
    AmmoBeltBulletBonePrefix="RW_Bullets"
    NumAmmoBeltBullets=14
    LastAmmoCount=-1
    PackageKey="Stoner63a"
    FirstPersonMeshName="WEP_1P_Stoner63A_MESH.Wep_1stP_Stoner63A_Rig"
    FirstPersonAnimSetNames=/* Array type was not detected. */
    PickupMeshName="WEP_3P_Stoner63A_MESH.Wep_Stoner63A_Pickup"
    AttachmentArchetypeName="WEP_Stoner63A_ARCH.Wep_Stoner63A_3P"
    MuzzleFlashTemplateName="WEP_Stoner63A_ARCH.Wep_Stoner63A_MuzzleFlash"
    bHasIronSights=true
    bCanBeReloaded=true
    bReloadFromMagazine=true
    FireModeIconPaths=/* Array type was not detected. */
    SingleFireSoundIndex=1
    InventorySize=9
    MagazineCapacity=75
    MeshFOV=75
    MeshIronSightFOV=35
    PlayerIronSightFOV=70
    IronSightPosition=(X=8.5,Y=0,Z=0)
    DOF_FG_FocalRadius=85
    DOF_FG_MaxNearBlurSize=2.5
    GroupPriority=100
    WeaponSelectTexture=Texture2D'wep_ui_stoner63a_tex.UI_WeaponSelect_Stoner'
    SpareAmmoCapacity=500
    InitialSpareMags=1
    bLoopingFireAnim=/* Array type was not detected. */
    bLoopingFireSnd=/* Array type was not detected. */
    FireSightedAnims=/* Array type was not detected. */
    WeaponFireSnd=/* Array type was not detected. */
    WeaponFireLoopEndSnd=/* Array type was not detected. */
    WeaponDryFireSnd=/* Array type was not detected. */
    PlayerViewOffset=(X=4,Y=8,Z=-4)
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_LMG_Stoner63A.MeleeHelper'
    EjectedShellForegroundDuration=0.8
    maxRecoilPitch=120
    minRecoilPitch=70
    maxRecoilYaw=130
    minRecoilYaw=-130
    RecoilRate=0.08
    RecoilViewRotationScale=0.25
    RecoilMaxYawLimit=500
    RecoilMinYawLimit=65035
    RecoilMaxPitchLimit=900
    RecoilMinPitchLimit=65035
    RecoilISMaxYawLimit=75
    RecoilISMinYawLimit=65460
    RecoilISMaxPitchLimit=375
    RecoilISMinPitchLimit=65460
    HippedRecoilModifier=1.5
    IronSightMeshFOVCompensationScale=2.3
    AssociatedPerkClasses=/* Array type was not detected. */
    WeaponUpgrades=/* Array type was not detected. */
    WeaponFireTypes=/* Array type was not detected. */
    WeaponProjectiles=/* Array type was not detected. */
    FireInterval=/* Array type was not detected. */
    Spread=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    FireOffset=(X=30,Y=4.5,Z=-5)
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_LMG_Stoner63A.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="Stoner 63A LMG"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_LMG_Stoner63A.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_LMG_Stoner63A.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}