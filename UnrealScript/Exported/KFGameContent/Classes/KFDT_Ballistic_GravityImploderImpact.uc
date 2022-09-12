//=============================================================================
// KFDT_Ballistic_GravityImploderImpact
//=============================================================================
// Killing Floor 2
// Copyright (C) 2020 Tripwire Interactive LLC
//=============================================================================

class KFDT_Ballistic_GravityImploderImpact extends KFDT_Ballistic_Shell
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_GravityImploder'
   KnockdownPower=50.000000
   StumblePower=250.000000
   GunHitPower=150.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Demolitionist'
   KDamageImpulse=2000.000000
   KDeathVel=1500.000000
   KDeathUpKick=750.000000
   Name="Default__KFDT_Ballistic_GravityImploderImpact"
   ObjectArchetype=KFDT_Ballistic_Shell'KFGame.Default__KFDT_Ballistic_Shell'
}