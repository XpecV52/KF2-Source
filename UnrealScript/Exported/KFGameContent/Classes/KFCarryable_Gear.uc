//=============================================================================
// KFCarryable_Gear
//=============================================================================
// A steampunk gear that can be carried by players
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================
class KFCarryable_Gear extends KFCarryableObject_Collectible;

defaultproperties
{
   PackageKey="Steampunk_Gear"
   FirstPersonMeshName="wep_1p_steampunk_gear_mesh.Wep_1stP_Steampunk_Gear_Rig"
   FirstPersonAnimSetNames(0)="WEP_1P_Steampunk_Gear_ANIM.Wep_1stP_Steampunk_Gear_anim"
   PickupMeshName="WEP_3P_Steampunk_Gear_MESH.Wep_3rdP_Steampunk_Gear_Pickup"
   AttachmentArchetypeName="WEP_Steampunk_Gear_ARCH.Wep_Steampunk_Gear_3P"
   WeaponSelectTexture=Texture2D'WEP_UI_Steampunk_Gear_TEX.UI_WeaponSelect_SteampunkGear'
   PlayerViewOffset=(X=0.000000,Y=6.000000,Z=0.000000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'kfgamecontent.Default__KFCarryableObject_Collectible:MeleeHelper_0'
      bUseDirectionalMelee=True
      bHasChainAttacks=True
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'kfgamecontent.Default__KFCarryableObject_Collectible:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFCarryable_Gear:MeleeHelper_0'
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFCarryableObject_Collectible:FirstPersonMesh'
      MinTickTimeStep=0.025000
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFCarryableObject_Collectible:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Gear"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'kfgamecontent.Default__KFCarryableObject_Collectible:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'kfgamecontent.Default__KFCarryableObject_Collectible:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFCarryable_Gear"
   ObjectArchetype=KFCarryableObject_Collectible'kfgamecontent.Default__KFCarryableObject_Collectible'
}
