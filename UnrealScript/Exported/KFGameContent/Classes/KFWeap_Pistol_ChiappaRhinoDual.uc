//=============================================================================
// KFWeap_Pistol_ChiappaRhinoDual
//=============================================================================
// A dual set of Chiappa Rhino pistols
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================

class KFWeap_Pistol_ChiappaRhinoDual extends KFWeap_DualBase;

defaultproperties
{
   LeftFireOffset=(X=17.000000,Y=-4.000000,Z=-2.250000)
   SingleClass=Class'kfgamecontent.KFWeap_Pistol_ChiappaRhino'
   BonesToLockOnEmpty_L(0)="LW_Hammer"
   PackageKey="Dual_ChiappaRhino"
   FirstPersonMeshName="WEP_1P_Dual_ChiappaRhino_MESH.Wep_1stP_Dual_ChiappaRhino_Rig"
   FirstPersonAnimSetNames(0)="WEP_1P_Dual_ChiappaRhino_ANIM.WEP_1stP_Dual_ChiappaRhino_Anim"
   PickupMeshName="WEP_3P_Dual_ChiappaRhino_MESH.Wep_3rdP_ChiappaRhino_Pickup"
   AttachmentArchetypeName="WEP_Dual_ChiappaRhino_ARCH.Wep_Dual_ChiappaRhino_3P"
   MuzzleFlashTemplateName="WEP_Dual_ChiappaRhino_ARCH.Wep_Dual_ChiappaRhino_MuzzleFlash"
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   bHasFireLastAnims=True
   InventorySize=4
   MagazineCapacity(0)=12
   PenetrationPower(0)=2.000000
   PenetrationPower(1)=2.000000
   MeshIronSightFOV=77.000000
   PlayerIronSightFOV=77.000000
   IronSightPosition=(X=-1.000000,Y=0.000000,Z=0.000000)
   QuickWeaponDownRotation=(Pitch=-8192,Yaw=0,Roll=0)
   DOF_FG_FocalRadius=38.000000
   DOF_FG_MaxNearBlurSize=3.500000
   GroupPriority=42.000000
   WeaponSelectTexture=Texture2D'wep_ui_chiapparhino_tex.UI_WeaponSelect_DualChiappaRhinos'
   SpareAmmoCapacity(0)=108
   InitialSpareMags(0)=3
   BonesToLockOnEmpty(0)="RW_Hammer"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_ChiappaRhinos.Play_WEP_ChiappaRhinos_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_ChiappaRhinos.Play_WEP_ChiappaRhinos_Fire_1P')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_ChiappaRhinos.Play_WEP_ChiappaRhinos_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_ChiappaRhinos.Play_WEP_ChiappaRhinos_Fire_1P')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_ChiappaRhinos.Play_WEP_ChiappaRhinos_DryFire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_ChiappaRhinos.Play_WEP_ChiappaRhinos_DryFire'
   PlayerViewOffset=(X=9.000000,Y=0.000000,Z=-5.000000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_DualBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_DualBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Pistol_ChiappaRhinoDual:MeleeHelper_0'
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
   WeaponUpgrades(1)=(Stats=((Stat=EWUS_Damage0,Scale=1.250000),(Stat=EWUS_Damage1,Scale=1.250000),(Add=2)))
   WeaponUpgrades(2)=(Stats=((Stat=EWUS_Damage0,Scale=1.400000),(Stat=EWUS_Damage1,Scale=1.400000),(Add=4)))
   FiringStatesArray(0)="WeaponSingleFiring"
   FiringStatesArray(1)="WeaponSingleFiring"
   FiringStatesArray(2)=()
   FiringStatesArray(3)=()
   FiringStatesArray(4)=()
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=EWFT_Projectile
   WeaponFireTypes(2)=()
   WeaponFireTypes(3)=()
   WeaponFireTypes(4)=()
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_Pistol_ChiappaRhino'
   WeaponProjectiles(1)=Class'kfgamecontent.KFProj_Bullet_Pistol_ChiappaRhino'
   FireInterval(0)=0.100000
   FireInterval(1)=0.100000
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.010000
   Spread(1)=0.010000
   InstantHitDamage(0)=70.000000
   InstantHitDamage(1)=70.000000
   InstantHitDamage(2)=()
   InstantHitDamage(3)=24.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_ChiappaRhino'
   InstantHitDamageTypes(1)=Class'kfgamecontent.KFDT_Ballistic_ChiappaRhino'
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_ChiappaRhino'
   FireOffset=(X=17.000000,Y=4.000000,Z=-2.250000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_DualBase:FirstPersonMesh'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Dual_Animtree_Master'
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
   ItemName="Dual Rhinos"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_DualBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_DualBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Pistol_ChiappaRhinoDual"
   ObjectArchetype=KFWeap_DualBase'KFGame.Default__KFWeap_DualBase'
}
