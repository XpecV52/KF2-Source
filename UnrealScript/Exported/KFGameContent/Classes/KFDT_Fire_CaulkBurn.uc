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
   WeaponDef=Class'KFGame.KFWeapDef_CaulkBurn'
   Name="Default__KFDT_Fire_CaulkBurn"
   ObjectArchetype=KFDT_Fire'KFGame.Default__KFDT_Fire'
}
