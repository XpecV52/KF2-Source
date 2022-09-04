/*******************************************************************************
 * KFWeap_Pistol_ChiappaRhinoDual generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_Pistol_ChiappaRhinoDual extends KFWeap_DualBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

defaultproperties
{
    LeftFireOffset=(X=17,Y=-4,Z=-2.25)
    SingleClass=Class'KFWeap_Pistol_ChiappaRhino'
    BonesToLockOnEmpty_L=/* Array type was not detected. */
    PackageKey="Dual_ChiappaRhino"
    FirstPersonMeshName="WEP_1P_Dual_ChiappaRhino_MESH.Wep_1stP_Dual_ChiappaRhino_Rig"
    FirstPersonAnimSetNames=/* Array type was not detected. */
    PickupMeshName="WEP_3P_Dual_ChiappaRhino_MESH.Wep_3rdP_ChiappaRhino_Pickup"
    AttachmentArchetypeName="WEP_Dual_ChiappaRhino_ARCH.Wep_Dual_ChiappaRhino_3P"
    MuzzleFlashTemplateName="WEP_Dual_ChiappaRhino_ARCH.Wep_Dual_ChiappaRhino_MuzzleFlash"
    bHasIronSights=true
    bCanBeReloaded=true
    bReloadFromMagazine=true
    bHasFireLastAnims=true
    InventorySize=4
    MagazineCapacity=12
    PenetrationPower=/* Array type was not detected. */
    MeshIronSightFOV=77
    PlayerIronSightFOV=77
    IronSightPosition=(X=-1,Y=0,Z=0)
    QuickWeaponDownRotation=(Pitch=-8192,Yaw=0,Roll=0)
    DOF_FG_FocalRadius=38
    DOF_FG_MaxNearBlurSize=3.5
    GroupPriority=42
    WeaponSelectTexture=Texture2D'wep_ui_chiapparhino_tex.UI_WeaponSelect_DualChiappaRhinos'
    SpareAmmoCapacity=108
    InitialSpareMags=3
    BonesToLockOnEmpty=/* Array type was not detected. */
    WeaponFireSnd=/* Array type was not detected. */
    WeaponDryFireSnd=/* Array type was not detected. */
    PlayerViewOffset=(X=9,Y=0,Z=-5)
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_Pistol_ChiappaRhinoDual.MeleeHelper'
    maxRecoilPitch=500
    minRecoilPitch=450
    maxRecoilYaw=150
    minRecoilYaw=-150
    RecoilRate=0.07
    RecoilMaxYawLimit=500
    RecoilMinYawLimit=65035
    RecoilMaxPitchLimit=1250
    RecoilMinPitchLimit=65035
    RecoilISMaxYawLimit=50
    RecoilISMinYawLimit=65485
    RecoilISMaxPitchLimit=500
    RecoilISMinPitchLimit=65485
    AssociatedPerkClasses=/* Array type was not detected. */
    WeaponUpgrades=/* Array type was not detected. */
    FiringStatesArray=/* Array type was not detected. */
    WeaponFireTypes=/* Array type was not detected. */
    WeaponProjectiles=/* Array type was not detected. */
    FireInterval=/* Array type was not detected. */
    Spread=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    FireOffset=(X=17,Y=4,Z=-2.25)
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Pistol_ChiappaRhinoDual.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="Dual Rhinos"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Pistol_ChiappaRhinoDual.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Pistol_ChiappaRhinoDual.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}