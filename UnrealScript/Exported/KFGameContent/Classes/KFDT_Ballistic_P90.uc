//=============================================================================
// KFDT_Ballistic_P90
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 11/20/2013
//=============================================================================

class KFDT_Ballistic_P90 extends KFDT_Ballistic_Submachinegun
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_P90'
   StumblePower=15.000000
   GunHitPower=15.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_SWAT'
   KDamageImpulse=900.000000
   KDeathVel=100.000000
   KDeathUpKick=-300.000000
   Name="Default__KFDT_Ballistic_P90"
   ObjectArchetype=KFDT_Ballistic_Submachinegun'kfgamecontent.Default__KFDT_Ballistic_Submachinegun'
}
