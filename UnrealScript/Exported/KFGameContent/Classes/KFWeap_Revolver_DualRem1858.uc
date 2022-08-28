//=============================================================================
// KFWeap_Revolver_DualRem1858
//=============================================================================
// A set of Remington 1858 revolvers
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Jeff Robinson
//=============================================================================

class KFWeap_Revolver_DualRem1858 extends KFWeap_DualBase;

defaultproperties
{
   LeftFireOffset=(X=17.000000,Y=-4.000000,Z=-2.250000)
   SingleClass=Class'kfgamecontent.KFWeap_Revolver_Rem1858'
   BonesToLockOnEmpty_L(0)="LW_Hammer"
   CylinderRotInfo_L=(InC=-60.000000,Time=0.087500)
   bRevolver=True
   UnusedBulletMeshTemplate=SkeletalMesh'WEP_1P_Remington_1858_MESH.Wep_1stP_Remington_1858_NewCap'
   UsedBulletMeshTemplate=SkeletalMesh'WEP_1P_Remington_1858_MESH.Wep_1stP_Remington_1858_UsedCap'
   BulletFXSocketNames(0)="RW_Bullet_FX_6"
   BulletFXSocketNames(1)="LW_Bullet_FX_6"
   BulletFXSocketNames(2)="RW_Bullet_FX_5"
   BulletFXSocketNames(3)="LW_Bullet_FX_5"
   BulletFXSocketNames(4)="RW_Bullet_FX_4"
   BulletFXSocketNames(5)="LW_Bullet_FX_4"
   BulletFXSocketNames(6)="RW_Bullet_FX_3"
   BulletFXSocketNames(7)="LW_Bullet_FX_3"
   BulletFXSocketNames(8)="RW_Bullet_FX_2"
   BulletFXSocketNames(9)="LW_Bullet_FX_2"
   BulletFXSocketNames(10)="RW_Bullet_FX_1"
   BulletFXSocketNames(11)="LW_Bullet_FX_1"
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
   Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp0_L
      SkeletalMesh=SkeletalMesh'WEP_1P_Remington_1858_MESH.Wep_1stP_Remington_1858_NewCap'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bUseAsOccluder=False
      CastShadow=False
      Name="BulletMeshComp0_L"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFSkeletalMeshComponent'
   End Object
   BulletMeshComponents(1)=BulletMeshComp0_L
   Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp1
      SkeletalMesh=SkeletalMesh'WEP_1P_Remington_1858_MESH.Wep_1stP_Remington_1858_NewCap'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bUseAsOccluder=False
      CastShadow=False
      Name="BulletMeshComp1"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFSkeletalMeshComponent'
   End Object
   BulletMeshComponents(2)=BulletMeshComp1
   Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp1_L
      SkeletalMesh=SkeletalMesh'WEP_1P_Remington_1858_MESH.Wep_1stP_Remington_1858_NewCap'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bUseAsOccluder=False
      CastShadow=False
      Name="BulletMeshComp1_L"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFSkeletalMeshComponent'
   End Object
   BulletMeshComponents(3)=BulletMeshComp1_L
   Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp2
      SkeletalMesh=SkeletalMesh'WEP_1P_Remington_1858_MESH.Wep_1stP_Remington_1858_NewCap'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bUseAsOccluder=False
      CastShadow=False
      Name="BulletMeshComp2"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFSkeletalMeshComponent'
   End Object
   BulletMeshComponents(4)=BulletMeshComp2
   Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp2_L
      SkeletalMesh=SkeletalMesh'WEP_1P_Remington_1858_MESH.Wep_1stP_Remington_1858_NewCap'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bUseAsOccluder=False
      CastShadow=False
      Name="BulletMeshComp2_L"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFSkeletalMeshComponent'
   End Object
   BulletMeshComponents(5)=BulletMeshComp2_L
   Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp3
      SkeletalMesh=SkeletalMesh'WEP_1P_Remington_1858_MESH.Wep_1stP_Remington_1858_NewCap'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bUseAsOccluder=False
      CastShadow=False
      Name="BulletMeshComp3"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFSkeletalMeshComponent'
   End Object
   BulletMeshComponents(6)=BulletMeshComp3
   Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp3_L
      SkeletalMesh=SkeletalMesh'WEP_1P_Remington_1858_MESH.Wep_1stP_Remington_1858_NewCap'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bUseAsOccluder=False
      CastShadow=False
      Name="BulletMeshComp3_L"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFSkeletalMeshComponent'
   End Object
   BulletMeshComponents(7)=BulletMeshComp3_L
   Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp4
      SkeletalMesh=SkeletalMesh'WEP_1P_Remington_1858_MESH.Wep_1stP_Remington_1858_NewCap'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bUseAsOccluder=False
      CastShadow=False
      Name="BulletMeshComp4"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFSkeletalMeshComponent'
   End Object
   BulletMeshComponents(8)=BulletMeshComp4
   Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp4_L
      SkeletalMesh=SkeletalMesh'WEP_1P_Remington_1858_MESH.Wep_1stP_Remington_1858_NewCap'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bUseAsOccluder=False
      CastShadow=False
      Name="BulletMeshComp4_L"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFSkeletalMeshComponent'
   End Object
   BulletMeshComponents(9)=BulletMeshComp4_L
   Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp5
      SkeletalMesh=SkeletalMesh'WEP_1P_Remington_1858_MESH.Wep_1stP_Remington_1858_NewCap'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bUseAsOccluder=False
      CastShadow=False
      Name="BulletMeshComp5"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFSkeletalMeshComponent'
   End Object
   BulletMeshComponents(10)=BulletMeshComp5
   Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp5_L
      SkeletalMesh=SkeletalMesh'WEP_1P_Remington_1858_MESH.Wep_1stP_Remington_1858_NewCap'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bUseAsOccluder=False
      CastShadow=False
      Name="BulletMeshComp5_L"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFSkeletalMeshComponent'
   End Object
   BulletMeshComponents(11)=BulletMeshComp5_L
   CylinderRotInfo=(InC=-60.000000,Time=0.087500)
   PackageKey="DualRemington1858"
   FirstPersonMeshName="WEP_1P_DualRemington1858_MESH.Wep_1stP_DualRemington1858_Rig"
   FirstPersonAnimSetNames(0)="WEP_1P_DualRemington1858_Anim.WEP_1P_DualRemington1858_Anim"
   PickupMeshName="WEP_3P_DualRemington1858_MESH.Wep_3P_Remington_1858_Pickup"
   AttachmentArchetypeName="WEP_DualRemington1858_ARCH.Wep_DualRemington1858_3P"
   MuzzleFlashTemplateName="WEP_DualRemington1858_ARCH.Wep_DualRemington1858_MuzzleFlash"
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   bHasFireLastAnims=True
   InventorySize=4
   MagazineCapacity(0)=12
   MeshFOV=60.000000
   MeshIronSightFOV=55.000000
   PlayerIronSightFOV=77.000000
   IronSightPosition=(X=4.000000,Y=0.000000,Z=0.000000)
   QuickWeaponDownRotation=(Pitch=-8192,Yaw=0,Roll=0)
   DOF_FG_FocalRadius=40.000000
   DOF_FG_MaxNearBlurSize=3.500000
   GroupPriority=35.000000
   WeaponSelectTexture=Texture2D'WEP_UI_DualRemington1858_TEX.UI_WeaponSelect_DualRemington'
   SpareAmmoCapacity(0)=144
   InitialSpareMags(0)=7
   IdleFidgetAnims(3)="Guncheck_v4"
   BonesToLockOnEmpty(0)="RW_Hammer"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_SA_1858.Play_WEP_SA_1858_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_SA_1858.Play_WEP_SA_1858_Fire_1P')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_SA_1858.Play_WEP_SA_1858_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_SA_1858.Play_WEP_SA_1858_Fire_1P')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_1858.Play_WEP_SA_1858_Fire_DryFire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_SA_1858.Play_WEP_SA_1858_Fire_DryFire'
   PlayerViewOffset=(X=23.000000,Y=0.000000,Z=-1.000000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_DualBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_DualBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Revolver_DualRem1858:MeleeHelper_0'
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
   WeaponUpgrades(1)=(IncrementWeight=0,IncrementDamage=1.100000)
   WeaponUpgrades(2)=(IncrementWeight=0,IncrementDamage=1.600000)
   WeaponUpgrades(3)=(IncrementWeight=2,IncrementDamage=2.000000)
   WeaponUpgrades(4)=(IncrementWeight=4,IncrementDamage=2.500000)
   FiringStatesArray(0)="WeaponSingleFiring"
   FiringStatesArray(1)="WeaponSingleFiring"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_RevolverRem1858'
   WeaponProjectiles(1)=Class'kfgamecontent.KFProj_Bullet_RevolverRem1858'
   FireInterval(0)=0.110000
   FireInterval(1)=0.110000
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.015000
   Spread(1)=0.015000
   InstantHitDamage(0)=50.000000
   InstantHitDamage(1)=50.000000
   InstantHitDamage(2)=()
   InstantHitDamage(3)=24.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_Rem1858_Dual'
   InstantHitDamageTypes(1)=Class'kfgamecontent.KFDT_Ballistic_Rem1858_Dual'
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_Rem1858'
   FireOffset=(X=17.000000,Y=4.000000,Z=-2.250000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_DualBase:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Dual_Animtree_Master_Revolver'
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
   ItemName="Dual 1858 Revolvers"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_DualBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
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
   Components(10)=BulletMeshComp5
   Components(11)=BulletMeshComp5_L
   Name="Default__KFWeap_Revolver_DualRem1858"
   ObjectArchetype=KFWeap_DualBase'KFGame.Default__KFWeap_DualBase'
}
