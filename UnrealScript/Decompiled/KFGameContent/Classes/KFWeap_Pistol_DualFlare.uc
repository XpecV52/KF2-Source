/*******************************************************************************
 * KFWeap_Pistol_DualFlare generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_Pistol_DualFlare extends KFWeap_DualBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

defaultproperties
{
    LeftFireOffset=(X=17,Y=-4,Z=-2.25)
    SingleClass=Class'KFWeap_Pistol_Flare'
    BonesToLockOnEmpty_L=/* Array type was not detected. */
    CylinderRotInfo_L=(InC=-60,Time=0.0875)
    bRevolver=true
    CylinderRotInfo=(InC=-60,Time=0.0875)
    InventorySize=4
    MagazineCapacity=12
    bHasIronSights=true
    bCanBeReloaded=true
    bReloadFromMagazine=true
    bHasFireLastAnims=true
    MeshFOV=60
    MeshIronSightFOV=55
    PlayerIronSightFOV=77
    IronSightPosition=(X=4,Y=0,Z=0)
    QuickWeaponDownRotation=(Pitch=-8192,Yaw=0,Roll=0)
    DOF_FG_FocalRadius=40
    DOF_FG_MaxNearBlurSize=3.5
    GroupPriority=35
    WeaponSelectTexture=Texture2D'wep_ui_dual_flaregun_tex.UI_WeaponSelect_DualFlaregun'
    SpareAmmoCapacity=180
    InitialSpareMags=7
    BonesToLockOnEmpty=/* Array type was not detected. */
    WeaponFireSnd=/* Array type was not detected. */
    WeaponDryFireSnd=/* Array type was not detected. */
    PlayerViewOffset=(X=23,Y=0,Z=-1)
    AttachmentArchetype=KFWeapAttach_DualBase'WEP_Dual_FlareGun_ARCH.Wep_Dual_FlareGun_3P'
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_Pistol_DualFlare.MeleeHelper'
    MuzzleFlashTemplate=KFMuzzleFlash'WEP_FlareGun_ARCH.Wep_Flaregun_MuzzleFlash'
    maxRecoilPitch=400
    minRecoilPitch=350
    maxRecoilYaw=125
    minRecoilYaw=-125
    RecoilRate=0.08
    RecoilBlendOutRatio=0.75
    RecoilMaxYawLimit=500
    RecoilMinYawLimit=65035
    RecoilMaxPitchLimit=900
    RecoilMinPitchLimit=65035
    RecoilISMaxYawLimit=50
    RecoilISMinYawLimit=65485
    RecoilISMaxPitchLimit=400
    RecoilISMinPitchLimit=65485
    IronSightMeshFOVCompensationScale=1.5
    AssociatedPerkClasses=/* Array type was not detected. */
    FiringStatesArray=/* Array type was not detected. */
    WeaponFireTypes=/* Array type was not detected. */
    WeaponProjectiles=/* Array type was not detected. */
    FireInterval=/* Array type was not detected. */
    Spread=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    FireOffset=(X=17,Y=4,Z=-2.25)
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_1P_Dual_FlareGun_MESH.Wep_1stP_Dual_FlareGun_Rig'
        AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Dual_Animtree_Master_Revolver'
        AnimSets(0)=AnimSet'WEP_1P_Dual_FlareGun_ANIM.Wep_1stP_Dual_FlareGun_Anim'
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Pistol_DualFlare.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="Dual Spitfires"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        StaticMesh=StaticMesh'WEP_3P_FlareGun_MESH.Wep_FlareGun_Pickup'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Pistol_DualFlare.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        StaticMesh=StaticMesh'WEP_3P_FlareGun_MESH.Wep_FlareGun_Pickup'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Pistol_DualFlare.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}