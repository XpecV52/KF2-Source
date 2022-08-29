//=============================================================================
// KFDT_Fire_MicrowaveRifleDoT
//=============================================================================
// Damage caused by burning from being hit by a microwave assault rifle round
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================

class KFDT_Fire_MicrowaveRifleDoT extends KFDT_Fire
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_MicrowaveRifle'
   DoT_Duration=2.000000
   DoT_Interval=0.500000
   DoT_DamageScale=0.300000
   BurnPower=8.500000
   Name="Default__KFDT_Fire_MicrowaveRifleDoT"
   ObjectArchetype=KFDT_Fire'KFGame.Default__KFDT_Fire'
}
