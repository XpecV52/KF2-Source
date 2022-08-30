//=============================================================================
// KFWeap_GrenadeLauncher_M32
//=============================================================================
// An M32 Grenade Launcher
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================

class KFWeap_GrenadeLauncher_M32 extends KFWeap_GrenadeLauncher_CylinderBase;

defaultproperties
{
   BulletFXSocketNames(0)="RW_Bullet_FX_1"
   BulletFXSocketNames(1)="RW_Bullet_FX_2"
   BulletFXSocketNames(2)="RW_Bullet_FX_3"
   BulletFXSocketNames(3)="RW_Bullet_FX_4"
   BulletFXSocketNames(4)="RW_Bullet_FX_5"
   BulletFXSocketNames(5)="RW_Bullet_FX_6"
   Begin Object Class=KFBulletSkeletalMeshComponent Name=BulletMeshComp0
      UnusedBulletMeshTemplate=SkeletalMesh'WEP_1P_M32_MGL_MESH.Wep_1stP_M32_MGL_Shell'
      UsedBulletMeshTemplate=SkeletalMesh'WEP_1P_M32_MGL_MESH.Wep_1stP_M32_MGL_Empty_Shell'
      SkeletalMesh=SkeletalMesh'WEP_1P_M32_MGL_MESH.Wep_1stP_M32_MGL_Shell'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bUseAsOccluder=False
      CastShadow=False
      Name="BulletMeshComp0"
      ObjectArchetype=KFBulletSkeletalMeshComponent'KFGame.Default__KFBulletSkeletalMeshComponent'
   End Object
   BulletMeshComponents(0)=BulletMeshComp0
   Begin Object Class=KFBulletSkeletalMeshComponent Name=BulletMeshComp1
      UnusedBulletMeshTemplate=SkeletalMesh'WEP_1P_M32_MGL_MESH.Wep_1stP_M32_MGL_Shell'
      UsedBulletMeshTemplate=SkeletalMesh'WEP_1P_M32_MGL_MESH.Wep_1stP_M32_MGL_Empty_Shell'
      SkeletalMesh=SkeletalMesh'WEP_1P_M32_MGL_MESH.Wep_1stP_M32_MGL_Shell'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bUseAsOccluder=False
      CastShadow=False
      Name="BulletMeshComp1"
      ObjectArchetype=KFBulletSkeletalMeshComponent'KFGame.Default__KFBulletSkeletalMeshComponent'
   End Object
   BulletMeshComponents(1)=BulletMeshComp1
   Begin Object Class=KFBulletSkeletalMeshComponent Name=BulletMeshComp2
      UnusedBulletMeshTemplate=SkeletalMesh'WEP_1P_M32_MGL_MESH.Wep_1stP_M32_MGL_Shell'
      UsedBulletMeshTemplate=SkeletalMesh'WEP_1P_M32_MGL_MESH.Wep_1stP_M32_MGL_Empty_Shell'
      SkeletalMesh=SkeletalMesh'WEP_1P_M32_MGL_MESH.Wep_1stP_M32_MGL_Shell'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bUseAsOccluder=False
      CastShadow=False
      Name="BulletMeshComp2"
      ObjectArchetype=KFBulletSkeletalMeshComponent'KFGame.Default__KFBulletSkeletalMeshComponent'
   End Object
   BulletMeshComponents(2)=BulletMeshComp2
   Begin Object Class=KFBulletSkeletalMeshComponent Name=BulletMeshComp3
      UnusedBulletMeshTemplate=SkeletalMesh'WEP_1P_M32_MGL_MESH.Wep_1stP_M32_MGL_Shell'
      UsedBulletMeshTemplate=SkeletalMesh'WEP_1P_M32_MGL_MESH.Wep_1stP_M32_MGL_Empty_Shell'
      SkeletalMesh=SkeletalMesh'WEP_1P_M32_MGL_MESH.Wep_1stP_M32_MGL_Shell'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bUseAsOccluder=False
      CastShadow=False
      Name="BulletMeshComp3"
      ObjectArchetype=KFBulletSkeletalMeshComponent'KFGame.Default__KFBulletSkeletalMeshComponent'
   End Object
   BulletMeshComponents(3)=BulletMeshComp3
   Begin Object Class=KFBulletSkeletalMeshComponent Name=BulletMeshComp4
      UnusedBulletMeshTemplate=SkeletalMesh'WEP_1P_M32_MGL_MESH.Wep_1stP_M32_MGL_Shell'
      UsedBulletMeshTemplate=SkeletalMesh'WEP_1P_M32_MGL_MESH.Wep_1stP_M32_MGL_Empty_Shell'
      SkeletalMesh=SkeletalMesh'WEP_1P_M32_MGL_MESH.Wep_1stP_M32_MGL_Shell'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bUseAsOccluder=False
      CastShadow=False
      Name="BulletMeshComp4"
      ObjectArchetype=KFBulletSkeletalMeshComponent'KFGame.Default__KFBulletSkeletalMeshComponent'
   End Object
   BulletMeshComponents(4)=BulletMeshComp4
   Begin Object Class=KFBulletSkeletalMeshComponent Name=BulletMeshComp5
      UnusedBulletMeshTemplate=SkeletalMesh'WEP_1P_M32_MGL_MESH.Wep_1stP_M32_MGL_Shell'
      UsedBulletMeshTemplate=SkeletalMesh'WEP_1P_M32_MGL_MESH.Wep_1stP_M32_MGL_Empty_Shell'
      SkeletalMesh=SkeletalMesh'WEP_1P_M32_MGL_MESH.Wep_1stP_M32_MGL_Shell'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bUseAsOccluder=False
      CastShadow=False
      Name="BulletMeshComp5"
      ObjectArchetype=KFBulletSkeletalMeshComponent'KFGame.Default__KFBulletSkeletalMeshComponent'
   End Object
   BulletMeshComponents(5)=BulletMeshComp5
   ShellBoneNames(0)="RW_Shell3"
   ShellBoneNames(1)="RW_Shell2"
   ShellBoneNames(2)="RW_Shell1"
   ShellBoneNames(3)="RW_Shell6"
   ShellBoneNames(4)="RW_Shell5"
   ShellBoneNames(5)="RW_Shell4"
   Begin Object Class=KFBulletSkeletalMeshComponent Name=BulletMeshComp6
      UnusedBulletMeshTemplate=SkeletalMesh'WEP_1P_M32_MGL_MESH.Wep_1stP_M32_MGL_Shell'
      UsedBulletMeshTemplate=SkeletalMesh'WEP_1P_M32_MGL_MESH.Wep_1stP_M32_MGL_Empty_Shell'
      SkeletalMesh=SkeletalMesh'WEP_1P_M32_MGL_MESH.Wep_1stP_M32_MGL_Shell'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bUseAsOccluder=False
      CastShadow=False
      Name="BulletMeshComp6"
      ObjectArchetype=KFBulletSkeletalMeshComponent'KFGame.Default__KFBulletSkeletalMeshComponent'
   End Object
   ReloadShell=BulletMeshComp6
   CylinderRotInfo=(InC=60.000000)
   PickupMeshName="WEP_3P_M32_MGL_MESH.Wep_3rdP_M32_MGL_Pickup"
   MuzzleFlashTemplateName="WEP_M32_MGL_ARCH.Wep_M32_MGL_MuzzleFlash"
   InventorySize=9
   GroupPriority=125.000000
   WeaponSelectTexture=Texture2D'WEP_UI_M32_MGL_TEX.UI_WeaponSelect_M32_MGL'
   InitialSpareMags(0)=2
   AmmoPickupScale(0)=1.000000
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_M32.Play_M32_Fire_3P_Single',FirstPersonCue=AkEvent'WW_WEP_M32.Play_M32_Fire_1P_Single')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_M32.Play_M32_DryFire'
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_GrenadeLauncher_CylinderBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_GrenadeLauncher_CylinderBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_GrenadeLauncher_M32:MeleeHelper_0'
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_HighExplosive_M32'
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_M32Impact'
   InstantHitDamageTypes(1)=()
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_M32'
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_GrenadeLauncher_CylinderBase:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master_Revolver'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_GrenadeLauncher_CylinderBase:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="M32 Grenade Launcher"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_GrenadeLauncher_CylinderBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_GrenadeLauncher_CylinderBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Components(0)=BulletMeshComp0
   Components(1)=BulletMeshComp1
   Components(2)=BulletMeshComp2
   Components(3)=BulletMeshComp3
   Components(4)=BulletMeshComp4
   Components(5)=BulletMeshComp5
   Components(6)=BulletMeshComp6
   Name="Default__KFWeap_GrenadeLauncher_M32"
   ObjectArchetype=KFWeap_GrenadeLauncher_CylinderBase'KFGame.Default__KFWeap_GrenadeLauncher_CylinderBase'
}
