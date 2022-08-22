/*******************************************************************************
 * KFWeap_Shotgun_M4 generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_Shotgun_M4 extends KFWeap_ShotgunBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

defaultproperties
{
    FireModeIconPaths=/* Array type was not detected. */
    InventorySize=8
    MagazineCapacity=8
    bHasIronSights=true
    bCanBeReloaded=true
    PenetrationPower=/* Array type was not detected. */
    MeshFOV=75
    MeshIronSightFOV=52
    PlayerIronSightFOV=70
    IronSightPosition=(X=5,Y=0,Z=0)
    DOF_FG_FocalRadius=25
    GroupPriority=75
    WeaponSelectTexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_Benelli'
    SpareAmmoCapacity=64
    InitialSpareMags=3
    WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Heavy_Recoil_SingleShot'
    WeaponFireSnd=/* Array type was not detected. */
    WeaponDryFireSnd=/* Array type was not detected. */
    PlayerViewOffset=(X=15,Y=8.5,Z=-3.5)
    AttachmentArchetype=KFWeaponAttachment'WEP_M4Shotgun_ARCH.Wep_M4Shotgun_3P'
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_Shotgun_M4.MeleeHelper'
    MuzzleFlashTemplate=KFMuzzleFlash'WEP_M4Shotgun_ARCH.Wep_M4Shotgun_MuzzleFlash'
    maxRecoilPitch=675
    minRecoilPitch=600
    maxRecoilYaw=375
    minRecoilYaw=-375
    RecoilRate=0.075
    RecoilBlendOutRatio=0.25
    RecoilViewRotationScale=0.7
    RecoilMaxYawLimit=500
    RecoilMinYawLimit=65035
    RecoilMaxPitchLimit=900
    RecoilMinPitchLimit=64785
    RecoilISMaxYawLimit=50
    RecoilISMinYawLimit=65485
    RecoilISMaxPitchLimit=500
    RecoilISMinPitchLimit=65485
    HippedRecoilModifier=1.5
    FallingRecoilModifier=1.5
    AssociatedPerkClass=Class'KFGame.KFPerk_Support'
    FiringStatesArray=/* Array type was not detected. */
    WeaponFireTypes=/* Array type was not detected. */
    WeaponProjectiles=/* Array type was not detected. */
    FireInterval=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    FireOffset=(X=30,Y=5,Z=-4)
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_1P_M4Shotgun_MESH.Wep_1stP_M4Shotgun_Rig'
        AnimSets(0)=AnimSet'WEP_1P_M4Shotgun_ANIM.Wep_1st_M4Shotgun_ANIM'
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Shotgun_M4.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="M4 Combat Shotgun"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        StaticMesh=StaticMesh'WEP_3P_Pickups_MESH.Wep_M4Shotgun_Pickup'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Shotgun_M4.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        StaticMesh=StaticMesh'WEP_3P_Pickups_MESH.Wep_M4Shotgun_Pickup'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Shotgun_M4.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}