//=============================================================================
// KFWeap_Blunt_Crovel
//=============================================================================
// A melee survival tool with bludgeoning and slashing damage
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFWeap_Blunt_Crovel extends KFWeap_MeleeBase;

defaultproperties
{
   ParryStrength=3
   BlockSound=AkEvent'WW_WEP_Bullet_Impacts.Play_Block_MEL_Crovel'
   ParrySound=AkEvent'WW_WEP_Bullet_Impacts.Play_Parry_Metal'
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BluntMelee'
   FireModeIconPaths(1)=()
   FireModeIconPaths(2)=()
   FireModeIconPaths(3)=()
   FireModeIconPaths(4)=()
   FireModeIconPaths(5)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BluntMelee'
   InventorySize=4
   GroupPriority=25.000000
   WeaponSelectTexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_Crovel'
   AttachmentArchetype=KFWeaponAttachment'WEP_Crovel_ARCH.Wep_Crovel_3P'
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_MeleeBase:MeleeHelper_0'
      bUseDirectionalMelee=True
      bHasChainAttacks=True
      ChainSequence_B(0)=DIR_BackwardLeft
      ChainSequence_B(1)=DIR_Left
      ChainSequence_B(2)=DIR_Right
      ChainSequence_B(3)=()
      ChainSequence_B(4)=()
      ChainSequence_B(5)=()
      ChainSequence_B(6)=()
      ChainSequence_L(1)=DIR_BackwardRight
      ChainSequence_L(2)=()
      ChainSequence_L(3)=()
      ChainSequence_L(4)=()
      ChainSequence_L(5)=()
      ChainSequence_R(1)=DIR_BackwardLeft
      ChainSequence_R(2)=()
      ChainSequence_R(3)=()
      ChainSequence_R(4)=()
      ChainSequence_R(5)=()
      HitboxChain(0)=(BoneOffset=(X=0.000000,Y=3.000000,Z=150.000000))
      HitboxChain(1)=(BoneOffset=(X=0.000000,Y=-3.000000,Z=130.000000))
      HitboxChain(2)=(BoneOffset=(X=0.000000,Y=3.000000,Z=110.000000))
      HitboxChain(3)=(BoneOffset=(X=0.000000,Y=-3.000000,Z=90.000000))
      HitboxChain(4)=(BoneOffset=(X=0.000000,Y=3.000000,Z=70.000000))
      HitboxChain(5)=(BoneOffset=(X=0.000000,Y=-3.000000,Z=50.000000))
      HitboxChain(6)=(BoneOffset=(X=0.000000,Y=3.000000,Z=30.000000))
      HitboxChain(7)=(BoneOffset=(X=0.000000,Y=0.000000,Z=10.000000))
      HitboxChain(8)=(BoneOffset=(X=0.000000,Y=0.000000,Z=-10.000000))
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_MeleeBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Blunt_Crovel:MeleeHelper_0'
   AssociatedPerkClass=Class'KFGame.KFPerk_Berserker'
   InstantHitDamage(0)=49.000000
   InstantHitDamage(1)=()
   InstantHitDamage(2)=()
   InstantHitDamage(3)=()
   InstantHitDamage(4)=()
   InstantHitDamage(5)=86.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Slashing_Crovel'
   InstantHitDamageTypes(1)=()
   InstantHitDamageTypes(2)=()
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_CrovelBash'
   InstantHitDamageTypes(4)=()
   InstantHitDamageTypes(5)=Class'kfgamecontent.KFDT_Bludgeon_Crovel'
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_MeleeBase:FirstPersonMesh'
      MinTickTimeStep=0.025000
      SkeletalMesh=SkeletalMesh'WEP_1P_Crovel_MESH.Wep_1stP_Crovel_Rig'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      AnimSets(0)=AnimSet'WEP_1P_Crovel_ANIM.WEP_1P_Crovel_ANIM'
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
   ItemName="Crovel Survival Tool"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_MeleeBase:StaticPickupComponent'
      StaticMesh=StaticMesh'WEP_3P_Pickups_MESH.Wep_Crovel_Pickup'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_MeleeBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Blunt_Crovel"
   ObjectArchetype=KFWeap_MeleeBase'KFGame.Default__KFWeap_MeleeBase'
}
