/*******************************************************************************
 * KFWeap_GrenadeLauncher_CylinderBase generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_GrenadeLauncher_CylinderBase extends KFWeap_GrenadeLauncher_Base
    native
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

const CYLINDERSTATE_READY = 0;
const CYLINDERSTATE_PENDING = 1;
const CYLINDERSTATE_ROTATING = 2;

var int CurrentShellSlotReloading;
var bool bReloadingFromEmpty;
var bool bInitialReloadIsOpenOnly;
var bool bRevolver;
var array<name> BulletFXSocketNames;
var export editinline array<export editinline KFBulletSkeletalMeshComponent> BulletMeshComponents;
var array<name> ShellBoneNames;
var name ReloadShellSocketName;
var export editinline KFBulletSkeletalMeshComponent ReloadShell;
var CylinderRotationInfo CylinderRotInfo;

// Export UKFWeap_GrenadeLauncher_CylinderBase::execSetCylinderRotation(FFrame&, void* const)
native simulated function SetCylinderRotation(out CylinderRotationInfo RotInfo, float Degrees);

simulated event PostInitAnimTree(SkeletalMeshComponent SkelComp)
{
    super(KFWeapon).PostInitAnimTree(SkelComp);
    if(bRevolver)
    {
        PostInitAnimTreeRevolver(SkelComp);
    }
}

simulated function ConsumeAmmo(byte FireModeNum)
{
    local int BulletIndex;

    BulletIndex = MagazineCapacity[0] - AmmoCount[0];
    super(KFWeapon).ConsumeAmmo(FireModeNum);
    if(BulletIndex < BulletMeshComponents.Length)
    {
        BulletMeshComponents[BulletIndex].SetBulletState(1);
    }
    if((bRevolver && Instigator != none) && Instigator.IsLocallyControlled())
    {
        ConsumeAmmoRevolver();
    }
}

simulated function PerformReload(optional byte FireModeNum)
{
    if(!bInitialReloadIsOpenOnly)
    {
        bInitialReloadIsOpenOnly = true;
        return;
    }
    super(KFWeapon).PerformReload(FireModeNum);
    BulletMeshComponents[CurrentShellSlotReloading].SetBulletState(0);
    ++ CurrentShellSlotReloading;
}

simulated function UpdateShellsBaseOnAmmoCount(optional byte FireModeNum)
{
    local int I;

    FireModeNum = 0;
    I = 0;
    J0x11:

    if(I < BulletMeshComponents.Length)
    {
        if((BulletMeshComponents[I].GetBulletShellState() != 0) && AmmoCount[FireModeNum] > I)
        {
            BulletMeshComponents[I].SetBulletState(0);
            return;
        }
        ++ I;
        goto J0x11;
    }
}

simulated function GetFirstEmptyShell();

simulated function SetShellToState(int ShellIndex, byte ShellState)
{
    switch(ShellState)
    {
        case 0:
            BulletMeshComponents[ShellIndex].SetBulletState(0);
            break;
        case 1:
            BulletMeshComponents[ShellIndex].SetBulletState(1);
            break;
        case 2:
            BulletMeshComponents[ShellIndex].SetBulletState(2);
            break;
        default:
            BulletMeshComponents[ShellIndex].SetBulletState(0);
            break;
    }
}

simulated event PostInitAnimTreeRevolver(SkeletalMeshComponent SkelComp)
{
    local int I;

    CylinderRotInfo.Control = SkelControlSingleBone(SkelComp.FindSkelControl('CylinderControl'));
    if(CylinderRotInfo.Control != none)
    {
        CylinderRotInfo.Control.SetSkelControlActive(true);
    }
    I = 0;
    J0xAE:

    if(I < BulletMeshComponents.Length)
    {
        BulletMeshComponents[I].SetBulletState(0);
        MySkelMesh.AttachComponentToSocket(BulletMeshComponents[I], BulletFXSocketNames[I]);
        ++ I;
        goto J0xAE;
    }
    MySkelMesh.AttachComponentToSocket(ReloadShell, ReloadShellSocketName);
}

simulated function ConsumeAmmoRevolver()
{
    CheckCylinderRotation(CylinderRotInfo);
    CylinderRotInfo.State = 1;
}

simulated function CheckCylinderRotation(out CylinderRotationInfo RotInfo, optional bool bResetState)
{
    if(RotInfo.State != 0)
    {
        RotateCylinder(RotInfo, true);
        if(bResetState)
        {
            RotInfo.State = 0;
        }
    }
}

simulated function ANIMNOTIFY_ResetBulletMeshes()
{
    local int I;

    I = 0;
    J0x0B:

    if(I < BulletMeshComponents.Length)
    {
        BulletMeshComponents[I].SetBulletState(((I < (MagazineCapacity[0] - AmmoCount[0])) ? 2 : 0));
        ++ I;
        goto J0x0B;
    }
}

simulated function ANIMNOTIFY_RotateCylinder()
{
    RotateCylinder(CylinderRotInfo);
}

simulated function RotateCylinder(out CylinderRotationInfo RotInfo, optional bool bInstant)
{
    if(bInstant)
    {
        if(RotInfo.State == 1)
        {
            IncrementCylinderRotation(RotInfo);            
        }
        else
        {
            RotInfo.State = 1;
        }
        SetCylinderRotation(RotInfo, RotInfo.NextDegrees);
        RotInfo.Timer = 0;        
    }
    else
    {
        RotInfo.State = 2;
        IncrementCylinderRotation(RotInfo);
        RotInfo.Timer = RotInfo.Time;
    }
}

simulated function IncrementCylinderRotation(out CylinderRotationInfo RotInfo)
{
    local bool bReloading;

    bReloading = ReloadStatus == 2;
    RotInfo.PrevDegrees = RotInfo.NextDegrees;
    RotInfo.NextDegrees += ((bReloading) ? -RotInfo.InC : RotInfo.InC);
}

simulated function ResetCylinderInfo(out CylinderRotationInfo RotInfo)
{
    RotInfo.PrevDegrees = 0;
    RotInfo.NextDegrees = 0;
    RotInfo.State = 0;
}

simulated event OnCylinderRotationFinished(out CylinderRotationInfo RotInfo)
{
    RotInfo.State = 0;
}

simulated function ResetCylinder()
{
    SetCylinderRotation(CylinderRotInfo, 0);
    ResetCylinderInfo(CylinderRotInfo);
    if(AmmoCount[0] == 0)
    {
        return;
    }
}

simulated function ResetBulletMeshes()
{
    local int I;

    return;
    I = 0;
    J0x0D:

    if(I < BulletMeshComponents.Length)
    {
        BulletMeshComponents[I].SetBulletState(0);
        ++ I;
        goto J0x0D;
    }
}

simulated event SetFOV(float NewFOV)
{
    local int I;

    super(KFWeapon).SetFOV(NewFOV);
    I = 0;
    J0x1E:

    if(I < BulletMeshComponents.Length)
    {
        BulletMeshComponents[I].super(KFSkeletalMeshComponent).SetFOV(NewFOV);
        ++ I;
        goto J0x1E;
    }
}

simulated function InitializeReload()
{
    bInitialReloadIsOpenOnly = false;
    RebuildLockedBonesForReload();
    super(KFWeapon).InitializeReload();
    CheckCylinderRotation(CylinderRotInfo, true);
    CurrentShellSlotReloading = 0;
}

simulated function RebuildLockedBonesForReload()
{
    local int I, NumOfShotsToReload;

    if(EmptyMagBlendNode != none)
    {
        EmptyMagBlendNode.SetBlendTarget(0, 0);
    }
    BonesToLockOnEmpty.Length = 0;
    NumOfShotsToReload = MagazineCapacity[0] - AmmoCount[0];
    I = NumOfShotsToReload;
    J0x7D:

    if(I < ShellBoneNames.Length)
    {
        BonesToLockOnEmpty.AddItem(ShellBoneNames[I];
        ++ I;
        goto J0x7D;
    }
    if((EmptyMagBlendNode != none) && BonesToLockOnEmpty.Length > 0)
    {
        BuildEmptyMagNodeWeightList(EmptyMagBlendNode, BonesToLockOnEmpty);
        EmptyMagBlendNode.SetBlendTarget(1, 0);
    }
}

simulated function name GetReloadAnimName(bool bTacticalReload)
{
    if(!bReloadFromMagazine)
    {
        switch(ReloadStatus)
        {
            case 1:
                ReloadStatus = GetNextReloadStatus();
                bReloadingFromEmpty = AmmoCount[0] == 0;
                return ((bReloadingFromEmpty) ? 'Reload_Empty_Open' : 'Reload_Half_Open');
            case 2:
                return ((bReloadingFromEmpty) ? 'Reload_Empty_Insert' : 'Reload_Half_Insert');
            case 3:
                return ((bReloadingFromEmpty) ? 'Reload_Empty_Close' : 'Reload_Half_Close');
            default:
                return 'Reload_Half_Insert';
                break;
        }
    }
}

simulated function UnloadAllBulletMeshes()
{
    local int I;

    I = 0;
    J0x0B:

    if(I < BulletMeshComponents.Length)
    {
        BulletMeshComponents[I].SetBulletState(2);
        ++ I;
        goto J0x0B;
    }
}

simulated state Reloading
{
    ignores ForceReload, ShouldAutoReload, AllowSprinting;

    simulated function BeginState(name PreviousStateName)
    {
        super.BeginState(PreviousStateName);
        if(bRevolver)
        {
            ResetCylinder();
        }
    }
    stop;    
}

simulated state WeaponPuttingDown
{
    simulated function EndState(name NextStateName)
    {
        super.EndState(NextStateName);
        CheckCylinderRotation(CylinderRotInfo, true);
    }
    stop;    
}

defaultproperties
{
    bRevolver=true
    ReloadShellSocketName=RW_Shell_Reload
    CylinderRotInfo=(InC=72,PrevDegrees=0,NextDegrees=0,Time=0.0875,Timer=0,Control=none,State=0)
    ForceReloadTime=0
    PackageKey="M32_MGL"
    FirstPersonMeshName="WEP_1P_M32_MGL_MESH.Wep_1stP_M32_MGL_Rig"
    FirstPersonAnimSetNames(0)="WEP_1P_M32_MGL_ANIM.Wep_1stP_M32_MGL_Anim"
    PickupMeshName="WEP_3P_M79_MESH.Wep_m79_Pickup"
    AttachmentArchetypeName="WEP_M32_MGL_ARCH.Wep_M32_MGL_3P"
    MuzzleFlashTemplateName="WEP_M79_ARCH.Wep_M79_MuzzleFlash"
    bHasIronSights=true
    bCanBeReloaded=true
    bHasFireLastAnims=true
    FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_Grenade'
    FireModeIconPaths(1)=none
    InventorySize=6
    MagazineCapacity=6
    MeshIronSightFOV=52
    PlayerIronSightFOV=73
    FastZoomOutTime=0.2
    GroupPriority=75
    WeaponSelectTexture=Texture2D'WEP_UI_M79_TEX.UI_WeaponSelect_M79'
    SpareAmmoCapacity=36
    InitialSpareMags=9
    AmmoPickupScale=2
    WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Heavy_Recoil_SingleShot'
    WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_SA_M79.Play_WEP_SA_M79_Fire_M',FirstPersonCue=AkEvent'WW_WEP_SA_M79.Play_WEP_SA_M79_Fire_S')
    WeaponDryFireSnd(0)=none
    PlayerViewOffset=(X=19,Y=13,Z=-2)
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_GrenadeLauncher_CylinderBase.MeleeHelper'
    maxRecoilPitch=900
    minRecoilPitch=775
    maxRecoilYaw=500
    minRecoilYaw=-500
    RecoilRate=0.085
    RecoilBlendOutRatio=0.35
    RecoilViewRotationScale=0.8
    RecoilMaxYawLimit=500
    RecoilMinYawLimit=65035
    RecoilMinPitchLimit=64785
    RecoilISMaxYawLimit=50
    RecoilISMinYawLimit=65485
    RecoilISMaxPitchLimit=500
    RecoilISMinPitchLimit=65485
    HippedRecoilModifier=1.25
    FallingRecoilModifier=1.5
    AssociatedPerkClasses(0)=class'KFPerk_Demolitionist'
    FiringStatesArray=/* Array type was not detected. */
    WeaponFireTypes=/* Array type was not detected. */
    FireInterval=/* Array type was not detected. */
    Spread=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    FireOffset=(X=23,Y=4,Z=-3)
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_GrenadeLauncher_CylinderBase.FirstPersonMesh'
    Mesh=FirstPersonMesh
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_GrenadeLauncher_CylinderBase.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_GrenadeLauncher_CylinderBase.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}