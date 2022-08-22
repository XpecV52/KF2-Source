//=============================================================================
// KFDT_Ballistic_RPG7Impact
//=============================================================================
// Rocket impact damage type for the RPG-7 rocket launcher
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFDT_Ballistic_RPG7Impact extends KFDT_Ballistic_Shell
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_RPG7'
   KnockdownPower=200.000000
   StumblePower=340.000000
   GunHitPower=275.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Demolitionist'
   KDamageImpulse=3000.000000
   KDeathVel=500.000000
   KDeathUpKick=1000.000000
   Name="Default__KFDT_Ballistic_RPG7Impact"
   ObjectArchetype=KFDT_Ballistic_Shell'kfgamecontent.Default__KFDT_Ballistic_Shell'
}
