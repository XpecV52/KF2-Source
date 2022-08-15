//=============================================================================
// KFWeap_Pistol_9mm
//=============================================================================
// An 9mm Beretta Pistol
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFWeap_Pistol_9mm extends KFWeap_PistolBase;

defaultproperties
{
    // FOV
	MeshFOV=96
	MeshIronSightFOV=77
    PlayerIronSightFOV=77

	// Depth of field
	DOF_FG_FocalRadius=40
	DOF_FG_MaxNearBlurSize=3.5

	// Zooming/Position
	PlayerViewOffset=(X=12.0,Y=12,Z=-6)

	Begin Object Name=StaticPickupComponent
		StaticMesh=StaticMesh'WEP_3P_Pickups_MESH.Wep_9mm_Pickup'
	End Object

	Begin Object Name=FirstPersonMesh
		SkeletalMesh=SkeletalMesh'WEP_1P_9MM_MESH.Wep_1stP_9mm_Rig'
		AnimSets(0)=AnimSet'WEP_1P_9MM_ANIM.Wep_1stP_9MM_Anim'
	End Object

	AttachmentArchetype=KFWeaponAttachment'WEP_9MM_ARCH.Wep_9mm_3P'

   	// Zooming/Position
	IronSightPosition=(X=10,Y=0,Z=0)

	// Ammo
	MagazineCapacity[0]=15
	MaxSpareAmmo[0]=195
	InitialSpareMags[0]=6
	bCanBeReloaded=true
	bReloadFromMagazine=true

	// Recoil
	maxRecoilPitch=250
	minRecoilPitch=200
	maxRecoilYaw=100
	minRecoilYaw=-100
	RecoilRate=0.07
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=900
	RecoilMinPitchLimit=65035
	RecoilISMaxYawLimit=50
	RecoilISMinYawLimit=65485
	RecoilISMaxPitchLimit=250
	RecoilISMinPitchLimit=65485

	// DEFAULT_FIREMODE
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_Bullet_Pistol9mm'
	FireInterval(DEFAULT_FIREMODE)=+0.175
	InstantHitDamage(DEFAULT_FIREMODE)=15.0
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Ballistic_9mm'
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_9mm'
	Spread(DEFAULT_FIREMODE)=0.015
	FireOffset=(X=20,Y=4.0,Z=-3)

	// ALT_FIREMODE
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_None

	// Fire Effects
	MuzzleFlashTemplate=KFMuzzleFlash'WEP_9MM_ARCH.Wep_9MM_MuzzleFlash'
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_9mm.Play_WEP_SA_9mm_Fire_Single_M', FirstPersonCue=AkEvent'WW_WEP_SA_9mm.Play_WEP_SA_9mm_Fire_Single_S')
	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_9mm.Play_WEP_SA_9mm_Handling_DryFire'

	// Attachments
	bHasIronSights=true
	bHasFlashlight=true

	AssociatedPerkClass=none

	// Inventory
	InventoryGroup=IG_Secondary
	InventorySize=0
	GroupPriority=15
	bCanThrow=false
	bDropOnDeath=false
	UITexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_9mm'
	FilterTypeUI=FT_Pistol
	bIsBackupWeapon=true

	DualClass=class'KFWeap_Pistol_Dual9mm'

	// Custom animations
	FireSightedAnims=(Shoot_Iron, Shoot_Iron2, Shoot_Iron3)
	IdleFidgetAnims=(Guncheck_v1, Guncheck_v2, Guncheck_v3, Guncheck_v4, Guncheck_v5,Guncheck_v6)
}

