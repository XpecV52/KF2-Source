//=============================================================================
// KFWeap_Shotgun_HRG_Kaboomstick
//=============================================================================
// A double barrel shotgun that shoots explosives projectiles
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
// Tulio Beloqui (Saber Interactive)
//=============================================================================

class KFWeap_Shotgun_HRG_Kaboomstick extends KFWeap_Shotgun_DoubleBarrel;

defaultproperties
{
   PackageKey="HRG_Kaboomstick"
   FirstPersonMeshName="WEP_1P_HRG_Kaboomstick_MESH.Wep_1stP_HRG_Kaboomstick_Rig"
   FirstPersonAnimSetNames(0)="WEP_1P_HRG_Kaboomstick_ANIM.Wep_1stP_HRG_Kaboomstick_Anim"
   PickupMeshName="WEP_3P_HRG_Kaboomstick_MESH.Wep_HRG_Kaboomstick_Pickup"
   AttachmentArchetypeName="WEP_HRG_Kaboomstick_ARCH.Wep_HRG_Kaboomstick_3P"
   MuzzleFlashTemplateName="WEP_HRG_Kaboomstick_ARCH.Wep_HRG_Kaboomstick_MuzzleFlash"
   InventorySize=6
   PenetrationPower(0)=0.000000
   PenetrationPower(1)=0.000000
   IronSightPosition=(X=7.000000,Y=0.000000,Z=0.000000)
   GroupPriority=75.000000
   WeaponSelectTexture=Texture2D'WEP_UI_HRG_Kaboomstick_TEX.UI_WeaponSelect_HRG_Kaboomstick'
   InitialSpareMags(0)=9
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Shotgun_DoubleBarrel:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Shotgun_DoubleBarrel:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Shotgun_HRG_Kaboomstick:MeleeHelper_0'
   NumPellets(0)=8
   NumPellets(1)=16
   NumPellets(2)=()
   NumPellets(3)=()
   NumPellets(4)=()
   NumPellets(5)=()
   NumPellets(6)=()
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_Demolitionist'
   WeaponUpgrades(1)=(Stats=((Scale=1.150000),(Scale=1.150000),))
   WeaponUpgrades(2)=(Stats=((Scale=1.300000),(Scale=1.300000),))
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Explosive_HRG_Kaboomstick'
   WeaponProjectiles(1)=Class'kfgamecontent.KFProj_Explosive_HRG_Kaboomstick'
   Spread(0)=0.450000
   Spread(1)=0.450000
   InstantHitDamage(0)=15.000000
   InstantHitDamage(1)=15.000000
   InstantHitDamage(2)=()
   InstantHitDamage(3)=26.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_HRG_Kaboomstick'
   InstantHitDamageTypes(1)=Class'kfgamecontent.KFDT_Ballistic_HRG_Kaboomstick'
   InstantHitDamageTypes(2)=()
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_HRG_Kaboomstick'
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_Shotgun_DoubleBarrel:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_Shotgun_DoubleBarrel:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="HRG Kaboomstick"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'kfgamecontent.Default__KFWeap_Shotgun_DoubleBarrel:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'kfgamecontent.Default__KFWeap_Shotgun_DoubleBarrel:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Shotgun_HRG_Kaboomstick"
   ObjectArchetype=KFWeap_Shotgun_DoubleBarrel'kfgamecontent.Default__KFWeap_Shotgun_DoubleBarrel'
}
