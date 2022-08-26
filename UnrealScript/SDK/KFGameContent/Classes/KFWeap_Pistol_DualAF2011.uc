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

	BarrelOffset=(X=10.0,Y=0,Z=0)

	Begin Object Name=FirstPersonMesh
		SkeletalMesh=SkeletalMesh'wep_1p_dual_af2001_mesh.Wep_1stP_Dual_AF2001_Rig'
		AnimSets(0)=AnimSet'wep_1p_dual_af2001_anim.Wep_1stP_Dual_AF2001_Anim'
	End Object

	Begin Object Name=StaticPickupComponent
		StaticMesh=StaticMesh'WEP_3P_AF2001_MESH.Wep_3rdP_AF2001_Pickup'
	End Object

	AttachmentArchetype=KFWeapAttach_DualBase'WEP_Dual_AF2001_ARCH.Wep_Dual_AF2001_3P'
	MuzzleFlashTemplate=KFMuzzleFlash'WEP_Dual_AF2001_ARCH.Wep_Dual_AF2001_MuzzleFlash'

	FireOffset=(X=17,Y=4.0,Z=-2.25)
	LeftFireOffset=(X=17,Y=-4,Z=-2.25)

	// Zooming/Position
	IronSightPosition=(X=-1,Y=0,Z=0)
	PlayerViewOffset=(X=9,Y=0,Z=-5)
	QuickWeaponDownRotation=(Pitch=-8192,Yaw=0,Roll=0)

	SingleClass=class'KFWeap_Pistol_AF2011'

	// FOV
	MeshFOV=86
	MeshIronSightFOV=77
    PlayerIronSightFOV=77

	// Depth of field
	DOF_FG_FocalRadius=38
	DOF_FG_MaxNearBlurSize=3.5

	// Ammo
	MagazineCapacity[0]=32 // twice as much as single
	SpareAmmoCapacity[0]=272
	InitialSpareMags[0]=2
	AmmoPickupScale[0]=1.0
	bCanBeReloaded=true
	bReloadFromMagazine=true

	// Recoil
	maxRecoilPitch=650  //650  //550
	minRecoilPitch=550  //550  //550
	maxRecoilYaw=550 //150
	minRecoilYaw=-550 //150
	RecoilRate=0.09 //0.07
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=1250
	RecoilMinPitchLimit=65035
	RecoilISMaxYawLimit=50
	RecoilISMinYawLimit=65485
	RecoilISMaxPitchLimit=500
	RecoilISMinPitchLimit=65485

	// DEFAULT_FIREMODE
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_Projectile
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_Bullet_PistolAF2011'
	FireInterval(DEFAULT_FIREMODE)=+0.13 // about twice as fast as single
	InstantHitDamage(DEFAULT_FIREMODE)=53
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Ballistic_AF2011'
	PenetrationPower(DEFAULT_FIREMODE)=1.5
	NumPojectiles(DEFAULT_FIREMODE) = 2
	Spread(DEFAULT_FIREMODE)=0.01
    AmmoCost(DEFAULT_FIREMODE)=2

	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletSingle'

	// ALTFIRE_FIREMODE
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)= EWFT_Projectile
	WeaponProjectiles(ALTFIRE_FIREMODE)=class'KFProj_Bullet_PistolAF2011'
	FireInterval(ALTFIRE_FIREMODE)=+0.13 // about twice as fast as single
	InstantHitDamage(ALTFIRE_FIREMODE)=53
	InstantHitDamageTypes(ALTFIRE_FIREMODE)=class'KFDT_Ballistic_AF2011'
	PenetrationPower(ALTFIRE_FIREMODE)=1.5
	NumPojectiles(ALTFIRE_FIREMODE) = 2
	Spread(ALTFIRE_FIREMODE)=0.01
    AmmoCost(ALTFIRE_FIREMODE) = 2

	FireModeIconPaths(ALTFIRE_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletSingle'

	// BASH_FIREMODE
	InstantHitDamage(BASH_FIREMODE)=24
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_AF2011'

	// Fire Effects
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_AF2011.Play_WEP_AF2011_Fire_3P', FirstPersonCue=AkEvent'WW_WEP_AF2011.Play_WEP_AF2011_Fire_1P') //@TODO: Replace me
	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_DesertEagle.Play_WEP_SA_DesertEagle_Handling_DryFire' //@TODO: Replace me

	WeaponFireSnd(ALTFIRE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_AF2011.Play_WEP_AF2011_Fire_3P', FirstPersonCue=AkEvent'WW_WEP_AF2011.Play_WEP_AF2011_Fire_1P') //@TODO: Replace me
	WeaponDryFireSnd(ALTFIRE_FIREMODE)=AkEvent'WW_WEP_SA_DesertEagle.Play_WEP_SA_DesertEagle_Handling_DryFire' //@TODO: Replace me

	// Attachments
	bHasIronSights=true
	bHasFlashlight=false

	// Inventory
	InventorySize=6
	GroupPriority=45
	bCanThrow=true
	bDropOnDeath=true
	WeaponSelectTexture=Texture2D'WEP_UI_AF2001_TEX.UI_WeaponSelect_DualAF2011'
	bIsBackupWeapon=false
	AssociatedPerkClasses(0)=class'KFPerk_Gunslinger'

    BonesToLockOnEmpty=(RW_Bolt, RW_Bullets1)
    BonesToLockOnEmpty_L=(LW_Bolt, LW_Bullets1)

    bHasFireLastAnims=true
}

