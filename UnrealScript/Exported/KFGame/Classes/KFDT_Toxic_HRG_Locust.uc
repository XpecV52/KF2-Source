//=============================================================================
// KFDT_Ballistic_HRG_Locust
//=============================================================================
// HRG Locust bullet impact
//=============================================================================
// Killing Floor 2
// Copyright (C) 2022 Tripwire Interactive LLC
//=============================================================================
class KFDT_Toxic_HRG_Locust extends KFDT_Bleeding
	abstract
	hidedropdown;

// Damage dealt when zeds touch each other and spread the afflictions
var int SpreadOnTouchDamage;

static function int GetSpreadOnTouchDamage()
{
	return default.SpreadOnTouchDamage;
}

defaultproperties
{
   SpreadOnTouchDamage=40
   WeaponDef=Class'KFGame.KFWeapDef_HRG_Locust'
   DoT_Duration=3.000000
   DoT_Interval=0.500000
   PoisonPower=25.000000
   BleedPower=20.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Survivalist'
   Name="Default__KFDT_Toxic_HRG_Locust"
   ObjectArchetype=KFDT_Bleeding'KFGame.Default__KFDT_Bleeding'
}
