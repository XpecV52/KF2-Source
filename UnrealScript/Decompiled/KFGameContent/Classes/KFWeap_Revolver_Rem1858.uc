/*******************************************************************************
 * KFWeap_Revolver_Rem1858 generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_Revolver_Rem1858 extends KFWeap_PistolBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

defaultproperties
{
    bRevolver=true
    UnusedBulletMeshTemplate=SkeletalMesh'WEP_1P_Remington_1858_MESH.Wep_1stP_Remington_1858_NewCap'
    UsedBulletMeshTemplate=SkeletalMesh'WEP_1P_Remington_1858_MESH.Wep_1stP_Remington_1858_UsedCap'
    BulletFXSocketNames=/* Array type was not detected. */
    BulletMeshComponents=/* Array type was not detected. */
    CylinderRotInfo=(InC=-60,Time=0.0175)
    PackageKey="Remington_1858"
    FirstPersonMeshName="WEP_1P_Remington_1858_MESH.Wep_1stP_Remington_1858_Rig"
    FirstPersonAnimSetNames=/* Array type was not detected. */
    PickupMeshName="WEP_3P_Remington_1858_MESH.Wep_3P_Remington_1858_Pickup"
    AttachmentArchetypeName="WEP_Remington_1858_ARCH.Wep_Remington_1858_3P"
    MuzzleFlashTemplateName="WEP_Remington_1858_ARCH.Wep_Remington_1858_MuzzleFlash"
    bHasIronSights=true
    bCanBeReloaded=true
    bReloadFromMagazine=true
    bHasFireLastAnims=true
    InventorySize=2
    MeshFOV=60
    MeshIronSightFOV=55
    PlayerIronSightFOV=77
    IronSightPosition=(X=4,Y=0,Z=0)
    DOF_FG_FocalRadius=40
    DOF_FG_MaxNearBlurSize=3.5
    GroupPriority=15
    WeaponSelectTexture=Texture2D'WEP_UI_Remington_1858_TEX.UI_WeaponSelect_Remington'
    DualClass=Class'KFWeap_Revolver_DualRem1858'
    MagazineCapacity=6
    SpareAmmoCapacity=144
    InitialSpareMags=12
    AmmoPickupScale=2
    IdleFidgetAnims=/* Array type was not detected. */
    FireSightedAnims=/* Array type was not detected. */
    BonesToLockOnEmpty=/* Array type was not detected. */
    WeaponFireSnd=/* Array type was not detected. */
    WeaponDryFireSnd=/* Array type was not detected. */
    PlayerViewOffset=(X=15,Y=14,Z=-6)
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_Revolver_Rem1858.MeleeHelper'
    maxRecoilPitch=400
    minRecoilPitch=350
    maxRecoilYaw=125
    minRecoilYaw=-125
    RecoilRate=0.08
    RecoilBlendOutRatio=0.75
    RecoilMaxYawLimit=500
    RecoilMinYawLimit=65035
    RecoilMaxPitchLimit=900
    RecoilMinPitchLimit=65035
    RecoilISMaxYawLimit=50
    RecoilISMinYawLimit=65485
    RecoilISMaxPitchLimit=400
    RecoilISMinPitchLimit=65485
    IronSightMeshFOVCompensationScale=1.5
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
        AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Dual_Animtree_Master_Revolver'
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Revolver_Rem1858.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="1858 Revolver"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Revolver_Rem1858.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Revolver_Rem1858.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
    begin object name=BulletMeshComp0 class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_1P_Remington_1858_MESH.Wep_1stP_Remington_1858_NewCap'
        ReplacementPrimitive=none
        DepthPriorityGroup=ESceneDepthPriorityGroup.SDPG_Foreground
        bUseAsOccluder=false
        CastShadow=false
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Revolver_Rem1858.BulletMeshComp0'
    Components(0)=BulletMeshComp0
    begin object name=BulletMeshComp1 class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_1P_Remington_1858_MESH.Wep_1stP_Remington_1858_NewCap'
        ReplacementPrimitive=none
        DepthPriorityGroup=ESceneDepthPriorityGroup.SDPG_Foreground
        bUseAsOccluder=false
        CastShadow=false
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Revolver_Rem1858.BulletMeshComp1'
    Components(1)=BulletMeshComp1
    begin object name=BulletMeshComp2 class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_1P_Remington_1858_MESH.Wep_1stP_Remington_1858_NewCap'
        ReplacementPrimitive=none
        DepthPriorityGroup=ESceneDepthPriorityGroup.SDPG_Foreground
        bUseAsOccluder=false
        CastShadow=false
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Revolver_Rem1858.BulletMeshComp2'
    Components(2)=BulletMeshComp2
    begin object name=BulletMeshComp3 class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_1P_Remington_1858_MESH.Wep_1stP_Remington_1858_NewCap'
        ReplacementPrimitive=none
        DepthPriorityGroup=ESceneDepthPriorityGroup.SDPG_Foreground
        bUseAsOccluder=false
        CastShadow=false
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Revolver_Rem1858.BulletMeshComp3'
    Components(3)=BulletMeshComp3
    begin object name=BulletMeshComp4 class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_1P_Remington_1858_MESH.Wep_1stP_Remington_1858_NewCap'
        ReplacementPrimitive=none
        DepthPriorityGroup=ESceneDepthPriorityGroup.SDPG_Foreground
        bUseAsOccluder=false
        CastShadow=false
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Revolver_Rem1858.BulletMeshComp4'
    Components(4)=BulletMeshComp4
    begin object name=BulletMeshComp5 class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_1P_Remington_1858_MESH.Wep_1stP_Remington_1858_NewCap'
        ReplacementPrimitive=none
        DepthPriorityGroup=ESceneDepthPriorityGroup.SDPG_Foreground
        bUseAsOccluder=false
        CastShadow=false
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Revolver_Rem1858.BulletMeshComp5'
    Components(5)=BulletMeshComp5
}