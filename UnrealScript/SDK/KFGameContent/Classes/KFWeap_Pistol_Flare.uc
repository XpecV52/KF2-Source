//=============================================================================
// KFWeap_Pistol_Flare
//=============================================================================
// A pistol that fires napalm rounds
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================

class KFWeap_Pistol_Flare extends KFWeap_PistolBase;

static simulated event EFilterTypeUI GetAltTraderFilter()
{
    return FT_Flame;
}

defaultproperties
{
	// Content
	PackageKey="FlareGun"
	FirstPersonMeshName="WEP_1P_FlareGun_MESH.Wep_1stP_FlareGun_Rig"
	FirstPersonAnimSetNames(0)="WEP_1P_FlareGun_ANIM.Wep_1stP_FlareGun_Anim"
	PickupMeshName="WEP_3P_FlareGun_MESH.Wep_FlareGun_Pickup"
	AttachmentArchetypeName="WEP_FlareGun_ARCH.Wep_FlareGun_3P"
	MuzzleFlashTemplateName="WEP_FlareGun_ARCH.Wep_Flaregun_MuzzleFlash"

	Begin Object Name=FirstPersonMesh
		AnimTreeTemplate=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Master_Revolver'
	End Object

   	// Position and FOV
   	PlayerViewOffset=(X=15.0,Y=14,Z=-6)
	IronSightPosition=(X=4,Y=0,Z=0)
	MeshFOV=60
	MeshIronSightFOV=55
    PlayerIronSightFOV=77

   	// Depth of field
	DOF_FG_FocalRadius=40
	DOF_FG_MaxNearBlurSize=3.5

	// Ammo
	MagazineCapacity[0]=6
	SpareAmmoCapacity[0]=186
	InitialSpareMags[0]=15
	AmmoPickupScale[0]=2.0
	bCanBeReloaded=true
	bReloadFromMagazine=true

	// Recoil
	maxRecoilPitch=400
	minRecoilPitch=350
	maxRecoilYaw=125
	minRecoilYaw=-125
	RecoilRate=0.08
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=900
	RecoilMinPitchLimit=65035
	RecoilISMaxYawLimit=50
	RecoilISMinYawLimit=65485
	RecoilISMaxPitchLimit=400
	RecoilISMinPitchLimit=65485
	RecoilBlendOutRatio=0.75
	IronSightMeshFOVCompensationScale=1.5

	// DEFAULT_FIREMODE
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_Projectile
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_FlareGun'
	FireInterval(DEFAULT_FIREMODE)=+0.2
	InstantHitDamage(DEFAULT_FIREMODE)=40.0
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Fire_FlareGun'
	Spread(DEFAULT_FIREMODE)=0.015
	FireOffset=(X=20,Y=4.0,Z=-3)

	// ALT_FIREMODE
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_None

	// BASH_FIREMODE
	InstantHitDamage(BASH_FIREMODE)=22
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_FlareGun'

	// Fire Effects
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_Flare_Gun.Play_WEP_Flare_Gun_Fire_3P', FirstPersonCue=AkEvent'WW_WEP_Flare_Gun.Play_WEP_Flare_Gun_Fire_1P')
	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_Flare_Gun.Play_WEP_Flare_Gun_DryFire'

	// Inventory
	InventorySize=2
	GroupPriority=15
	bCanThrow=true
	bDropOnDeath=true
	WeaponSelectTexture=Texture2D'wep_ui_flaregun_tex.UI_WeaponSelect_Flaregun'
	bIsBackupWeapon=false
	DualClass=class'KFWeap_Pistol_DualFlare'
    AssociatedPerkClasses(0)=class'KFPerk_Firebug'
    AssociatedPerkClasses(1)=class'KFPerk_Gunslinger'
    AssociatedPerkClasses(2)=class'KFPerk_Sharpshooter'

	// Attachments
	bHasIronSights=true
	bHasFlashlight=true

	// Hammer lock control
	bHasFireLastAnims = true
	BonesToLockOnEmpty = (RW_Hammer)

	// Revolver
	bRevolver=true
	CylinderRotInfo=(Inc=-60.0, Time=0.0175/*about 0.07 in the anim divided by ratescale of 4*/)

	// Weapon Upgrade stat boosts
	WeaponUpgrades[1]=(IncrementDamage=1.25f,IncrementWeight=0)
	WeaponUpgrades[2]=(IncrementDamage=1.5f,IncrementWeight=1)
	WeaponUpgrades[3]=(IncrementDamage=1.75f,IncrementWeight=2)
}

