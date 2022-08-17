/*******************************************************************************
 * KFWeap_Pistol_Colt1911 generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_Pistol_Colt1911 extends KFWeap_PistolBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

defaultproperties
{
    InventorySize=2
    bHasIronSights=true
    bCanBeReloaded=true
    bReloadFromMagazine=true
    bHasFireLastAnims=true
    PenetrationPower=/* Array type was not detected. */
    MeshFOV=75
    MeshIronSightFOV=60
    PlayerIronSightFOV=77
    IronSightPosition=(X=15,Y=0,Z=0)
    DOF_FG_FocalRadius=40
    DOF_FG_MaxNearBlurSize=3.5
    GroupPriority=20
    WeaponSelectTexture=Texture2D'WEP_UI_M1911_TEX.UI_WeaponSelect_M1911Colt'
    DualClass=Class'KFWeap_Pistol_DualColt1911'
    MagazineCapacity=8
    MaxSpareAmmo=136
    InitialSpareMags=8
    AmmoPickupScale=2
    IdleFidgetAnims=/* Array type was not detected. */
    FireSightedAnims=/* Array type was not detected. */
    BonesToLockOnEmpty=/* Array type was not detected. */
    WeaponFireSnd=/* Array type was not detected. */
    WeaponDryFireSnd=/* Array type was not detected. */
    PlayerViewOffset=(X=22,Y=12,Z=-6)
    AttachmentArchetype=KFWeaponAttachment'WEP_M1911_ARCH.Wep_M1911_3P'
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_Pistol_Colt1911.MeleeHelper'
    MuzzleFlashTemplate=KFMuzzleFlash'WEP_M1911_ARCH.Wep_M1911_MuzzleFlash'
    maxRecoilPitch=450
    minRecoilPitch=400
    maxRecoilYaw=150
    minRecoilYaw=-150
    RecoilRate=0.07
    RecoilMaxYawLimit=500
    RecoilMinYawLimit=65035
    RecoilMaxPitchLimit=900
    RecoilMinPitchLimit=65035
    RecoilISMaxYawLimit=50
    RecoilISMinYawLimit=65485
    RecoilISMaxPitchLimit=500
    RecoilISMinPitchLimit=65485
    IronSightMeshFOVCompensationScale=1.35
    AssociatedPerkClass=Class'KFGame.KFPerk_Gunslinger'
    FiringStatesArray=/* Array type was not detected. */
    WeaponFireTypes=/* Array type was not detected. */
    WeaponProjectiles=/* Array type was not detected. */
    FireInterval=/* Array type was not detected. */
    Spread=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    FireOffset=(X=20,Y=4,Z=-3)
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_1P_M1911_MESH.Wep_1stP_M1911_Rig'
        AnimSets(0)=AnimSet'WEP_1P_M1911_ANIM.Wep_1stP_M1911_Anim'
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Pistol_Colt1911.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="M1911 Pistol"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        StaticMesh=StaticMesh'WEP_3P_M1911_MESH.Wep_M1911_Pickup'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Pistol_Colt1911.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        StaticMesh=StaticMesh'WEP_3P_M1911_MESH.Wep_M1911_Pickup'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Pistol_Colt1911.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}