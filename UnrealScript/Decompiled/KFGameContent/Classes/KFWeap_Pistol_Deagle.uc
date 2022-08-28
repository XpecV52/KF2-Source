/*******************************************************************************
 * KFWeap_Pistol_Deagle generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_Pistol_Deagle extends KFWeap_PistolBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

defaultproperties
{
    PackageKey="Deagle"
    FirstPersonMeshName="WEP_1P_Deagle_MESH.Wep_1stP_Deagle_Rig"
    FirstPersonAnimSetNames=/* Array type was not detected. */
    PickupMeshName="WEP_3P_Deagle_MESH.Wep_Deagle_Pickup"
    AttachmentArchetypeName="WEP_Deagle_ARCH.Wep_Deagle_3P"
    MuzzleFlashTemplateName="WEP_Deagle_ARCH.Wep_Deagle_MuzzleFlash"
    bHasIronSights=true
    bCanBeReloaded=true
    bReloadFromMagazine=true
    bHasFireLastAnims=true
    InventorySize=2
    MagazineCapacity=7
    PenetrationPower=/* Array type was not detected. */
    MeshIronSightFOV=77
    PlayerIronSightFOV=77
    IronSightPosition=(X=11,Y=0,Z=0)
    DOF_FG_FocalRadius=38
    DOF_FG_MaxNearBlurSize=3.5
    GroupPriority=25
    WeaponSelectTexture=Texture2D'WEP_UI_Deagle_TEX.UI_WeaponSelect_Deagle'
    DualClass=Class'KFWeap_Pistol_DualDeagle'
    SpareAmmoCapacity=105
    InitialSpareMags=5
    AmmoPickupScale=2
    WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Medium_Recoil'
    IdleFidgetAnims=/* Array type was not detected. */
    FireSightedAnims=/* Array type was not detected. */
    BonesToLockOnEmpty=/* Array type was not detected. */
    WeaponFireSnd=/* Array type was not detected. */
    WeaponDryFireSnd=/* Array type was not detected. */
    PlayerViewOffset=(X=14,Y=10,Z=-4)
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_Pistol_Deagle.MeleeHelper'
    maxRecoilPitch=650
    minRecoilPitch=550
    maxRecoilYaw=150
    minRecoilYaw=-150
    RecoilRate=0.07
    RecoilMaxYawLimit=500
    RecoilMinYawLimit=65035
    RecoilMaxPitchLimit=1250
    RecoilMinPitchLimit=65035
    RecoilISMaxYawLimit=50
    RecoilISMinYawLimit=65485
    RecoilISMaxPitchLimit=500
    RecoilISMinPitchLimit=65485
    AssociatedPerkClasses=/* Array type was not detected. */
    WeaponUpgrades=/* Array type was not detected. */
    FiringStatesArray=/* Array type was not detected. */
    WeaponFireTypes=/* Array type was not detected. */
    WeaponProjectiles=/* Array type was not detected. */
    FireInterval=/* Array type was not detected. */
    Spread=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    FireOffset=(X=20,Y=4,Z=-3)
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Pistol_Deagle.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName=".50 Desert Eagle"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Pistol_Deagle.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Pistol_Deagle.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}