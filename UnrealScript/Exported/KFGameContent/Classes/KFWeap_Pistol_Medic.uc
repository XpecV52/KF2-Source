//=============================================================================
// KFWeap_Pistol_Medic
//=============================================================================
// A 9mm Pistol that fires healing medic darts
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFWeap_Pistol_Medic extends KFWeap_MedicBase;

defaultproperties
{
   InventoryGroup=IG_Secondary
   FilterTypeUI=FT_Pistol
   InventorySize=1
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   MeshIronSightFOV=77.000000
   PlayerIronSightFOV=77.000000
   IronSightPosition=(X=15.000000,Y=0.000000,Z=0.000000)
   DOF_FG_FocalRadius=40.000000
   DOF_FG_MaxNearBlurSize=3.500000
   GroupPriority=25.000000
   UITexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_MedicPistol'
   SecondaryAmmoTexture=Texture2D'UI_SecondaryAmmo_TEX.MedicDarts'
   MagazineCapacity(0)=15
   MaxSpareAmmo(0)=225
   InitialSpareMags(0)=7
   FireSightedAnims(1)="Shoot_Iron2"
   FireSightedAnims(2)="Shoot_Iron3"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_SA_MedicPistol.Play_SA_MedicPistol_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_SA_MedicPistol.Play_SA_MedicPistol_Fire_1P')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_MedicPistol.Play_SA_MedicPistol_Handling_DryFire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_SA_MedicDart.Play_WEP_SA_Medic_Dart_DryFire'
   PlayerViewOffset=(X=29.000000,Y=13.000000,Z=-4.000000)
   AttachmentArchetype=KFWeaponAttachment'WEP_Medic_Pistol_ARCH.Wep_Medic_Pistol_3P'
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGameContent.Default__KFWeap_MedicBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGameContent.Default__KFWeap_MedicBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'KFGameContent.Default__KFWeap_Pistol_Medic:MeleeHelper_0'
   MuzzleFlashTemplate=KFMuzzleFlash'WEP_Medic_Pistol_ARCH.Wep_Medic_Pistol_MuzzleFlash'
   maxRecoilPitch=250
   minRecoilPitch=200
   maxRecoilYaw=100
   minRecoilYaw=-100
   RecoilRate=0.070000
   RecoilMaxYawLimit=500
   RecoilMinYawLimit=65035
   RecoilMaxPitchLimit=900
   RecoilMinPitchLimit=65035
   RecoilISMaxYawLimit=50
   RecoilISMinYawLimit=65485
   RecoilISMaxPitchLimit=250
   RecoilISMinPitchLimit=65485
   AssociatedPerkClass=Class'KFGame.KFPerk_FieldMedic'
   FiringStatesArray(0)="WeaponSingleFiring"
   FiringStatesArray(1)=()
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponProjectiles(0)=Class'KFGameContent.KFProj_Bullet_Pistol9mm'
   WeaponProjectiles(1)=()
   FireInterval(0)=0.175000
   FireInterval(1)=()
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.015000
   Spread(1)=()
   InstantHitDamage(0)=20.000000
   InstantHitDamage(1)=()
   InstantHitDamage(2)=()
   InstantHitDamage(3)=10.000000
   InstantHitDamageTypes(0)=Class'KFGameContent.KFDT_Ballistic_Pistol_Medic'
   InstantHitDamageTypes(1)=()
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'KFGameContent.KFDT_Bludgeon_Pistol_Medic'
   FireOffset=(X=20.000000,Y=4.000000,Z=-3.000000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGameContent.Default__KFWeap_MedicBase:FirstPersonMesh'
      SkeletalMesh=SkeletalMesh'WEP_1P_Medic_Pistol_MESH.Wep_1stP_Medic_Pistol_Rig'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      AnimSets(0)=AnimSet'WEP_1P_Medic_Pistol_ANIM.WEP_1P_Medic_Pistol_ANIM'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'KFGameContent.Default__KFWeap_MedicBase:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="HMTech-101 Pistol"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGameContent.Default__KFWeap_MedicBase:StaticPickupComponent'
      StaticMesh=StaticMesh'WEP_3P_Pickups_MESH.Wep_Medic_Pistol_Pickup'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGameContent.Default__KFWeap_MedicBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Pistol_Medic"
   ObjectArchetype=KFWeap_MedicBase'KFGameContent.Default__KFWeap_MedicBase'
}
