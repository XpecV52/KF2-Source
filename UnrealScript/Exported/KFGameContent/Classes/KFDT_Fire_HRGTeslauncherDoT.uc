//=============================================================================
// KFDT_Fire_HRGTeslauncherDoT
//=============================================================================
// Damage caused by burning from being hit by a microwave assault rifle round
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================

class KFDT_Fire_HRGTeslauncherDoT extends KFDT_Fire
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_HRGTeslauncher'
   DoT_Duration=2.000000
   DoT_Interval=0.500000
   DoT_DamageScale=0.300000
   BurnPower=8.500000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Berserker'
   Name="Default__KFDT_Fire_HRGTeslauncherDoT"
   ObjectArchetype=KFDT_Fire'KFGame.Default__KFDT_Fire'
}
