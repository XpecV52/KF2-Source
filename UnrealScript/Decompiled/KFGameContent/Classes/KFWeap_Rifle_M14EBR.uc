/*******************************************************************************
 * KFWeap_Rifle_M14EBR generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_Rifle_M14EBR extends KFWeap_ScopedBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

defaultproperties
{
    begin object name=SceneCapture2DComponent0 class=TWSceneCapture2DDPGComponent
        TextureTarget=TextureRenderTarget2D'Wep_Mat_Lib.WEP_ScopeLense_Target'
        FieldOfView=12.5
    object end
    // Reference: TWSceneCapture2DDPGComponent'Default__KFWeap_Rifle_M14EBR.SceneCapture2DComponent0'
    SceneCapture=SceneCapture2DComponent0
    ScopeLenseMICTemplate=MaterialInstanceConstant'WEP_1P_M14EBR_MAT_TWO.WEP_1P_M14EBR_Scope_MAT'
    ScopedSensitivityMod=8
    PackageKey="M14EBR"
    FirstPersonMeshName="WEP_1P_M14EBR_MESH.WEP_1stP_M14_EBR"
    FirstPersonAnimSetNames=/* Array type was not detected. */
    PickupMeshName="WEP_3P_M14EBR_MESH.Wep_M14EBR_Pickup"
    AttachmentArchetypeName="WEP_M14EBR_ARCH.Wep_M14EBR_3P"
    MuzzleFlashTemplateName="WEP_M14EBR_ARCH.Wep_M14EBR_MuzzleFlash"
    bHasIronSights=true
    bWarnAIWhenAiming=true
    bCanBeReloaded=true
    bReloadFromMagazine=true
    bHasLaserSight=true
    InventorySize=7
    PenetrationPower=/* Array type was not detected. */
    MeshFOV=70
    MeshIronSightFOV=27
    PlayerIronSightFOV=70
    IronSightPosition=(X=0,Y=-0.016,Z=-0.016)
    DOF_BlendInSpeed=3
    DOF_FG_FocalRadius=0
    DOF_FG_MaxNearBlurSize=3.5
    AimWarningDelay=(X=0.4,Y=0.8)
    GroupPriority=75
    WeaponSelectTexture=Texture2D'WEP_UI_M14EBR_TEX.UI_WeaponSelect_SM14-EBR'
    MagazineCapacity=20
    SpareAmmoCapacity=120
    InitialSpareMags=2
    WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Heavy_Recoil'
    FireSightedAnims=/* Array type was not detected. */
    WeaponFireSnd=/* Array type was not detected. */
    WeaponDryFireSnd=/* Array type was not detected. */
    PlayerViewOffset=(X=15,Y=11.5,Z=-4)
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_Rifle_M14EBR.MeleeHelper'
    LaserSightTemplate=KFLaserSightAttachment'FX_LaserSight_ARCH.LaserSight_WithAttachment_1P'
    maxRecoilPitch=225
    minRecoilPitch=200
    maxRecoilYaw=200
    minRecoilYaw=-200
    RecoilRate=0.08
    RecoilViewRotationScale=0.6
    RecoilMaxYawLimit=500
    RecoilMinYawLimit=65035
    RecoilMaxPitchLimit=900
    RecoilMinPitchLimit=65035
    RecoilISMaxYawLimit=150
    RecoilISMinYawLimit=65385
    RecoilISMaxPitchLimit=375
    RecoilISMinPitchLimit=65460
    AssociatedPerkClasses=/* Array type was not detected. */
    WeaponUpgrades=/* Array type was not detected. */
    FiringStatesArray=/* Array type was not detected. */
    WeaponFireTypes=/* Array type was not detected. */
    WeaponProjectiles=/* Array type was not detected. */
    FireInterval=/* Array type was not detected. */
    Spread=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    FireOffset=(X=30,Y=3,Z=-2.5)
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Rifle_M14EBR.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="M14 EBR"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Rifle_M14EBR.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Rifle_M14EBR.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
    begin object name=SceneCapture2DComponent0 class=TWSceneCapture2DDPGComponent
        TextureTarget=TextureRenderTarget2D'Wep_Mat_Lib.WEP_ScopeLense_Target'
        FieldOfView=12.5
    object end
    // Reference: TWSceneCapture2DDPGComponent'Default__KFWeap_Rifle_M14EBR.SceneCapture2DComponent0'
    Components(0)=SceneCapture2DComponent0
}