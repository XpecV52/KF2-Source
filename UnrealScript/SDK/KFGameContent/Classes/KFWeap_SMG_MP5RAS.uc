//=============================================================================
// KFWeap_SMG_MP5RAS
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//  - Brooks Butler
//=============================================================================

class KFWeap_SMG_MP5RAS extends KFWeap_SMGBase;

defaultproperties
{
	// Inventory
	InventorySize=4
	GroupPriority=60
	WeaponSelectTexture=Texture2D'WEP_UI_MP5RAS_TEX.UI_WeaponSelect_MP5RAS'

	// FOV
	MeshFOV=86
	MeshIronSightFOV=50
	PlayerIronSightFOV=75

	// Zooming/Position
	IronSightPosition=(X=10.f,Y=0,Z=0)
	PlayerViewOffset=(X=17.f,Y=8,Z=-4.0)

	Begin Object Name=FirstPersonMesh
		SkeletalMesh=SkeletalMesh'wep_1p_mp5ras_mesh.Wep_1stP_MP5RAS_Rig'
		AnimSets(0)=AnimSet'wep_1p_mp5ras_anim.wep_1p_mp5ras_anim'
	End Object

	Begin Object Name=StaticPickupComponent
		StaticMesh=StaticMesh'wep_3p_mp5ras_mesh.Wep_MP5RAS_Pickup'
	End Object

	AttachmentArchetype=KFWeaponAttachment'wep_mp5ras_arch.Wep_MP5RAS_3P'

	// Ammo
	MagazineCapacity[0]=40
	SpareAmmoCapacity[0]=320 //360
	InitialSpareMags[0]=4
	bCanBeReloaded=true
	bReloadFromMagazine=true

	// Recoil
	maxRecoilPitch=60
	minRecoilPitch=40
	maxRecoilYaw=50
	minRecoilYaw=-50
	RecoilRate=0.06
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=550 //900
	RecoilMinPitchLimit=65035
	RecoilISMaxYawLimit=75
	RecoilISMinYawLimit=65460
	RecoilISMaxPitchLimit=375
	RecoilISMinPitchLimit=65460
	IronSightMeshFOVCompensationScale=1.6
	WalkingRecoilModifier=1.1
	JoggingRecoilModifier=1.2

	// DEFAULT_FIREMODE
	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletAuto'
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponFiring
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_Bullet_AssaultRifle'
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Ballistic_MP5RAS'
	FireInterval(DEFAULT_FIREMODE)=+.067 // 900 RPM
	Spread(DEFAULT_FIREMODE)=0.01
	InstantHitDamage(ALTFIRE_FIREMODE)=25  //22
	FireOffset=(X=30,Y=4.5,Z=-5)

	// ALT_FIREMODE
	FireModeIconPaths(ALTFIRE_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletBurst'
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponBurstFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(ALTFIRE_FIREMODE)=class'KFProj_Bullet_AssaultRifle'
	InstantHitDamageTypes(ALTFIRE_FIREMODE)=class'KFDT_Ballistic_MP5RAS'
	FireInterval(ALTFIRE_FIREMODE)=+.067 // 900 RPM
	InstantHitDamage(DEFAULT_FIREMODE)=25 //22
	Spread(ALTFIRE_FIREMODE)=0.01
	BurstAmount=3

	// BASH_FIREMODE
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_MP5RAS'
	InstantHitDamage(BASH_FIREMODE)=24.0

	// Fire Effects
	MuzzleFlashTemplate=KFMuzzleFlash'wep_mp5ras_arch.Wep_MP5RAS_MuzzleFlash'

	//@todo: add akevents when we have them
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_MP5.Play_MP5_Fire_3P_Loop', FirstPersonCue=AkEvent'WW_WEP_MP5.Play_MP5_Fire_1P_Loop')
	WeaponFireSnd(ALTFIRE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_MP5.Play_MP5_Fire_3P_Single', FirstPersonCue=AkEvent'WW_WEP_MP5.Play_MP5_Fire_1P_Single')
	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_MedicSMG.Play_SA_MedicSMG_Handling_DryFire'
	WeaponDryFireSnd(ALTFIRE_FIREMODE)=AkEvent'WW_WEP_SA_MedicDart.Play_WEP_SA_Medic_Dart_DryFire'

	// Advanced (High RPM) Fire Effects
	bLoopingFireAnim(DEFAULT_FIREMODE)=true
	bLoopingFireSnd(DEFAULT_FIREMODE)=true
	WeaponFireLoopEndSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_MP5.Play_MP5_Fire_3P_EndLoop', FirstPersonCue=AkEvent'WW_WEP_MP5.Play_MP5_Fire_1P_EndLoop')
	SingleFireSoundIndex=ALTFIRE_FIREMODE

	// Attachments
	bHasIronSights=true
	bHasFlashlight=true

	AssociatedPerkClass=class'KFPerk_Swat'
}
