//=============================================================================
// KFDT_Ballistic_HRG_Locust
//=============================================================================
// HRG Locust bullet impact
//=============================================================================
// Killing Floor 2
// Copyright (C) 2022 Tripwire Interactive LLC
//=============================================================================
class KFDT_Ballistic_HRG_Locust extends KFDamageType
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_HRG_Locust'
   ModifierPerkList(0)=Class'KFGame.KFPerk_Survivalist'
   Name="Default__KFDT_Ballistic_HRG_Locust"
   ObjectArchetype=KFDamageType'KFGame.Default__KFDamageType'
}
