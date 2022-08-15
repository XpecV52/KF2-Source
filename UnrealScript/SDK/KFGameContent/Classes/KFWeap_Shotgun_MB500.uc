//=============================================================================
// KFWeap_Shotgun_MB500
//=============================================================================
// A Mossberg 500 Shotgun
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeap_Shotgun_MB500 extends KFWeap_ShotgunBase;

defaultproperties
{
	// Inventory
	InventorySize=5
	GroupPriority=25
	UITexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_Mossberg'
	FilterTypeUI=FT_Shotgun

    // FOV
	MeshIronSightFOV=52
    PlayerIronSightFOV=70

	// Depth of field
	DOF_FG_FocalRadius=95
	DOF_FG_MaxNearBlurSize=3.5

	// Zooming/Position
	PlayerViewOffset=(X=8.0,Y=8.0,Z=-3.5)
	IronSightPosition=(X=9.5,Y=0,Z=0)

	Begin Object Name=FirstPersonMesh
		SkeletalMesh=SkeletalMesh'WEP_1P_MB500_MESH.Wep_1stP_MB500_Rig'
		AnimSets(0)=AnimSet'WEP_1P_MB500_ANIM.Wep_1st_MB500_Anim_New'
	End Object

	Begin Object Name=StaticPickupComponent
		StaticMesh=StaticMesh'WEP_3P_Pickups_MESH.Wep_MB500_Pickup'
	End Object

	AttachmentArchetype=KFWeaponAttachment'WEP_MB500_ARCH.Wep_MB500_3P'

	// DEFAULT_FIREMODE
	FireModeIconPaths(DEFAULT_FIREMODE)="ui_firemodes_tex.UI_FireModeSelect_ShotgunSingle"
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_Projectile
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_Bullet_Pellet'
	InstantHitDamage(DEFAULT_FIREMODE)=20.0
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Ballistic_MB500'
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_MB500'
	PenetrationPower(DEFAULT_FIREMODE)=2.0
	FireInterval(DEFAULT_FIREMODE)=0.77 // 78 RPM
	FireOffset=(X=30,Y=3,Z=-3)
	// Shotgun
	NumPellets(DEFAULT_FIREMODE)=7

	// ALT_FIREMODE
	FireModeIconPaths(ALTFIRE_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_ShotgunSingle'
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_None

	// Fire Effects
	MuzzleFlashTemplate=KFMuzzleFlash'WEP_MB500_ARCH.Wep_MB500_MuzzleFlash'

	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_MB500.Play_WEP_SA_MB500_Fire_M', FirstPersonCue=AkEvent'WW_WEP_SA_MB500.Play_WEP_SA_MB500_Fire_S')
    WeaponFireSnd(ALTFIRE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_MB500.Play_WEP_SA_MB500_Fire_M', FirstPersonCue=AkEvent'WW_WEP_SA_MB500.Play_WEP_SA_MB500_Fire_S')

    // using M4 dry fire sound. this is intentional.
	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_M4.Play_WEP_SA_M4_Handling_DryFire'
	WeaponDryFireSnd(ALTFIRE_FIREMODE)=AkEvent'WW_WEP_SA_M4.Play_WEP_SA_M4_Handling_DryFire'

	// Attachments
	bHasIronSights=true
	bHasFlashlight=true

	// Ammo
	MagazineCapacity[0]=8
	MaxSpareAmmo[0]=24
	InitialSpareMags[0]=1
	bCanBeReloaded=true
	bReloadFromMagazine=false

	// Recoil
	maxRecoilPitch=900
	minRecoilPitch=775
	maxRecoilYaw=500
	minRecoilYaw=-500
	RecoilRate=0.085
	RecoilBlendOutRatio=0.35
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=1500
	RecoilMinPitchLimit=64785
	RecoilISMaxYawLimit=50
	RecoilISMinYawLimit=65485
	RecoilISMaxPitchLimit=500
	RecoilISMinPitchLimit=65485
	RecoilViewRotationScale=0.8
	FallingRecoilModifier=1.5
	HippedRecoilModifier=1.25

	// Trader
    EffectiveRange=20

	AssociatedPerkClass=class'KFPerk_Support'
}


