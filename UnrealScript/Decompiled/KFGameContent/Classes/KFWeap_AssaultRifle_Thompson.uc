/*******************************************************************************
 * KFWeap_AssaultRifle_Thompson generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_AssaultRifle_Thompson extends KFWeap_SMGBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

defaultproperties
{
    PackageKey="TommyGun"
    FirstPersonMeshName="WEP_1P_TommyGun_MESH.Wep_1stP_TommyGun_Rig"
    FirstPersonAnimSetNames=/* Array type was not detected. */
    PickupMeshName="WEP_3P_TommyGun_MESH.Wep_3rdP_TommyGun_Pickup"
    AttachmentArchetypeName="WEP_TommyGun_ARCH.Wep_TommyGun_3P"
    MuzzleFlashTemplateName="WEP_TommyGun_ARCH.Wep_TommyGun_MuzzleFlash"
    bHasIronSights=true
    bCanBeReloaded=true
    bReloadFromMagazine=true
    bHasFireLastAnims=true
    FireModeIconPaths=/* Array type was not detected. */
    SingleFireSoundIndex=1
    InventorySize=6
    MeshFOV=75
    MeshIronSightFOV=52
    PlayerIronSightFOV=70
    IronSightPosition=(X=5,Y=0,Z=0)
    DOF_FG_FocalRadius=85
    DOF_FG_MaxNearBlurSize=2.5
    GroupPriority=50
    WeaponSelectTexture=Texture2D'WEP_UI_TommyGun_TEX.UI_WeaponSelect_TommyGun'
    MagazineCapacity=50
    SpareAmmoCapacity=250
    InitialSpareMags=3
    bLoopingFireAnim=/* Array type was not detected. */
    bLoopingFireSnd=/* Array type was not detected. */
    FireSightedAnims=/* Array type was not detected. */
    BonesToLockOnEmpty=/* Array type was not detected. */
    WeaponFireSnd=/* Array type was not detected. */
    WeaponFireLoopEndSnd=/* Array type was not detected. */
    WeaponDryFireSnd=/* Array type was not detected. */
    PlayerViewOffset=(X=5,Y=9,Z=-5)
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_AssaultRifle_Thompson.MeleeHelper'
    maxRecoilPitch=130
    minRecoilPitch=115
    maxRecoilYaw=115
    minRecoilYaw=-115
    RecoilRate=0.085
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
    IronSightMeshFOVCompensationScale=1.5
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
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_AssaultRifle_Thompson.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="Tommy Gun"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_AssaultRifle_Thompson.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_AssaultRifle_Thompson.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}