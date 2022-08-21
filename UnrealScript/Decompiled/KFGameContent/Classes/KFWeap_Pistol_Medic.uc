/*******************************************************************************
 * KFWeap_Pistol_Medic generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_Pistol_Medic extends KFWeap_MedicBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

static simulated event KFGame.KFGFxObject_TraderItems.EFilterTypeUI GetTraderFilter()
{
    return 0;
}

defaultproperties
{
    InventoryGroup=EInventoryGroup.IG_Secondary
    InventorySize=1
    MagazineCapacity=15
    bHasIronSights=true
    bCanBeReloaded=true
    bReloadFromMagazine=true
    MeshIronSightFOV=77
    PlayerIronSightFOV=77
    IronSightPosition=(X=15,Y=0,Z=0)
    DOF_FG_FocalRadius=40
    DOF_FG_MaxNearBlurSize=3.5
    GroupPriority=25
    WeaponSelectTexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_MedicPistol'
    SecondaryAmmoTexture=Texture2D'UI_SecondaryAmmo_TEX.MedicDarts'
    MaxSpareAmmo=240
    InitialSpareMags=8
    FireSightedAnims=/* Array type was not detected. */
    WeaponFireSnd=/* Array type was not detected. */
    WeaponDryFireSnd=/* Array type was not detected. */
    PlayerViewOffset=(X=29,Y=13,Z=-4)
    AttachmentArchetype=KFWeaponAttachment'WEP_Medic_Pistol_ARCH.Wep_Medic_Pistol_3P'
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_Pistol_Medic.MeleeHelper'
    MuzzleFlashTemplate=KFMuzzleFlash'WEP_Medic_Pistol_ARCH.Wep_Medic_Pistol_MuzzleFlash'
    maxRecoilPitch=250
    minRecoilPitch=200
    maxRecoilYaw=100
    minRecoilYaw=-100
    RecoilRate=0.07
    RecoilMaxYawLimit=500
    RecoilMinYawLimit=65035
    RecoilMaxPitchLimit=900
    RecoilMinPitchLimit=65035
    RecoilISMaxYawLimit=50
    RecoilISMinYawLimit=65485
    RecoilISMaxPitchLimit=250
    RecoilISMinPitchLimit=65485
    AssociatedPerkClass=Class'KFGame.KFPerk_FieldMedic'
    FiringStatesArray=/* Array type was not detected. */
    WeaponProjectiles=/* Array type was not detected. */
    FireInterval=/* Array type was not detected. */
    Spread=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    FireOffset=(X=20,Y=4,Z=-3)
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_1P_Medic_Pistol_MESH.Wep_1stP_Medic_Pistol_Rig'
        AnimSets(0)=AnimSet'WEP_1P_Medic_Pistol_ANIM.WEP_1P_Medic_Pistol_ANIM'
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Pistol_Medic.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="HMTech-101 Pistol"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        StaticMesh=StaticMesh'WEP_3P_Pickups_MESH.Wep_Medic_Pistol_Pickup'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Pistol_Medic.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        StaticMesh=StaticMesh'WEP_3P_Pickups_MESH.Wep_Medic_Pistol_Pickup'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Pistol_Medic.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}