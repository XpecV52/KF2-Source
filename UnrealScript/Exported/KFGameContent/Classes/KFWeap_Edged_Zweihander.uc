//=============================================================================
// KFWeap_Edged_Zweihander
//=============================================================================
// A two-handed sword primarily of the Renaissance. It is a true two-handed
// sword because it requires two hands to wield, unlike other large swords
// that are wielded with two hands but can also be wielded with one.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Andrew "Strago" Ladenberger
//=============================================================================

class KFWeap_Edged_Zweihander extends KFWeap_MeleeBase;

defaultproperties
{
   ParryStrength=5
   ParryDamageMitigationPercent=0.400000
   BlockSound=AkEvent'WW_WEP_Bullet_Impacts.Play_Block_MEL_Katana'
   ParrySound=AkEvent'WW_WEP_Bullet_Impacts.Play_Parry_Metal'
   PackageKey="Zweihander"
   FirstPersonMeshName="WEP_1P_Zweihander_MESH.Wep_1stP_Zweihander_Rig"
   FirstPersonAnimSetNames(0)="WEP_1P_Zweihander_ANIM.Wep_1stP_Zweihander_Anim"
   PickupMeshName="WEP_3P_Zweihander_MESH.Wep_Zweihander_Pickup"
   AttachmentArchetypeName="WEP_Zweihander_ARCH.Wep_Zweihander_3P"
   InventorySize=7
   GroupPriority=85.000000
   WeaponSelectTexture=Texture2D'WEP_UI_Zweihander_TEX.UI_WeaponSelect_Zweihander'
   PlayerViewOffset=(X=2.000000,Y=0.000000,Z=0.000000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_MeleeBase:MeleeHelper_0'
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
      ChainSequence_B(4)=()
      ChainSequence_B(5)=()
      ChainSequence_B(6)=()
      MeleeImpactCamShakeScale=0.040000
      MaxHitRange=240.000000
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
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Edged_Zweihander:MeleeHelper_0'
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_Berserker'
   WeaponUpgrades(1)=(Stats=((Stat=EWUS_Damage0,Scale=1.050000),(Stat=EWUS_Damage1,Scale=1.050000),(Stat=EWUS_Damage2,Scale=1.050000),(Add=1)))
   WeaponUpgrades(2)=(Stats=((Stat=EWUS_Damage0,Scale=1.100000),(Stat=EWUS_Damage1,Scale=1.100000),(Stat=EWUS_Damage2,Scale=1.100000),(Add=2)))
   InstantHitDamage(0)=85.000000
   InstantHitDamage(1)=()
   InstantHitDamage(2)=()
   InstantHitDamage(3)=63.000000
   InstantHitDamage(4)=()
   InstantHitDamage(5)=195.000000
   InstantHitMomentum(0)=30000.000000
   InstantHitMomentum(1)=()
   InstantHitMomentum(2)=()
   InstantHitMomentum(3)=()
   InstantHitMomentum(4)=()
   InstantHitMomentum(5)=30000.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Slashing_Zweihander'
   InstantHitDamageTypes(1)=()
   InstantHitDamageTypes(2)=()
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Piercing_ZweihanderStab'
   InstantHitDamageTypes(4)=()
   InstantHitDamageTypes(5)=Class'kfgamecontent.KFDT_Slashing_ZweihanderHeavy'
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
   ItemName="Zweihander"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_MeleeBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_MeleeBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Edged_Zweihander"
   ObjectArchetype=KFWeap_MeleeBase'KFGame.Default__KFWeap_MeleeBase'
}
