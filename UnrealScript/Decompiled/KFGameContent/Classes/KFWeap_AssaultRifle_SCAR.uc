/*******************************************************************************
 * KFWeap_AssaultRifle_SCAR generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_AssaultRifle_SCAR extends KFWeap_RifleBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

defaultproperties
{
    PackageKey="SCAR"
    FirstPersonMeshName="WEP_1P_SCAR_MESH.Wep_1stP_SCAR_Rig"
    FirstPersonAnimSetNames=/* Array type was not detected. */
    PickupMeshName="WEP_3P_SCAR_MESH.Wep_SCAR_Pickup"
    AttachmentArchetypeName="WEP_SCAR_ARCH.Wep_SCAR_3P"
    MuzzleFlashTemplateName="WEP_SCAR_ARCH.Wep_Scar_MuzzleFlash"
    bHasIronSights=true
    bCanBeReloaded=true
    bReloadFromMagazine=true
    FireModeIconPaths=/* Array type was not detected. */
    SingleFireSoundIndex=1
    InventorySize=5
    MagazineCapacity=20
    MeshFOV=70
    MeshIronSightFOV=20
    PlayerIronSightFOV=70
    IronSightPosition=(X=20,Y=0,Z=0)
    DOF_FG_FocalRadius=150
    GroupPriority=100
    WeaponSelectTexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_SCAR'
    SpareAmmoCapacity=340
    InitialSpareMags=4
    bLoopingFireAnim=/* Array type was not detected. */
    bLoopingFireSnd=/* Array type was not detected. */
    FireSightedAnims=/* Array type was not detected. */
    WeaponFireSnd=/* Array type was not detected. */
    WeaponFireLoopEndSnd=/* Array type was not detected. */
    WeaponDryFireSnd=/* Array type was not detected. */
    PlayerViewOffset=(X=18,Y=9,Z=-3.5)
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_AssaultRifle_SCAR.MeleeHelper'
    maxRecoilPitch=150
    minRecoilPitch=125
    maxRecoilYaw=125
    minRecoilYaw=-125
    RecoilRate=0.085
    RecoilMaxYawLimit=500
    RecoilMinYawLimit=65035
    RecoilMaxPitchLimit=900
    RecoilMinPitchLimit=65035
    RecoilISMaxYawLimit=75
    RecoilISMinYawLimit=65460
    RecoilISMaxPitchLimit=375
    RecoilISMinPitchLimit=65460
    IronSightMeshFOVCompensationScale=4
    AssociatedPerkClasses=/* Array type was not detected. */
    WeaponUpgrades=/* Array type was not detected. */
    FiringStatesArray=/* Array type was not detected. */
    WeaponProjectiles=/* Array type was not detected. */
    FireInterval=/* Array type was not detected. */
    Spread=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    FireOffset=(X=30,Y=4.5,Z=-5)
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_AssaultRifle_SCAR.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="SCAR-H Assault Rifle"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_AssaultRifle_SCAR.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_AssaultRifle_SCAR.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}