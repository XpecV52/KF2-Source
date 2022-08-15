//=============================================================================
// KFDT_Ballistic_Rifle
//=============================================================================
// Container class for rifle damage types
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Sakib Saikia 11/22/2013
//=============================================================================

class KFDT_Ballistic_Rifle extends KFDT_Ballistic
	abstract
	hidedropdown;

defaultproperties
{
   StumblePower=10
   LegStumblePower=15
   GunHitPower=25
   GoreDamageGroup=DGT_Rifle
   Name="Default__KFDT_Ballistic_Rifle"
   ObjectArchetype=KFDT_Ballistic'KFGame.Default__KFDT_Ballistic'
}
