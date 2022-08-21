//=============================================================================
// KFDT_Ballistic_AssaultRifle
//=============================================================================
// Container class for assault rifle damage types
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Sakib Saikia 11/22/2013
//=============================================================================

class KFDT_Ballistic_AssaultRifle extends KFDT_Ballistic
	abstract
	hidedropdown;

defaultproperties
{
   GoreDamageGroup=DGT_AssaultRifle
   StumblePower=10.000000
   LegStumblePower=20.000000
   GunHitPower=15.000000
   Name="Default__KFDT_Ballistic_AssaultRifle"
   ObjectArchetype=KFDT_Ballistic'KFGame.Default__KFDT_Ballistic'
}
