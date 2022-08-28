//=============================================================================
// KFWeap_Ice_FreezeThrower
//=============================================================================
// The cryogenic freeze gun
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
// - Matt "Squirrlz" Farber
//=============================================================================
class KFWeap_Ice_FreezeThrower extends KFWeap_FlameBase;

/** Shoot animation to play when shooting secondary fire */
var(Animations) const editconst	name	FireHeavyAnim;

/** Shoot animation to play when shooting secondary fire last shot */
var(Animations) const editconst	name	FireLastHeavyAnim;

/** Shoot animation to play when shooting secondary fire last shot when aiming */
var(Animations) const editconst	name	FireLastHeavySightedAnim;

/** Shoot animation to play when ending looping fire on last shot */
var(Animations) const editconst	name	FireLoopEndLastAnim;

/** Shoot animation to play when ending looping fire on last shot  when aiming*/
var(Animations) const editconst	name	FireLoopEndLastSightedAnim;

/** Alt-fire explosion template */
var() GameExplosion 		ExplosionTemplate;

/** For Ice Blast */
var(Weapon) protected array<byte> NumPellets;
var protected const array<vector2D> PelletSpread;

/** How much recoil the altfire should do */
var protected const float AltFireRecoilScale;

/** Handle one-hand fire anims */
simulated function name GetWeaponFireAnim(byte FireModeNum)
{
	local bool bPlayFireLast;

    bPlayFireLast = ShouldPlayFireLast(FireModeNum);

	if ( bUsingSights )
	{
		if( bPlayFireLast )
        {
        	if ( FireModeNum == ALTFIRE_FIREMODE )
        	{
                return FireLastHeavySightedAnim;
        	}
        	else
        	{
                return FireLastSightedAnim;
            }
        }
        else
        {
            return FireSightedAnims[FireModeNum];
        }

	}
	else
	{
		if( bPlayFireLast )
        {
        	if ( FireModeNum == ALTFIRE_FIREMODE )
        	{
                return FireLastHeavyAnim;
        	}
        	else
        	{
                return FireLastAnim;
            }
        }
        else
        {
        	if ( FireModeNum == ALTFIRE_FIREMODE )
        	{
                return FireHeavyAnim;
        	}
        	else
        	{
                return FireAnim;
            }
        }
	}
}

/** Get name of the animation to play for PlayFireEffects */
simulated function name GetLoopEndFireAnim(byte FireModeNum)
{
	local bool bPlayFireLast;

    bPlayFireLast = ShouldPlayFireLast(FireModeNum);

	if ( bUsingSights )
	{
    	if( bPlayFireLast && FireLoopEndLastSightedAnim != '' )
        {
            return FireLoopEndLastSightedAnim;
        }
        else
        {
            return FireLoopEndSightedAnim;
        }
	}
	else
	{
    	if( bPlayFireLast && FireLoopEndLastAnim != '' )
        {
            return FireLoopEndLastAnim;
        }
        else
        {
            return FireLoopEndAnim;
        }
	}
}

/**
 * Instead of a toggle, just immediately fire alternate fire.
 */
simulated function AltFireMode()
{
	// LocalPlayer Only
	if ( !Instigator.IsLocallyControlled()  )
	{
		return;
	}

	StartFire( ALTFIRE_FIREMODE );
}

/** Spawn projectile is called once for each shot pellet fired */
simulated function KFProjectile SpawnProjectile( class<KFProjectile> KFProjClass, vector RealStartLoc, vector AimDir )
{
	local int i;
	local rotator AimRot;

    if( CurrentFireMode == GRENADE_FIREMODE )
    {
        return Super.SpawnProjectile(KFProjClass, RealStartLoc, AimDir);
    }

	AimRot = rotator(AimDir);
	for (i = 0; i < GetNumProjectilesToFire(CurrentFireMode); i++)
	{
		Super.SpawnProjectile( KFProjClass, RealStartLoc, vector(AddMultiShotSpread(AimRot, i)) );
	}

	return None;
}

/** Returns number of projectiles to fire from SpawnProjectile */
simulated function byte GetNumProjectilesToFire(byte FireModeNum)
{
	return NumPellets[CurrentFireMode];
}

/** Disable normal bullet spread */
simulated function rotator AddSpread( rotator BaseAim )
{
	return BaseAim; // do nothing
}

 /** Same as AddSpread(), but used with MultiShotSpread */
simulated function rotator AddMultiShotSpread( rotator BaseAim, byte PelletNum )
{
	local vector X, Y, Z;
	local float CurrentSpread, RandY, RandZ;

	CurrentSpread = Spread[CurrentFireMode];
	if (CurrentSpread == 0)
	{
		return BaseAim;
	}
	else
	{
		// Add in any spread.
		GetAxes(BaseAim, X, Y, Z);
		RandY = PelletSpread[PelletNum].Y * RandRange( 0.5f, 1.5f );
		RandZ = PelletSpread[PelletNum].X * RandRange( 0.5f, 1.5f );
		return rotator(X + RandY * CurrentSpread * Y + RandZ * CurrentSpread * Z);
	}
}

/** Disable auto-reload for alt-fire */
simulated function bool ShouldAutoReload(byte FireModeNum)
{
	local bool bRequestReload;

    bRequestReload = Super.ShouldAutoReload(FireModeNum);

    // Must be completely empty for auto-reload or auto-switch
    if ( FireModeNum == ALTFIRE_FIREMODE && AmmoCount[0] > 0 )
    {
   		bPendingAutoSwitchOnDryFire = false;
   		return false;
    }

    return bRequestReload;
}

/** Notification that a weapon attack has has happened */
function HandleWeaponShotTaken( byte FireMode )
{
    if( KFPlayer != none && FireMode == ALTFIRE_FIREMODE )
	{
        KFPlayer.AddShotsFired( GetNumProjectilesToFire(FireMode) );
        return;
	}

	super.HandleWeaponShotTaken( FireMode );
}

/** Increase recoil for altfire */
simulated function ModifyRecoil( out float CurrentRecoilModifier )
{
	if( CurrentFireMode == ALTFIRE_FIREMODE )
	{
		CurrentRecoilModifier *= AltFireRecoilScale;
	}

	super.ModifyRecoil( CurrentRecoilModifier );
}

/** Can be overridden on a per-weapon or per-state basis */
simulated function bool IsHeavyWeapon()
{
	return true;
}

/** No pilot light on freeze thrower */
simulated function SetPilotDynamicLightEnabled( bool bLightEnabled );

static simulated event EFilterTypeUI GetTraderFilter()
{
	return FT_Electric;
}

defaultproperties
{
    FlameSprayArchetype=SprayActor_Flame'WEP_CryoGun_ARCH.Wep_CryoGun_IceSpray'

    // FX
	PSC_PilotLight=none
	PilotLights.Empty

	// Shooting Animations
	bHasFireLastAnims=true
	FireLastHeavySightedAnim=Shoot_Heavy_Iron_Last
    FireHeavyAnim=Shoot_Heavy
    FireLastHeavyAnim=Shoot_Heavy_Last

	// Advanced Looping (High RPM) Fire Effects
	FireLoopEndLastAnim=ShootLoop_End_Last
	FireLoopEndLastSightedAnim=ShootLoop_Iron_End_Last

	// Shooting Animations
	FireSightedAnims[0]=Shoot
	FireSightedAnims[1]=Shoot_Heavy_Iron
	FireLoopSightedAnim=ShootLoop

	// Advanced Looping (High RPM) Fire Effects
	FireLoopStartSightedAnim=ShootLoop_Start
	FireLoopEndSightedAnim=ShootLoop_End

    // FOV
	MeshIronSightFOV=52
    PlayerIronSightFOV=80

	// Depth of field
	DOF_FG_FocalRadius=150
	DOF_FG_MaxNearBlurSize=1

	// Content
	PackageKey="CryoGun"
	FirstPersonMeshName="WEP_1P_CryoGun_MESH.Wep_1stP_CryoGun_Rig"
	FirstPersonAnimSetNames(0)="wep_1p_CryoGun_anim.Wep_1stP_CryoGun_anim"
	PickupMeshName="WEP_3P_CryoGun_MESH.Wep_CryoGun_Pickup"
	AttachmentArchetypeName="WEP_CryoGun_ARCH.Wep_CryoGun_3P"
	MuzzleFlashTemplateName="WEP_CryoGun_ARCH.Wep_CryoGun_MuzzleFlash"

   	// Zooming/Position
	PlayerViewOffset=(X=6.0,Y=15,Z=-5)
	IronSightPosition=(X=20,Y=8,Z=-3) //z=0
    QuickWeaponDownRotation=(Pitch=-8192,Yaw=0,Roll=0)

		//PlayerViewOffset=(X=3.0,Y=9,Z=-3)
	    //IronSightPosition=(X=3,Y=6,Z=-1)

	// Ammo
	MagazineCapacity[0]=100
	SpareAmmoCapacity[0]=400
	InitialSpareMags[0]=1
	AmmoPickupScale[0]=0.75
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
	AltFireRecoilScale=4.0f

    // Inventory
	InventorySize=7
	GroupPriority=75
	WeaponSelectTexture=Texture2D'wep_ui_cryogun_tex.UI_WeaponSelect_Cryogun'

	// DEFAULT_FIREMODE
	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'wep_ui_cryogun_tex.UI_FireModeSelect_Cryogun'
	FiringStatesArray(DEFAULT_FIREMODE)=SprayingFire
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_Custom
	FireInterval(DEFAULT_FIREMODE)=+0.07 // 850 RPM
	FireOffset=(X=30,Y=4.5,Z=-5)
	//MinFireDuration=0.25
	MinAmmoConsumed=4

	// ALT_FIREMODE
	FireModeIconPaths(ALTFIRE_FIREMODE)=Texture2D'wep_ui_cryogun_tex.UI_FireModeSelect_2nd_Cryogun'
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_Projectile
	WeaponProjectiles(ALTFIRE_FIREMODE)=class'KFProj_FreezeThrower_IceShards'
	InstantHitDamage(ALTFIRE_FIREMODE)=20.0
	InstantHitDamageTypes(ALTFIRE_FIREMODE)=class'KFDT_Freeze_FreezeThrower_IceShards'
	FireInterval(ALTFIRE_FIREMODE)=0.6f
	AmmoCost(ALTFIRE_FIREMODE)=10
	NumPellets(ALTFIRE_FIREMODE)=7
	Spread(ALTFIRE_FIREMODE)=0.05f
	PelletSpread(0)=(X=0.f,Y=0.f)
	PelletSpread(1)=(X=0.5f,Y=0.f) 			//0deg 
	PelletSpread(2)=(X=0.3214,Y=0.3830) 	//60deg
	PelletSpread(3)=(X=-0.25,Y=0.4330)		//120deg
	PelletSpread(4)=(X=-0.5f,Y=0.f)			//180deg
	PelletSpread(5)=(X=-0.25f,Y=-0.4330)	//240deg
	PelletSpread(6)=(X=0.25,Y=-0.4330)		//300deg

	// BASH_FIREMODE
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_Freezethrower'
	InstantHitDamage(BASH_FIREMODE)=28

	// Fire Effects
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_Cryo_Gun.Play_Cryo_Gun_3P_Start', FirstPersonCue=AkEvent'WW_WEP_Cryo_Gun.Play_Cryo_Gun_1P_Start')
	WeaponFireLoopEndSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_Cryo_Gun.Play_Cryo_Gun_3P_Stop', FirstPersonCue=AkEvent'WW_WEP_Cryo_Gun.Play_Cryo_Gun_1P_Stop')
    WeaponFireSnd(ALTFIRE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_Cryo_Gun.Play_Cryo_Gun_3P_Alt_Fire', FirstPersonCue=AkEvent'WW_WEP_Cryo_Gun.Play_Cryo_Gun_1P_Alt_Fire')

	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_Flamethrower.Play_WEP_SA_Flamethrower_Handling_DryFire'
	WeaponDryFireSnd(ALTFIRE_FIREMODE)=AkEvent'WW_WEP_SA_Flamethrower.Play_WEP_SA_Flamethrower_Handling_DryFire'

	// Advanced (High RPM) Fire Effects
	bLoopingFireAnim(DEFAULT_FIREMODE)=true
	bLoopingFireSnd(DEFAULT_FIREMODE)=true
	SingleFireSoundIndex=FIREMODE_NONE
	bLoopingFireAnim(ALTFIRE_FIREMODE)=false
	bLoopingFireSnd(ALTFIRE_FIREMODE)=false

	// Attachments
	bHasIronSights=true
	bHasFlashlight=false

 	// AI Warning
 	bWarnAIWhenFiring=true

   	AssociatedPerkClasses(0)=class'KFPerk_Survivalist'

	WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Weak_Recoil'

	// Weapon Upgrade stat boosts
	WeaponUpgrades[1]=(IncrementDamage=1.4f,IncrementWeight=1)
	WeaponUpgrades[2]=(IncrementDamage=1.8f,IncrementWeight=2)
}