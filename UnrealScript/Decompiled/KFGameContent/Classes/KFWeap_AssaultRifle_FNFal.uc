/*******************************************************************************
 * KFWeap_AssaultRifle_FNFal generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_AssaultRifle_FNFal extends KFWeap_ScopedBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

defaultproperties
{
    begin object name=SceneCapture2DComponent0 class=TWSceneCapture2DDPGComponent
        TextureTarget=TextureRenderTarget2D'Wep_Mat_Lib.WEP_ScopeLense_Target'
        FieldOfView=12.5
    object end
    // Reference: TWSceneCapture2DDPGComponent'Default__KFWeap_AssaultRifle_FNFal.SceneCapture2DComponent0'
    SceneCapture=SceneCapture2DComponent0
    ScopeLenseMICTemplate=MaterialInstanceConstant'WEP_1P_FNFAL_MAT.WEP_1P_FNFAL_Scope_MAT'
    ScopedSensitivityMod=8
    PackageKey="FNFAL"
    FirstPersonMeshName="WEP_1P_FNFAL_MESH.WEP_1stP_FNFAL_Rig"
    FirstPersonAnimSetNames=/* Array type was not detected. */
    PickupMeshName="WEP_3P_FNFAL_MESH.WEP_3rdP_FNFAL_Pickup"
    AttachmentArchetypeName="WEP_FNFAL_ARCH.Wep_FNFAL_3P"
    MuzzleFlashTemplateName="WEP_FNFAL_ARCH.Wep_FNFAL_MuzzleFlash"
    bUseAltFireMode=true
    bHasIronSights=true
    bCanBeReloaded=true
    bReloadFromMagazine=true
    FireModeIconPaths=/* Array type was not detected. */
    SingleFireSoundIndex=1
    InventorySize=8
    MagazineCapacity=20
    PenetrationPower=/* Array type was not detected. */
    MeshFOV=55
    MeshIronSightFOV=20
    PlayerIronSightFOV=70
    IronSightPosition=(X=15,Y=0,Z=0)
    DOF_BlendInSpeed=3
    DOF_FG_FocalRadius=0
    DOF_FG_MaxNearBlurSize=3.5
    GroupPriority=100
    WeaponSelectTexture=Texture2D'WEP_UI_FNFAL_TEX.UI_WeaponSelect_FNFAL'
    SpareAmmoCapacity=160
    InitialSpareMags=3
    bLoopingFireAnim=/* Array type was not detected. */
    bLoopingFireSnd=/* Array type was not detected. */
    FireSightedAnims=/* Array type was not detected. */
    WeaponFireSnd=/* Array type was not detected. */
    WeaponFireLoopEndSnd=/* Array type was not detected. */
    WeaponDryFireSnd=/* Array type was not detected. */
    PlayerViewOffset=(X=22,Y=11,Z=-3)
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_AssaultRifle_FNFal.MeleeHelper'
    maxRecoilPitch=200
    minRecoilPitch=165
    maxRecoilYaw=190
    minRecoilYaw=-165
    RecoilViewRotationScale=0.6
    RecoilMaxYawLimit=500
    RecoilMinYawLimit=65035
    RecoilMaxPitchLimit=900
    RecoilMinPitchLimit=65035
    RecoilISMaxYawLimit=150
    RecoilISMinYawLimit=65385
    RecoilISMaxPitchLimit=375
    RecoilISMinPitchLimit=65460
    HippedRecoilModifier=1.5
    AssociatedPerkClasses=/* Array type was not detected. */
    WeaponUpgrades=/* Array type was not detected. */
    FiringStatesArray=/* Array type was not detected. */
    WeaponProjectiles=/* Array type was not detected. */
    FireInterval=/* Array type was not detected. */
    Spread=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    FireOffset=(X=30,Y=4.5,Z=-5)
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_AssaultRifle_FNFal.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="FN FAL ACOG"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_AssaultRifle_FNFal.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_AssaultRifle_FNFal.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
    begin object name=SceneCapture2DComponent0 class=TWSceneCapture2DDPGComponent
        TextureTarget=TextureRenderTarget2D'Wep_Mat_Lib.WEP_ScopeLense_Target'
        FieldOfView=12.5
    object end
    // Reference: TWSceneCapture2DDPGComponent'Default__KFWeap_AssaultRifle_FNFal.SceneCapture2DComponent0'
    Components(0)=SceneCapture2DComponent0
}