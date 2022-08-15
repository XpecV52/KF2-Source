//=============================================================================
// KFDT_Slashing_ZweihanderHeavy
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Slashing_ZweihanderHeavy extends KFDT_Slashing_Katana
	abstract
	hidedropdown;

`include(KFGame\KFMatchStats.uci);

/** Allows the damage type to customize exactly which hit zones it can dismember */
static simulated function bool CanDismemberHitZone( name InHitZoneName )
{
	if( super.CanDismemberHitZone( InHitZoneName ) )
	{
		return true;
	}

	switch ( InHitZoneName )
	{
		case 'lupperarm':
		case 'rupperarm':
	 		return true;
	}

	return false;
}

defaultproperties
{
	KDamageImpulse=1600
	KDeathUpKick=200
	KDeathVel=500

	KnockdownPower=40
	StunPower=42
	StumblePower=63
	LegStumblePower=63
	MeleeHitPower=50

	AARWeaponID=`AAR_Zweihander
	ModifierPerkList(0)=class'KFPerk_Berserker'
}
