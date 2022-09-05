//=============================================================================
// KFWeap_Shotgun_DragonsBreath
//=============================================================================
// A trench shotgun with incendiary rounds Dragons Breath!
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - John "Ramm-Jaeger" Gibson
//=============================================================================
class KFWeap_Shotgun_DragonsBreath extends KFWeap_ShotgunBase;

static simulated event EFilterTypeUI GetAltTraderFilter()
{
	return FT_Flame;
}

defaultproperties
{
	// Inventory
	InventorySize=5
	GroupPriority=50
	WeaponSelectTexture=Texture2D'WEP_UI_DragonsBreath.UI_WeaponSelect_DragonsBreath'

    // FOV
    MeshFOV=75
	MeshIronSightFOV=52
    PlayerIronSightFOV=70

	// Depth of field
	DOF_FG_FocalRadius=95
	DOF_FG_MaxNearBlurSize=2.5

	// Zooming/Position
	PlayerViewOffset=(X=10.0,Y=7.5,Z=-4.5)
	IronSightPosition=(X=7,Y=0,Z=-0.0)

	// Content
	PackageKey="DragonsBreath"
	FirstPersonMeshName="WEP_1P_DragonsBreath_MESH.Wep_1stP_DragonsBreath_Rig"
	FirstPersonAnimSetNames(0)="WEP_1P_DragonsBreath_ANIM.WEP_1P_DragonsBreath_ANIM"
	PickupMeshName="WEP_3P_DragonsBreath_MESH.Wep_DragonsBreath_Pickup"
	AttachmentArchetypeName="WEP_DragonsBreath_ARCH.Wep_DragonsBreath_3P"
	MuzzleFlashTemplateName="WEP_DragonsBreath_ARCH.Wep_DragonsBreath_MuzzleFlash_3P"

	// DEFAULT_FIREMODE
	FireModeIconPaths(DEFAULT_FIREMODE)="ui_firemodes_tex.UI_FireModeSelect_ShotgunSingle"
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_Projectile
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_Bullet_DragonsBreath'
	InstantHitDamage(DEFAULT_FIREMODE)=35 //15 //27
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Ballistic_DragonsBreath'
	PenetrationPower(DEFAULT_FIREMODE)=2.0 //3.0
	FireInterval(DEFAULT_FIREMODE)=0.77 // 78 RPM //0.77
	FireOffset=(X=30,Y=3,Z=-3)
	// Shotgun
	Spread(DEFAULT_FIREMODE)=0.16 //0.1
	NumPellets(DEFAULT_FIREMODE)=6 //9

	// ALT_FIREMODE
	FireModeIconPaths(ALTFIRE_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_ShotgunSingle'
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_None

	// BASH_FIREMODE
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_DragonsBreath'
	InstantHitDamage(BASH_FIREMODE)=25

	// Fire Effects
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_DragonsBreath.Play_SA_DragonsBreath_Fire_3P', FirstPersonCue=AkEvent'WW_WEP_SA_DragonsBreath.Play_SA_DragonsBreath_Fire_1P')
    WeaponFireSnd(ALTFIRE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_DragonsBreath.Play_SA_DragonsBreath_Fire_3P', FirstPersonCue=AkEvent'WW_WEP_SA_DragonsBreath.Play_SA_DragonsBreath_Fire_1P')

    // using M4 dry fire sound. this is intentional.
	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_M4.Play_WEP_SA_M4_Handling_DryFire'
	WeaponDryFireSnd(ALTFIRE_FIREMODE)=AkEvent'WW_WEP_SA_M4.Play_WEP_SA_M4_Handling_DryFire'

	// Attachments
	bHasIronSights=true
	bHasFlashlight=false

	// Ammo
	MagazineCapacity[0]=6
	SpareAmmoCapacity[0]=60
	InitialSpareMags[0]=4
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

	AssociatedPerkClasses(0)=class'KFPerk_Firebug'
	AssociatedPerkClasses(1)=class'KFPerk_Support'

	BonesToLockOnEmpty=(RW_Hammer)

	WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Heavy_Recoil_SingleShot'

	// Weapon Upgrade stat boosts
	//WeaponUpgrades[1]=(IncrementDamage=1.1f,IncrementWeight=1)
	//WeaponUpgrades[2]=(IncrementDamage=1.2f,IncrementWeight=2)
	//WeaponUpgrades[3]=(IncrementDamage=1.3f,IncrementWeight=3)

	WeaponUpgrades[1]=(Stats=((Stat=EWUS_Damage0, Scale=1.1f), (Stat=EWUS_Weight, Add=1)))
	WeaponUpgrades[2]=(Stats=((Stat=EWUS_Damage0, Scale=1.2f), (Stat=EWUS_Weight, Add=2)))
	WeaponUpgrades[3]=(Stats=((Stat=EWUS_Damage0, Scale=1.3f), (Stat=EWUS_Weight, Add=3)))
}