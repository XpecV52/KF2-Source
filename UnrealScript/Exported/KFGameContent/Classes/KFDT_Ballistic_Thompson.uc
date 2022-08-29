//=============================================================================
// KFDT_Ballistic_Thompson
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================

class KFDT_Ballistic_Thompson extends KFDT_Ballistic_Submachinegun
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_Thompson'
   StumblePower=24.000000
   GunHitPower=24.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_SWAT'
   ModifierPerkList(1)=Class'KFGame.KFPerk_Commando'
   KDamageImpulse=900.000000
   KDeathVel=100.000000
   KDeathUpKick=-300.000000
   Name="Default__KFDT_Ballistic_Thompson"
   ObjectArchetype=KFDT_Ballistic_Submachinegun'kfgamecontent.Default__KFDT_Ballistic_Submachinegun'
}
