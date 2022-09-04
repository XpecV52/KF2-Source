//=============================================================================
// KFWeap_Pistol_ChiappaRhino
//=============================================================================
// A Chiappa Rhino pistol
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================

class KFWeap_Pistol_ChiappaRhino extends KFWeap_PistolBase;

defaultproperties
{
   PackageKey="ChiappaRhino"
   FirstPersonMeshName="WEP_1P_ChiappaRhino_MESH.Wep_1stP_ChiappaRhino_Rig"
   FirstPersonAnimSetNames(0)="WEP_1P_ChiappaRhino_ANIM.WEP_1stP_ChiappaRhino_Anim"
   PickupMeshName="WEP_3P_ChiappaRhino_MESH.Wep_3rdP_ChiappaRhino_Pickup"
   AttachmentArchetypeName="WEP_ChiappaRhino_ARCH.Wep_ChiappaRhino_3P"
   MuzzleFlashTemplateName="WEP_ChiappaRhino_ARCH.Wep_ChiappaRhino_MuzzleFlash"
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   bHasFireLastAnims=True
   InventorySize=2
   MagazineCapacity(0)=6
   PenetrationPower(0)=2.000000
   PenetrationPower(1)=()
   MeshIronSightFOV=77.000000
   PlayerIronSightFOV=77.000000
   IronSightPosition=(X=11.000000,Y=0.000000,Z=0.000000)
   DOF_FG_FocalRadius=38.000000
   DOF_FG_MaxNearBlurSize=3.500000
   GroupPriority=22.000000
   WeaponSelectTexture=Texture2D'wep_ui_chiapparhino_tex.UI_WeaponSelect_ChiappaRhinos'
   DualClass=Class'kfgamecontent.KFWeap_Pistol_ChiappaRhinoDual'
   SpareAmmoCapacity(0)=114
   InitialSpareMags(0)=7
   AmmoPickupScale(0)=2.000000
   WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Medium_Recoil'
   IdleFidgetAnims(3)="Guncheck_v4"
   FireSightedAnims(1)="Shoot_Iron2"
   FireSightedAnims(2)="Shoot_Iron3"
   BonesToLockOnEmpty(0)="RW_Hammer"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_ChiappaRhinos.Play_WEP_ChiappaRhinos_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_ChiappaRhinos.Play_WEP_ChiappaRhinos_Fire_1P')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_ChiappaRhinos.Play_WEP_ChiappaRhinos_DryFire'
   PlayerViewOffset=(X=14.000000,Y=10.000000,Z=-4.000000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_PistolBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_PistolBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Pistol_ChiappaRhino:MeleeHelper_0'
   maxRecoilPitch=500
   minRecoilPitch=450
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
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_Gunslinger'
   WeaponUpgrades(1)=(Stats=((Stat=EWUS_Damage0,Scale=1.250000),(Add=1)))
   WeaponUpgrades(2)=(Stats=((Stat=EWUS_Damage0,Scale=1.400000),(Add=2)))
   FiringStatesArray(0)="WeaponSingleFiring"
   FiringStatesArray(1)="WeaponSingleFiring"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=EWFT_None
   WeaponFireTypes(2)=()
   WeaponFireTypes(3)=()
   WeaponFireTypes(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_Pistol_ChiappaRhino'
   FireInterval(0)=0.175000
   FireInterval(1)=()
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.010000
   InstantHitDamage(0)=70.000000
   InstantHitDamage(1)=()
   InstantHitDamage(2)=()
   InstantHitDamage(3)=24.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_ChiappaRhino'
   InstantHitDamageTypes(1)=()
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_ChiappaRhino'
   FireOffset=(X=20.000000,Y=4.000000,Z=-3.000000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_PistolBase:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master'
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
   ItemName="Rhino"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_PistolBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_PistolBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Pistol_ChiappaRhino"
   ObjectArchetype=KFWeap_PistolBase'KFGame.Default__KFWeap_PistolBase'
}