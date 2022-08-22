//=============================================================================
// KFWeap_Pistol_Colt1911
//=============================================================================
// A Colt 1911 pistol
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Jeff Robinson
//=============================================================================

class KFWeap_Pistol_Colt1911 extends KFWeap_PistolBase;

defaultproperties
{
   InventorySize=2
   MagazineCapacity(0)=8
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   bHasFireLastAnims=True
   PenetrationPower(0)=1.000000
   PenetrationPower(1)=()
   MeshFOV=75.000000
   MeshIronSightFOV=60.000000
   PlayerIronSightFOV=77.000000
   IronSightPosition=(X=15.000000,Y=0.000000,Z=0.000000)
   DOF_FG_FocalRadius=40.000000
   DOF_FG_MaxNearBlurSize=3.500000
   GroupPriority=20.000000
   WeaponSelectTexture=Texture2D'WEP_UI_M1911_TEX.UI_WeaponSelect_M1911Colt'
   DualClass=Class'kfgamecontent.KFWeap_Pistol_DualColt1911'
   SpareAmmoCapacity(0)=136
   InitialSpareMags(0)=7
   AmmoPickupScale(0)=2.000000
   IdleFidgetAnims(3)="Guncheck_v4"
   IdleFidgetAnims(4)="Guncheck_v5"
   IdleFidgetAnims(5)="Guncheck_v6"
   FireSightedAnims(1)="Shoot_Iron2"
   FireSightedAnims(2)="Shoot_Iron3"
   BonesToLockOnEmpty(1)="RW_Bullets1"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_1911.Play_WEP_SA_1911_Fire_Single_M',FirstPersonCue=AkEvent'WW_WEP_1911.Play_WEP_SA_1911_Fire_Single_S')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_1911.Play_WEP_SA_1911_Handling_DryFire'
   PlayerViewOffset=(X=22.000000,Y=12.000000,Z=-6.000000)
   AttachmentArchetype=KFWeaponAttachment'WEP_M1911_ARCH.Wep_M1911_3P'
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_PistolBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_PistolBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Pistol_Colt1911:MeleeHelper_0'
   MuzzleFlashTemplate=KFMuzzleFlash'WEP_M1911_ARCH.Wep_M1911_MuzzleFlash'
   maxRecoilPitch=450
   minRecoilPitch=400
   maxRecoilYaw=150
   minRecoilYaw=-150
   RecoilRate=0.070000
   RecoilMaxYawLimit=500
   RecoilMinYawLimit=65035
   RecoilMaxPitchLimit=900
   RecoilMinPitchLimit=65035
   RecoilISMaxYawLimit=50
   RecoilISMinYawLimit=65485
   RecoilISMaxPitchLimit=500
   RecoilISMinPitchLimit=65485
   IronSightMeshFOVCompensationScale=1.350000
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
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_PistolColt1911'
   FireInterval(0)=0.175000
   FireInterval(1)=()
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.015000
   InstantHitDamage(0)=50.000000
   InstantHitDamage(1)=()
   InstantHitDamage(2)=()
   InstantHitDamage(3)=22.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_Colt1911'
   InstantHitDamageTypes(1)=()
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_Colt1911'
   FireOffset=(X=20.000000,Y=4.000000,Z=-3.000000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_PistolBase:FirstPersonMesh'
      SkeletalMesh=SkeletalMesh'WEP_1P_M1911_MESH.Wep_1stP_M1911_Rig'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      AnimSets(0)=AnimSet'WEP_1P_M1911_ANIM.Wep_1stP_M1911_Anim'
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
   ItemName="M1911 Pistol"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_PistolBase:StaticPickupComponent'
      StaticMesh=StaticMesh'WEP_3P_M1911_MESH.Wep_M1911_Pickup'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_PistolBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Pistol_Colt1911"
   ObjectArchetype=KFWeap_PistolBase'KFGame.Default__KFWeap_PistolBase'
}
