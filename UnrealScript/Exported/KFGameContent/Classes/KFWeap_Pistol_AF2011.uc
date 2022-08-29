//=============================================================================
// KFWeap_Pistol_AF2011
//=============================================================================
// An AF2011 pistol
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================

class KFWeap_Pistol_AF2011 extends KFWeap_PistolBase;

var vector BarrelOffset;

simulated function KFProjectile SpawnProjectile(class<KFProjectile> KFProjClass, vector RealStartLoc, vector AimDir)
{
	if (CurrentFireMode == GRENADE_FIREMODE)
	{
		return Super.SpawnProjectile(KFProjClass, RealStartLoc, AimDir);
	}

	Super.SpawnProjectile(KFProjClass, RealStartLoc + BarrelOffset / 2.f, AimDir);
	Super.SpawnProjectile(KFProjClass, RealStartLoc - BarrelOffset / 2.f, AimDir);

	return None;
}

defaultproperties
{
   BarrelOffset=(X=10.000000,Y=0.000000,Z=0.000000)
   PackageKey="AF2001"
   FirstPersonMeshName="wep_1p_af2001_mesh.Wep_1stP_AF2001_Rig"
   FirstPersonAnimSetNames(0)="wep_1p_af2001_anim.Wep_1stP_AF2001_Anim"
   PickupMeshName="WEP_3P_AF2001_MESH.Wep_3rdP_AF2001_Pickup"
   AttachmentArchetypeName="WEP_AF2001_ARCH.Wep_AF2001_3P"
   MuzzleFlashTemplateName="WEP_AF2001_ARCH.Wep_AF2001_MuzzleFlash"
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   bHasFireLastAnims=True
   InventorySize=3
   MagazineCapacity(0)=16
   PenetrationPower(0)=1.500000
   PenetrationPower(1)=()
   MeshIronSightFOV=77.000000
   PlayerIronSightFOV=77.000000
   IronSightPosition=(X=11.000000,Y=0.000000,Z=0.000000)
   DOF_FG_FocalRadius=38.000000
   DOF_FG_MaxNearBlurSize=3.500000
   GroupPriority=25.000000
   WeaponSelectTexture=Texture2D'WEP_UI_AF2001_TEX.UI_WeaponSelect_AF2011'
   DualClass=Class'kfgamecontent.KFWeap_Pistol_DualAF2011'
   AmmoCost(0)=2
   AmmoCost(1)=()
   SpareAmmoCapacity(0)=288
   InitialSpareMags(0)=4
   AmmoPickupScale(0)=2.000000
   WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Medium_Recoil'
   IdleFidgetAnims(3)="Guncheck_v4"
   FireSightedAnims(1)="Shoot_Iron2"
   FireSightedAnims(2)="Shoot_Iron3"
   BonesToLockOnEmpty(1)="RW_Bullets1"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_AF2011.Play_WEP_AF2011_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_AF2011.Play_WEP_AF2011_Fire_1P')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_DesertEagle.Play_WEP_SA_DesertEagle_Handling_DryFire'
   PlayerViewOffset=(X=14.000000,Y=10.000000,Z=-4.000000)
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_PistolBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_PistolBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Pistol_AF2011:MeleeHelper_0'
   maxRecoilPitch=650
   minRecoilPitch=550
   maxRecoilYaw=550
   minRecoilYaw=-550
   RecoilMaxYawLimit=500
   RecoilMinYawLimit=65035
   RecoilMaxPitchLimit=1250
   RecoilMinPitchLimit=65035
   RecoilISMaxYawLimit=50
   RecoilISMinYawLimit=65485
   RecoilISMaxPitchLimit=500
   RecoilISMinPitchLimit=65485
   AssociatedPerkClasses(0)=Class'KFGame.KFPerk_Gunslinger'
   WeaponUpgrades(1)=(Stats=((Stat=EWUS_Damage0,Scale=1.125000),(Add=1)))
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
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_PistolAF2011'
   FireInterval(0)=0.189800
   FireInterval(1)=()
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.010000
   InstantHitDamage(0)=53.000000
   InstantHitDamage(1)=()
   InstantHitDamage(2)=()
   InstantHitDamage(3)=22.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_AF2011'
   InstantHitDamageTypes(1)=()
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_AF2011'
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
   ItemName="AF2011-A1"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_PistolBase:StaticPickupComponent'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_PistolBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Pistol_AF2011"
   ObjectArchetype=KFWeap_PistolBase'KFGame.Default__KFWeap_PistolBase'
}
