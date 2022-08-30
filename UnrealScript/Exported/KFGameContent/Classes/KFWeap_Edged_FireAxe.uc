//=============================================================================
// KFWeap_Edged_FireAxe
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================

class KFWeap_Edged_FireAxe extends KFWeap_MeleeBase;

defaultproperties
{
   BlockDamageMitigation=0.600000
   ParryDamageMitigationPercent=0.500000
   BlockSound=AkEvent'WW_WEP_Bullet_Impacts.Play_Block_MEL_Hammer'
   ParrySound=AkEvent'WW_WEP_Bullet_Impacts.Play_Parry_Wood'
   PackageKey="FireAxe"
   FirstPersonMeshName="wep_1p_fireaxe_mesh.Wep_1stP_FireAxe_Rig"
   FirstPersonAnimSetNames(0)="wep_1p_fireaxe_anim.Wep_1stP_FireAxe_Anim"
   PickupMeshName="wep_3p_fireaxe_mesh.Wep_3rdP_FireAxe_Pickup"
   AttachmentArchetypeName="wep_fireaxe_arch.Wep_FireAxe_3P"
   InventorySize=5
   GroupPriority=50.000000
   WeaponSelectTexture=Texture2D'WEP_UI_FireAxe_TEX.UI_WeaponSelect_Fireaxe'
   PlayerViewOffset=(X=2.000000,Y=0.000000,Z=0.000000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_MeleeBase:MeleeHelper_0'
      bUseDirectionalMelee=True
      bHasChainAttacks=True
      MeleeImpactCamShakeScale=0.030000
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
      WorldImpactEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Bladed_melee_impact'
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_MeleeBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Edged_FireAxe:MeleeHelper_0'
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_Berserker'
   WeaponUpgrades(1)=(Stats=((Stat=EWUS_Damage0,Scale=1.200000),(Stat=EWUS_Damage1,Scale=1.200000),(Stat=EWUS_Damage2,Scale=1.200000),(Add=1)))
   WeaponUpgrades(2)=(Stats=((Stat=EWUS_Damage0,Scale=1.400000),(Stat=EWUS_Damage1,Scale=1.400000),(Stat=EWUS_Damage2,Scale=1.400000),(Add=2)))
   WeaponUpgrades(3)=(Stats=((Stat=EWUS_Damage0,Scale=1.600000),(Stat=EWUS_Damage1,Scale=1.600000),(Stat=EWUS_Damage2,Scale=1.600000),(Add=3)))
   InstantHitDamage(0)=80.000000
   InstantHitDamage(1)=()
   InstantHitDamage(2)=()
   InstantHitDamage(3)=20.000000
   InstantHitDamage(4)=()
   InstantHitDamage(5)=125.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Slashing_FireAxe'
   InstantHitDamageTypes(1)=()
   InstantHitDamageTypes(2)=()
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_FireAxeBash'
   InstantHitDamageTypes(4)=()
   InstantHitDamageTypes(5)=Class'kfgamecontent.KFDT_Slashing_FireAxeHeavy'
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
   ItemName="Fire Axe"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_MeleeBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_MeleeBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Edged_FireAxe"
   ObjectArchetype=KFWeap_MeleeBase'KFGame.Default__KFWeap_MeleeBase'
}
