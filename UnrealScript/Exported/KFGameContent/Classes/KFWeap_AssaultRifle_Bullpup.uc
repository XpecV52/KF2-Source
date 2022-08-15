//=============================================================================
// KFWeap_Bullpup
//=============================================================================
// A L85A2 'bullpup'
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFWeap_AssaultRifle_Bullpup extends KFWeap_RifleBase;

defaultproperties
{
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletAuto'
   FireModeIconPaths(1)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletSingle'
   SingleFireMode=1
   InventorySize=6
   EffectiveRange=68
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   MeshIronSightFOV=52.000000
   PlayerIronSightFOV=70.000000
   DOF_FG_FocalRadius=85.000000
   DOF_FG_MaxNearBlurSize=2.500000
   GroupPriority=50.000000
   UITexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_Bullpup'
   MagazineCapacity(0)=30
   MaxSpareAmmo(0)=270
   InitialSpareMags(0)=4
   bLoopingFireAnim(0)=True
   bLoopingFireSnd(0)=True
   FireSightedAnims(1)="Shoot_Iron2"
   FireSightedAnims(2)="Shoot_Iron3"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_SA_L85A2.Play_WEP_SA_L85A2_Fire_Loop_M',FirstPersonCue=AkEvent'WW_WEP_SA_L85A2.Play_WEP_SA_L85A2_Fire_Loop_S')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_SA_L85A2.Play_WEP_SA_L85A2_Fire_Single_M',FirstPersonCue=AkEvent'WW_WEP_SA_L85A2.Play_WEP_SA_L85A2_Fire_Single_S')
   WeaponFireLoopEndSnd(0)=(DefaultCue=AkEvent'WW_WEP_SA_L85A2.Play_WEP_SA_L85A2_Fire_Loop_End_M',FirstPersonCue=AkEvent'WW_WEP_SA_L85A2.Play_WEP_SA_L85A2_Fire_Loop_End_S')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_L85A2.Play_WEP_SA_L85A2_Handling_DryFire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_SA_L85A2.Play_WEP_SA_L85A2_Handling_DryFire'
   PlayerViewOffset=(X=3.000000,Y=9.000000,Z=-3.000000)
   AttachmentArchetype=KFWeaponAttachment'WEP_L85A2_ARCH.Wep_L85A2_3P'
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_RifleBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_RifleBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'KFGameContent.Default__KFWeap_AssaultRifle_Bullpup:MeleeHelper_0'
   MuzzleFlashTemplate=KFMuzzleFlash'WEP_L85A2_ARCH.Wep_L85A2_MuzzleFlash'
   maxRecoilPitch=150
   minRecoilPitch=115
   maxRecoilYaw=115
   minRecoilYaw=-115
   RecoilRate=0.085000
   RecoilViewRotationScale=0.250000
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
   AssociatedPerkClass=Class'KFGame.KFPerk_Commando'
   FiringStatesArray(1)="WeaponSingleFiring"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponProjectiles(0)=Class'KFGameContent.KFProj_Bullet_AssaultRifle'
   WeaponProjectiles(1)=Class'KFGameContent.KFProj_Bullet_AssaultRifle'
   FireInterval(0)=0.090900
   FireInterval(1)=0.100000
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.008500
   Spread(1)=0.008500
   InstantHitDamage(0)=25.000000
   InstantHitDamage(1)=25.000000
   InstantHitDamage(2)=()
   InstantHitDamage(3)=()
   InstantHitDamageTypes(0)=Class'KFGameContent.KFDT_Ballistic_Bullpup'
   InstantHitDamageTypes(1)=Class'KFGameContent.KFDT_Ballistic_Bullpup'
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'KFGameContent.KFDT_Bludgeon_Bullpup'
   FireOffset=(X=30.000000,Y=4.500000,Z=-5.000000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_RifleBase:FirstPersonMesh'
      SkeletalMesh=SkeletalMesh'WEP_1P_L85A2_MESH.Wep_1stP_L85A2_Rig'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      AnimSets(0)=AnimSet'WEP_1P_L85A2_ANIM.Wep_1st_L85A2_Anim'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_RifleBase:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="SA80 L85A2 Bullpup"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_RifleBase:StaticPickupComponent'
      StaticMesh=StaticMesh'WEP_3P_Pickups_MESH.Wep_L85A2_Pickup'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_RifleBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_AssaultRifle_Bullpup"
   ObjectArchetype=KFWeap_RifleBase'KFGame.Default__KFWeap_RifleBase'
}
