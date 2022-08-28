//=============================================================================
// KFWeap_Pistol_9mm
//=============================================================================
// An 9mm Beretta Pistol
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFWeap_Pistol_9mm extends KFWeap_PistolBase;

defaultproperties
{
   PackageKey="9mm"
   FirstPersonMeshName="WEP_1P_9MM_MESH.Wep_1stP_9mm_Rig"
   FirstPersonAnimSetNames(0)="WEP_1P_9MM_ANIM.Wep_1stP_9MM_Anim"
   PickupMeshName="WEP_3P_9MM_MESH.Wep_9mm_Pickup"
   AttachmentArchetypeName="WEP_9MM_ARCH.Wep_9mm_3P"
   MuzzleFlashTemplateName="WEP_9MM_ARCH.Wep_9MM_MuzzleFlash"
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   bHasFireLastAnims=True
   bIsBackupWeapon=True
   MagazineCapacity(0)=15
   MeshFOV=96.000000
   MeshIronSightFOV=77.000000
   PlayerIronSightFOV=77.000000
   IronSightPosition=(X=10.000000,Y=0.000000,Z=0.000000)
   DOF_FG_FocalRadius=40.000000
   DOF_FG_MaxNearBlurSize=3.500000
   GroupPriority=10.000000
   WeaponSelectTexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_9mm'
   DualClass=Class'kfgamecontent.KFWeap_Pistol_Dual9mm'
   SpareAmmoCapacity(0)=75
   InitialSpareMags(0)=4
   IdleFidgetAnims(3)="Guncheck_v4"
   FireSightedAnims(1)="Shoot_Iron2"
   FireSightedAnims(2)="Shoot_Iron3"
   BonesToLockOnEmpty(1)="RW_Bullets1"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_SA_9mm.Play_WEP_SA_9mm_Fire_Single_M',FirstPersonCue=AkEvent'WW_WEP_SA_9mm.Play_WEP_SA_9mm_Fire_Single_S')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_9mm.Play_WEP_SA_9mm_Handling_DryFire'
   PlayerViewOffset=(X=12.000000,Y=12.000000,Z=-6.000000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_PistolBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_PistolBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Pistol_9mm:MeleeHelper_0'
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
   WeaponUpgrades(1)=(IncrementWeight=0,IncrementDamage=1.200000)
   WeaponUpgrades(2)=(IncrementWeight=0,IncrementDamage=1.400000)
   WeaponUpgrades(3)=(IncrementWeight=0,IncrementDamage=1.600000)
   WeaponUpgrades(4)=(IncrementWeight=0,IncrementDamage=1.800000)
   WeaponUpgrades(5)=(IncrementWeight=0,IncrementDamage=2.000000)
   FiringStatesArray(0)="WeaponSingleFiring"
   FiringStatesArray(1)="WeaponSingleFiring"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponFireTypes(1)=EWFT_None
   WeaponFireTypes(2)=()
   WeaponFireTypes(3)=()
   WeaponFireTypes(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_Pistol9mm'
   FireInterval(0)=0.200000
   FireInterval(1)=()
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.015000
   InstantHitDamage(0)=25.000000
   InstantHitDamage(1)=()
   InstantHitDamage(2)=()
   InstantHitDamage(3)=()
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_9mm'
   InstantHitDamageTypes(1)=()
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_9mm'
   FireOffset=(X=20.000000,Y=4.000000,Z=-3.000000)
   bCanThrow=False
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_PistolBase:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
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
   ItemName="9mm Pistol"
   bDropOnDeath=False
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_PistolBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_PistolBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Pistol_9mm"
   ObjectArchetype=KFWeap_PistolBase'KFGame.Default__KFWeap_PistolBase'
}
