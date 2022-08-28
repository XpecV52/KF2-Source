/*******************************************************************************
 * KFWeap_Shotgun_MB500 generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_Shotgun_MB500 extends KFWeap_ShotgunBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

defaultproperties
{
    PackageKey="MB500"
    FirstPersonMeshName="WEP_1P_MB500_MESH.Wep_1stP_MB500_Rig"
    FirstPersonAnimSetNames=/* Array type was not detected. */
    PickupMeshName="WEP_3P_MB500_MESH.Wep_MB500_Pickup"
    AttachmentArchetypeName="WEP_MB500_ARCH.Wep_MB500_3P"
    MuzzleFlashTemplateName="WEP_MB500_ARCH.Wep_MB500_MuzzleFlash"
    bHasIronSights=true
    bCanBeReloaded=true
    FireModeIconPaths=/* Array type was not detected. */
    InventorySize=5
    MagazineCapacity=8
    PenetrationPower=/* Array type was not detected. */
    MeshIronSightFOV=52
    PlayerIronSightFOV=70
    IronSightPosition=(X=9.5,Y=0,Z=0)
    DOF_FG_FocalRadius=95
    DOF_FG_MaxNearBlurSize=3.5
    GroupPriority=25
    WeaponSelectTexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_Mossberg'
    SpareAmmoCapacity=56
    InitialSpareMags=3
    WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Heavy_Recoil_SingleShot'
    WeaponFireSnd=/* Array type was not detected. */
    WeaponDryFireSnd=/* Array type was not detected. */
    PlayerViewOffset=(X=8,Y=8,Z=-3.5)
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_Shotgun_MB500.MeleeHelper'
    maxRecoilPitch=900
    minRecoilPitch=775
    maxRecoilYaw=500
    minRecoilYaw=-500
    RecoilRate=0.085
    RecoilBlendOutRatio=0.35
    RecoilViewRotationScale=0.8
    RecoilMaxYawLimit=500
    RecoilMinYawLimit=65035
    RecoilMinPitchLimit=64785
    RecoilISMaxYawLimit=50
    RecoilISMinYawLimit=65485
    RecoilISMaxPitchLimit=500
    RecoilISMinPitchLimit=65485
    HippedRecoilModifier=1.25
    FallingRecoilModifier=1.5
    AssociatedPerkClasses=/* Array type was not detected. */
    WeaponUpgrades=/* Array type was not detected. */
    FiringStatesArray=/* Array type was not detected. */
    WeaponFireTypes=/* Array type was not detected. */
    WeaponProjectiles=/* Array type was not detected. */
    FireInterval=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    FireOffset=(X=30,Y=3,Z=-3)
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Shotgun_MB500.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="SG 500 Pump-Action"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Shotgun_MB500.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Shotgun_MB500.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}