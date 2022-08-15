//=============================================================================
// KFDT_Fire_CaulkBurn
//=============================================================================
// Damage caused by heat and combustion
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Fire_CaulkBurn extends KFDT_Fire
	abstract;

`include(KFGame\KFMatchStats.uci);

static function int GetKillerDialogID()
{
	return 86;//KILL_Fire
}

static function int GetDamagerDialogID()
{
	return 102;//DAMZ_Fire
}

static function int GetDamageeDialogID()
{
	return 116;//DAMP_Fire
}

defaultproperties
{
	AARWeaponID=`AAR_CaulkBurn

	DoT_Type=DOT_Fire
	DoT_Duration=5.0
	DoT_Interval=1.0
	DoT_DamageScale=1.5
	bIgnoreSelfInflictedScale=true

	BurnPower=0.25
}

