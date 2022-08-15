//=============================================================================
// KFWeap_GrenadeLauncher_Base
//=============================================================================
// Base for grenade launchers
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFWeap_GrenadeLauncher_Base extends KFWeapon;

/** How long the to wait after firing to force zoom out */
var(IronSight)	float		ForceZoomOutTime;

/** How long the to wait after firing to force zoom out */
var()			float		ForceReloadTime;

/**
 * FireAmmunition: Perform all logic associated with firing a shot
 * - Fires ammunition (instant hit or spawn projectile)
 * - Consumes ammunition
 * - Plays any associated effects (fire sound and whatnot)
 *
 * Network: LocalPlayer and Server
 */
simulated state WeaponSingleFiring
{
	simulated function PlayFireEffects( byte FireModeNum, optional vector HitLocation )
	{
		Super.PlayFireEffects( FireModeNum, HitLocation );

		// Reload after every shot, assuming there is ammo available
		SetTimer(ForceReloadTime, false, nameof( ForceReload ) );
	}
}

/** Return true if this weapon should play the fire last animation for this shoot animation */
simulated function bool ShouldPlayFireLast(byte FireModeNum)
{
    if( SpareAmmoCount[GetAmmoType(FireModeNum)] == 0 )
    {
        return true;
    }

    return false;
}

DefaultProperties
{
	ForceReloadTime=0.3

	// Trader
    EffectiveRange=30
}
