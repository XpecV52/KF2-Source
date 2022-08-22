//=============================================================================
// KFWeap_Pistol_Deagle
//=============================================================================
// A Desert Eagle pistol
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Jeff Robinson
//=============================================================================

class KFWeap_Pistol_Deagle extends KFWeap_PistolBase;

defaultproperties
{
   InventorySize=2
   MagazineCapacity(0)=7
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   bHasFireLastAnims=True
   PenetrationPower(0)=2.000000
   PenetrationPower(1)=()
   MeshIronSightFOV=77.000000
   PlayerIronSightFOV=77.000000
   IronSightPosition=(X=11.000000,Y=0.000000,Z=0.000000)
   DOF_FG_FocalRadius=38.000000
   DOF_FG_MaxNearBlurSize=3.500000
   GroupPriority=25.000000
   WeaponSelectTexture=Texture2D'WEP_UI_Deagle_TEX.UI_WeaponSelect_Deagle'
   DualClass=Class'kfgamecontent.KFWeap_Pistol_DualDeagle'
   SpareAmmoCapacity(0)=105
   InitialSpareMags(0)=5
   AmmoPickupScale(0)=2.000000
   WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Medium_Recoil'
   IdleFidgetAnims(3)="Guncheck_v4"
   FireSightedAnims(1)="Shoot_Iron2"
   FireSightedAnims(2)="Shoot_Iron3"
   BonesToLockOnEmpty(0)="RW_Slide"
   BonesToLockOnEmpty(1)="RW_Bullets1"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_SA_DesertEagle.Play_WEP_SA_DesertEagle_Fire_Single_M',FirstPersonCue=AkEvent'WW_WEP_SA_DesertEagle.Play_WEP_SA_DesertEagle_Fire_Single_S')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_DesertEagle.Play_WEP_SA_DesertEagle_Handling_DryFire'
   PlayerViewOffset=(X=14.000000,Y=10.000000,Z=-4.000000)
   AttachmentArchetype=KFWeaponAttachment'WEP_Deagle_ARCH.Wep_Deagle_3P'
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_PistolBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_PistolBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Pistol_Deagle:MeleeHelper_0'
   MuzzleFlashTemplate=KFMuzzleFlash'WEP_Deagle_ARCH.Wep_Deagle_MuzzleFlash'
   maxRecoilPitch=650
   minRecoilPitch=550
   maxRecoilYaw=150
   minRecoilYaw=-150
   RecoilRate=0.070000
   RecoilMaxYawLimit=500
   RecoilMinYawLimit=65035
   RecoilMaxPitchLimit=1250
   RecoilMinPitchLimit=65035
   RecoilISMaxYawLimit=50
   RecoilISMinYawLimit=65485
   RecoilISMaxPitchLimit=500
   RecoilISMinPitchLimit=65485
   AssociatedPerkClass=Class'KFGame.KFPerk_Gunslinger'
   FiringStatesArray(0)="WeaponSingleFiring"
   FiringStatesArray(1)="WeaponSingleFiring"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponFireTypes(1)=EWFT_None
   WeaponFireTypes(2)=()
   WeaponFireTypes(3)=()
   WeaponFireTypes(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_Pistol50AE'
   FireInterval(0)=0.200000
   FireInterval(1)=()
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.010000
   InstantHitDamage(0)=91.000000
   InstantHitDamage(1)=()
   InstantHitDamage(2)=()
   InstantHitDamage(3)=22.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_Deagle'
   InstantHitDamageTypes(1)=()
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_Deagle'
   FireOffset=(X=20.000000,Y=4.000000,Z=-3.000000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_PistolBase:FirstPersonMesh'
      SkeletalMesh=SkeletalMesh'WEP_1P_Deagle_MESH.Wep_1stP_Deagle_Rig'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      AnimSets(0)=AnimSet'WEP_1P_Deagle_ANIM.Wep_1st_Deagle_Anim'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_PistolBase:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName=".50 Desert Eagle"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_PistolBase:StaticPickupComponent'
      StaticMesh=StaticMesh'WEP_3P_Deagle_MESH.Wep_DEagle_Pickup'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_PistolBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Pistol_Deagle"
   ObjectArchetype=KFWeap_PistolBase'KFGame.Default__KFWeap_PistolBase'
}
