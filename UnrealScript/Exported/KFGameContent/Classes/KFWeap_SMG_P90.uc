//=============================================================================
// KFWeap_SMG_P90
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 11/20/2013
//=============================================================================

class KFWeap_SMG_P90 extends KFWeap_SMGBase;

defaultproperties
{
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletAuto'
   FireModeIconPaths(1)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletSingle'
   SingleFireSoundIndex=1
   InventorySize=5
   MagazineCapacity(0)=50
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   MeshFOV=75.000000
   MeshIronSightFOV=55.000000
   GroupPriority=80.000000
   WeaponSelectTexture=Texture2D'WEP_UI_P90_TEX.UI_WeaponSelect_FNP90'
   SpareAmmoCapacity(0)=350
   InitialSpareMags(0)=2
   bLoopingFireAnim(0)=True
   bLoopingFireSnd(0)=True
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_P90.Play_P90_Fire_3P_Loop',FirstPersonCue=AkEvent'WW_WEP_P90.Play_P90_Fire_1P_Loop')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_P90.Play_P90_Fire_3P_Single',FirstPersonCue=AkEvent'WW_WEP_P90.Play_P90_Fire_1P_Single')
   WeaponFireLoopEndSnd(0)=(DefaultCue=AkEvent'WW_WEP_P90.Play_P90_Fire_3P_EndLoop',FirstPersonCue=AkEvent'WW_WEP_P90.Play_P90_Fire_1P_EndLoop')
   WeaponDryFireSnd(0)=None
   WeaponDryFireSnd(1)=None
   PlayerViewOffset=(X=19.000000,Y=10.000000,Z=-0.500000)
   AttachmentArchetype=KFWeaponAttachment'wep_p90_arch.Wep_P90_3P'
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_SMGBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_SMGBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_SMG_P90:MeleeHelper_0'
   MuzzleFlashTemplate=KFMuzzleFlash'wep_p90_arch.Wep_P90_MuzzleFlash'
   maxRecoilPitch=80
   minRecoilPitch=65
   maxRecoilYaw=60
   minRecoilYaw=-60
   RecoilRate=0.063000
   RecoilMaxYawLimit=400
   RecoilMinYawLimit=65135
   RecoilMaxPitchLimit=800
   RecoilMinPitchLimit=65035
   RecoilISMaxYawLimit=150
   RecoilISMinYawLimit=65385
   RecoilISMinPitchLimit=65435
   IronSightMeshFOVCompensationScale=1.500000
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_SWAT'
   FiringStatesArray(1)="WeaponSingleFiring"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_AssaultRifle'
   WeaponProjectiles(1)=Class'kfgamecontent.KFProj_Bullet_AssaultRifle'
   FireInterval(0)=0.070000
   FireInterval(1)=0.100000
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.015000
   Spread(1)=0.015000
   InstantHitDamage(0)=30.000000
   InstantHitDamage(1)=30.000000
   InstantHitDamage(2)=()
   InstantHitDamage(3)=25.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_P90'
   InstantHitDamageTypes(1)=Class'kfgamecontent.KFDT_Ballistic_P90'
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_P90'
   FireOffset=(X=30.000000,Y=4.500000,Z=-5.000000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_SMGBase:FirstPersonMesh'
      SkeletalMesh=SkeletalMesh'wep_1p_p90_mesh.Wep_1stP_P90_Rig'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      AnimSets(0)=AnimSet'wep_1p_p90_anim.Wep_1stP_P90_Anim'
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      LightingChannels=(bInitialized=True,Outdoor=True)
      bAllowPerObjectShadows=True
      Name="FirstPersonMesh"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_SMGBase:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="P90 SMG"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_SMGBase:StaticPickupComponent'
      StaticMesh=StaticMesh'wep_3p_p90_mesh.Wep_P90_Pickup'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_SMGBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_SMG_P90"
   ObjectArchetype=KFWeap_SMGBase'KFGame.Default__KFWeap_SMGBase'
}
