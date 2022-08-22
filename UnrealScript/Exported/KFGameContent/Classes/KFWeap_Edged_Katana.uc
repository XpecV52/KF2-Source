//=============================================================================
// KFWeap_Edged_Katana
//=============================================================================
// A long, curved single-edged sword traditionally used by Japanese samurai
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Andrew "Strago" Ladenberger
//=============================================================================

class KFWeap_Edged_Katana extends KFWeap_MeleeBase;

defaultproperties
{
   BlockDamageMitigation=0.600000
   ParryDamageMitigationPercent=0.500000
   BlockSound=AkEvent'WW_WEP_Bullet_Impacts.Play_Block_MEL_Katana'
   ParrySound=AkEvent'WW_WEP_Bullet_Impacts.Play_Parry_Metal'
   InventorySize=3
   GroupPriority=100.000000
   WeaponSelectTexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_Katana'
   PlayerViewOffset=(X=2.000000,Y=0.000000,Z=0.000000)
   AttachmentArchetype=KFWeaponAttachment'WEP_Katana_ARCH.Wep_Katana_3P'
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_MeleeBase:MeleeHelper_0'
      bUseDirectionalMelee=True
      bHasChainAttacks=True
      WorldImpactEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Bladed_melee_impact'
      MeleeImpactCamShakeScale=0.300000
      MaxHitRange=190.000000
      HitboxChain(0)=(BoneOffset=(X=3.000000,Y=0.000000,Z=190.000000))
      HitboxChain(1)=(BoneOffset=(X=-3.000000,Y=0.000000,Z=170.000000))
      HitboxChain(2)=(BoneOffset=(X=3.000000,Y=0.000000,Z=150.000000))
      HitboxChain(3)=(BoneOffset=(X=-3.000000,Y=0.000000,Z=130.000000))
      HitboxChain(4)=(BoneOffset=(X=3.000000,Y=0.000000,Z=110.000000))
      HitboxChain(5)=(BoneOffset=(X=-3.000000,Y=0.000000,Z=90.000000))
      HitboxChain(6)=(BoneOffset=(X=3.000000,Y=0.000000,Z=70.000000))
      HitboxChain(7)=(BoneOffset=(X=-3.000000,Y=0.000000,Z=50.000000))
      HitboxChain(8)=(BoneOffset=(X=3.000000,Y=0.000000,Z=30.000000))
      HitboxChain(9)=(BoneOffset=(X=0.000000,Y=0.000000,Z=10.000000))
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_MeleeBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Edged_Katana:MeleeHelper_0'
   AssociatedPerkClass=Class'KFGame.KFPerk_Berserker'
   InstantHitDamage(0)=68.000000
   InstantHitDamage(1)=()
   InstantHitDamage(2)=()
   InstantHitDamage(3)=68.000000
   InstantHitDamage(4)=()
   InstantHitDamage(5)=90.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Slashing_Katana'
   InstantHitDamageTypes(1)=()
   InstantHitDamageTypes(2)=()
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Piercing_KatanaStab'
   InstantHitDamageTypes(4)=()
   InstantHitDamageTypes(5)=Class'kfgamecontent.KFDT_Slashing_KatanaHeavy'
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_MeleeBase:FirstPersonMesh'
      MinTickTimeStep=0.025000
      SkeletalMesh=SkeletalMesh'WEP_1P_KATANA_MESH.Wep_1stP_Katana_Rig'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      AnimSets(0)=AnimSet'WEP_1P_KATANA_ANIM.Katana_Anim_Master'
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
   ItemName="Katana"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_MeleeBase:StaticPickupComponent'
      StaticMesh=StaticMesh'WEP_3P_Pickups_MESH.Wep_Katana_Pickup'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_MeleeBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Edged_Katana"
   ObjectArchetype=KFWeap_MeleeBase'KFGame.Default__KFWeap_MeleeBase'
}
