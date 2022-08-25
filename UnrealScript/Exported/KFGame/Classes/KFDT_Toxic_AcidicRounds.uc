//=============================================================================
// KFDT_Toxic_AcidicRounds
//=============================================================================
// The medic's Acidic Round damage type
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Toxic_AcidicRounds extends KFDT_Toxic
	abstract;




































































































































































































































































































































































































































































































































































































































#linenumber 13

static function bool AlwaysPoisons()
{
	return true;
}

defaultproperties
{
   DoT_Duration=5.000000
   DoT_DamageScale=2.000000
   PoisonPower=200.000000
   Name="Default__KFDT_Toxic_AcidicRounds"
   ObjectArchetype=KFDT_Toxic'KFGame.Default__KFDT_Toxic'
}
