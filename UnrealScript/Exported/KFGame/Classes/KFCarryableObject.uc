//=============================================================================
// KFCarryableObject
//=============================================================================
// A carried object that forces the player to equip it and prevents the player
// from switching to a different inventory item, though it can be dropped.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFCarryableObject extends KFWeap_MeleeBase
	abstract;

reliable client function ClientWeaponSet(bool bOptionalSet, optional bool bDoNotActivate)
{
	Super.ClientWeaponSet(false);
}

simulated function float GetWeaponRating()
{
	return 1000;
}

defaultproperties
{
   WeaponDryFireSnd(0)=None
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_MeleeBase:MeleeHelper_0'
      bUseDirectionalMelee=True
      bHasChainAttacks=True
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_MeleeBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'KFGame.Default__KFCarryableObject:MeleeHelper_0'
   AssociatedPerkClasses(0)=None
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_MeleeBase:FirstPersonMesh'
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
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_MeleeBase:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_MeleeBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_MeleeBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFCarryableObject"
   ObjectArchetype=KFWeap_MeleeBase'KFGame.Default__KFWeap_MeleeBase'
}
