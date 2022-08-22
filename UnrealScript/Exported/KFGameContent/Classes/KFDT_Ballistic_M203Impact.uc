//=============================================================================
// KFDT_Ballistic_M203Impact
//=============================================================================
// Shell impact damage type for the M79 Grenade launcher
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Chris "schneidzekk" Schneider
//=============================================================================

class KFDT_Ballistic_M203Impact extends KFDT_Ballistic_Shell
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_M16M203'
   KnockdownPower=125.000000
   StumblePower=340.000000
   GunHitPower=275.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Demolitionist'
   KDamageImpulse=2000.000000
   KDeathVel=350.000000
   KDeathUpKick=750.000000
   Name="Default__KFDT_Ballistic_M203Impact"
   ObjectArchetype=KFDT_Ballistic_Shell'KFGame.Default__KFDT_Ballistic_Shell'
}
