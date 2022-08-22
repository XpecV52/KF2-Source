/*******************************************************************************
 * KFWeap_AssaultRifle_Bullpup generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_AssaultRifle_Bullpup extends KFWeap_RifleBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

defaultproperties
{
    FireModeIconPaths=/* Array type was not detected. */
    SingleFireSoundIndex=1
    InventorySize=6
    MagazineCapacity=30
    bHasIronSights=true
    bCanBeReloaded=true
    bReloadFromMagazine=true
    MeshIronSightFOV=52
    PlayerIronSightFOV=70
    DOF_FG_FocalRadius=85
    DOF_FG_MaxNearBlurSize=2.5
    GroupPriority=50
    WeaponSelectTexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_Bullpup'
    SpareAmmoCapacity=270
    InitialSpareMags=4
    bLoopingFireAnim=/* Array type was not detected. */
    bLoopingFireSnd=/* Array type was not detected. */
    FireSightedAnims=/* Array type was not detected. */
    WeaponFireSnd=/* Array type was not detected. */
    WeaponFireLoopEndSnd=/* Array type was not detected. */
    WeaponDryFireSnd=/* Array type was not detected. */
    PlayerViewOffset=(X=3,Y=9,Z=-3)
    AttachmentArchetype=KFWeaponAttachment'WEP_L85A2_ARCH.Wep_L85A2_3P'
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_AssaultRifle_Bullpup.MeleeHelper'
    MuzzleFlashTemplate=KFMuzzleFlash'WEP_L85A2_ARCH.Wep_L85A2_MuzzleFlash'
    maxRecoilPitch=150
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
    AssociatedPerkClass=Class'KFGame.KFPerk_Commando'
    FiringStatesArray=/* Array type was not detected. */
    WeaponProjectiles=/* Array type was not detected. */
    FireInterval=/* Array type was not detected. */
    Spread=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    FireOffset=(X=30,Y=4.5,Z=-5)
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_1P_L85A2_MESH.Wep_1stP_L85A2_Rig'
        AnimSets(0)=AnimSet'WEP_1P_L85A2_ANIM.Wep_1st_L85A2_Anim'
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_AssaultRifle_Bullpup.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="SA80 L85A2 Bullpup"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        StaticMesh=StaticMesh'WEP_3P_Pickups_MESH.Wep_L85A2_Pickup'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_AssaultRifle_Bullpup.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        StaticMesh=StaticMesh'WEP_3P_Pickups_MESH.Wep_L85A2_Pickup'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_AssaultRifle_Bullpup.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}