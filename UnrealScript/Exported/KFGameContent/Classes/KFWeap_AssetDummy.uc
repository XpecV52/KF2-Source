//=============================================================================
// KFWeap_AssetTest
//=============================================================================
// A debug weapon for viewing new assets
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFWeap_AssetDummy extends KFWeapon;

defaultproperties
{
   PackageKey="AssetTest"
   FirstPersonMeshName="WEP_1P_AssetTest_MESH.Wep_1stP_AssetTest_Rig"
   FirstPersonAnimSetNames(0)="WEP_1P_AssetTest_ANIM.Wep_1st_AssetTest_Anim"
   PickupMeshName="WEP_3P_L85A2_MESH.Wep_L85A2_Pickup"
   AttachmentArchetypeName="WEP_L85A2_ARCH.Wep_L85A2_3P"
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   MagazineCapacity(0)=30
   SpareAmmoCapacity(0)=390
   InitialSpareMags(0)=4
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeapon:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeapon:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_AssetDummy:MeleeHelper_0'
   WeaponFireTypes(0)=EWFT_Custom
   WeaponFireTypes(1)=EWFT_Custom
   WeaponFireTypes(2)=()
   WeaponFireTypes(3)=()
   WeaponFireTypes(4)=()
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeapon:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFWeapon:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeapon:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeapon:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_AssetDummy"
   ObjectArchetype=KFWeapon'KFGame.Default__KFWeapon'
}
