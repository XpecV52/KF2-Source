/*******************************************************************************
 * KFWeap_AssaultRifle_Medic generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_AssaultRifle_Medic extends KFWeap_MedicBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

static simulated event KFGame.KFGFxObject_TraderItems.EFilterTypeUI GetTraderFilter()
{
    return 7;
}

defaultproperties
{
    HealAmount=15
    HealFullRechargeSeconds=10
    FireModeIconPaths=/* Array type was not detected. */
    SingleFireSoundIndex=1
    InventorySize=7
    MagazineCapacity=30
    bHasIronSights=true
    bCanBeReloaded=true
    bReloadFromMagazine=true
    MeshFOV=75
    MeshIronSightFOV=52
    PlayerIronSightFOV=70
    IronSightPosition=(X=12,Y=0,Z=0)
    DOF_FG_FocalRadius=85
    DOF_FG_MaxNearBlurSize=2.5
    GroupPriority=100
    WeaponSelectTexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_MedicAssault'
    SecondaryAmmoTexture=Texture2D'UI_SecondaryAmmo_TEX.MedicDarts'
    AmmoCost=/* Array type was not detected. */
    SpareAmmoCapacity=390
    InitialSpareMags=3
    bLoopingFireAnim=/* Array type was not detected. */
    bLoopingFireSnd=/* Array type was not detected. */
    FireSightedAnims=/* Array type was not detected. */
    WeaponFireSnd=/* Array type was not detected. */
    WeaponFireLoopEndSnd=/* Array type was not detected. */
    WeaponDryFireSnd=/* Array type was not detected. */
    PlayerViewOffset=(X=15,Y=6.5,Z=-3)
    AttachmentArchetype=KFWeaponAttachment'WEP_Medic_Assault_ARCH.Wep_Medic_Assault_3P'
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_AssaultRifle_Medic.MeleeHelper'
    MuzzleFlashTemplate=KFMuzzleFlash'WEP_Medic_Assault_ARCH.Wep_Medic_Assault_MuzzleFlash'
    maxRecoilPitch=200
    minRecoilPitch=150
    maxRecoilYaw=175
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
    IronSightMeshFOVCompensationScale=1.5
    AssociatedPerkClass=Class'KFGame.KFPerk_FieldMedic'
    WeaponProjectiles=/* Array type was not detected. */
    FireInterval=/* Array type was not detected. */
    Spread=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    FireOffset=(X=30,Y=4.5,Z=-5)
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_1P_Medic_Assault_MESH.Wep_1stP_Medic_Assault_Rig'
        AnimSets(0)=AnimSet'WEP_1P_Medic_Assault_ANIM.Wep_1stP_Medic_Assault_Anim'
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_AssaultRifle_Medic.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="HMTech-401 Assault Rifle"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        StaticMesh=StaticMesh'WEP_3P_Pickups_MESH.Wep_Medic_Assault_Pickup'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_AssaultRifle_Medic.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        StaticMesh=StaticMesh'WEP_3P_Pickups_MESH.Wep_Medic_Assault_Pickup'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_AssaultRifle_Medic.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}