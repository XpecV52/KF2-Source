//=============================================================================
// KFDT_Ballistic_Seeker6Impact
//=============================================================================
// Rocket impact damage type for the Seeker6 rocket launcher
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFDT_Ballistic_Seeker6Impact extends KFDT_Ballistic_Shell
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_Seeker6'
   KnockdownPower=50.000000
   StumblePower=100.000000
   GunHitPower=68.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Demolitionist'
   KDamageImpulse=3000.000000
   KDeathVel=500.000000
   KDeathUpKick=1000.000000
   Name="Default__KFDT_Ballistic_Seeker6Impact"
   ObjectArchetype=KFDT_Ballistic_Shell'KFGame.Default__KFDT_Ballistic_Shell'
}
