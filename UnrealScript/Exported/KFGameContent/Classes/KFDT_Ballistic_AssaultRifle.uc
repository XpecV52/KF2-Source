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
   StumblePower=10
   LegStumblePower=20
   GunHitPower=15
   GoreDamageGroup=DGT_AssaultRifle
   Name="Default__KFDT_Ballistic_AssaultRifle"
   ObjectArchetype=KFDT_Ballistic'KFGame.Default__KFDT_Ballistic'
}
