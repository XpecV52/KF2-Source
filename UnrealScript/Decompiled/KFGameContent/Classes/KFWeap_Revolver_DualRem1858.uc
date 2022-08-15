/*******************************************************************************
 * KFWeap_Revolver_DualRem1858 generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_Revolver_DualRem1858 extends KFWeap_DualBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

defaultproperties
{
    LeftMuzzleFlashTemplate=KFMuzzleFlash'WEP_DualRemington1858_ARCH.Wep_DualRemington1858_MuzzleFlash_L'
    LeftFireOffset=(X=17,Y=-4,Z=-2.25)
    SingleClass=Class'KFWeap_Revolver_Rem1858'
    BonesToLockOnEmpty_L=/* Array type was not detected. */
    CylinderRotInfo_L=(InC=-60,Time=0.0875)
    bRevolver=true
    UnusedBulletMeshTemplate=SkeletalMesh'WEP_1P_Remington_1858_MESH.Wep_1stP_Remington_1858_NewCap'
    UsedBulletMeshTemplate=SkeletalMesh'WEP_1P_Remington_1858_MESH.Wep_1stP_Remington_1858_UsedCap'
    BulletFXSocketNames=/* Array type was not detected. */
    BulletMeshComponents=/* Array type was not detected. */
    CylinderRotInfo=(InC=-60,Time=0.0875)
    InventorySize=4
    bHasIronSights=true
    bCanBeReloaded=true
    bReloadFromMagazine=true
    bHasFireLastAnims=true
    MeshFOV=60
    MeshIronSightFOV=55
    PlayerIronSightFOV=77
    IronSightPosition=(X=4,Y=0,Z=0)
    QuickWeaponDownRotation=(Pitch=-8192,Yaw=0,Roll=0)
    DOF_FG_FocalRadius=40
    DOF_FG_MaxNearBlurSize=3.5
    GroupPriority=35
    WeaponSelectTexture=Texture2D'WEP_UI_DualRemington1858_TEX.UI_WeaponSelect_DualRemington'
    MagazineCapacity=12
    MaxSpareAmmo=132
    InitialSpareMags=5
    IdleFidgetAnims=/* Array type was not detected. */
    BonesToLockOnEmpty=/* Array type was not detected. */
    WeaponFireSnd=/* Array type was not detected. */
    WeaponDryFireSnd=/* Array type was not detected. */
    PlayerViewOffset=(X=23,Y=0,Z=-1)
    AttachmentArchetype=KFWeapAttach_DualBase'WEP_DualRemington1858_ARCH.Wep_DualRemington1858_3P'
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_Revolver_DualRem1858.MeleeHelper'
    MuzzleFlashTemplate=KFMuzzleFlash'WEP_DualRemington1858_ARCH.Wep_DualRemington1858_MuzzleFlash'
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
    AssociatedPerkClass=Class'KFGame.KFPerk_Gunslinger'
    FiringStatesArray=/* Array type was not detected. */
    WeaponProjectiles=/* Array type was not detected. */
    FireInterval=/* Array type was not detected. */
    Spread=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    FireOffset=(X=17,Y=4,Z=-2.25)
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_1P_DualRemington1858_MESH.Wep_1stP_DualRemington1858_Rig'
        AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Dual_Animtree_Master_Revolver'
        AnimSets(0)=AnimSet'WEP_1P_DualRemington1858_Anim.WEP_1P_DualRemington1858_Anim'
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Revolver_DualRem1858.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="Dual 1858 Revolver"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        StaticMesh=StaticMesh'WEP_3P_Remington_1858_MESH.Wep_3P_Remington_1858_Pickup'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Revolver_DualRem1858.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        StaticMesh=StaticMesh'WEP_3P_Remington_1858_MESH.Wep_3P_Remington_1858_Pickup'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Revolver_DualRem1858.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
    begin object name=BulletMeshComp0 class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_1P_Remington_1858_MESH.Wep_1stP_Remington_1858_NewCap'
        ReplacementPrimitive=none
        DepthPriorityGroup=ESceneDepthPriorityGroup.SDPG_Foreground
        CastShadow=false
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Revolver_DualRem1858.BulletMeshComp0'
    Components(0)=BulletMeshComp0
    begin object name=BulletMeshComp0_L class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_1P_Remington_1858_MESH.Wep_1stP_Remington_1858_NewCap'
        ReplacementPrimitive=none
        DepthPriorityGroup=ESceneDepthPriorityGroup.SDPG_Foreground
        CastShadow=false
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Revolver_DualRem1858.BulletMeshComp0_L'
    Components(1)=BulletMeshComp0_L
    begin object name=BulletMeshComp1 class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_1P_Remington_1858_MESH.Wep_1stP_Remington_1858_NewCap'
        ReplacementPrimitive=none
        DepthPriorityGroup=ESceneDepthPriorityGroup.SDPG_Foreground
        CastShadow=false
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Revolver_DualRem1858.BulletMeshComp1'
    Components(2)=BulletMeshComp1
    begin object name=BulletMeshComp1_L class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_1P_Remington_1858_MESH.Wep_1stP_Remington_1858_NewCap'
        ReplacementPrimitive=none
        DepthPriorityGroup=ESceneDepthPriorityGroup.SDPG_Foreground
        CastShadow=false
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Revolver_DualRem1858.BulletMeshComp1_L'
    Components(3)=BulletMeshComp1_L
    begin object name=BulletMeshComp2 class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_1P_Remington_1858_MESH.Wep_1stP_Remington_1858_NewCap'
        ReplacementPrimitive=none
        DepthPriorityGroup=ESceneDepthPriorityGroup.SDPG_Foreground
        CastShadow=false
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Revolver_DualRem1858.BulletMeshComp2'
    Components(4)=BulletMeshComp2
    begin object name=BulletMeshComp2_L class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_1P_Remington_1858_MESH.Wep_1stP_Remington_1858_NewCap'
        ReplacementPrimitive=none
        DepthPriorityGroup=ESceneDepthPriorityGroup.SDPG_Foreground
        CastShadow=false
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Revolver_DualRem1858.BulletMeshComp2_L'
    Components(5)=BulletMeshComp2_L
    begin object name=BulletMeshComp3 class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_1P_Remington_1858_MESH.Wep_1stP_Remington_1858_NewCap'
        ReplacementPrimitive=none
        DepthPriorityGroup=ESceneDepthPriorityGroup.SDPG_Foreground
        CastShadow=false
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Revolver_DualRem1858.BulletMeshComp3'
    Components(6)=BulletMeshComp3
    begin object name=BulletMeshComp3_L class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_1P_Remington_1858_MESH.Wep_1stP_Remington_1858_NewCap'
        ReplacementPrimitive=none
        DepthPriorityGroup=ESceneDepthPriorityGroup.SDPG_Foreground
        CastShadow=false
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Revolver_DualRem1858.BulletMeshComp3_L'
    Components(7)=BulletMeshComp3_L
    begin object name=BulletMeshComp4 class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_1P_Remington_1858_MESH.Wep_1stP_Remington_1858_NewCap'
        ReplacementPrimitive=none
        DepthPriorityGroup=ESceneDepthPriorityGroup.SDPG_Foreground
        CastShadow=false
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Revolver_DualRem1858.BulletMeshComp4'
    Components(8)=BulletMeshComp4
    begin object name=BulletMeshComp4_L class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_1P_Remington_1858_MESH.Wep_1stP_Remington_1858_NewCap'
        ReplacementPrimitive=none
        DepthPriorityGroup=ESceneDepthPriorityGroup.SDPG_Foreground
        CastShadow=false
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Revolver_DualRem1858.BulletMeshComp4_L'
    Components(9)=BulletMeshComp4_L
    begin object name=BulletMeshComp5 class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_1P_Remington_1858_MESH.Wep_1stP_Remington_1858_NewCap'
        ReplacementPrimitive=none
        DepthPriorityGroup=ESceneDepthPriorityGroup.SDPG_Foreground
        CastShadow=false
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Revolver_DualRem1858.BulletMeshComp5'
    Components(10)=BulletMeshComp5
    begin object name=BulletMeshComp5_L class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_1P_Remington_1858_MESH.Wep_1stP_Remington_1858_NewCap'
        ReplacementPrimitive=none
        DepthPriorityGroup=ESceneDepthPriorityGroup.SDPG_Foreground
        CastShadow=false
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Revolver_DualRem1858.BulletMeshComp5_L'
    Components(11)=BulletMeshComp5_L
}