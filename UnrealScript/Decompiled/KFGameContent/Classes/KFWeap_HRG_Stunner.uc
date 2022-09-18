/*******************************************************************************
 * KFWeap_HRG_Stunner generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_HRG_Stunner extends KFWeap_ShotgunBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

const SecondaryFireAnim = 'Shoot_Secondary';
const SecondaryFireIronAnim = 'Shoot_Secondary_Iron';

var protected const float AltFireRecoilScale;

simulated function ModifyRecoil(out float CurrentRecoilModifier)
{
    if(CurrentFireMode == 1)
    {
        CurrentRecoilModifier *= AltFireRecoilScale;
    }
    super(KFWeapon).ModifyRecoil(CurrentRecoilModifier);
}

simulated function StartFire(byte FireModeNum)
{
    if((FireModeNum == 0) && bUseAltFireMode)
    {
        if((AmmoCount[FireModeNum] < AmmoCost[1]) && SpareAmmoCount[FireModeNum] > 0)
        {
            BeginFire(2);
            return;
        }
    }
    super(KFWeapon).StartFire(FireModeNum);
}

simulated function AltFireMode()
{
    StartFire(1);
}

simulated function NotifyAltFireUsage()
{
    local KFPawn_Human KFPH;

    KFPH = KFPawn_Human(Instigator);
    if(KFPH != none)
    {
        KFPH.SetUsingAltFireMode(bUseAltFireMode, true);
        KFPH.bNetDirty = true;
    }
}

simulated function name GetWeaponFireAnim(byte FireModeNum)
{
    if(FireModeNum == 1)
    {
        return ((bUsingSights) ? 'Shoot_Secondary_Iron' : 'Shoot_Secondary');
    }
    return super(KFWeapon).GetWeaponFireAnim(FireModeNum);
}

defaultproperties
{
    AltFireRecoilScale=3
    PackageKey="HRG_Stunner"
    FirstPersonMeshName="Wep_1P_HRG_Stunner_MESH.Wep_1stP_HRG_Stunner_Rig"
    FirstPersonAnimSetNames=/* Array type was not detected. */
    PickupMeshName="WEP_3P_HRG_Stunner_MESH.Wep_HRG_Stunner_Pickup"
    AttachmentArchetypeName="WEP_HRG_Stunner_ARCH.Wep_AA12_3P"
    MuzzleFlashTemplateName="WEP_HRG_Stunner_ARCH.Wep_AA12_MuzzleFlash"
    bHasIronSights=true
    bCanBeReloaded=true
    bReloadFromMagazine=true
    bHasFireLastAnims=false
    FireModeIconPaths=/* Array type was not detected. */
    InventorySize=6
    PenetrationPower=/* Array type was not detected. */
    MeshIronSightFOV=52
    PlayerIronSightFOV=70
    IronSightPosition=(X=8,Y=0,Z=0)
    DOF_FG_FocalRadius=85
    DOF_FG_MaxNearBlurSize=3.5
    GroupPriority=100
    WeaponSelectTexture=Texture2D'wep_ui_hrg_stunner_tex.UI_Weapon_Select_HRG_Stunner'
    MagazineCapacity=25
    AmmoCost=/* Array type was not detected. */
    SpareAmmoCapacity=225
    InitialSpareMags=1
    WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Heavy_Recoil'
    FireSightedAnims=/* Array type was not detected. */
    WeaponFireSnd=/* Array type was not detected. */
    WeaponDryFireSnd=/* Array type was not detected. */
    PlayerViewOffset=(X=15,Y=8.5,Z=0)
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_HRG_Stunner.MeleeHelper'
    NumPellets=/* Array type was not detected. */
    maxRecoilPitch=150
    minRecoilPitch=125
    maxRecoilYaw=75
    minRecoilYaw=-75
    RecoilRate=0.075
    RecoilBlendOutRatio=0.25
    RecoilViewRotationScale=0.7
    RecoilMaxYawLimit=500
    RecoilMinYawLimit=65035
    RecoilMaxPitchLimit=900
    RecoilMinPitchLimit=64785
    RecoilISMaxYawLimit=75
    RecoilISMinYawLimit=65460
    RecoilISMaxPitchLimit=375
    RecoilISMinPitchLimit=65460
    FallingRecoilModifier=1.5
    AssociatedPerkClasses=/* Array type was not detected. */
    WeaponUpgrades=/* Array type was not detected. */
    FiringStatesArray=/* Array type was not detected. */
    WeaponFireTypes=/* Array type was not detected. */
    WeaponProjectiles=/* Array type was not detected. */
    FireInterval=/* Array type was not detected. */
    Spread=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    FireOffset=(X=30,Y=5,Z=-4)
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_HRG_Stunner.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="HRG Stunner"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_HRG_Stunner.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_HRG_Stunner.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}