//=============================================================================
// KFDT_Ballistic_HX25Impact
//=============================================================================
// Shell impact damage type for the HX25 Grenade pistol
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFDT_Ballistic_HX25Impact extends KFDT_Ballistic_Shell
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_HX25'
   KnockdownPower=12.000000
   StumblePower=14.000000
   LegStumblePower=14.000000
   GunHitPower=39.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Demolitionist'
   KDamageImpulse=1500.000000
   KDeathVel=250.000000
   KDeathUpKick=500.000000
   Name="Default__KFDT_Ballistic_HX25Impact"
   ObjectArchetype=KFDT_Ballistic_Shell'KFGame.Default__KFDT_Ballistic_Shell'
}
