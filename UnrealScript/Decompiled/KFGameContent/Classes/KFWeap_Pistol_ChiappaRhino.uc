/*******************************************************************************
 * KFWeap_Pistol_ChiappaRhino generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_Pistol_ChiappaRhino extends KFWeap_PistolBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

defaultproperties
{
    PackageKey="ChiappaRhino"
    FirstPersonMeshName="WEP_1P_ChiappaRhino_MESH.Wep_1stP_ChiappaRhino_Rig"
    FirstPersonAnimSetNames=/* Array type was not detected. */
    PickupMeshName="WEP_3P_ChiappaRhino_MESH.Wep_3rdP_ChiappaRhino_Pickup"
    AttachmentArchetypeName="WEP_ChiappaRhino_ARCH.Wep_ChiappaRhino_3P"
    MuzzleFlashTemplateName="WEP_ChiappaRhino_ARCH.Wep_ChiappaRhino_MuzzleFlash"
    bHasIronSights=true
    bCanBeReloaded=true
    bReloadFromMagazine=true
    bHasFireLastAnims=true
    InventorySize=2
    MagazineCapacity=6
    PenetrationPower=/* Array type was not detected. */
    MeshIronSightFOV=77
    PlayerIronSightFOV=77
    IronSightPosition=(X=11,Y=0,Z=-0.25)
    DOF_FG_FocalRadius=38
    DOF_FG_MaxNearBlurSize=3.5
    GroupPriority=22
    WeaponSelectTexture=Texture2D'wep_ui_chiapparhino_tex.UI_WeaponSelect_ChiappaRhinos'
    DualClass=Class'KFWeap_Pistol_ChiappaRhinoDual'
    SpareAmmoCapacity=114
    InitialSpareMags=7
    AmmoPickupScale=2
    WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Medium_Recoil'
    IdleFidgetAnims=/* Array type was not detected. */
    FireSightedAnims=/* Array type was not detected. */
    BonesToLockOnEmpty=/* Array type was not detected. */
    WeaponFireSnd=/* Array type was not detected. */
    WeaponDryFireSnd=/* Array type was not detected. */
    PlayerViewOffset=(X=14,Y=10,Z=-4)
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_Pistol_ChiappaRhino.MeleeHelper'
    maxRecoilPitch=500
    minRecoilPitch=450
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
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Pistol_ChiappaRhino.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="Rhino"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Pistol_ChiappaRhino.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Pistol_ChiappaRhino.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}