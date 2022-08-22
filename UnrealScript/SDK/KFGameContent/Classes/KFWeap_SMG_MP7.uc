//=============================================================================
// KFWeap_SMG_MP7
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//  - Brooks Butler
//=============================================================================

class KFWeap_SMG_MP7 extends KFWeap_SMGBase;

defaultproperties
{
	// Inventory
	InventorySize=4
	GroupPriority=50
	WeaponSelectTexture=Texture2D'WEP_UI_MP7_TEX.UI_WeaponSelect_MP7'

	// FOV
	MeshFOV=81
	MeshIronSightFOV=55
	PlayerIronSightFOV=70

	// Zooming/Position
	IronSightPosition=(X=5,Y=0,Z=0)
	PlayerViewOffset=(X=18.5f,Y=10.25f,Z=-4.0f)

	Begin Object Name=FirstPersonMesh
		SkeletalMesh=SkeletalMesh'wep_1p_mp7_mesh.Wep_1stP_MP7_Rig'
		AnimSets(0)=AnimSet'wep_1p_mp7_anim.wep_1p_mp7_anim'
	End Object

	Begin Object Name=StaticPickupComponent
		StaticMesh=StaticMesh'wep_3p_mp7_mesh.Wep_MP7_Pickup'
	End Object

	AttachmentArchetype=KFWeaponAttachment'wep_mp7_arch.Wep_MP7_3P'

	// Ammo
	MagazineCapacity[0]=30
	SpareAmmoCapacity[0]=330
	InitialSpareMags[0]=6
	bCanBeReloaded=true
	bReloadFromMagazine=true

	// Recoil
	maxRecoilPitch=50
	minRecoilPitch=40
	maxRecoilYaw=80
	minRecoilYaw=-80
	RecoilRate=0.06
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=900
	RecoilMinPitchLimit=65035
	RecoilISMaxYawLimit=75
	RecoilISMinYawLimit=65460
	RecoilISMaxPitchLimit=375
	RecoilISMinPitchLimit=65460
	IronSightMeshFOVCompensationScale=1.5
	WalkingRecoilModifier=1.1
	JoggingRecoilModifier=1.2

	// DEFAULT_FIREMODE
	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletAuto'
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponFiring
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_Bullet_AssaultRifle'
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Ballistic_MP7'
	FireInterval(DEFAULT_FIREMODE)=+.063 // 950 RPM
	Spread(DEFAULT_FIREMODE)=0.015
	InstantHitDamage(DEFAULT_FIREMODE)=16 //20
	FireOffset=(X=30,Y=4.5,Z=-5)

	// ALT_FIREMODE
	FireModeIconPaths(ALTFIRE_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletSingle'
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(ALTFIRE_FIREMODE)=class'KFProj_Bullet_AssaultRifle'
	InstantHitDamageTypes(ALTFIRE_FIREMODE)=class'KFDT_Ballistic_MP7'
	FireInterval(ALTFIRE_FIREMODE)=+.063 // 950 RPM
	InstantHitDamage(ALTFIRE_FIREMODE)=16 //20
	Spread(ALTFIRE_FIREMODE)=0.01

	// BASH_FIREMODE
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_MP7'
	InstantHitDamage(BASH_FIREMODE)=24

	// Fire Effects
	MuzzleFlashTemplate=KFMuzzleFlash'wep_MP7_arch.Wep_MP7_MuzzleFlash'

	//@todo: add akevents when we have them
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_MP7.Play_MP7_Fire_3P_Loop', FirstPersonCue=AkEvent'WW_WEP_MP7.Play_MP7_Fire_1P_Loop')
	WeaponFireSnd(ALTFIRE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_MP7.Play_MP7_Fire_3P_Single', FirstPersonCue=AkEvent'WW_WEP_MP7.Play_MP7_Fire_1P_Single')
	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_MedicSMG.Play_SA_MedicSMG_Handling_DryFire'
	WeaponDryFireSnd(ALTFIRE_FIREMODE)=AkEvent'WW_WEP_SA_MedicDart.Play_WEP_SA_Medic_Dart_DryFire'

	// Advanced (High RPM) Fire Effects
	bLoopingFireAnim(DEFAULT_FIREMODE)=true
	bLoopingFireSnd(DEFAULT_FIREMODE)=true
	WeaponFireLoopEndSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_MP7.Play_MP7_Fire_3P_EndLoop', FirstPersonCue=AkEvent'WW_WEP_MP7.Play_MP7_Fire_1P_EndLoop')
	SingleFireSoundIndex=ALTFIRE_FIREMODE

	// Attachments
	bHasIronSights=true
	bHasFlashlight=true

	AssociatedPerkClass=class'KFPerk_Swat'
}
