//=============================================================================
// KFDT_Ballistic_M32Impact
//=============================================================================
// Shell impact damage type for the M32 Grenade launcher
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================

class KFDT_Ballistic_M32Impact extends KFDT_Ballistic_Shell
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_M32'
   KnockdownPower=125.000000
   StumblePower=340.000000
   GunHitPower=275.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Demolitionist'
   KDamageImpulse=2000.000000
   KDeathVel=350.000000
   KDeathUpKick=750.000000
   Name="Default__KFDT_Ballistic_M32Impact"
   ObjectArchetype=KFDT_Ballistic_Shell'KFGame.Default__KFDT_Ballistic_Shell'
}
