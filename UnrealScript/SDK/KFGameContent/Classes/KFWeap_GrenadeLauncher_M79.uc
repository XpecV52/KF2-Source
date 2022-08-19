//=============================================================================
// KFWeap_GrenadeLauncher_M79
//=============================================================================
// An M79 Grenade Launcher
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFWeap_GrenadeLauncher_M79 extends KFWeap_GrenadeLauncher_Base;

defaultproperties
{
	ForceReloadTime=0.3f

	// Inventory
	InventoryGroup=IG_Primary
	GroupPriority=75
	InventorySize=6
	WeaponSelectTexture=Texture2D'WEP_UI_M79_TEX.UI_WeaponSelect_M79'

    // FOV
	MeshIronSightFOV=52
    PlayerIronSightFOV=73

	// Zooming/Position
	PlayerViewOffset=(X=13.0,Y=13,Z=-4)
	FastZoomOutTime=0.2

	Begin Object Name=FirstPersonMesh
		SkeletalMesh=SkeletalMesh'WEP_1P_M79_MESH.Wep_1stP_M79_Rig'
		AnimSets(0)=AnimSet'WEP_1P_M79_ANIM.WEP_1P_M79_ANIM'
	End Object

	Begin Object Name=StaticPickupComponent
		StaticMesh=StaticMesh'WEP_3P_M79_MESH.Wep_m79_Pickup'
	End Object

	AttachmentArchetype=KFWeaponAttachment'WEP_M79_ARCH.Wep_M79_3P'

   	// Zooming/Position
	IronSightPosition=(X=0,Y=0,Z=0)

	// Ammo
	MagazineCapacity[0]=1
	MaxSpareAmmo[0]=26
	InitialSpareMags[0]=9
	AmmoPickupScale[0]=2.0
	bCanBeReloaded=true
	bReloadFromMagazine=true

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

	// DEFAULT_FIREMODE
	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_Grenade'
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponSingleFireAndReload
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_Projectile
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_HighExplosive_M79'
	FireInterval(DEFAULT_FIREMODE)=+0.25
	InstantHitDamage(DEFAULT_FIREMODE)=150.0
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Ballistic_M79Impact'
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_M79'
	Spread(DEFAULT_FIREMODE)=0.015
	FireOffset=(X=23,Y=4.0,Z=-3)

	// ALT_FIREMODE
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_None

	// Fire Effects
	MuzzleFlashTemplate=KFMuzzleFlash'WEP_M79_ARCH.Wep_M79_MuzzleFlash'
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_M79.Play_WEP_SA_M79_Fire_M', FirstPersonCue=AkEvent'WW_WEP_SA_M79.Play_WEP_SA_M79_Fire_S')

	//@todo: add akevent when we have it
	WeaponDryFireSnd(DEFAULT_FIREMODE)=none

	// Animation
	bHasFireLastAnims=true

	// Attachments
	bHasIronSights=true
	bHasFlashlight=false

	AssociatedPerkClass=class'KFPerk_Demolitionist'
}

