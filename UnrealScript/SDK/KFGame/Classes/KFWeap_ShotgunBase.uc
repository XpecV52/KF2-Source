//=============================================================================
// KFWeap_ShotgunBase
//=============================================================================
// Base class for a shotgun weapon
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeap_ShotgunBase extends KFWeapon
	abstract;

var(Weapon) array<byte>	NumPellets;

/** Reload open that also inserts one shell, played when gun is empty */
var(Animations) const editconst name	ReloadOpenInsertAnim;
var(Animations) const editconst name	ReloadOpenInsertEliteAnim;
/** Shoot animation to play when reload is interrupted */
var(Animations) const editconst	name	FireOneHandAnim;
var(Animations) const editconst	name	FireOneHandLastAnim;

/** Last time 'AbortReload' was called */
var transient float LastReloadAbortTime;

/*********************************************************************************************
 Firing / Projectile
********************************************************************************************* */

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
		Super.SpawnProjectile(KFProjClass, RealStartLoc, vector(AddMultiShotSpread(AimRot)));
	}

	return None;
}

/** Returns number of projectiles to fire from SpawnProjectile */
simulated function byte GetNumProjectilesToFire(byte FireModeNum)
{
	return NumPellets[CurrentFireMode];
}

/** Notification that a weapon attack has has happened */
function HandleWeaponShotTaken( byte FireMode )
{
    if( KFPlayer != None )
	{
        KFPlayer.AddShotsFired(GetNumProjectilesToFire( FireMode ));
	}
}

/** Disable normal bullet spread */
simulated function rotator AddSpread(rotator BaseAim)
{
	return BaseAim; // do nothing
}

 /** Same as AddSpread(), but used with MultiShotSpread */
simulated function rotator AddMultiShotSpread(rotator BaseAim)
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
		RandY = FRand() - 0.5;
		RandZ = Sqrt(0.5 - Square(RandY)) * (FRand() - 0.5);
		return rotator(X + RandY * CurrentSpread * Y + RandZ * CurrentSpread * Z);
	}
}

/*********************************************************************************************
 * State Reloading
 * This is the default Reloading State.  It's performed on both the client and the server.
 *********************************************************************************************/

simulated state Reloading
{
	/** Called when reload animation is interrupted */
	simulated function AbortReload()
	{
		LastReloadAbortTime = WorldInfo.TimeSeconds;
		Super.AbortReload();
	}
}

/** Handle ReloadOpenInsertAnim */
simulated function name GetReloadAnimName( bool bTacticalReload )
{
	if ( !bReloadFromMagazine && ReloadStatus == RS_OpeningBolt )
	{
		if ( AmmoCount[0] == 0 )
		{
			// immediately skip reload status so that we start getting ammo
			ReloadStatus = GetNextReloadStatus();
			return bTacticalReload ? ReloadOpenInsertEliteAnim : ReloadOpenInsertAnim;
		}
	}

	return Super.GetReloadAnimName(bTacticalReload);
}

/** Handle one-hand fire anims */
simulated function name GetWeaponFireAnim(byte FireModeNum)
{
	// if reload was just interrupted, then use the one-hand shoots
	if ( !bReloadFromMagazine && LastReloadAbortTime == WorldInfo.TimeSeconds )
	{
		if ( !bUsingSights )
		{
			return ShouldPlayFireLast(FireModeNum) ? FireOneHandLastAnim : FireOneHandAnim;
		}
	}

	return Super.GetWeaponFireAnim(FireModeNum);
}

/*********************************************************************************************
 * @name	Trader
 *********************************************************************************************/

/** Allows weapon to calculate its own damage for display in trader.
  * Overridden to multiply damage by number of pellets.
  */
static simulated function float CalculateTraderWeaponStatDamage()
{
	local float BaseDamage, DoTDamage;
	local class<KFDamageType> DamageType;

	BaseDamage = default.InstantHitDamage[DEFAULT_FIREMODE];

	DamageType = class<KFDamageType>(default.InstantHitDamageTypes[DEFAULT_FIREMODE]);
	if( DamageType != none && DamageType.default.DoT_Type != DOT_None )
	{
		DoTDamage = (DamageType.default.DoT_Duration / DamageType.default.DoT_Interval) * (BaseDamage * DamageType.default.DoT_DamageScale);
	}

	return BaseDamage * default.NumPellets[DEFAULT_FIREMODE] + DoTDamage;
}

/** Returns trader filter index based on weapon type */
static simulated event EFilterTypeUI GetTraderFilter()
{
	return FT_Shotgun;
}

defaultproperties
{
	NumPellets(DEFAULT_FIREMODE)=7
	NumPellets(ALTFIRE_FIREMODE)=7

	Spread(DEFAULT_FIREMODE)=0.07
	Spread(ALTFIRE_FIREMODE)=0.07

	// BASH_FIREMODE - Waiting on animations
	InstantHitDamage(BASH_FIREMODE)=20.0

	// Animation
	ReloadOpenInsertAnim=Reload_Open_Shell
	ReloadOpenInsertEliteAnim=Reload_Open_Shell_Elite
	FireOneHandAnim=Shoot_OneHand
	FireOneHandLastAnim=Shoot_OneHand_Last
	bHasFireLastAnims=true	

	// Aim Assist
	AimCorrectionSize=0.f
}


