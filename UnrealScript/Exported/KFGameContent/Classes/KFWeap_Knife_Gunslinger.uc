//=============================================================================
// KFWeap_Knife_Gunslinger
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================

class KFWeap_Knife_Gunslinger extends KFWeap_Edged_Knife;

defaultproperties
{
   WeaponSelectTexture=Texture2D'WEP_UI_Gunslinger_Knife_TEX.UI_WeaponSelect_GunslingerKnife'
   AttachmentArchetype=KFWeaponAttachment'WEP_Gunslinger_Knife_ARCH.Wep_Gunslinger_Knife_3P'
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Edged_Knife:MeleeHelper_0'
      bUseDirectionalMelee=True
      bHasChainAttacks=True
      ChainSequence_F(0)=DIR_ForwardRight
      ChainSequence_F(1)=DIR_ForwardLeft
      ChainSequence_F(2)=DIR_ForwardRight
      ChainSequence_F(3)=DIR_ForwardLeft
      ChainSequence_B(0)=DIR_BackwardLeft
      ChainSequence_B(1)=DIR_BackwardRight
      ChainSequence_B(2)=()
      ChainSequence_B(3)=()
      ChainSequence_L(1)=DIR_ForwardLeft
      ChainSequence_L(2)=()
      ChainSequence_L(3)=DIR_Left
      ChainSequence_L(4)=()
      ChainSequence_R(1)=DIR_ForwardRight
      ChainSequence_R(2)=()
      ChainSequence_R(3)=DIR_Right
      ChainSequence_R(4)=()
      WorldImpactEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Bladed_melee_impact'
      MaxHitRange=220.000000
      HitboxChain(0)=(BoneOffset=(X=0.000000,Y=3.000000,Z=125.000000))
      HitboxChain(1)=(BoneOffset=(X=0.000000,Y=-3.000000,Z=100.000000))
      HitboxChain(2)=(BoneOffset=(X=0.000000,Y=3.000000,Z=75.000000))
      HitboxChain(3)=(BoneOffset=(X=0.000000,Y=-3.000000,Z=50.000000))
      HitboxChain(4)=(BoneOffset=(X=0.000000,Y=3.000000,Z=25.000000))
      HitboxChain(5)=(BoneOffset=(X=0.000000,Y=-3.000000,Z=0.000000))
      HitboxChain(6)=(BoneOffset=(X=0.000000,Y=0.000000,Z=-25.000000))
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Edged_Knife:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Knife_Gunslinger:MeleeHelper_0'
   AssociatedPerkClass=Class'KFGame.KFPerk_Gunslinger'
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_Edged_Knife:FirstPersonMesh'
      MinTickTimeStep=0.025000
      SkeletalMesh=SkeletalMesh'WEP_1P_Gunslinger_Knife_MESH.Wep_1stP_GunslingerKnife_Rig'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      AnimSets(0)=AnimSet'WEP_1P_CommandoKnife_ANIM.Wep_1stP_CommKnife_Anim'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_Edged_Knife:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Bowie Knife"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'kfgamecontent.Default__KFWeap_Edged_Knife:StaticPickupComponent'
      StaticMesh=StaticMesh'WEP_3P_Pickups_MESH.Wep_CommandoKnife_Pickup'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'kfgamecontent.Default__KFWeap_Edged_Knife:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Knife_Gunslinger"
   ObjectArchetype=KFWeap_Edged_Knife'kfgamecontent.Default__KFWeap_Edged_Knife'
}