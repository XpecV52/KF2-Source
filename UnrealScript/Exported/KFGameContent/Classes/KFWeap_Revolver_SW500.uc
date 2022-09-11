//=============================================================================
// KFWeap_Revolver_SW500
//=============================================================================
// A Smith & Wesson .500 "Bone Collector"
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Jeff Robinson
//=============================================================================

class KFWeap_Revolver_SW500 extends KFWeap_PistolBase;

defaultproperties
{
   bRevolver=True
   UnusedBulletMeshTemplate=SkeletalMesh'WEP_1P_SW_500_MESH.Wep_1stP_SW_500_Bullet'
   UsedBulletMeshTemplate=SkeletalMesh'WEP_1P_SW_500_MESH.Wep_1stP_SW_500_EmptyShell'
   BulletFXSocketNames(0)="RW_Bullet_FX_5"
   BulletFXSocketNames(1)="RW_Bullet_FX_4"
   BulletFXSocketNames(2)="RW_Bullet_FX_3"
   BulletFXSocketNames(3)="RW_Bullet_FX_2"
   BulletFXSocketNames(4)="RW_Bullet_FX_1"
   Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp0
      SkeletalMesh=SkeletalMesh'WEP_1P_SW_500_MESH.Wep_1stP_SW_500_Bullet'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bUseAsOccluder=False
      CastShadow=False
      Name="BulletMeshComp0"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFSkeletalMeshComponent'
   End Object
   BulletMeshComponents(0)=BulletMeshComp0
   Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp1
      SkeletalMesh=SkeletalMesh'WEP_1P_SW_500_MESH.Wep_1stP_SW_500_Bullet'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bUseAsOccluder=False
      CastShadow=False
      Name="BulletMeshComp1"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFSkeletalMeshComponent'
   End Object
   BulletMeshComponents(1)=BulletMeshComp1
   Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp2
      SkeletalMesh=SkeletalMesh'WEP_1P_SW_500_MESH.Wep_1stP_SW_500_Bullet'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bUseAsOccluder=False
      CastShadow=False
      Name="BulletMeshComp2"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFSkeletalMeshComponent'
   End Object
   BulletMeshComponents(2)=BulletMeshComp2
   Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp3
      SkeletalMesh=SkeletalMesh'WEP_1P_SW_500_MESH.Wep_1stP_SW_500_Bullet'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bUseAsOccluder=False
      CastShadow=False
      Name="BulletMeshComp3"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFSkeletalMeshComponent'
   End Object
   BulletMeshComponents(3)=BulletMeshComp3
   Begin Object Class=KFSkeletalMeshComponent Name=BulletMeshComp4
      SkeletalMesh=SkeletalMesh'WEP_1P_SW_500_MESH.Wep_1stP_SW_500_Bullet'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bUseAsOccluder=False
      CastShadow=False
      Name="BulletMeshComp4"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFSkeletalMeshComponent'
   End Object
   BulletMeshComponents(4)=BulletMeshComp4
   CylinderRotInfo=(InC=-72.000000,Time=0.087500)
   PackageKey="SW_500"
   FirstPersonMeshName="WEP_1P_SW_500_MESH.Wep_1stP_SW_500_Rig"
   FirstPersonAnimSetNames(0)="WEP_1P_SW_500_ANIM.WEP_1stP_SW_500_Anim"
   PickupMeshName="WEP_3P_SW_500_MESH.Wep_SW_500_Pickup"
   AttachmentArchetypeName="WEP_SW_500_ARCH.Wep_SW_500_3P"
   MuzzleFlashTemplateName="WEP_SW_500_ARCH.Wep_SW_500_MuzzleFlash"
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   bHasFireLastAnims=True
   InventorySize=3
   PenetrationPower(0)=3.000000
   PenetrationPower(1)=()
   MeshFOV=60.000000
   MeshIronSightFOV=60.000000
   PlayerIronSightFOV=77.000000
   IronSightPosition=(X=2.000000,Y=0.000000,Z=0.000000)
   DOF_FG_FocalRadius=40.000000
   DOF_FG_MaxNearBlurSize=3.500000
   GroupPriority=30.000000
   WeaponSelectTexture=Texture2D'WEP_UI_SW_500_TEX.UI_WeaponSelect_SW500'
   DualClass=Class'kfgamecontent.KFWeap_Revolver_DualSW500'
   MagazineCapacity(0)=5
   SpareAmmoCapacity(0)=100
   InitialSpareMags(0)=5
   AmmoPickupScale(0)=2.000000
   WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Medium_Recoil'
   IdleFidgetAnims(3)="Guncheck_v4"
   IdleFidgetAnims(4)="Guncheck_v5"
   FireSightedAnims(1)="Shoot_Iron2"
   FireSightedAnims(2)="Shoot_Iron3"
   BonesToLockOnEmpty(0)="RW_Hammer"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_SA_SW500.Play_WEP_SA_SW500_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_SA_SW500.Play_WEP_SA_SW500_Fire_1P')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_SW500.Play_WEP_SA_SW500_Handling_DryFire'
   PlayerViewOffset=(X=22.000000,Y=12.000000,Z=-6.000000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_PistolBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_PistolBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Revolver_SW500:MeleeHelper_0'
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
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_Gunslinger'
   AssociatedPerkClasses(1)=Class'KFGame.KFPerk_Sharpshooter'
   WeaponUpgrades(1)=(Stats=((Stat=EWUS_Damage0,Scale=1.150000),(Add=1)))
   FiringStatesArray(0)="WeaponSingleFiring"
   FiringStatesArray(1)="WeaponSingleFiring"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponFireTypes(1)=EWFT_None
   WeaponFireTypes(2)=()
   WeaponFireTypes(3)=()
   WeaponFireTypes(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_RevolverSW500'
   FireInterval(0)=0.240000
   FireInterval(1)=()
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.015000
   InstantHitDamage(0)=160.000000
   InstantHitDamage(1)=()
   InstantHitDamage(2)=()
   InstantHitDamage(3)=23.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_SW500'
   InstantHitDamageTypes(1)=()
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_SW500'
   FireOffset=(X=20.000000,Y=4.000000,Z=-3.000000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_PistolBase:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Dual_Animtree_Master_Revolver'
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
   ItemName=".500 Magnum Revolver"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_PistolBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
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
   Name="Default__KFWeap_Revolver_SW500"
   ObjectArchetype=KFWeap_PistolBase'KFGame.Default__KFWeap_PistolBase'
}
