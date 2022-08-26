//=============================================================================
// KFWeap_Pistol_DualAF2011
//=============================================================================
// A set of AF2011-A1 pistols
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================

class KFWeap_Pistol_DualAF2011 extends KFWeap_DualBase;

var vector BarrelOffset;
var(Weapon) array<byte>	NumPojectiles;

simulated function KFProjectile SpawnProjectile(class<KFProjectile> KFProjClass, vector RealStartLoc, vector AimDir)
{
	local int i;

	if (CurrentFireMode == GRENADE_FIREMODE)
	{
		return Super.SpawnProjectile(KFProjClass, RealStartLoc, AimDir);
	}

	for (i = 0; i < GetNumProjectilesToFire(CurrentFireMode); i++)
	{
		Super.SpawnProjectile(KFProjClass, RealStartLoc + BarrelOffset * float(i), AimDir);
	}

	return None;
}

simulated function byte GetNumProjectilesToFire(byte FireModeNum)
{
	return NumPojectiles[CurrentFireMode];
}

defaultproperties
{
   BarrelOffset=(X=10.000000,Y=0.000000,Z=0.000000)
   NumPojectiles(0)=2
   NumPojectiles(1)=2
   LeftFireOffset=(X=17.000000,Y=-4.000000,Z=-2.250000)
   SingleClass=Class'kfgamecontent.KFWeap_Pistol_AF2011'
   BonesToLockOnEmpty_L(1)="LW_Bullets1"
   InventorySize=6
   MagazineCapacity(0)=32
   bHasIronSights=True
   bCanBeReloaded=True
   bReloadFromMagazine=True
   bHasFireLastAnims=True
   PenetrationPower(0)=1.500000
   PenetrationPower(1)=1.500000
   MeshIronSightFOV=77.000000
   PlayerIronSightFOV=77.000000
   IronSightPosition=(X=-1.000000,Y=0.000000,Z=0.000000)
   QuickWeaponDownRotation=(Pitch=-8192,Yaw=0,Roll=0)
   DOF_FG_FocalRadius=38.000000
   DOF_FG_MaxNearBlurSize=3.500000
   GroupPriority=45.000000
   WeaponSelectTexture=Texture2D'WEP_UI_AF2001_TEX.UI_WeaponSelect_DualAF2011'
   AmmoCost(0)=2
   AmmoCost(1)=2
   SpareAmmoCapacity(0)=272
   InitialSpareMags(0)=2
   BonesToLockOnEmpty(1)="RW_Bullets1"
   WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_AF2011.Play_WEP_AF2011_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_AF2011.Play_WEP_AF2011_Fire_1P')
   WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_AF2011.Play_WEP_AF2011_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_AF2011.Play_WEP_AF2011_Fire_1P')
   WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_DesertEagle.Play_WEP_SA_DesertEagle_Handling_DryFire'
   WeaponDryFireSnd(1)=AkEvent'WW_WEP_SA_DesertEagle.Play_WEP_SA_DesertEagle_Handling_DryFire'
   PlayerViewOffset=(X=9.000000,Y=0.000000,Z=-5.000000)
   AttachmentArchetype=KFWeapAttach_DualBase'WEP_Dual_AF2001_ARCH.Wep_Dual_AF2001_3P'
   Begin Object Class=KFMeleeHelperWeapon Name=MeleeHelper_0 Archetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_DualBase:MeleeHelper_0'
      MaxHitRange=175.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperWeapon'KFGame.Default__KFWeap_DualBase:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperWeapon'kfgamecontent.Default__KFWeap_Pistol_DualAF2011:MeleeHelper_0'
   MuzzleFlashTemplate=KFMuzzleFlash'WEP_Dual_AF2001_ARCH.Wep_Dual_AF2001_MuzzleFlash'
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
   WeaponProjectiles(0)=Class'kfgamecontent.KFProj_Bullet_PistolAF2011'
   WeaponProjectiles(1)=Class'kfgamecontent.KFProj_Bullet_PistolAF2011'
   FireInterval(0)=0.130000
   FireInterval(1)=0.130000
   FireInterval(2)=()
   FireInterval(3)=()
   FireInterval(4)=()
   Spread(0)=0.010000
   Spread(1)=0.010000
   InstantHitDamage(0)=53.000000
   InstantHitDamage(1)=53.000000
   InstantHitDamage(2)=()
   InstantHitDamage(3)=24.000000
   InstantHitDamageTypes(0)=Class'kfgamecontent.KFDT_Ballistic_AF2011'
   InstantHitDamageTypes(1)=Class'kfgamecontent.KFDT_Ballistic_AF2011'
   InstantHitDamageTypes(2)=None
   InstantHitDamageTypes(3)=Class'kfgamecontent.KFDT_Bludgeon_AF2011'
   FireOffset=(X=17.000000,Y=4.000000,Z=-2.250000)
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonMesh Archetype=KFSkeletalMeshComponent'KFGame.Default__KFWeap_DualBase:FirstPersonMesh'
      SkeletalMesh=SkeletalMesh'wep_1p_dual_af2001_mesh.Wep_1stP_Dual_AF2001_Rig'
      AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Dual_Animtree_Master'
      AnimSets(0)=AnimSet'wep_1p_dual_af2001_anim.Wep_1stP_Dual_AF2001_Anim'
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
   ItemName="Dual AF2011-A1"
   Begin Object Class=StaticMeshComponent Name=StaticPickupComponent Archetype=StaticMeshComponent'KFGame.Default__KFWeap_DualBase:StaticPickupComponent'
      StaticMesh=StaticMesh'WEP_3P_AF2001_MESH.Wep_3rdP_AF2001_Pickup'
      ReplacementPrimitive=None
      CastShadow=False
      Name="StaticPickupComponent"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFWeap_DualBase:StaticPickupComponent'
   End Object
   DroppedPickupMesh=StaticPickupComponent
   PickupFactoryMesh=StaticPickupComponent
   Name="Default__KFWeap_Pistol_DualAF2011"
   ObjectArchetype=KFWeap_DualBase'KFGame.Default__KFWeap_DualBase'
}
