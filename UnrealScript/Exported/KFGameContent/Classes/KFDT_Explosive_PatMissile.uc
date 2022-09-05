//=============================================================================
// KFDT_Explosive_PatMissile
//=============================================================================
// Explosive damage type for the Patriarch missile
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFDT_Explosive_PatMissile extends KFDT_Explosive
	abstract
	hidedropdown;






































































































































































































































































































































































































































































































































































































































































#linenumber 15

static function int GetKillerDialogID()
{
	return 19;
}

defaultproperties
{
   bShouldSpawnPersistentBlood=True
   KDeathVel=500.000000
   KDeathUpKick=500.000000
   RadialDamageImpulse=1000.000000
   Name="Default__KFDT_Explosive_PatMissile"
   ObjectArchetype=KFDT_Explosive'KFGame.Default__KFDT_Explosive'
}
