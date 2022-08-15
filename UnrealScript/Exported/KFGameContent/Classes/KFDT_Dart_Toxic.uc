//=============================================================================
// KFDT_Dart_Toxic
//=============================================================================
// Toxic Dart DamageType
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFDT_Dart_Toxic extends KFDT_Toxic
	abstract
	hidedropdown;

































































































	















#linenumber 15;

/** If true, damage zeds when the acidic compund perk is active 
  * Completely overrides super 
  */
static function bool IsToxicDartWithACMedicPerk()
{
	return true;
}

defaultproperties
{
   AARWeaponID=53
   Name="Default__KFDT_Dart_Toxic"
   ObjectArchetype=KFDT_Toxic'KFGame.Default__KFDT_Toxic'
}
