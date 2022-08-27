//=============================================================================
// KFWeap_Revolver_Rem1858
//=============================================================================
// A Remington 1858 revolver
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Jeff Robinson
//=============================================================================

class KFWeap_Revolver_Rem1858 extends KFWeap_PistolBase;

defaultproperties
{
   bRevolver=True
   UnusedBulletMeshTemplate=SkeletalMesh'WEP_1P_Remington_1858_MESH.Wep_1stP_Remington_1858_NewCap'
   UsedBulletMeshTemplate=SkeletalMesh'WEP_1P_Remington_1858_MESH.Wep_1stP_Remington_1858_UsedCap'
   BulletFXSocketNames(0)="RW_Bullet_FX_6"
   BulletFXSocketNames(1)="RW_Bullet_FX_5"
   BulletFXSocketNames(2)="RW_Bullet_FX_4"
   BulletFXSocketNames(3)="RW_Bullet_FX_3"
   BulletFXSocketNames(4)="RW_Bullet_FX_2"
   BulletFXSocketNames(5)="RW_Bullet_FX_1"
   Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp0
      SkeletalMesh=SkeletalMesh'WEP_1P_Remington_1858_MESH.Wep_1stP_Remington_1858_NewCap'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bUseAsOccluder=False
      CastShadow=False
      Name="BulletMeshComp0"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFSkeletalMeshComponent'
   End Object
   BulletMeshComponents(0)=BulletMeshComp0
   Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp1
      SkeletalMesh=SkeletalMesh'WEP_1P_Remington_1858_MESH.Wep_1stP_Remington_1858_NewCap'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bUseAsOccluder=False
      CastShadow=False
      Name="BulletMeshComp1"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFSkeletalMeshComponent'
   End Object
   BulletMeshComponents(1)=BulletMeshComp1
   Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp2
      SkeletalMesh=SkeletalMesh'WEP_1P_Remington_1858_MESH.Wep_1stP_Remington_1858_NewCap'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bUseAsOccluder=False
      CastShadow=False
      Name="BulletMeshComp2"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFSkeletalMeshComponent'
   End Object
   BulletMeshComponents(2)=BulletMeshComp2
   Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp3
      SkeletalMesh=SkeletalMesh'WEP_1P_Remington_1858_MESH.Wep_1stP_Remington_1858_NewCap'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bUseAsOccluder=False
      CastShadow=False
      Name="BulletMeshComp3"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFSkeletalMeshComponent'
   End Object
   BulletMeshComponents(3)=BulletMeshComp3
   Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp4
      SkeletalMesh=SkeletalMesh'WEP_1P_Remington_1858_MESH.Wep_1stP_Remington_1858_NewCap'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bUseAsOccluder=False
      CastShadow=False
      Name="BulletMeshComp4"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFSkeletalMeshComponent'
   End Object
   BulletMeshComponents(4)=BulletMeshComp4
   Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp5
      SkeletalMesh=SkeletalMesh'WEP_1P_Remington_1858_MESH.Wep_1stP_Remington_1858_NewCap'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bUseAsOccluder=False
      CastShadow=False
      Name="BulletMeshComp5"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFSkeletalMeshComponent'
   End Object
   BulletMeshComponents(5)=BulletMeshComp5
   CylinderRotInfo=(InC=-60.000000,Time=0.017500)
   InventorySize=2
   MagazineCapacity(0)=6
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   bHasFireLastAnims=True
   MeshFOV=60.000000
   MeshIronSightFOV=55.000000
   PlayerIronSightFOV=77.000000
   IronSightPosition=(X=4.000000,Y=0.000000,Z=0.000000)
   DOF_FG_FocalRadius=40.000000
   DOF_FG_MaxNearBlurSize=3.500000
   GroupPriority=15.000000
   WeaponSelectTexture=Texture2D'WEP_UI_Remington_1858_TEX.UI_WeaponSelect_Remington'
   DualClass=Class'kfgamecontent.KFWeap_Revolver_DualRem1858'
   SpareAmmoCapacity(0)=144
   InitialSpareMags(0)=12
   AmmoPickupScale(0)=2.000000
   IdleFidgetAnims(3)="Guncheck_v4"
   FireSightedAnims(1)="Shoot_Iron2"
   FireSightedAnims(2)="Shoot_Iron3"
   BonesToLockOnEmpty(0)="RW_Hammer"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'ww_wep_sa_1858.Play_WEP_SA_1858_Fire_3P',FirstPersonCue=AkEvent'ww_wep_sa_1858.Play_WEP_SA_1858_Fire_1P')
   WeaponDryFireSnd(0)=AkEvent'ww_wep_sa_1858.Play_WEP_SA_1858_Fire_DryFire'
   PlayerViewOffset=(X=15.000000,Y=14.000000,Z=-6.000000)
   AttachmentArchetype=KFWeaponAttachment'WEP_Remington_1858_ARCH.Wep_Remington_1858_3P'
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_PistolBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_PistolBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Revolver_Rem1858:MeleeHelper_0'
   MuzzleFlashTemplate=KFMuzzleFlash'WEP_Remington_1858_ARCH.Wep_Remington_1858_MuzzleFlash'
   maxRecoilPitch=400
   minRecoilPitch=350
   maxRecoilYaw=125
   minRecoilYaw=-125
   RecoilRate=0.080000
   RecoilBlendOutRatio=0.750000
   RecoilMaxYawLimit=500
   RecoilMinYawLimit=65035
   RecoilMaxPitchLimit=900
   RecoilMinPitchLimit=65035
   RecoilISMaxYawLimit=50
   RecoilISMinYawLimit=65485
   RecoilISMaxPitchLimit=400
   RecoilISMinPitchLimit=65485
   IronSightMeshFOVCompensationScale=1.500000
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_Gunslinger'
   AssociatedPerkClasses(1)=Class'KFGame.KFPerk_Sharpshooter'
   FiringStatesArray(0)="WeaponSingleFiring"
   FiringStatesArray(1)="WeaponSingleFiring"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponFireTypes(1)=EWFT_None
   WeaponFireTypes(2)=()
   WeaponFireTypes(3)=()
   WeaponFireTypes(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_RevolverRem1858'
   FireInterval(0)=0.200000
   FireInterval(1)=()
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.015000
   InstantHitDamage(0)=50.000000
   InstantHitDamage(1)=()
   InstantHitDamage(2)=()
   InstantHitDamage(3)=22.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_Rem1858'
   InstantHitDamageTypes(1)=()
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_Rem1858'
   FireOffset=(X=20.000000,Y=4.000000,Z=-3.000000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_PistolBase:FirstPersonMesh'
      SkeletalMesh=SkeletalMesh'WEP_1P_Remington_1858_MESH.Wep_1stP_Remington_1858_Rig'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master_Revolver'
      AnimSets(0)=AnimSet'WEP_1P_Remington_1858_Anim.WEP_1P_Remington_1858_Anim'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_PistolBase:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="1858 Revolver"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_PistolBase:StaticPickupComponent'
      StaticMesh=StaticMesh'WEP_3P_Remington_1858_MESH.Wep_3P_Remington_1858_Pickup'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_PistolBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Components(0)=BulletMeshComp0
   Components(1)=BulletMeshComp1
   Components(2)=BulletMeshComp2
   Components(3)=BulletMeshComp3
   Components(4)=BulletMeshComp4
   Components(5)=BulletMeshComp5
   Name="Default__KFWeap_Revolver_Rem1858"
   ObjectArchetype=KFWeap_PistolBase'KFGame.Default__KFWeap_PistolBase'
}
