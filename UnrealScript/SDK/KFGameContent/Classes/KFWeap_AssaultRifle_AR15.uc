//=============================================================================
// KFWeap_AssaultRifle_AR15
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 8/8/2013
//=============================================================================

class KFWeap_AssaultRifle_AR15 extends KFWeap_RifleBase;

/** Number of shots already fired in this burst. */
var int BurstCount;
/** Number of shots to fire per burst. */
var() int BurstAmount;

/*********************************************************************************************
 * State WeaponBurstFiring
 * Fires a burst of bullets. Fire must be released between every shot.
 *********************************************************************************************/

simulated state WeaponBurstFiring extends WeaponFiring
{
	simulated function BeginState(Name PrevStateName)
	{
        // Reset the BurstCount when we start firing again
        BurstCount=0;

        // Don't let us fire more shots than we have ammo for
        BurstAmount=Min(default.BurstAmount, AmmoCount[GetAmmoType(CurrentFireMode)]);

		super.BeginState(PrevStateName);
	}

	simulated function bool ShouldRefire()
	{
		// Stop firing when we hit the burst amount
        if( BurstCount >= BurstAmount )
		{
            return false;
		}
    	// if doesn't have ammo to keep on firing, then stop
    	else if( !HasAmmo( CurrentFireMode ) )
    	{
    		return false;
    	}
		else
		{
            return true;
		}
	}

    /**
     * FireAmmunition: Perform all logic associated with firing a shot
     * - Fires ammunition (instant hit or spawn projectile)
     * - Consumes ammunition
     * - Plays any associated effects (fire sound and whatnot)
     * Overridden to increment the BurstCount
     *
     * Network: LocalPlayer and Server
     */
    simulated function FireAmmunition()
    {
        super.FireAmmunition();
        BurstCount++;
    }

	simulated event EndState( Name NextStateName )
	{
		Super.EndState(NextStateName);
		EndFire(CurrentFireMode);
	}
}

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
	DOF_FG_FocalRadius=75
	DOF_FG_MaxNearBlurSize=3.5

	// Zooming/Position
	PlayerViewOffset=(X=9.0,Y=10,Z=-4)

	Begin Object Name=FirstPersonMesh
		SkeletalMesh=SkeletalMesh'WEP_1P_AR15_9mm_MESH.Wep_1stP_AR15_9mm_Rig'
		AnimSets(0)=AnimSet'WEP_1P_AR15_9mm_ANIM.Wep_1stP_AR15_9mm_Anim'
	End Object

	Begin Object Name=StaticPickupComponent
		StaticMesh=StaticMesh'WEP_3P_Pickups_MESH.Wep_AR15_Pickup'
	End Object

	AttachmentArchetype=KFWeaponAttachment'WEP_AR15_9mm_ARCH.Wep_AR15_9mm_3P'

   	// Zooming/Position
	IronSightPosition=(X=7,Y=0,Z=0)

	// Ammo
	MagazineCapacity[0]=20
	MaxSpareAmmo[0]=240
	InitialSpareMags[0]=6
	bCanBeReloaded=true
	bReloadFromMagazine=true

	// Recoil
	maxRecoilPitch=225
	minRecoilPitch=150
	maxRecoilYaw=150
	minRecoilYaw=-150
	RecoilRate=0.085
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=900
	RecoilMinPitchLimit=65035
	RecoilISMaxYawLimit=75
	RecoilISMinYawLimit=65460
	RecoilISMaxPitchLimit=195
	RecoilISMinPitchLimit=65460
	RecoilViewRotationScale=0.25
	IronSightMeshFOVCompensationScale=1.5

	// Inventory / Grouping
	InventorySize=4
	GroupPriority=25
	WeaponSelectTexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_AR15'

	// DEFAULT_FIREMODE
	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletBurst'
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponBurstFiring
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_Bullet_AssaultRifle'
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Ballistic_AR15'
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_AR15'
	FireInterval(DEFAULT_FIREMODE)=+0.12
	InstantHitDamage(DEFAULT_FIREMODE)=20.0
	Spread(DEFAULT_FIREMODE)=0.01
	FireOffset=(X=30,Y=4.5,Z=-4)
	BurstAmount=3

	// ALT_FIREMODE
	FireModeIconPaths(ALTFIRE_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletSingle'
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(ALTFIRE_FIREMODE)=class'KFProj_Bullet_AssaultRifle'
	FireInterval(ALTFIRE_FIREMODE)=+0.12 // 500 RPM
	InstantHitDamageTypes(ALTFIRE_FIREMODE)=class'KFDT_Ballistic_AR15'
	InstantHitDamage(ALTFIRE_FIREMODE)=20.0
	Spread(ALTFIRE_FIREMODE)=0.01

	// Fire Effects
	MuzzleFlashTemplate=KFMuzzleFlash'WEP_AR15_9mm_ARCH.Wep_AR15_9MM_MuzzleFlash'
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_AR15.Play_WEP_SA_AR15_Fire_3P', FirstPersonCue=AkEvent'WW_WEP_SA_AR15.Play_WEP_SA_AR15_Fire_1P')
	WeaponFireSnd(ALTFIRE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_AR15.Play_WEP_SA_AR15_Fire_3P', FirstPersonCue=AkEvent'WW_WEP_SA_AR15.Play_WEP_SA_AR15_Fire_1P')
	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_AR15.Play_WEP_SA_AR15_Handling_DryFire'
	WeaponDryFireSnd(ALTFIRE_FIREMODE)=AkEvent'WW_WEP_SA_AR15.Play_WEP_SA_AR15_Handling_DryFire'

	// Attachments
	bHasIronSights=true
	bHasFlashlight=true

	AssociatedPerkClass=class'KFPerk_Commando'
}

