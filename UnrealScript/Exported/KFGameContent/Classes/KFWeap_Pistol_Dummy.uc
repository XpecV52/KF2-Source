//=============================================================================
// KFWeap_Pistol_Dummy
//=============================================================================
// An Dummy Pistol Used For Testing Out Animations and Position
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFWeap_Pistol_Dummy extends KFWeap_Pistol_9mm;

defaultproperties
{
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGameContent.Default__KFWeap_Pistol_9mm:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGameContent.Default__KFWeap_Pistol_9mm:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'KFGameContent.Default__KFWeap_Pistol_Dummy:MeleeHelper_0'
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGameContent.Default__KFWeap_Pistol_9mm:FirstPersonMesh'
      SkeletalMesh=SkeletalMesh'WEP_1P_9MM_MESH.Wep_1stP_9mm_Rig'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      AnimSets(0)=AnimSet'WEP_1P_9MM_ANIM.Wep_1stP_9MM_Anim'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'KFGameContent.Default__KFWeap_Pistol_9mm:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGameContent.Default__KFWeap_Pistol_9mm:StaticPickupComponent'
      StaticMesh=StaticMesh'WEP_3P_Pickups_MESH.Wep_9mm_Pickup'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGameContent.Default__KFWeap_Pistol_9mm:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Pistol_Dummy"
   ObjectArchetype=KFWeap_Pistol_9mm'KFGameContent.Default__KFWeap_Pistol_9mm'
}
