//=============================================================================
// KFDT_Ballistic_Rem1858
//=============================================================================
// Remington 1858 damage type
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFDT_Ballistic_Rem1858 extends KFDT_Ballistic_Handgun
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_Remington1858'
   KnockdownPower=15.000000
   StumblePower=50.000000
   GunHitPower=150.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Gunslinger'
   KDamageImpulse=2500.000000
   KDeathVel=200.000000
   KDeathUpKick=-500.000000
   Name="Default__KFDT_Ballistic_Rem1858"
   ObjectArchetype=KFDT_Ballistic_Handgun'kfgamecontent.Default__KFDT_Ballistic_Handgun'
}
