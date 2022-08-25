//=============================================================================
// KFDT_Fire_Mac10
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================

class KFDT_Fire_Mac10 extends KFDT_Ballistic_DragonsBreath
	abstract
	hidedropdown;

defaultproperties
{
   BurnDamageType=Class'KFGame.KFDT_Fire_Mac10DoT'
   WeaponDef=Class'KFGame.KFWeapDef_Mac10'
   BurnPower=18.500000
   ModifierPerkList(1)=Class'KFGame.KFPerk_SWAT'
   Name="Default__KFDT_Fire_Mac10"
   ObjectArchetype=KFDT_Ballistic_DragonsBreath'kfgamecontent.Default__KFDT_Ballistic_DragonsBreath'
}
