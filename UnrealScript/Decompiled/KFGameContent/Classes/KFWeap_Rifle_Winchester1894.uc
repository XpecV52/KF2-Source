/*******************************************************************************
 * KFWeap_Rifle_Winchester1894 generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_Rifle_Winchester1894 extends KFWeap_RifleBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

defaultproperties
{
    InventorySize=5
    MagazineCapacity=10
    bHasIronSights=true
    bCanBeReloaded=true
    bHasFireLastAnims=true
    PenetrationPower=/* Array type was not detected. */
    MeshFOV=65
    MeshIronSightFOV=45
    PlayerIronSightFOV=65
    DOF_FG_MaxNearBlurSize=3.5
    GroupPriority=25
    WeaponSelectTexture=Texture2D'wep_ui_winchester_tex.UI_WeaponSelect_Winchester'
    MaxSpareAmmo=60
    InitialSpareMags=3
    FireSightedAnims=/* Array type was not detected. */
    BonesToLockOnEmpty=/* Array type was not detected. */
    WeaponFireSnd=/* Array type was not detected. */
    WeaponDryFireSnd=/* Array type was not detected. */
    PlayerViewOffset=(X=8,Y=7,Z=-3.5)
    AttachmentArchetype=KFWeaponAttachment'wep_winchester_arch.Wep_Winchester_3P'
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_Rifle_Winchester1894.MeleeHelper'
    MuzzleFlashTemplate=KFMuzzleFlash'wep_winchester_arch.Wep_Winchester_MuzzleFlash'
    maxRecoilPitch=500
    minRecoilPitch=400
    maxRecoilYaw=150
    minRecoilYaw=-150
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
    AssociatedPerkClass=Class'KFGame.KFPerk_Sharpshooter'
    FiringStatesArray=/* Array type was not detected. */
    WeaponFireTypes=/* Array type was not detected. */
    WeaponProjectiles=/* Array type was not detected. */
    FireInterval=/* Array type was not detected. */
    Spread=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    FireOffset=(X=25,Y=3,Z=-2.5)
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_1P_Winchester_MESH.Wep_1stP_Winchester_Rig'
        AnimSets(0)=AnimSet'WEP_1P_Winchester_ANIM.Wep_1stP_Winchester_Anim'
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Rifle_Winchester1894.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="Winchester 1894"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        StaticMesh=StaticMesh'WEP_3P_Winchester_MESH.Wep_LAR1894_Pickup'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Rifle_Winchester1894.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        StaticMesh=StaticMesh'WEP_3P_Winchester_MESH.Wep_LAR1894_Pickup'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Rifle_Winchester1894.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}