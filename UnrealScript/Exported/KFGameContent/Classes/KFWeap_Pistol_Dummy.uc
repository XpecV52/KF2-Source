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
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Pistol_9mm:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Pistol_9mm:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Pistol_Dummy:MeleeHelper_0'
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_Pistol_9mm:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_Pistol_9mm:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'kfgamecontent.Default__KFWeap_Pistol_9mm:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'kfgamecontent.Default__KFWeap_Pistol_9mm:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Pistol_Dummy"
   ObjectArchetype=KFWeap_Pistol_9mm'kfgamecontent.Default__KFWeap_Pistol_9mm'
}
