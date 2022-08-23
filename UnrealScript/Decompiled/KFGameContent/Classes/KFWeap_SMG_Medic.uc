/*******************************************************************************
 * KFWeap_SMG_Medic generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_SMG_Medic extends KFWeap_MedicBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

static simulated event KFGame.KFGFxObject_TraderItems.EFilterTypeUI GetTraderFilter()
{
    return 9;
}

defaultproperties
{
    HealAmount=15
    FireModeIconPaths=/* Array type was not detected. */
    SingleFireSoundIndex=1
    InventorySize=3
    MagazineCapacity=40
    bHasIronSights=true
    bCanBeReloaded=true
    bReloadFromMagazine=true
    MeshFOV=81
    MeshIronSightFOV=64
    PlayerIronSightFOV=70
    IronSightPosition=(X=8,Y=0,Z=0)
    GroupPriority=50
    WeaponSelectTexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_MedicSMG'
    SecondaryAmmoTexture=Texture2D'UI_SecondaryAmmo_TEX.MedicDarts'
    SpareAmmoCapacity=480
    InitialSpareMags=5
    bLoopingFireAnim=/* Array type was not detected. */
    bLoopingFireSnd=/* Array type was not detected. */
    WeaponFireSnd=/* Array type was not detected. */
    WeaponFireLoopEndSnd=/* Array type was not detected. */
    WeaponDryFireSnd=/* Array type was not detected. */
    PlayerViewOffset=(X=22,Y=10,Z=-4.5)
    AttachmentArchetype=KFWeaponAttachment'WEP_Medic_SMG_ARCH.Wep_Medic_SMG_3P'
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_SMG_Medic.MeleeHelper'
    MuzzleFlashTemplate=KFMuzzleFlash'WEP_Medic_SMG_ARCH.Wep_Medic_SMG_MuzzleFlash'
    maxRecoilPitch=100
    minRecoilPitch=75
    maxRecoilYaw=75
    minRecoilYaw=-75
    RecoilRate=0.07
    RecoilMaxYawLimit=500
    RecoilMinYawLimit=65035
    RecoilMaxPitchLimit=900
    RecoilMinPitchLimit=65035
    RecoilISMaxYawLimit=75
    RecoilISMinYawLimit=65460
    RecoilISMaxPitchLimit=375
    RecoilISMinPitchLimit=65460
    IronSightMeshFOVCompensationScale=1.5
    AssociatedPerkClasses=/* Array type was not detected. */
    WeaponProjectiles=/* Array type was not detected. */
    FireInterval=/* Array type was not detected. */
    Spread=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    FireOffset=(X=30,Y=4.5,Z=-5)
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_1P_Medic_SMG_MESH.Wep_1stP_Medic_SMG_Rig'
        AnimSets(0)=AnimSet'WEP_1P_Medic_SMG_ANIM.Wep_1stP_Medic_SMG_Anim'
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_SMG_Medic.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="HMTech-201 SMG"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        StaticMesh=StaticMesh'WEP_3P_Pickups_MESH.Wep_Medic_SMG_Pickup'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_SMG_Medic.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        StaticMesh=StaticMesh'WEP_3P_Pickups_MESH.Wep_Medic_SMG_Pickup'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_SMG_Medic.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}