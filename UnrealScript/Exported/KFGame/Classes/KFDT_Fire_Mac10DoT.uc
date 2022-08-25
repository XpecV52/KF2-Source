//=============================================================================
// KFDT_Fire_Mac10DoT
//=============================================================================
// Damage caused by burning from being hit by a mac10 round
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//  - Zane
//=============================================================================

class KFDT_Fire_Mac10DoT extends KFDT_Fire
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_Mac10'
   DoT_Duration=2.000000
   DoT_Interval=0.500000
   DoT_DamageScale=0.300000
   BurnPower=8.500000
   Name="Default__KFDT_Fire_Mac10DoT"
   ObjectArchetype=KFDT_Fire'KFGame.Default__KFDT_Fire'
}
