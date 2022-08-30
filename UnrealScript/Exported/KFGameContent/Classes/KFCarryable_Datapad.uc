//=============================================================================
// KFCarryable_Datapad
//=============================================================================
// A data pad that can be carried by players
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================
class KFCarryable_Datapad extends KFCarryableObject_Collectible;

var() AkEvent PersistentSoundLoop;
var() AKEvent PersistentSoundStop;

simulated state WeaponEquipping
{
	// when picked up, start the persistent sound
	simulated event BeginState(Name PreviousStateName)
	{
		local KFPawn InstigatorPawn;

		super.BeginState(PreviousStateName);

		if (Instigator != none)
		{
			InstigatorPawn = KFPawn(Instigator);
			if (InstigatorPawn != none)
			{
				InstigatorPawn.PlayWeaponSoundEvent(PersistentSoundLoop);
			}
		}
	}
}

simulated state Inactive
{
	// when dropped, destroyed, etc, play the stop on the persistent sound
	simulated event BeginState(Name PreviousStateName)
	{
		local KFPawn InstigatorPawn;

		super.BeginState(PreviousStateName);

		if (Instigator != none)
		{
			InstigatorPawn = KFPawn(Instigator);
			if (InstigatorPawn != none)
			{
				InstigatorPawn.PlayWeaponSoundEvent(PersistentSoundStop);
			}
		}
	}
}

defaultproperties
{
   PersistentSoundLoop=AkEvent'WW_WEP_Datapad.Play_WEP_Datapad_Hold_LP'
   PersistentSoundStop=AkEvent'WW_WEP_Datapad.Stop_WEP_Datapad_Hold_LP'
   PackageKey="Datapad"
   FirstPersonMeshName="WEP_1P_Datapad_MESH.WEP_1stP_Datapad_Rig"
   FirstPersonAnimSetNames(0)="WEP_1P_Datapad_ANIM.Wep_1stP_datapad_Anim"
   PickupMeshName="WEP_3P_Datapad_MESH.Wep_3rdP_Horzine_Datapad_Static_Pickuo"
   AttachmentArchetypeName="WEP_Datapad_ARCH.Wep_Datapad_3P"
   WeaponSelectTexture=Texture2D'WEP_UI_Datapad_TEX.UI_WeaponSelect_Datapad'
   PlayerViewOffset=(X=0.000000,Y=6.000000,Z=0.000000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'kfgamecontent.Default__KFCarryableObject_Collectible:MeleeHelper_0'
      bUseDirectionalMelee=True
      bHasChainAttacks=True
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'kfgamecontent.Default__KFCarryableObject_Collectible:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFCarryable_Datapad:MeleeHelper_0'
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
   ItemName="Data Pad"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'kfgamecontent.Default__KFCarryableObject_Collectible:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'kfgamecontent.Default__KFCarryableObject_Collectible:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFCarryable_Datapad"
   ObjectArchetype=KFCarryableObject_Collectible'kfgamecontent.Default__KFCarryableObject_Collectible'
}
