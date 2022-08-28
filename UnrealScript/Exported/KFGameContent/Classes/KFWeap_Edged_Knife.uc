//=============================================================================
// KFWeap_CommandoKnife
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 4/14/2014
//=============================================================================

class KFWeap_Edged_Knife extends KFWeap_MeleeBase;

simulated static function bool AllowedForAllPerks()
{
    return true;
}

defaultproperties
{
   MaxChainAtkCount=4
   ParryStrength=1
   BlockDamageMitigation=0.800000
   ParryDamageMitigationPercent=0.800000
   BlockSound=AkEvent'WW_WEP_Bullet_Impacts.Play_Block_MEL_Katana'
   ParrySound=AkEvent'WW_WEP_Bullet_Impacts.Play_Block_MEL_Katana'
   bIsBackupWeapon=True
   GroupPriority=10.000000
   WeaponSelectTexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_Knife'
   PlayerViewOffset=(X=10.000000,Y=10.000000,Z=0.000000)
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
      ChainSequence_L(1)=DIR_ForwardLeft
      ChainSequence_L(2)=()
      ChainSequence_L(3)=DIR_Left
      ChainSequence_L(4)=()
      ChainSequence_R(1)=DIR_ForwardRight
      ChainSequence_R(2)=()
      ChainSequence_R(3)=DIR_Right
      ChainSequence_R(4)=()
      MeleeImpactCamShakeScale=0.030000
      MaxHitRange=220.000000
      HitboxChain(0)=(BoneOffset=(X=0.000000,Y=3.000000,Z=125.000000))
      HitboxChain(1)=(BoneOffset=(X=0.000000,Y=-3.000000,Z=100.000000))
      HitboxChain(2)=(BoneOffset=(X=0.000000,Y=3.000000,Z=75.000000))
      HitboxChain(3)=(BoneOffset=(X=0.000000,Y=-3.000000,Z=50.000000))
      HitboxChain(4)=(BoneOffset=(X=0.000000,Y=3.000000,Z=25.000000))
      HitboxChain(5)=(BoneOffset=(X=0.000000,Y=-3.000000,Z=0.000000))
      HitboxChain(6)=(BoneOffset=(X=0.000000,Y=0.000000,Z=-25.000000))
      WorldImpactEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Bladed_melee_impact'
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_MeleeBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Edged_Knife:MeleeHelper_0'
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_Commando'
   InstantHitDamage(0)=32.000000
   InstantHitDamage(1)=()
   InstantHitDamage(2)=()
   InstantHitDamage(3)=()
   InstantHitDamage(4)=()
   InstantHitDamage(5)=64.000000
   InstantHitMomentum(3)=1000.000000
   InstantHitMomentum(4)=()
   InstantHitMomentum(5)=()
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Slashing_Knife'
   InstantHitDamageTypes(1)=()
   InstantHitDamageTypes(2)=()
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Piercing_KnifeStab'
   InstantHitDamageTypes(4)=()
   InstantHitDamageTypes(5)=Class'kfgamecontent.KFDT_Slashing_KnifeHeavy'
   bCanThrow=False
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
   bDropOnDeath=False
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_MeleeBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_MeleeBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Edged_Knife"
   ObjectArchetype=KFWeap_MeleeBase'KFGame.Default__KFWeap_MeleeBase'
}
