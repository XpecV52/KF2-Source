//=============================================================================
// KFWeap_Pistol_Dual9mm
//=============================================================================
// A set of 9mm Beretta Pistols
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson and Jeff Robinson
//=============================================================================

class KFWeap_Pistol_Dual9mm extends KFWeap_DualBase;

defaultproperties
{
	Begin Object Name=FirstPersonMesh
		SkeletalMesh=SkeletalMesh'WEP_1P_Dual_9MM_MESH.Wep_1stP_Dual_9mm_Rig'
		AnimSets(0)=AnimSet'WEP_1P_Dual_9MM_ANIM.Wep_1stP_Dual_9MM_Anim'
	End Object

	Begin Object Name=StaticPickupComponent
		StaticMesh=StaticMesh'WEP_3P_Pickups_MESH.Wep_9mm_Pickup'
	End Object

	AttachmentArchetype=KFWeapAttach_DualBase'WEP_Dual_9MM_ARCH.WEP_Dual_9MM_3P'

	MuzzleFlashTemplate=KFMuzzleFlash'wep_dual_9mm_arch.Wep_Dual_9MM_MuzzleFlash'
	LeftMuzzleFlashTemplate=KFMuzzleFlash'WEP_Dual_9MM_ARCH.Wep_Dual_9MM_MuzzleFlash_L'

	FireOffset=(X=17,Y=4.0,Z=-2.25)
	LeftFireOffset=(X=17,Y=-4,Z=-2.25)

	// Zooming/Position
	IronSightPosition=(X=-3,Y=0,Z=0)
	PlayerViewOffset=(X=5,Y=0,Z=-5)
	QuickWeaponDownRotation=(Pitch=-8192,Yaw=0,Roll=0)

	bCanThrow=true
	bDropOnDeath=true

	SingleClass=class'KFWeap_Pistol_9mm'

	FireInterval(DEFAULT_FIREMODE)=+0.1 // about twice as fast as single

	//// BEGIN COPY FROM KFWEAP_PISTOLBASE
	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletSingle'

	// BASH_FIREMODE
	InstantHitDamage(BASH_FIREMODE)=10.0
	//// END COPY

	//// BEGIN COPY FROM KFWEAP_PISTOL_9MM
	// FOV
	MeshFOV=96
	MeshIronSightFOV=77
    PlayerIronSightFOV=77

	// Depth of field
	DOF_FG_FocalRadius=40
	DOF_FG_MaxNearBlurSize=3.5

	// Ammo
	MagazineCapacity[0]=30 // twice as much as single
	MaxSpareAmmo[0]=225
	InitialSpareMags[0]=7
	AmmoPickupScale[0]=0.5
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
	InstantHitDamage(DEFAULT_FIREMODE)=15.0
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Ballistic_9mm'
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_9mm'
	Spread(DEFAULT_FIREMODE)=0.015

	// ALT_FIREMODE
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_None

	// Fire Effects
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_9mm.Play_WEP_SA_9mm_Fire_Single_M', FirstPersonCue=AkEvent'WW_WEP_SA_9mm.Play_WEP_SA_9mm_Fire_Single_S')
	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_9mm.Play_WEP_SA_9mm_Handling_DryFire'

	// Attachments
	bHasIronSights=true
	bHasFlashlight=true

	AssociatedPerkClass=none

	// Inventory
	InventoryGroup=IG_Secondary
	InventorySize=2
	GroupPriority=20
	UITexture=Texture2D'WEP_UI_Dual_9MM_TEX.UI_WeaponSelect_Dual9mm'
	FilterTypeUI=FT_Pistol
	bIsBackupWeapon=true
	//// END COPY 9MM

	// Trader
    EffectiveRange=50

}

