//=============================================================================
// KFWeap_PistolBase
//=============================================================================
// Generic pistol class
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Chris "schneidzekk" Schneider
//=============================================================================
class KFWeap_PistolBase extends KFWeapon
	abstract;

DefaultProperties
{
	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletSingle'

	// BASH_FIREMODE
	InstantHitDamage(BASH_FIREMODE)=10.0

	// Trader
	EffectiveRange=50
}
