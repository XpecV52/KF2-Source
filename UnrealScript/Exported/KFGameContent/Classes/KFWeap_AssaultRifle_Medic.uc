//=============================================================================
// KFWeap_AssaultRifle_Medic
//=============================================================================
// A Medic Assault Rifle
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFWeap_AssaultRifle_Medic extends KFWeap_MedicBase;

/*********************************************************************************************
 * @name	Trader
 *********************************************************************************************/

/** Returns trader filter index based on weapon type */
static simulated event EFilterTypeUI GetTraderFilter()
{
	return FT_Assault;
}

defaultproperties
{
   HealAmount=15
   HealFullRechargeSeconds=10.000000
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletAuto'
   FireModeIconPaths(1)=()
   SingleFireSoundIndex=1
   InventorySize=7
   MagazineCapacity(0)=40
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   MeshFOV=75.000000
   MeshIronSightFOV=52.000000
   PlayerIronSightFOV=70.000000
   IronSightPosition=(X=12.000000,Y=0.000000,Z=0.000000)
   DOF_FG_FocalRadius=85.000000
   DOF_FG_MaxNearBlurSize=2.500000
   GroupPriority=100.000000
   WeaponSelectTexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_MedicAssault'
   SecondaryAmmoTexture=Texture2D'UI_SecondaryAmmo_TEX.MedicDarts'
   AmmoCost(1)=30
   SpareAmmoCapacity(0)=400
   InitialSpareMags(0)=2
   bLoopingFireAnim(0)=True
   bLoopingFireSnd(0)=True
   FireSightedAnims(1)="Shoot_Iron2"
   FireSightedAnims(2)="Shoot_Iron3"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'ww_wep_sa_medicassault.Play_SA_MedicAssault_Fire_3P_Loop',FirstPersonCue=AkEvent'ww_wep_sa_medicassault.Play_SA_MedicAssault_Fire_1P_Loop')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'ww_wep_sa_medicassault.Play_SA_MedicAssault_Fire_3P_Single',FirstPersonCue=AkEvent'ww_wep_sa_medicassault.Play_SA_MedicAssault_Fire_1P_Single')
   WeaponFireLoopEndSnd(0)=(DefaultCue=AkEvent'ww_wep_sa_medicassault.Play_SA_MedicAssault_Fire_3P_EndLoop',FirstPersonCue=AkEvent'ww_wep_sa_medicassault.Play_SA_MedicAssault_Fire_1P_EndLoop')
   WeaponDryFireSnd(0)=AkEvent'ww_wep_sa_medicassault.Play_SA_MedicAssault_Handling_DryFire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_SA_MedicDart.Play_WEP_SA_Medic_Dart_DryFire'
   PlayerViewOffset=(X=15.000000,Y=6.500000,Z=-3.000000)
   AttachmentArchetype=KFWeaponAttachment'WEP_Medic_Assault_ARCH.Wep_Medic_Assault_3P'
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_MedicBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_MedicBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_AssaultRifle_Medic:MeleeHelper_0'
   MuzzleFlashTemplate=KFMuzzleFlash'WEP_Medic_Assault_ARCH.Wep_Medic_Assault_MuzzleFlash'
   maxRecoilPitch=140
   minRecoilPitch=105
   maxRecoilYaw=122
   minRecoilYaw=-122
   RecoilRate=0.075000
   RecoilMaxYawLimit=500
   RecoilMinYawLimit=65035
   RecoilMaxPitchLimit=900
   RecoilMinPitchLimit=65035
   RecoilISMaxYawLimit=75
   RecoilISMinYawLimit=65460
   RecoilISMaxPitchLimit=375
   RecoilISMinPitchLimit=65460
   HippedRecoilModifier=1.500000
   IronSightMeshFOVCompensationScale=1.500000
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_FieldMedic'
   AssociatedPerkClasses(1)=Class'KFGame.KFPerk_Commando'
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_AssaultRifle'
   WeaponProjectiles(1)=()
   FireInterval(0)=0.080000
   FireInterval(1)=()
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.008500
   Spread(1)=()
   InstantHitDamage(0)=35.000000
   InstantHitDamage(1)=()
   InstantHitDamage(2)=()
   InstantHitDamage(3)=27.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_Assault_Medic'
   InstantHitDamageTypes(1)=()
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_Assault_Medic'
   FireOffset=(X=30.000000,Y=4.500000,Z=-5.000000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFWeap_MedicBase:FirstPersonMesh'
      SkeletalMesh=SkeletalMesh'WEP_1P_Medic_Assault_MESH.Wep_1stP_Medic_Assault_Rig'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      AnimSets(0)=AnimSet'WEP_1P_Medic_Assault_ANIM.Wep_1stP_Medic_Assault_Anim'
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
   ItemName="HMTech-401 Assault Rifle"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'kfgamecontent.Default__KFWeap_MedicBase:StaticPickupComponent'
      StaticMesh=StaticMesh'WEP_3P_Pickups_MESH.Wep_Medic_Assault_Pickup'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'kfgamecontent.Default__KFWeap_MedicBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_AssaultRifle_Medic"
   ObjectArchetype=KFWeap_MedicBase'kfgamecontent.Default__KFWeap_MedicBase'
}
