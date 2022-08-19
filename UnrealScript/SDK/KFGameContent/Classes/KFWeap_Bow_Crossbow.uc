//=============================================================================
// KFWeap_Bow_Crossbow
//=============================================================================
// A crossbow
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFWeap_Bow_Crossbow extends KFWeap_ScopedBase;

/** Return true if this weapon should play the fire last animation for this shoot animation */
simulated function bool ShouldPlayFireLast(byte FireModeNum)
{
    if( SpareAmmoCount[GetAmmoType(FireModeNum)] == 0 )
    {
        return true;
    }

    return false;
}

/** Returns animation to play based on reload type and status */
simulated function name GetReloadAnimName( bool bTacticalReload )
{
	if ( AmmoCount[0] > 0 )
	{
		// Disable half-reloads for now.  This can happen if server gets out
		// of sync, but choosing the wrong animation will just make it worse!
		`warn("Grenade launcher reloading with non-empty mag");
	}

	return ReloadEmptyMagAnim;
}

defaultproperties
{
	// Inventory
	InventorySize=6
	GroupPriority=50
	WeaponSelectTexture=Texture2D'WEP_UI_Crossbow_TEX.UI_WeaponSelect_Crossbow'
   	AssociatedPerkClass=class'KFPerk_Sharpshooter'

    // FOV / Position
    MeshFOV=70
	MeshIronSightFOV=52
    PlayerIronSightFOV=70
	PlayerViewOffset=(X=1,Y=8,Z=-5)
	IronSightPosition=(X=-13,Y=0,Z=0)

    // 2D scene capture
	Begin Object Name=SceneCapture2DComponent0
	   TextureTarget=TextureRenderTarget2D'Wep_Mat_Lib.WEP_ScopeLense_Target'
	   FieldOfView=18.5 // "2.0X" = 37(our real world FOV determinant)/2.0
	End Object

	ScopedSensitivityMod=12.0

	ScopeLenseMICTemplate=MaterialInstanceConstant'WEP_1P_Crossbow_MAT.WEP_1P_Crossbow_Scope_MAT'

	// Depth of field
	DOF_BlendInSpeed=3.0
	DOF_FG_FocalRadius=0.0
	DOF_FG_MaxNearBlurSize=3.5

	Begin Object Name=FirstPersonMesh
		SkeletalMesh=SkeletalMesh'WEP_1P_Crossbow_MESH.Wep_1stP_Crossbow_Rig'
		AnimSets(0)=AnimSet'WEP_1P_Crossbow_ANIM.Wep_1stP_Crossbow_Anim'
	End Object

	Begin Object Name=StaticPickupComponent
		StaticMesh=StaticMesh'WEP_3P_Crossbow_MESH.Wep_Crossbow_Pickup'
	End Object

	AttachmentArchetype=KFWeaponAttachment'WEP_Crossbow_ARCH.Wep_Crossbow_3P'

	// Ammo
	MagazineCapacity[0]=1
	MaxSpareAmmo[0]=34
	InitialSpareMags[0]=13
	AmmoPickupScale[0]=3.0 // 3 arrows
	bCanBeReloaded=true
	bReloadFromMagazine=true // reloading from mag is one step, while NOT reloading from mag is multi-step (open bolt, load ammo, close bolt) and not applicable for bow

	// Recoil
	maxRecoilPitch=200
	minRecoilPitch=150
	maxRecoilYaw=100
	minRecoilYaw=-100
	RecoilRate=0.06
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=900
	RecoilMinPitchLimit=64785
	RecoilISMaxYawLimit=50
	RecoilISMinYawLimit=65485
	RecoilISMaxPitchLimit=375
	RecoilISMinPitchLimit=65460

	// DEFAULT_FIREMODE
	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletSingle'
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponSingleFireAndReload
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_Projectile
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_Bolt_Crossbow'
	InstantHitDamage(DEFAULT_FIREMODE)=350.0
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Piercing_Crossbow'
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_Crossbow'
	PenetrationPower(DEFAULT_FIREMODE)=4.0
	FireInterval(DEFAULT_FIREMODE)=0.4 // For this weapon, this is not the fire rate, but the time when the auto reload anim kicks in
	Spread(DEFAULT_FIREMODE)=0.007
	FireOffset=(X=25,Y=3.0,Z=-4.0)

	// ALT_FIREMODE
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_None

	// Fire Effects
	MuzzleFlashTemplate=KFMuzzleFlash'WEP_Crossbow_ARCH.Wep_Crossbow_MuzzleFlash'
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_Crossbow.Play_WEP_SA_Crossbow_Fire_3P', FirstPersonCue=AkEvent'WW_WEP_SA_Crossbow.Play_WEP_SA_Crossbow_Fire_1P')
	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_Crossbow.Play_WEP_SA_Crossbow_DryFire'

	// Custom animations
	FireSightedAnims=(Shoot_Iron, Shoot_Iron2, Shoot_Iron3)
	BonesToLockOnEmpty=(RW_Cable_Parent)

	// Attachments
	bHasIronSights=true
	bHasFlashlight=false

	// Just like the launchers, this weapon has mag size of 1 and force reload which
	// causes significant ammo sync issues.  This fix is far from perfect, but it helps.
	bAllowClientAmmoTracking=false
}


