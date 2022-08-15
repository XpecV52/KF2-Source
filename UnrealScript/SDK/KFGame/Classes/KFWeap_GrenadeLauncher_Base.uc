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

		if ( Instigator.IsLocallyControlled() )
		{
			// Reload after every shot, assuming there is ammo available
			SetTimer(ForceReloadTime, false, nameof( ForceReload ) );
		}
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

///////////////////////////////////////////////////////////////////////////////////////////
//
// Trader
//
///////////////////////////////////////////////////////////////////////////////////////////

/** Allows weapon to calculate its own damage for display in trader */
static simulated function float CalculateTraderWeaponStatDamage()
{
	local float CalculatedDamage;
	local class<KFDamageType> DamageType;
	local GameExplosion ExplosionInstance;

	ExplosionInstance = class<KFProjectile>(default.WeaponProjectiles[DEFAULT_FIREMODE]).default.ExplosionTemplate;

	CalculatedDamage = default.InstantHitDamage[DEFAULT_FIREMODE] + ExplosionInstance.Damage;

	DamageType = class<KFDamageType>(ExplosionInstance.MyDamageType);
	if( DamageType != none && DamageType.default.DoT_Type != DOT_None )
	{
		CalculatedDamage += (DamageType.default.DoT_Duration / DamageType.default.DoT_Interval) * (CalculatedDamage * DamageType.default.DoT_DamageScale);
	}

	return CalculatedDamage;
}

DefaultProperties
{
	ForceReloadTime=0.3

	// Doesn't use CSHD so FALSE is needed to avoid some rare, but tricky sync issues.
	// Since these weapons have a mag size of 1 client ammo is not that useful anyway.
	bAllowClientAmmoTracking=false

	// Trader
    EffectiveRange=30
}
