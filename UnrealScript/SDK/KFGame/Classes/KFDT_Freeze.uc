//=============================================================================
// KFDT_Freeze
//=============================================================================
// Damage caused by cold or ice weapons
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Freeze extends KFDamageType
	abstract;

`include(KFGameDialog.uci)

/** Returns ID of dialog event for killer to speak after killing a zed using this damage type */
static function int GetKillerDialogID()
{
	return `KILL_Freeze;
}

/** Returns ID of dialog event for damager to speak after damaging a zed using this damage type */
static function int GetDamagerDialogID()
{
	return `DAMZ_Freeze;
}

defaultproperties
{
	FreezePower=1.0f
}
