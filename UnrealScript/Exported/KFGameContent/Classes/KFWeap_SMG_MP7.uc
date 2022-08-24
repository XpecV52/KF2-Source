//=============================================================================
// KFWeap_SMG_MP7
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//  - Brooks Butler
//=============================================================================

class KFWeap_SMG_MP7 extends KFWeap_SMGBase;

defaultproperties
{
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletAuto'
   FireModeIconPaths(1)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletSingle'
   SingleFireSoundIndex=1
   InventorySize=4
   MagazineCapacity(0)=30
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   MeshFOV=81.000000
   MeshIronSightFOV=55.000000
   PlayerIronSightFOV=70.000000
   IronSightPosition=(X=5.000000,Y=0.000000,Z=0.000000)
   GroupPriority=50.000000
   WeaponSelectTexture=Texture2D'WEP_UI_MP7_TEX.UI_WeaponSelect_MP7'
   SpareAmmoCapacity(0)=330
   InitialSpareMags(0)=6
   bLoopingFireAnim(0)=True
   bLoopingFireSnd(0)=True
   WeaponFireSnd(0)=(DefaultCue=AkEvent'ww_wep_mp7.Play_MP7_Fire_3P_Loop',FirstPersonCue=AkEvent'ww_wep_mp7.Play_MP7_Fire_1P_Loop')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'ww_wep_mp7.Play_MP7_Fire_3P_Single',FirstPersonCue=AkEvent'ww_wep_mp7.Play_MP7_Fire_1P_Single')
   WeaponFireLoopEndSnd(0)=(DefaultCue=AkEvent'ww_wep_mp7.Play_MP7_Fire_3P_EndLoop',FirstPersonCue=AkEvent'ww_wep_mp7.Play_MP7_Fire_1P_EndLoop')
   WeaponDryFireSnd(0)=AkEvent'ww_wep_sa_medicsmg.Play_SA_MedicSMG_Handling_DryFire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_SA_MedicDart.Play_WEP_SA_Medic_Dart_DryFire'
   PlayerViewOffset=(X=18.500000,Y=10.250000,Z=-4.000000)
   AttachmentArchetype=KFWeaponAttachment'wep_mp7_arch.Wep_MP7_3P'
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_SMGBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_SMGBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_SMG_MP7:MeleeHelper_0'
   MuzzleFlashTemplate=KFMuzzleFlash'wep_mp7_arch.Wep_MP7_MuzzleFlash'
   maxRecoilPitch=50
   minRecoilPitch=40
   maxRecoilYaw=80
   minRecoilYaw=-80
   RecoilRate=0.060000
   RecoilMaxYawLimit=500
   RecoilMinYawLimit=65035
   RecoilMaxPitchLimit=900
   RecoilMinPitchLimit=65035
   RecoilISMaxYawLimit=75
   RecoilISMinYawLimit=65460
   RecoilISMaxPitchLimit=375
   RecoilISMinPitchLimit=65460
   JoggingRecoilModifier=1.200000
   WalkingRecoilModifier=1.100000
   IronSightMeshFOVCompensationScale=1.500000
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_SWAT'
   FiringStatesArray(1)="WeaponSingleFiring"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_AssaultRifle'
   WeaponProjectiles(1)=Class'kfgamecontent.KFProj_Bullet_AssaultRifle'
   FireInterval(0)=0.063000
   FireInterval(1)=0.063000
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.015000
   Spread(1)=0.010000
   InstantHitDamage(0)=16.000000
   InstantHitDamage(1)=16.000000
   InstantHitDamage(2)=()
   InstantHitDamage(3)=24.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_MP7'
   InstantHitDamageTypes(1)=Class'kfgamecontent.KFDT_Ballistic_MP7'
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_MP7'
   FireOffset=(X=30.000000,Y=4.500000,Z=-5.000000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_SMGBase:FirstPersonMesh'
      SkeletalMesh=SkeletalMesh'wep_1p_mp7_mesh.Wep_1stP_MP7_Rig'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
      AnimSets(0)=AnimSet'wep_1p_mp7_anim.wep_1p_mp7_anim'
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
   ItemName="MP7 SMG"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_SMGBase:StaticPickupComponent'
      StaticMesh=StaticMesh'wep_3p_mp7_mesh.Wep_MP7_Pickup'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_SMGBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_SMG_MP7"
   ObjectArchetype=KFWeap_SMGBase'KFGame.Default__KFWeap_SMGBase'
}
