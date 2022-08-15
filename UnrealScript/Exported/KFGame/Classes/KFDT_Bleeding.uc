//=============================================================================
// KFDT_Bleeding
//=============================================================================
// Damage caused by bleeding over time
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================

class KFDT_Bleeding extends KFDamageType
	abstract
	hidedropdown;

defaultproperties
{
   DoT_Type=DOT_Bleeding
   DoT_Duration=15.000000
   DoT_Interval=1.000000
   DoT_DamageScale=1.000000
   KDamageImpulse=0.000000
   Name="Default__KFDT_Bleeding"
   ObjectArchetype=KFDamageType'KFGame.Default__KFDamageType'
}
