//=============================================================================
// KFWeap_SMG_Medic
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Greg Felber 7/31/2014
//=============================================================================

class KFWeap_SMG_Medic extends KFWeap_MedicBase;

/*********************************************************************************************
 * @name	Trader
 *********************************************************************************************/

/** Returns trader filter index based on weapon type */
static simulated event EFilterTypeUI GetTraderFilter()
{
	return FT_SMG;
}

defaultproperties
{
   HealAmount=15
   PackageKey="Medic_SMG"
   FirstPersonMeshName="WEP_1P_Medic_SMG_MESH.Wep_1stP_Medic_SMG_Rig"
   FirstPersonAnimSetNames(0)="WEP_1P_Medic_SMG_ANIM.Wep_1stP_Medic_SMG_Anim"
   PickupMeshName="wep_3p_medic_smg_mesh.Wep_Medic_SMG_Pickup"
   AttachmentArchetypeName="WEP_Medic_SMG_ARCH.Wep_Medic_SMG_3P"
   MuzzleFlashTemplateName="WEP_Medic_SMG_ARCH.Wep_Medic_SMG_MuzzleFlash"
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletAuto'
   FireModeIconPaths(1)=()
   SingleFireSoundIndex=1
   InventorySize=3
   MagazineCapacity(0)=40
   MeshFOV=81.000000
   MeshIronSightFOV=64.000000
   PlayerIronSightFOV=70.000000
   IronSightPosition=(X=8.000000,Y=0.000000,Z=0.000000)
   GroupPriority=50.000000
   WeaponSelectTexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_MedicSMG'
   SecondaryAmmoTexture=Texture2D'UI_SecondaryAmmo_TEX.MedicDarts'
   AmmoCost(1)=40
   SpareAmmoCapacity(0)=480
   InitialSpareMags(0)=5
   bLoopingFireAnim(0)=True
   bLoopingFireSnd(0)=True
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_SA_MedicSMG.Play_SA_MedicSMG_Fire_3P_Loop',FirstPersonCue=AkEvent'WW_WEP_SA_MedicSMG.Play_SA_MedicSMG_Fire_1P_Loop')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_SA_MedicSMG.Play_SA_MedicSMG_Fire_3P_Single',FirstPersonCue=AkEvent'WW_WEP_SA_MedicSMG.Play_SA_MedicSMG_Fire_1P_Single')
   WeaponFireLoopEndSnd(0)=(DefaultCue=AkEvent'WW_WEP_SA_MedicSMG.Play_SA_MedicSMG_Fire_3P_EndLoop',FirstPersonCue=AkEvent'WW_WEP_SA_MedicSMG.Play_SA_MedicSMG_Fire_1P_EndLoop')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_MedicSMG.Play_SA_MedicSMG_Handling_DryFire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_SA_MedicDart.Play_WEP_SA_Medic_Dart_DryFire'
   PlayerViewOffset=(X=22.000000,Y=10.000000,Z=-4.500000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_MedicBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_MedicBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_SMG_Medic:MeleeHelper_0'
   maxRecoilPitch=100
   minRecoilPitch=75
   maxRecoilYaw=75
   minRecoilYaw=-75
   RecoilRate=0.070000
   RecoilMaxYawLimit=500
   RecoilMinYawLimit=65035
   RecoilMaxPitchLimit=900
   RecoilMinPitchLimit=65035
   RecoilISMaxYawLimit=75
   RecoilISMinYawLimit=65460
   RecoilISMaxPitchLimit=375
   RecoilISMinPitchLimit=65460
   IronSightMeshFOVCompensationScale=1.500000
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_FieldMedic'
   AssociatedPerkClasses(1)=Class'KFGame.KFPerk_SWAT'
   WeaponUpgrades(1)=(IncrementDamage=1.400000,IncrementHealFullRecharge=0.800000)
   WeaponUpgrades(2)=(IncrementWeight=2,IncrementDamage=1.590000,IncrementHealFullRecharge=0.700000)
   WeaponUpgrades(3)=(IncrementWeight=3,IncrementDamage=1.850000,IncrementHealFullRecharge=0.600000)
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_AssaultRifle'
   WeaponProjectiles(1)=()
   FireInterval(0)=0.075000
   FireInterval(1)=()
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.007000
   Spread(1)=()
   InstantHitDamage(0)=17.000000
   InstantHitDamage(1)=()
   InstantHitDamage(2)=()
   InstantHitDamage(3)=23.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_SMG_Medic'
   InstantHitDamageTypes(1)=()
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_SMG_Medic'
   FireOffset=(X=30.000000,Y=4.500000,Z=-5.000000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_MedicBase:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_MedicBase:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="HMTech-201 SMG"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'kfgamecontent.Default__KFWeap_MedicBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'kfgamecontent.Default__KFWeap_MedicBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_SMG_Medic"
   ObjectArchetype=KFWeap_MedicBase'kfgamecontent.Default__KFWeap_MedicBase'
}
