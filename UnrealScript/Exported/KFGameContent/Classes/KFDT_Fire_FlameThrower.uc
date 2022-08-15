//=============================================================================
// KFDT_Fire
//=============================================================================
// Damage caused by heat and combustion
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Fire_FlameThrower extends KFDT_Fire
	abstract;
































































































	















#linenumber 13;

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
   AARWeaponID=48
   DoT_DamageScale=0.600000
   Name="Default__KFDT_Fire_FlameThrower"
   ObjectArchetype=KFDT_Fire'KFGame.Default__KFDT_Fire'
}
