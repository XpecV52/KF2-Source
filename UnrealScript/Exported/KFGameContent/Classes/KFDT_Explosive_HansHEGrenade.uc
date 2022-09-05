//=============================================================================
// KFDT_Explosive_HansHEGrenade
//=============================================================================
// Explosive damage type for Hans' high explosive grenades
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFDT_Explosive_HansHEGrenade extends KFDT_Explosive_HEGrenade
	abstract
	hidedropdown;






































































































































































































































































































































































































































































































































































































































































#linenumber 15

static function int GetKillerDialogID()
{
	return 31;
}

defaultproperties
{
   bNoInstigatorDamage=True
   Name="Default__KFDT_Explosive_HansHEGrenade"
   ObjectArchetype=KFDT_Explosive_HEGrenade'kfgamecontent.Default__KFDT_Explosive_HEGrenade'
}
