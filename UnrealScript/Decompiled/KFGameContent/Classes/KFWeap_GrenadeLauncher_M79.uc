/*******************************************************************************
 * KFWeap_GrenadeLauncher_M79 generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_GrenadeLauncher_M79 extends KFWeap_GrenadeLauncher_Base
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

defaultproperties
{
    PackageKey="M79"
    FirstPersonMeshName="WEP_1P_M79_MESH.Wep_1stP_M79_Rig"
    FirstPersonAnimSetNames=/* Array type was not detected. */
    PickupMeshName="WEP_3P_M79_MESH.Wep_m79_Pickup"
    AttachmentArchetypeName="WEP_M79_ARCH.Wep_M79_3P"
    MuzzleFlashTemplateName="WEP_M79_ARCH.Wep_M79_MuzzleFlash"
    bHasIronSights=true
    bCanBeReloaded=true
    bReloadFromMagazine=true
    bHasFireLastAnims=true
    FireModeIconPaths=/* Array type was not detected. */
    InventorySize=6
    MeshIronSightFOV=52
    PlayerIronSightFOV=73
    FastZoomOutTime=0.2
    GroupPriority=75
    WeaponSelectTexture=Texture2D'WEP_UI_M79_TEX.UI_WeaponSelect_M79'
    MagazineCapacity=1
    SpareAmmoCapacity=26
    InitialSpareMags=9
    AmmoPickupScale=2
    WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Heavy_Recoil_SingleShot'
    WeaponFireSnd=/* Array type was not detected. */
    WeaponDryFireSnd=/* Array type was not detected. */
    PlayerViewOffset=(X=13,Y=13,Z=-4)
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_GrenadeLauncher_M79.MeleeHelper'
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
    AssociatedPerkClasses=/* Array type was not detected. */
    WeaponUpgrades=/* Array type was not detected. */
    FiringStatesArray=/* Array type was not detected. */
    WeaponFireTypes=/* Array type was not detected. */
    WeaponProjectiles=/* Array type was not detected. */
    FireInterval=/* Array type was not detected. */
    Spread=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    FireOffset=(X=23,Y=4,Z=-3)
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_GrenadeLauncher_M79.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="M79 Grenade Launcher"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_GrenadeLauncher_M79.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_GrenadeLauncher_M79.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}