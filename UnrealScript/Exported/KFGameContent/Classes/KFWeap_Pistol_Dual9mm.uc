//=============================================================================
// KFWeap_Pistol_Dual9mm
//=============================================================================
// A set of 9mm Beretta Pistols
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson and Jeff Robinson
//=============================================================================

class KFWeap_Pistol_Dual9mm extends KFWeap_DualBase;

defaultproperties
{
   LeftMuzzleFlashTemplate=KFMuzzleFlash'WEP_Dual_9MM_ARCH.Wep_Dual_9MM_MuzzleFlash_L'
   LeftFireOffset=(X=17.000000,Y=-4.000000,Z=-2.250000)
   SingleClass=Class'KFGameContent.KFWeap_Pistol_9mm'
   InventoryGroup=IG_Secondary
   FilterTypeUI=FT_Pistol
   InventorySize=2
   EffectiveRange=50
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   bHasFlashlight=True
   bIsBackupWeapon=True
   MeshFOV=96.000000
   MeshIronSightFOV=77.000000
   PlayerIronSightFOV=77.000000
   IronSightPosition=(X=-3.000000,Y=0.000000,Z=0.000000)
   QuickWeaponDownRotation=(Pitch=-8192,Yaw=0,Roll=0)
   DOF_FG_FocalRadius=40.000000
   DOF_FG_MaxNearBlurSize=3.500000
   GroupPriority=20.000000
   UITexture=Texture2D'WEP_UI_Dual_9MM_TEX.UI_WeaponSelect_Dual9mm'
   MagazineCapacity(0)=30
   MaxSpareAmmo(0)=225
   InitialSpareMags(0)=7
   AmmoPickupScale(0)=0.500000
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_SA_9mm.Play_WEP_SA_9mm_Fire_Single_M',FirstPersonCue=AkEvent'WW_WEP_SA_9mm.Play_WEP_SA_9mm_Fire_Single_S')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_9mm.Play_WEP_SA_9mm_Handling_DryFire'
   PlayerViewOffset=(X=5.000000,Y=0.000000,Z=-5.000000)
   AttachmentArchetype=KFWeapAttach_DualBase'WEP_Dual_9MM_ARCH.Wep_Dual_9mm_3P'
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_DualBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_DualBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'KFGameContent.Default__KFWeap_Pistol_Dual9mm:MeleeHelper_0'
   MuzzleFlashTemplate=KFMuzzleFlash'WEP_Dual_9MM_ARCH.Wep_Dual_9MM_MuzzleFlash'
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
   FiringStatesArray(0)="WeaponSingleFiring"
   FiringStatesArray(1)="WeaponSingleFiring"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponFireTypes(1)=EWFT_None
   WeaponFireTypes(2)=()
   WeaponFireTypes(3)=()
   WeaponFireTypes(4)=()
   WeaponProjectiles(0)=Class'KFGameContent.KFProj_Bullet_Pistol9mm'
   FireInterval(0)=0.100000
   FireInterval(1)=()
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.015000
   InstantHitDamage(0)=15.000000
   InstantHitDamage(1)=()
   InstantHitDamage(2)=()
   InstantHitDamage(3)=10.000000
   InstantHitDamageTypes(0)=Class'KFGameContent.KFDT_Ballistic_9mm'
   InstantHitDamageTypes(1)=()
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'KFGameContent.KFDT_Bludgeon_9mm'
   FireOffset=(X=17.000000,Y=4.000000,Z=-2.250000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_DualBase:FirstPersonMesh'
      SkeletalMesh=SkeletalMesh'WEP_1P_Dual_9MM_MESH.Wep_1stP_Dual_9mm_Rig'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Dual_Animtree_Master'
      AnimSets(0)=AnimSet'WEP_1P_Dual_9MM_ANIM.Wep_1stP_Dual_9MM_Anim'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_DualBase:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Dual 9mm Pistol"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_DualBase:StaticPickupComponent'
      StaticMesh=StaticMesh'WEP_3P_Pickups_MESH.Wep_9mm_Pickup'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_DualBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Pistol_Dual9mm"
   ObjectArchetype=KFWeap_DualBase'KFGame.Default__KFWeap_DualBase'
}
