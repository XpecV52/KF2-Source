//=============================================================================
// KFWeap_Revolver_DualSW500
//=============================================================================
// A set of Smith & Wesson .500 revolvers
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Jeff Robinson
//=============================================================================

class KFWeap_Revolver_DualSW500 extends KFWeap_DualBase;

defaultproperties
{
   LeftMuzzleFlashTemplate=KFMuzzleFlash'WEP_Dual_SW_500_ARCH.Wep_Dual_SW_500_MuzzleFlash_L'
   LeftFireOffset=(X=17.000000,Y=-4.000000,Z=-2.250000)
   SingleClass=Class'kfgamecontent.KFWeap_Revolver_SW500'
   BonesToLockOnEmpty_L(0)="LW_Hammer"
   CylinderRotInfo_L=(InC=-72.000000,Time=0.087500)
   bRevolver=True
   UnusedBulletMeshTemplate=SkeletalMesh'WEP_1P_SW_500_MESH.Wep_1stP_SW_500_Bullet'
   UsedBulletMeshTemplate=SkeletalMesh'WEP_1P_SW_500_MESH.Wep_1stP_SW_500_EmptyShell'
   BulletFXSocketNames(0)="RW_Bullet_FX_5"
   BulletFXSocketNames(1)="LW_Bullet_FX_5"
   BulletFXSocketNames(2)="RW_Bullet_FX_4"
   BulletFXSocketNames(3)="LW_Bullet_FX_4"
   BulletFXSocketNames(4)="RW_Bullet_FX_3"
   BulletFXSocketNames(5)="LW_Bullet_FX_3"
   BulletFXSocketNames(6)="RW_Bullet_FX_2"
   BulletFXSocketNames(7)="LW_Bullet_FX_2"
   BulletFXSocketNames(8)="RW_Bullet_FX_1"
   BulletFXSocketNames(9)="LW_Bullet_FX_1"
   Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp0
      SkeletalMesh=SkeletalMesh'WEP_1P_SW_500_MESH.Wep_1stP_SW_500_Bullet'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      CastShadow=False
      Name="BulletMeshComp0"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFSkeletalMeshComponent'
   End Object
   BulletMeshComponents(0)=BulletMeshComp0
   Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp0_L
      SkeletalMesh=SkeletalMesh'WEP_1P_SW_500_MESH.Wep_1stP_SW_500_Bullet'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      CastShadow=False
      Name="BulletMeshComp0_L"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFSkeletalMeshComponent'
   End Object
   BulletMeshComponents(1)=BulletMeshComp0_L
   Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp1
      SkeletalMesh=SkeletalMesh'WEP_1P_SW_500_MESH.Wep_1stP_SW_500_Bullet'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      CastShadow=False
      Name="BulletMeshComp1"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFSkeletalMeshComponent'
   End Object
   BulletMeshComponents(2)=BulletMeshComp1
   Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp1_L
      SkeletalMesh=SkeletalMesh'WEP_1P_SW_500_MESH.Wep_1stP_SW_500_Bullet'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      CastShadow=False
      Name="BulletMeshComp1_L"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFSkeletalMeshComponent'
   End Object
   BulletMeshComponents(3)=BulletMeshComp1_L
   Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp2
      SkeletalMesh=SkeletalMesh'WEP_1P_SW_500_MESH.Wep_1stP_SW_500_Bullet'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      CastShadow=False
      Name="BulletMeshComp2"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFSkeletalMeshComponent'
   End Object
   BulletMeshComponents(4)=BulletMeshComp2
   Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp2_L
      SkeletalMesh=SkeletalMesh'WEP_1P_SW_500_MESH.Wep_1stP_SW_500_Bullet'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      CastShadow=False
      Name="BulletMeshComp2_L"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFSkeletalMeshComponent'
   End Object
   BulletMeshComponents(5)=BulletMeshComp2_L
   Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp3
      SkeletalMesh=SkeletalMesh'WEP_1P_SW_500_MESH.Wep_1stP_SW_500_Bullet'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      CastShadow=False
      Name="BulletMeshComp3"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFSkeletalMeshComponent'
   End Object
   BulletMeshComponents(6)=BulletMeshComp3
   Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp3_L
      SkeletalMesh=SkeletalMesh'WEP_1P_SW_500_MESH.Wep_1stP_SW_500_Bullet'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      CastShadow=False
      Name="BulletMeshComp3_L"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFSkeletalMeshComponent'
   End Object
   BulletMeshComponents(7)=BulletMeshComp3_L
   Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp4
      SkeletalMesh=SkeletalMesh'WEP_1P_SW_500_MESH.Wep_1stP_SW_500_Bullet'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      CastShadow=False
      Name="BulletMeshComp4"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFSkeletalMeshComponent'
   End Object
   BulletMeshComponents(8)=BulletMeshComp4
   Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp4_L
      SkeletalMesh=SkeletalMesh'WEP_1P_SW_500_MESH.Wep_1stP_SW_500_Bullet'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      CastShadow=False
      Name="BulletMeshComp4_L"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFSkeletalMeshComponent'
   End Object
   BulletMeshComponents(9)=BulletMeshComp4_L
   CylinderRotInfo=(InC=-72.000000,Time=0.087500)
   InventorySize=6
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   bHasFireLastAnims=True
   PenetrationPower(0)=3.000000
   PenetrationPower(1)=3.000000
   MeshFOV=60.000000
   MeshIronSightFOV=60.000000
   PlayerIronSightFOV=77.000000
   IronSightPosition=(X=7.000000,Y=0.000000,Z=0.000000)
   QuickWeaponDownRotation=(Pitch=-8192,Yaw=0,Roll=0)
   DOF_FG_FocalRadius=40.000000
   DOF_FG_MaxNearBlurSize=3.500000
   GroupPriority=50.000000
   WeaponSelectTexture=Texture2D'WEP_UI_Dual_SW_500_TEX.UI_WeaponSelect_DualSW500'
   MagazineCapacity(0)=10
   MaxSpareAmmo(0)=95
   InitialSpareMags(0)=2
   BonesToLockOnEmpty(0)="RW_Hammer"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_SA_SW500.Play_WEP_SA_SW500_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_SA_SW500.Play_WEP_SA_SW500_Fire_1P')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_SA_SW500.Play_WEP_SA_SW500_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_SA_SW500.Play_WEP_SA_SW500_Fire_1P')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_SW500.Play_WEP_SA_SW500_Handling_DryFire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_SA_SW500.Play_WEP_SA_SW500_Handling_DryFire'
   PlayerViewOffset=(X=29.000000,Y=0.000000,Z=-4.000000)
   AttachmentArchetype=KFWeapAttach_DualBase'WEP_Dual_SW_500_ARCH.Wep_Dual_SW_500_3P'
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_DualBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_DualBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Revolver_DualSW500:MeleeHelper_0'
   MuzzleFlashTemplate=KFMuzzleFlash'WEP_Dual_SW_500_ARCH.Wep_Dual_SW_500_MuzzleFlash'
   maxRecoilPitch=850
   minRecoilPitch=750
   maxRecoilYaw=150
   minRecoilYaw=-150
   RecoilRate=0.100000
   RecoilMaxYawLimit=500
   RecoilMinYawLimit=65035
   RecoilMaxPitchLimit=900
   RecoilMinPitchLimit=65035
   RecoilISMaxYawLimit=50
   RecoilISMinYawLimit=65485
   RecoilISMaxPitchLimit=500
   RecoilISMinPitchLimit=65485
   IronSightMeshFOVCompensationScale=1.400000
   AssociatedPerkClass=Class'KFGame.KFPerk_Gunslinger'
   FiringStatesArray(0)="WeaponSingleFiring"
   FiringStatesArray(1)="WeaponSingleFiring"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_RevolverSW500'
   WeaponProjectiles(1)=Class'kfgamecontent.KFProj_Bullet_RevolverSW500'
   FireInterval(0)=0.140000
   FireInterval(1)=0.140000
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.015000
   Spread(1)=0.015000
   InstantHitDamage(0)=150.000000
   InstantHitDamage(1)=150.000000
   InstantHitDamage(2)=()
   InstantHitDamage(3)=()
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_SW500'
   InstantHitDamageTypes(1)=Class'kfgamecontent.KFDT_Ballistic_SW500'
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_SW500'
   FireOffset=(X=17.000000,Y=4.000000,Z=-2.250000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_DualBase:FirstPersonMesh'
      SkeletalMesh=SkeletalMesh'WEP_1P_Dual_SW_500_MESH.Wep_1stP_Dual_SW_500_Rig'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Dual_Animtree_Master_Revolver'
      AnimSets(0)=AnimSet'WEP_1P_Dual_SW_500_ANIM.Wep_1stP_Dual_SW_500_Anim'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_DualBase:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Dual .500 Magnums"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_DualBase:StaticPickupComponent'
      StaticMesh=StaticMesh'WEP_3P_SW_500_MESH.Wep_SW_500_Pickup'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_DualBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Components(0)=BulletMeshComp0
   Components(1)=BulletMeshComp0_L
   Components(2)=BulletMeshComp1
   Components(3)=BulletMeshComp1_L
   Components(4)=BulletMeshComp2
   Components(5)=BulletMeshComp2_L
   Components(6)=BulletMeshComp3
   Components(7)=BulletMeshComp3_L
   Components(8)=BulletMeshComp4
   Components(9)=BulletMeshComp4_L
   Name="Default__KFWeap_Revolver_DualSW500"
   ObjectArchetype=KFWeap_DualBase'KFGame.Default__KFWeap_DualBase'
}
