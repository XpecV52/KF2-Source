//=============================================================================
// KFDT_Ballistic_Kriss
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//  - Brooks Butler
//=============================================================================

class KFDT_Ballistic_Kriss extends KFDT_Ballistic_Submachinegun
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_Kriss'
   StumblePower=15.000000
   GunHitPower=15.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_SWAT'
   KDamageImpulse=900.000000
   KDeathVel=100.000000
   KDeathUpKick=-300.000000
   Name="Default__KFDT_Ballistic_Kriss"
   ObjectArchetype=KFDT_Ballistic_Submachinegun'kfgamecontent.Default__KFDT_Ballistic_Submachinegun'
}
