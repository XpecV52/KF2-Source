//=============================================================================
// KFWeap_Pistol_DualColt1911
//=============================================================================
// A set of Colt 1911 pistols
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Jeff Robinson
//=============================================================================

class KFWeap_Pistol_DualColt1911 extends KFWeap_DualBase;

defaultproperties
{
   LeftMuzzleFlashTemplate=KFMuzzleFlash'WEP_Dual_M1911_ARCH.Wep_Dual_M1911_MuzzleFlash_L'
   LeftFireOffset=(X=17.000000,Y=-4.000000,Z=-2.250000)
   SingleClass=Class'kfgamecontent.KFWeap_Pistol_Colt1911'
   BonesToLockOnEmpty_L(1)="LW_Bullets1"
   InventorySize=4
   MagazineCapacity(0)=16
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   bHasFireLastAnims=True
   PenetrationPower(0)=1.000000
   PenetrationPower(1)=1.000000
   MeshFOV=75.000000
   MeshIronSightFOV=60.000000
   PlayerIronSightFOV=77.000000
   IronSightPosition=(X=15.000000,Y=0.000000,Z=0.000000)
   QuickWeaponDownRotation=(Pitch=-8192,Yaw=0,Roll=0)
   DOF_FG_FocalRadius=40.000000
   DOF_FG_MaxNearBlurSize=3.500000
   GroupPriority=40.000000
   WeaponSelectTexture=Texture2D'WEP_UI_Dual_M1911_TEX.UI_WeaponSelect_DualM1911'
   MaxSpareAmmo(0)=128
   InitialSpareMags(0)=3
   BonesToLockOnEmpty(1)="RW_Bullets1"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_1911.Play_WEP_SA_1911_Fire_Single_M',FirstPersonCue=AkEvent'WW_WEP_1911.Play_WEP_SA_1911_Fire_Single_S')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_1911.Play_WEP_SA_1911_Fire_Single_M',FirstPersonCue=AkEvent'WW_WEP_1911.Play_WEP_SA_1911_Fire_Single_S')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_1911.Play_WEP_SA_1911_Handling_DryFire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_1911.Play_WEP_SA_1911_Handling_DryFire'
   PlayerViewOffset=(X=16.000000,Y=0.000000,Z=-5.000000)
   AttachmentArchetype=KFWeapAttach_DualBase'WEP_Dual_M1911_ARCH.Wep_Dual_M1911_3P'
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_DualBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_DualBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Pistol_DualColt1911:MeleeHelper_0'
   MuzzleFlashTemplate=KFMuzzleFlash'WEP_Dual_M1911_ARCH.Wep_Dual_M1911_MuzzleFlash'
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
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_PistolColt1911'
   WeaponProjectiles(1)=Class'kfgamecontent.KFProj_Bullet_PistolColt1911'
   FireInterval(0)=0.100000
   FireInterval(1)=0.100000
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.015000
   Spread(1)=0.015000
   InstantHitDamage(0)=50.000000
   InstantHitDamage(1)=50.000000
   InstantHitDamage(2)=()
   InstantHitDamage(3)=()
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_Colt1911'
   InstantHitDamageTypes(1)=Class'kfgamecontent.KFDT_Ballistic_Colt1911'
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_Colt1911'
   FireOffset=(X=17.000000,Y=4.000000,Z=-2.250000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_DualBase:FirstPersonMesh'
      SkeletalMesh=SkeletalMesh'WEP_1P_Dual_M1911_MESH.Wep_1stP_Dual_M1911_Rig'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Dual_Animtree_Master'
      AnimSets(0)=AnimSet'WEP_1P_Dual_M1911_ANIM.Wep_1stP_Dual_M1911_Anim'
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
   ItemName="Dual M1911 Pistols"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_DualBase:StaticPickupComponent'
      StaticMesh=StaticMesh'WEP_3P_M1911_MESH.Wep_M1911_Pickup'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_DualBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Pistol_DualColt1911"
   ObjectArchetype=KFWeap_DualBase'KFGame.Default__KFWeap_DualBase'
}
