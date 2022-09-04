//=============================================================================
// KFDT_Sonic
//=============================================================================
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Sonic extends KFDamageType
	abstract;









































































































































































































































































































































































































































































































































































































































#linenumber 12

/** Returns ID of dialog event for damagee to speak after getting damaged by a zed using this damage type */
static function int GetDamageeDialogID()
{
	return 117;
}

defaultproperties
{
   bAllowAIDoorDestruction=True
   ScreenMaterialName="Effect_Siren"
   ObliterationHealthThreshold=-1
   ObliterationDamageThreshold=3
   bArmorStops=False
   KDamageImpulse=1400.000000
   KDeathVel=700.000000
   KDeathUpKick=500.000000
   Name="Default__KFDT_Sonic"
   ObjectArchetype=KFDamageType'KFGame.Default__KFDamageType'
}
