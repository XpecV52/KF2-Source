/*******************************************************************************
 * KFWeap_Revolver_DualSW500 generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_Revolver_DualSW500 extends KFWeap_DualBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

defaultproperties
{
    LeftFireOffset=(X=17,Y=-4,Z=-2.25)
    SingleClass=Class'KFWeap_Revolver_SW500'
    BonesToLockOnEmpty_L=/* Array type was not detected. */
    CylinderRotInfo_L=(InC=-72,Time=0.0875)
    bRevolver=true
    UnusedBulletMeshTemplate=SkeletalMesh'WEP_1P_SW_500_MESH.Wep_1stP_SW_500_Bullet'
    UsedBulletMeshTemplate=SkeletalMesh'WEP_1P_SW_500_MESH.Wep_1stP_SW_500_EmptyShell'
    BulletFXSocketNames=/* Array type was not detected. */
    BulletMeshComponents=/* Array type was not detected. */
    CylinderRotInfo=(InC=-72,Time=0.0875)
    PackageKey="Dual_SW_500"
    FirstPersonMeshName="WEP_1P_Dual_SW_500_MESH.Wep_1stP_Dual_SW_500_Rig"
    FirstPersonAnimSetNames=/* Array type was not detected. */
    PickupMeshName="WEP_3P_Dual_SW_500_MESH.Wep_SW_500_Pickup"
    AttachmentArchetypeName="WEP_Dual_SW_500_ARCH.Wep_Dual_SW_500_3P"
    MuzzleFlashTemplateName="WEP_Dual_SW_500_ARCH.Wep_Dual_SW_500_MuzzleFlash"
    bHasIronSights=true
    bCanBeReloaded=true
    bReloadFromMagazine=true
    bHasFireLastAnims=true
    InventorySize=6
    PenetrationPower=/* Array type was not detected. */
    MeshFOV=60
    MeshIronSightFOV=60
    PlayerIronSightFOV=77
    IronSightPosition=(X=7,Y=0,Z=0)
    QuickWeaponDownRotation=(Pitch=-8192,Yaw=0,Roll=0)
    DOF_FG_FocalRadius=40
    DOF_FG_MaxNearBlurSize=3.5
    GroupPriority=50
    WeaponSelectTexture=Texture2D'WEP_UI_Dual_SW_500_TEX.UI_WeaponSelect_DualSW500'
    MagazineCapacity=10
    SpareAmmoCapacity=95
    InitialSpareMags=2
    BonesToLockOnEmpty=/* Array type was not detected. */
    WeaponFireSnd=/* Array type was not detected. */
    WeaponDryFireSnd=/* Array type was not detected. */
    PlayerViewOffset=(X=29,Y=0,Z=-4)
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_Revolver_DualSW500.MeleeHelper'
    maxRecoilPitch=850
    minRecoilPitch=750
    maxRecoilYaw=150
    minRecoilYaw=-150
    RecoilRate=0.1
    RecoilMaxYawLimit=500
    RecoilMinYawLimit=65035
    RecoilMaxPitchLimit=900
    RecoilMinPitchLimit=65035
    RecoilISMaxYawLimit=50
    RecoilISMinYawLimit=65485
    RecoilISMaxPitchLimit=500
    RecoilISMinPitchLimit=65485
    IronSightMeshFOVCompensationScale=1.4
    AssociatedPerkClasses=/* Array type was not detected. */
    WeaponUpgrades=/* Array type was not detected. */
    FiringStatesArray=/* Array type was not detected. */
    WeaponProjectiles=/* Array type was not detected. */
    FireInterval=/* Array type was not detected. */
    Spread=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    FireOffset=(X=17,Y=4,Z=-2.25)
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Dual_Animtree_Master_Revolver'
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Revolver_DualSW500.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="Dual .500 Magnums"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Revolver_DualSW500.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Revolver_DualSW500.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
    begin object name=BulletMeshComp0 class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_1P_SW_500_MESH.Wep_1stP_SW_500_Bullet'
        ReplacementPrimitive=none
        DepthPriorityGroup=ESceneDepthPriorityGroup.SDPG_Foreground
        bUseAsOccluder=false
        CastShadow=false
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Revolver_DualSW500.BulletMeshComp0'
    Components(0)=BulletMeshComp0
    begin object name=BulletMeshComp0_L class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_1P_SW_500_MESH.Wep_1stP_SW_500_Bullet'
        ReplacementPrimitive=none
        DepthPriorityGroup=ESceneDepthPriorityGroup.SDPG_Foreground
        bUseAsOccluder=false
        CastShadow=false
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Revolver_DualSW500.BulletMeshComp0_L'
    Components(1)=BulletMeshComp0_L
    begin object name=BulletMeshComp1 class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_1P_SW_500_MESH.Wep_1stP_SW_500_Bullet'
        ReplacementPrimitive=none
        DepthPriorityGroup=ESceneDepthPriorityGroup.SDPG_Foreground
        bUseAsOccluder=false
        CastShadow=false
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Revolver_DualSW500.BulletMeshComp1'
    Components(2)=BulletMeshComp1
    begin object name=BulletMeshComp1_L class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_1P_SW_500_MESH.Wep_1stP_SW_500_Bullet'
        ReplacementPrimitive=none
        DepthPriorityGroup=ESceneDepthPriorityGroup.SDPG_Foreground
        bUseAsOccluder=false
        CastShadow=false
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Revolver_DualSW500.BulletMeshComp1_L'
    Components(3)=BulletMeshComp1_L
    begin object name=BulletMeshComp2 class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_1P_SW_500_MESH.Wep_1stP_SW_500_Bullet'
        ReplacementPrimitive=none
        DepthPriorityGroup=ESceneDepthPriorityGroup.SDPG_Foreground
        bUseAsOccluder=false
        CastShadow=false
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Revolver_DualSW500.BulletMeshComp2'
    Components(4)=BulletMeshComp2
    begin object name=BulletMeshComp2_L class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_1P_SW_500_MESH.Wep_1stP_SW_500_Bullet'
        ReplacementPrimitive=none
        DepthPriorityGroup=ESceneDepthPriorityGroup.SDPG_Foreground
        bUseAsOccluder=false
        CastShadow=false
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Revolver_DualSW500.BulletMeshComp2_L'
    Components(5)=BulletMeshComp2_L
    begin object name=BulletMeshComp3 class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_1P_SW_500_MESH.Wep_1stP_SW_500_Bullet'
        ReplacementPrimitive=none
        DepthPriorityGroup=ESceneDepthPriorityGroup.SDPG_Foreground
        bUseAsOccluder=false
        CastShadow=false
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Revolver_DualSW500.BulletMeshComp3'
    Components(6)=BulletMeshComp3
    begin object name=BulletMeshComp3_L class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_1P_SW_500_MESH.Wep_1stP_SW_500_Bullet'
        ReplacementPrimitive=none
        DepthPriorityGroup=ESceneDepthPriorityGroup.SDPG_Foreground
        bUseAsOccluder=false
        CastShadow=false
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Revolver_DualSW500.BulletMeshComp3_L'
    Components(7)=BulletMeshComp3_L
    begin object name=BulletMeshComp4 class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_1P_SW_500_MESH.Wep_1stP_SW_500_Bullet'
        ReplacementPrimitive=none
        DepthPriorityGroup=ESceneDepthPriorityGroup.SDPG_Foreground
        bUseAsOccluder=false
        CastShadow=false
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Revolver_DualSW500.BulletMeshComp4'
    Components(8)=BulletMeshComp4
    begin object name=BulletMeshComp4_L class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_1P_SW_500_MESH.Wep_1stP_SW_500_Bullet'
        ReplacementPrimitive=none
        DepthPriorityGroup=ESceneDepthPriorityGroup.SDPG_Foreground
        bUseAsOccluder=false
        CastShadow=false
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Revolver_DualSW500.BulletMeshComp4_L'
    Components(9)=BulletMeshComp4_L
}