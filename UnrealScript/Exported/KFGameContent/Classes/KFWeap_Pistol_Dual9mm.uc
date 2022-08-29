//=============================================================================
// KFWeap_Pistol_Dual9mm
//=============================================================================
// A set of 9mm Beretta Pistols
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson and Jeff Robinson
//=============================================================================

class KFWeap_Pistol_Dual9mm extends KFWeap_DualBase;

defaultproperties
{
   LeftFireOffset=(X=17.000000,Y=-4.000000,Z=-2.250000)
   SingleClass=Class'kfgamecontent.KFWeap_Pistol_9mm'
   BonesToLockOnEmpty_L(1)="LW_Bullets1"
   PackageKey="Dual_9mm"
   FirstPersonMeshName="WEP_1P_Dual_9MM_MESH.Wep_1stP_Dual_9mm_Rig"
   FirstPersonAnimSetNames(0)="WEP_1P_Dual_9MM_ANIM.Wep_1stP_Dual_9MM_Anim"
   PickupMeshName="WEP_3P_Dual_9MM_MESH.Wep_9mm_Pickup"
   AttachmentArchetypeName="WEP_Dual_9MM_ARCH.WEP_Dual_9MM_3P"
   MuzzleFlashTemplateName="wep_dual_9mm_arch.Wep_Dual_9MM_MuzzleFlash"
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   bHasFireLastAnims=True
   bIsBackupWeapon=True
   InventoryGroup=IG_Secondary
   InventorySize=2
   MagazineCapacity(0)=30
   MeshFOV=96.000000
   MeshIronSightFOV=77.000000
   PlayerIronSightFOV=77.000000
   IronSightPosition=(X=-3.000000,Y=0.000000,Z=0.000000)
   QuickWeaponDownRotation=(Pitch=-8192,Yaw=0,Roll=0)
   DOF_FG_FocalRadius=40.000000
   DOF_FG_MaxNearBlurSize=3.500000
   GroupPriority=20.000000
   WeaponSelectTexture=Texture2D'WEP_UI_Dual_9MM_TEX.UI_WeaponSelect_Dual9mm'
   SpareAmmoCapacity(0)=60
   InitialSpareMags(0)=2
   BonesToLockOnEmpty(1)="RW_Bullets1"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_SA_9mm.Play_WEP_SA_9mm_Fire_Single_M',FirstPersonCue=AkEvent'WW_WEP_SA_9mm.Play_WEP_SA_9mm_Fire_Single_S')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_SA_9mm.Play_WEP_SA_9mm_Fire_Single_M',FirstPersonCue=AkEvent'WW_WEP_SA_9mm.Play_WEP_SA_9mm_Fire_Single_S')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_9mm.Play_WEP_SA_9mm_Handling_DryFire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_SA_9mm.Play_WEP_SA_9mm_Handling_DryFire'
   PlayerViewOffset=(X=5.000000,Y=0.000000,Z=-5.000000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_DualBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_DualBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Pistol_Dual9mm:MeleeHelper_0'
   maxRecoilPitch=250
   minRecoilPitch=200
   maxRecoilYaw=100
   minRecoilYaw=-100
   RecoilRate=0.070000
   RecoilMaxYawLimit=500
   RecoilMinYawLimit=65035
   RecoilMaxPitchLimit=900
   RecoilMinPitchLimit=65035
   RecoilISMaxYawLimit=50
   RecoilISMinYawLimit=65485
   RecoilISMaxPitchLimit=250
   RecoilISMinPitchLimit=65485
   AssociatedPerkClasses(0)=None
   WeaponUpgrades(1)=(Stats=((Stat=EWUS_Damage0,Scale=1.200000),(Stat=EWUS_Damage1,Scale=1.200000)))
   WeaponUpgrades(2)=(Stats=((Stat=EWUS_Damage0,Scale=1.400000),(Stat=EWUS_Damage1,Scale=1.400000)))
   WeaponUpgrades(3)=(Stats=((Stat=EWUS_Damage0,Scale=1.600000),(Stat=EWUS_Damage1,Scale=1.600000)))
   WeaponUpgrades(4)=(Stats=((Stat=EWUS_Damage0,Scale=1.800000),(Stat=EWUS_Damage1,Scale=1.800000)))
   WeaponUpgrades(5)=(Stats=((Stat=EWUS_Damage0,Scale=2.000000),(Stat=EWUS_Damage1,Scale=2.000000)))
   FiringStatesArray(0)="WeaponSingleFiring"
   FiringStatesArray(1)="WeaponSingleFiring"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_Pistol9mm'
   WeaponProjectiles(1)=Class'kfgamecontent.KFProj_Bullet_Pistol9mm'
   FireInterval(0)=0.120000
   FireInterval(1)=0.120000
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.015000
   Spread(1)=0.015000
   InstantHitDamage(0)=25.000000
   InstantHitDamage(1)=25.000000
   InstantHitDamage(2)=()
   InstantHitDamage(3)=22.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_9mm'
   InstantHitDamageTypes(1)=Class'kfgamecontent.KFDT_Ballistic_9mm'
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_9mm'
   FireOffset=(X=17.000000,Y=4.000000,Z=-2.250000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_DualBase:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Dual_Animtree_Master'
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
   ItemName="Dual 9mm Pistols"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_DualBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_DualBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Pistol_Dual9mm"
   ObjectArchetype=KFWeap_DualBase'KFGame.Default__KFWeap_DualBase'
}
