//=============================================================================
// KFWeap_Bullpup
//=============================================================================
// A L85A2 'bullpup'
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFWeap_AssaultRifle_Bullpup extends KFWeap_RifleBase;

defaultproperties
{
	// Shooting Animations
	FireSightedAnims[0]=Shoot_Iron
	FireSightedAnims[1]=Shoot_Iron2
	FireSightedAnims[2]=Shoot_Iron3

    // FOV
	MeshIronSightFOV=52
    PlayerIronSightFOV=70

	// Depth of field
	DOF_FG_FocalRadius=85
	DOF_FG_MaxNearBlurSize=2.5

	Begin Object Name=FirstPersonMesh
		SkeletalMesh=SkeletalMesh'WEP_1P_L85A2_MESH.Wep_1stP_L85A2_Rig'
		AnimSets(0)=AnimSet'WEP_1P_L85A2_ANIM.Wep_1st_L85A2_Anim'
	End Object

	Begin Object Name=StaticPickupComponent
		StaticMesh=StaticMesh'WEP_3P_Pickups_MESH.Wep_L85A2_Pickup'
	End Object

	AttachmentArchetype=KFWeaponAttachment'WEP_L85A2_ARCH.Wep_L85A2_3P'

   	// Zooming/Position
	PlayerViewOffset=(X=3.0,Y=9,Z=-3)
	IronSightPosition=(X=0,Y=0,Z=0)

	// Ammo
	MagazineCapacity[0]=30
	MaxSpareAmmo[0]=270
	InitialSpareMags[0]=4
	bCanBeReloaded=true
	bReloadFromMagazine=true

	// Recoil
	maxRecoilPitch=150
	minRecoilPitch=115
	maxRecoilYaw=115
	minRecoilYaw=-115
	RecoilRate=0.085
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=900
	RecoilMinPitchLimit=65035
	RecoilISMaxYawLimit=75
	RecoilISMinYawLimit=65460
	RecoilISMaxPitchLimit=375
	RecoilISMinPitchLimit=65460
	RecoilViewRotationScale=0.25
	IronSightMeshFOVCompensationScale=1.5
    HippedRecoilModifier=1.5

    // Inventory / Grouping
	InventorySize=6
	GroupPriority=50
	WeaponSelectTexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_Bullpup'
   	AssociatedPerkClass=class'KFPerk_Commando'

	// DEFAULT_FIREMODE
	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletAuto'
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponFiring
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_Bullet_AssaultRifle'
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Ballistic_Bullpup'
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_Bullpup'
	FireInterval(DEFAULT_FIREMODE)=+0.0909 // 660 RPM
	Spread(DEFAULT_FIREMODE)=0.0085
	InstantHitDamage(DEFAULT_FIREMODE)=25.0
	FireOffset=(X=30,Y=4.5,Z=-5)

	// ALT_FIREMODE
	FireModeIconPaths(ALTFIRE_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletSingle'
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(ALTFIRE_FIREMODE)=class'KFProj_Bullet_AssaultRifle'
	InstantHitDamageTypes(ALTFIRE_FIREMODE)=class'KFDT_Ballistic_Bullpup'
	FireInterval(ALTFIRE_FIREMODE)=+0.1
	InstantHitDamage(ALTFIRE_FIREMODE)=25.0
	Spread(ALTFIRE_FIREMODE)=0.0085

	// Fire Effects
	MuzzleFlashTemplate=KFMuzzleFlash'WEP_L85A2_ARCH.Wep_L85A2_MuzzleFlash'
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_L85A2.Play_WEP_SA_L85A2_Fire_Loop_M', FirstPersonCue=AkEvent'WW_WEP_SA_L85A2.Play_WEP_SA_L85A2_Fire_Loop_S')
	WeaponFireSnd(ALTFIRE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_L85A2.Play_WEP_SA_L85A2_Fire_Single_M', FirstPersonCue=AkEvent'WW_WEP_SA_L85A2.Play_WEP_SA_L85A2_Fire_Single_S')
	WeaponFireLoopEndSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_L85A2.Play_WEP_SA_L85A2_Fire_Loop_End_M', FirstPersonCue=AkEvent'WW_WEP_SA_L85A2.Play_WEP_SA_L85A2_Fire_Loop_End_S')

	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_L85A2.Play_WEP_SA_L85A2_Handling_DryFire'
	WeaponDryFireSnd(ALTFIRE_FIREMODE)=AkEvent'WW_WEP_SA_L85A2.Play_WEP_SA_L85A2_Handling_DryFire'

	// Advanced (High RPM) Fire Effects
	bLoopingFireAnim(DEFAULT_FIREMODE)=true
	bLoopingFireSnd(DEFAULT_FIREMODE)=true
	SingleFireMode=ALTFIRE_FIREMODE

	// Attachments
	bHasIronSights=true
	bHasFlashlight=false
}


