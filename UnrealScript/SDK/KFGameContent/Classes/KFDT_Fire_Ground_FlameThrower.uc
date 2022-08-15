//=============================================================================
// KFDT_Fire_Ground_FlameThrower
//=============================================================================
// A damage type for KFProj_GroundFire for the Flamethrower
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFDT_Fire_Ground_FlameThrower extends KFDT_Fire_Ground
	abstract;

`include(KFGame\KFMatchStats.uci);

defaultproperties
{
	AARWeaponID=`AAR_FlameThrower
}
