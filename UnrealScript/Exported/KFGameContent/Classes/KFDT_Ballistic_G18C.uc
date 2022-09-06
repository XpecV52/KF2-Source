//=============================================================================
// KFDT_Ballistic_G18C
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

class KFDT_Ballistic_G18C extends KFDT_Ballistic_Handgun
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_Pistol_G18C'
   StumblePower=12.000000
   GunHitPower=12.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Gunslinger'
   KDamageImpulse=900.000000
   KDeathVel=100.000000
   KDeathUpKick=-300.000000
   Name="Default__KFDT_Ballistic_G18C"
   ObjectArchetype=KFDT_Ballistic_Handgun'kfgamecontent.Default__KFDT_Ballistic_Handgun'
}
