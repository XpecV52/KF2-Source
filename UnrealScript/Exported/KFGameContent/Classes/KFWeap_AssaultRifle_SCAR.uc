//=============================================================================
// KFWeap_AssaultRifle_SCAR
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFWeap_AssaultRifle_SCAR extends KFWeap_RifleBase;

defaultproperties
{
   PackageKey="SCAR"
   FirstPersonMeshName="WEP_1P_SCAR_MESH.Wep_1stP_SCAR_Rig"
   FirstPersonAnimSetNames(0)="WEP_1P_SCAR_ANIM.Wep_1stP_SCAR_Anim"
   PickupMeshName="WEP_3P_SCAR_MESH.Wep_SCAR_Pickup"
   AttachmentArchetypeName="WEP_SCAR_ARCH.Wep_SCAR_3P"
   MuzzleFlashTemplateName="WEP_SCAR_ARCH.Wep_Scar_MuzzleFlash"
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletAuto'
   FireModeIconPaths(1)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletSingle'
   SingleFireSoundIndex=1
   InventorySize=6
   MeshFOV=70.000000
   MeshIronSightFOV=20.000000
   PlayerIronSightFOV=70.000000
   IronSightPosition=(X=20.000000,Y=0.000000,Z=0.000000)
   DOF_FG_FocalRadius=150.000000
   GroupPriority=100.000000
   WeaponSelectTexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_SCAR'
   MagazineCapacity(0)=20
   SpareAmmoCapacity(0)=340
   InitialSpareMags(0)=4
   bLoopingFireAnim(0)=True
   bLoopingFireSnd(0)=True
   FireSightedAnims(1)="Shoot_Iron2"
   FireSightedAnims(2)="Shoot_Iron3"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_SA_SCAR.Play_WEP_SA_SCAR_Fire_Loop_M',FirstPersonCue=AkEvent'WW_WEP_SA_SCAR.Play_WEP_SA_SCAR_Fire_Loop_S')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_SA_SCAR.Play_WEP_SA_SCAR_Single_Fire_M',FirstPersonCue=AkEvent'WW_WEP_SA_SCAR.Play_WEP_SA_SCAR_Single_Fire_S')
   WeaponFireLoopEndSnd(0)=(DefaultCue=AkEvent'WW_WEP_SA_SCAR.Play_WEP_SA_SCAR_Fire_Loop_End_M',FirstPersonCue=AkEvent'WW_WEP_SA_SCAR.Play_WEP_SA_SCAR_Fire_Loop_End_S')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_SCAR.Play_WEP_SA_SCAR_Handling_DryFire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_SA_SCAR.Play_WEP_SA_SCAR_Handling_DryFire'
   PlayerViewOffset=(X=18.000000,Y=9.000000,Z=-3.500000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_RifleBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_RifleBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_AssaultRifle_SCAR:MeleeHelper_0'
   maxRecoilPitch=150
   minRecoilPitch=125
   maxRecoilYaw=125
   minRecoilYaw=-125
   RecoilRate=0.085000
   RecoilMaxYawLimit=500
   RecoilMinYawLimit=65035
   RecoilMaxPitchLimit=900
   RecoilMinPitchLimit=65035
   RecoilISMaxYawLimit=75
   RecoilISMinYawLimit=65460
   RecoilISMaxPitchLimit=375
   RecoilISMinPitchLimit=65460
   IronSightMeshFOVCompensationScale=4.000000
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_Commando'
   WeaponUpgrades(1)=(Stats=((Stat=EWUS_Damage0,Scale=1.220000),(Stat=EWUS_Damage1,Scale=1.220000),(Add=1)))
   FiringStatesArray(1)="WeaponSingleFiring"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_AssaultRifle'
   WeaponProjectiles(1)=Class'kfgamecontent.KFProj_Bullet_AssaultRifle'
   FireInterval(0)=0.096000
   FireInterval(1)=0.100000
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.007000
   Spread(1)=0.007000
   InstantHitDamage(0)=55.000000
   InstantHitDamage(1)=55.000000
   InstantHitDamage(2)=()
   InstantHitDamage(3)=26.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_SCAR'
   InstantHitDamageTypes(1)=Class'kfgamecontent.KFDT_Ballistic_SCAR'
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_SCAR'
   FireOffset=(X=30.000000,Y=4.500000,Z=-5.000000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_RifleBase:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
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
   ItemName="SCAR-H Assault Rifle"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_RifleBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_RifleBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_AssaultRifle_SCAR"
   ObjectArchetype=KFWeap_RifleBase'KFGame.Default__KFWeap_RifleBase'
}
