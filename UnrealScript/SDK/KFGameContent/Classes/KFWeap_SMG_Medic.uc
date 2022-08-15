//=============================================================================
// KFWeap_SMG_Medic
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Greg Felber 7/31/2014
//=============================================================================

class KFWeap_SMG_Medic extends KFWeap_MedicBase;

/*********************************************************************************************
 * @name	Trader
 *********************************************************************************************/

/** Returns trader filter index based on weapon type */
static simulated event EFilterTypeUI GetTraderFilter()
{
	return FT_SMG;
}

defaultproperties
{
	// Healing charge
    HealAmount=30
	HealAmmoCost=50
	HealFullRechargeSeconds=15

	// Inventory
	InventorySize=3
	GroupPriority=50
	WeaponSelectTexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_MedicSMG'
	SecondaryAmmoTexture=Texture2D'UI_SecondaryAmmo_TEX.MedicDarts'

    // FOV
    MeshFOV=81
	MeshIronSightFOV=64
    PlayerIronSightFOV=70

	// Zooming/Position
	IronSightPosition=(X=8,Y=0,Z=0)
	PlayerViewOffset=(X=22,Y=10,Z=-4.5)

	Begin Object Name=FirstPersonMesh
		SkeletalMesh=SkeletalMesh'WEP_1P_Medic_SMG_MESH.Wep_1stP_Medic_SMG_Rig'
		AnimSets(0)=AnimSet'WEP_1P_Medic_SMG_ANIM.Wep_1stP_Medic_SMG_Anim'
	End Object

	Begin Object Name=StaticPickupComponent
		StaticMesh=StaticMesh'WEP_3P_Pickups_MESH.Wep_Medic_SMG_Pickup'
	End Object

	AttachmentArchetype=KFWeaponAttachment'WEP_Medic_SMG_ARCH.Wep_Medic_SMG_3P'
	//SpectatorWeaponArchetype=KFWeaponAttachment'WEP_Medic_SMG_ARCH.Wep_Medic_SMG_3P'

	// Ammo
	MagazineCapacity[0]=40
	MaxSpareAmmo[0]=320
	InitialSpareMags[0]=3
	bCanBeReloaded=true
	bReloadFromMagazine=true

	// Recoil
	maxRecoilPitch=100
	minRecoilPitch=75
	maxRecoilYaw=75
	minRecoilYaw=-75
	RecoilRate=0.07
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=900
	RecoilMinPitchLimit=65035
	RecoilISMaxYawLimit=75
	RecoilISMinYawLimit=65460
	RecoilISMaxPitchLimit=375
	RecoilISMinPitchLimit=65460
	IronSightMeshFOVCompensationScale=1.5

	// DEFAULT_FIREMODE
	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletAuto'
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponFiring
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_Bullet_AssaultRifle'
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Ballistic_SMG_Medic'
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_SMG_Medic'
	FireInterval(DEFAULT_FIREMODE)=+.075 // 800 RPM
	Spread(DEFAULT_FIREMODE)=0.007
	InstantHitDamage(DEFAULT_FIREMODE)=15.0
	FireOffset=(X=30,Y=4.5,Z=-5)

	// BASH_FIREMODE
	InstantHitDamage(BASH_FIREMODE)=15.0

	// Fire Effects
	MuzzleFlashTemplate=KFMuzzleFlash'WEP_Medic_SMG_ARCH.Wep_Medic_SMG_MuzzleFlash'
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_MedicSMG.Play_SA_MedicSMG_Fire_3P_Loop', FirstPersonCue=AkEvent'WW_WEP_SA_MedicSMG.Play_SA_MedicSMG_Fire_1P_Loop')
	WeaponFireSnd(ALTFIRE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_MedicSMG.Play_SA_MedicSMG_Fire_3P_Single', FirstPersonCue=AkEvent'WW_WEP_SA_MedicSMG.Play_SA_MedicSMG_Fire_1P_Single')
	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_MedicSMG.Play_SA_MedicSMG_Handling_DryFire'
	WeaponDryFireSnd(ALTFIRE_FIREMODE)=AkEvent'WW_WEP_SA_MedicDart.Play_WEP_SA_Medic_Dart_DryFire'

	// Advanced (High RPM) Fire Effects
	bLoopingFireAnim(DEFAULT_FIREMODE)=true
	bLoopingFireSnd(DEFAULT_FIREMODE)=true
	WeaponFireLoopEndSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_MedicSMG.Play_SA_MedicSMG_Fire_3P_EndLoop', FirstPersonCue=AkEvent'WW_WEP_SA_MedicSMG.Play_SA_MedicSMG_Fire_1P_EndLoop')
	SingleFireMode=ALTFIRE_FIREMODE

	// Attachments
	bHasIronSights=true
	bHasFlashlight=true

	AssociatedPerkClass=class'KFPerk_FieldMedic'
}
