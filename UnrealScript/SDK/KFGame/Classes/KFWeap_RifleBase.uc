//=============================================================================
// KFWeap_RifleBase
//=============================================================================
// Base class for rifles
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeap_RifleBase extends KFWeapon
	abstract;

/*********************************************************************************************
 * @name	Trader
 *********************************************************************************************/

/** Returns trader filter index based on weapon type */
static simulated event EFilterTypeUI GetTraderFilter()
{
	if( default.FiringStatesArray[DEFAULT_FIREMODE] == 'WeaponFiring' || default.FiringStatesArray[DEFAULT_FIREMODE] == 'WeaponBurstFiring' )
	{
		return FT_Assault;
	}
	else // if( FiringStatesArray[DEFAULT_FIREMODE] == 'WeaponSingleFiring')
	{
		return FT_Rifle;
	}
}

DefaultProperties
{
	// BASH_FIREMODE
	InstantHitDamage(BASH_FIREMODE)=15.0
	
	// Aim Assist
	AimCorrectionSize=40.f
}
