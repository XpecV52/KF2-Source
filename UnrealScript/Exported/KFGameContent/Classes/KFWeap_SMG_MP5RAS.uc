//=============================================================================
// KFWeap_SMG_MP5RAS
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//  - Brooks Butler
//=============================================================================

class KFWeap_SMG_MP5RAS extends KFWeap_SMGBase;

defaultproperties
{
   PackageKey="MP5RAS"
   FirstPersonMeshName="wep_1p_mp5ras_mesh.Wep_1stP_MP5RAS_Rig"
   FirstPersonAnimSetNames(0)="wep_1p_mp5ras_anim.wep_1p_mp5ras_anim"
   PickupMeshName="wep_3p_mp5ras_mesh.Wep_MP5RAS_Pickup"
   AttachmentArchetypeName="wep_mp5ras_arch.Wep_MP5RAS_3P"
   MuzzleFlashTemplateName="wep_mp5ras_arch.Wep_MP5RAS_MuzzleFlash"
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletAuto'
   FireModeIconPaths(1)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletBurst'
   SingleFireSoundIndex=1
   BurstAmount=3
   InventorySize=4
   MagazineCapacity(0)=40
   MeshIronSightFOV=50.000000
   IronSightPosition=(X=10.000000,Y=0.000000,Z=0.000000)
   GroupPriority=60.000000
   WeaponSelectTexture=Texture2D'WEP_UI_MP5RAS_TEX.UI_WeaponSelect_MP5RAS'
   SpareAmmoCapacity(0)=320
   InitialSpareMags(0)=4
   bLoopingFireAnim(0)=True
   bLoopingFireSnd(0)=True
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_MP5.Play_MP5_Fire_3P_Loop',FirstPersonCue=AkEvent'WW_WEP_MP5.Play_MP5_Fire_1P_Loop')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_MP5.Play_MP5_Fire_3P_Single',FirstPersonCue=AkEvent'WW_WEP_MP5.Play_MP5_Fire_1P_Single')
   WeaponFireLoopEndSnd(0)=(DefaultCue=AkEvent'WW_WEP_MP5.Play_MP5_Fire_3P_EndLoop',FirstPersonCue=AkEvent'WW_WEP_MP5.Play_MP5_Fire_1P_EndLoop')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_MedicSMG.Play_SA_MedicSMG_Handling_DryFire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_SA_MedicDart.Play_WEP_SA_Medic_Dart_DryFire'
   PlayerViewOffset=(X=17.000000,Y=8.000000,Z=-4.000000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_SMGBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_SMGBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_SMG_MP5RAS:MeleeHelper_0'
   maxRecoilPitch=60
   minRecoilPitch=40
   maxRecoilYaw=50
   minRecoilYaw=-50
   RecoilRate=0.060000
   RecoilMaxYawLimit=500
   RecoilMinYawLimit=65035
   RecoilMaxPitchLimit=550
   RecoilMinPitchLimit=65035
   RecoilISMaxYawLimit=75
   RecoilISMinYawLimit=65460
   RecoilISMaxPitchLimit=375
   RecoilISMinPitchLimit=65460
   JoggingRecoilModifier=1.200000
   WalkingRecoilModifier=1.100000
   IronSightMeshFOVCompensationScale=1.600000
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_SWAT'
   WeaponUpgrades(1)=(IncrementDamage=1.200000)
   WeaponUpgrades(2)=(IncrementWeight=2,IncrementDamage=1.400000)
   WeaponUpgrades(3)=(IncrementWeight=3,IncrementDamage=1.600000)
   FiringStatesArray(1)="WeaponBurstFiring"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_AssaultRifle'
   WeaponProjectiles(1)=Class'kfgamecontent.KFProj_Bullet_AssaultRifle'
   FireInterval(0)=0.067000
   FireInterval(1)=0.067000
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.010000
   Spread(1)=0.010000
   InstantHitDamage(0)=25.000000
   InstantHitDamage(1)=25.000000
   InstantHitDamage(2)=()
   InstantHitDamage(3)=24.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_MP5RAS'
   InstantHitDamageTypes(1)=Class'kfgamecontent.KFDT_Ballistic_MP5RAS'
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_MP5RAS'
   FireOffset=(X=30.000000,Y=4.500000,Z=-5.000000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_SMGBase:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
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
   ItemName="MP5RAS SMG"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_SMGBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_SMGBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_SMG_MP5RAS"
   ObjectArchetype=KFWeap_SMGBase'KFGame.Default__KFWeap_SMGBase'
}
